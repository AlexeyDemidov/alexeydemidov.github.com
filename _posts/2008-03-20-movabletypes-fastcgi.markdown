---
layout: post
title: Ускорение Movable Types ( Apache и FastCGI )
date: 2008-03-20 20:44:05 +03:00
comments: true
categories: [Apache, FastCGI, Movable Type]
---

После установки [Movable Type](https://movabletype.org/) обнаружилось что
работа с его админкой (CMS) достаточно некомфортна из-за её существенной
тормознутости &mdash; время загрузки главной страницы составляет около 15 секунд.
Впрочем, это не удивительно, поскольку админка реализована как достаточно
тяжелый perl’овый скрипт со множеством зависимостей которые при работе в режиме
стандратного CGI подгружаются при каждом <acronym>HTTP</acronym>-запросе.

Первой мыслью было попробовать запустить его под [mod\_perl](https://perl.apache.org/), который у меня уже есть, но как оказалось [Movable Type](https://movabletype.org/) поддерживает только [mod\_perl](https://perl.apache.org/) 1.x, а я уже третий год как переехал на [Apache](https://httpd.apache.org/) 2.x. Поэтому пришлось обратиться к альтернативном варианту — [FastCGI](https://en.wikipedia.org/wiki/FastCGI), отличие которого от классического CGI именно в том, что скрипт обслуживает не один, а множество <acronym>HTTP</acronym>-запросов, чем минимизируются временные затраты на запуск и инициализацию скрипта.

Сначала обеспечиваем поддержку [FastCGI](https://en.wikipedia.org/wiki/FastCGI) в [Apache](https://httpd.apache.org/) — это делается с помощь модуля [mod\_fastcgi](https://fastcgi-archives.github.io/mod_fastcgi.html) (или альтернативная реализация [mod\_fcgid](https://httpd.apache.org/mod_fcgid/)). Ставим модуль и подключаем его в httpd.conf.настройки для [mod\_fastcgi](https://fastcgi-archives.github.io/mod_fastcgi.html):

    LoadModule fastcgi_module libexec/apache22/mod_fastcgi.so
    <IfModule mod_fastcgi.c>
      AddHandler fastcgi-script .fcgi
      FastCgiIpcDir /var/run/fcgidsock/
    </IfModule>

настройки для [mod\_fcgid](https://httpd.apache.org/mod_fcgid/):

    LoadModule fcgid_module libexec/apache22/mod_fcgid.so
    <IfModule mod_fcgid.c>
      AddHandler fcgid-script .fcgi 
      SocketPath /var/run/fcgidsock/
    </IfModule>

Сам [Movable Type](https://movabletype.org/) начиная с версии 4 поддерживает работу через [FastCGI](https://en.wikipedia.org/wiki/FastCGI) из [коробки](https://movabletype.org/documentation/administrator/maintenance/fastcgi.html), поэтому для его настойки достаточно указать для каталога где находятся скрипты mt\*.cgi следующую директиву:

    AddHandler fcgid-script .cgi

или

    AddHandler fastcgi-script .cgi

После включения данной опции тестирование с помощью [ApacheBench](https://httpd.apache.org/docs/2.0/programs/ab.html) показало на моей домашней машинке ускорение более чем на порядок — с 0.75 запросов в секунду до 15. Но особого ускорения при работе с админкой не прозошло. Налицо классический случай «premature optimization», которая «root of all evil» © [C.A.R. Hoare](https://en.wikiquote.org/wiki/C._A._R._Hoare).

Поэтому пришлось все-таки более внимательно посмотреть в [YSlow](https://developer.yahoo.com/yslow/) и последовательно применить предлагаемые [рекомендации](https://developer.yahoo.com/performance/rules.html). Основная проблема оказалась в большом количестве объектов на странице и как следствие, большом количестве HTTP запросов (около 50 в данном случае), причем большинство запросов были If-Modified-Since на файлы из mt-static, в осовном изображения. Лечиться это добавлением заголовков Expires для каталога mt-static с помощью [mod\_expires](https://httpd.apache.org/docs/2.0/mod/mod_expires.html):

    ExpiresActive On
    ExpiresDefault "access plus 1 month"

С включением данной опции броузер перестал обращаться к каждой картинке при каждой загрузке страницы, что сократило количество запросов с полусотни до ровно одного — обращение собственно к mt.cgi. Общий объем передаваемых данных также сократился с 100Kb (уже с учетом включеной компрессии для text/\*) до 10Kb. Общее же время загрузки страницы сократилось с 15 секунд до 5-6 секунд по таймеру [YSlow](https://developer.yahoo.com/yslow/) и до 3-4 секунд по секундомеру с отключеным [FireBug](https://getfirebug.com/)‘ом и [YSlow](https://developer.yahoo.com/yslow/).

Достигнутый результат меня вполне устроит и тему оптимизации можно отложить. Дальше нужно будет заниматься уже переводом на русский и переносом на боевой сервер в тесный jail. А пока в процессе первых дней эксплуатации выяснилось пара нюансов. Во-первых, не все скрипты [MT](https://movabletype.org/) работают в режиме [FastCGI](https://en.wikipedia.org/wiki/FastCGI), поэтому лучше использовать следующие настройки подсмотренные в [документации Movable Type](https://movabletype.org/documentation/administrator/maintenance/fastcgi.html):

    <FilesMatch "^mt(?:-(?:comments|search|tb|view))?\.cgi$">
         AddHandler fcgid-script .cgi
    </FilesMatch>

Во-вторых, процесс mt.cgi со временем может разрастаться до достаточно неприличиных размеров (более 100 Mb) и поэтому лучше настроить [mod\_fastcgi](https://en.wikipedia.org/wiki/FastCGI) так, чтобы он переодические его перезапускал:

    FastCgiConfig -maxProcesses 10 -killInterval 3600

и для [mod\_fcgid](https://httpd.apache.org/mod_fcgid/)

    ProcessLifeTime 3600
       MaxProcessCount 10
       MaxRequestsPerProcess 500

И в третьих, при работе через [FastCGI](https://en.wikipedia.org/wiki/FastCGI) возникают неудобства с изменением кода MT на ходу — необходимо постоянно перезапускать mt.cgi чтобы он перечитал измененные модули.

**_ [Продолжение следует](/2008/03/24/russifikacija-movable-type-41/) …_**
