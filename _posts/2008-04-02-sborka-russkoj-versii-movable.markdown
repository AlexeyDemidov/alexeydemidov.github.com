---
layout: post
title: Сборка русской версии Movable Type
date: 2008-04-02 00:35:21 +04:00
comments: true
categories: [Movable Type]
---

Для сборки руссифицированной версии Movable Type нам опять понадобятся исходники из [svn-репозитария](https://github.com/movabletype/movabletype). Делаем чекаут, как описано в предыдущей [статье о работе с файлом перевода](/2008/03/30/rabota-s-failom-perevoda-mt/) и прикладываем к полученным исходникам патч [patch-rubuild.gz](/files/patch-rubuild.gz), который добавляет возможность сборки русской версии.

Следующим шагом вносим в исходники все необходимые изменения для поддержки русского языка:

- [patch-rudate41.gz](/files/patch-rudate41.gz) — добавляет русский формат дат
- [patch-rudirify41.gz](/files/patch-dirify.gz) — добавляет русские символы в таблицы преобразования заголовков статей в имена файлов (в отличии от [патча](http://blog.lexa.ru/files/patch-dirify.gz) [Алексея Тутубалина](http://blog.lexa.ru/) изменяется также и Javascript код, а преобразование русских символов в латиницу сделано в соответствии с [ГОСТ 7.79-2000](https://ru.wikipedia.org/wiki/ISO_9#.D0.93.D0.9E.D0.A1.D0.A2_7.79.E2.80.942000))
- [patch-nofollow.gz](http://blog.lexa.ru/files/patch-nofollow.gz) — добавляет поддержку тэга <noindex> необходимого для российских поисковиков (автор Алексей Тутубалин)
- [patch-monday-mt41.gz](http://blog.lexa.ru/files/patch-monday-mt41.gz) — делает первым днем недели в календаре понедельник (автор Алексей Тутубалин)

После внесения изменений в код и шаблоны осталось добавить собственно файл перевода lib/MT/L10N/ru.pm ( [перевод](http://movable-type.ru/forums/viewtopic.php?id=75) проекта [movable-type.ru](http://movable-type.ru), либо мой, менее полный [перевод](/files/ru.pm)), файл стилей [mt-static/styles\_ru.css](/files/styles_ru.css) и два HTML-файла — index.html.ru и readme.html.ru (они есть в [репозитарии](https://code.google.com/archive/p/movabletype/source ) русской версии Movable Type на Google Code). Файл перевода необходимо обработать в соответствии с инструкциями в предыдущей [статье](/2008/03/30/rabota-s-failom-perevoda-mt/). В завершении можно изменить некоторые настройки по умолчанию (часовой пояс, кодировки, ссылки на новости, портал и техподдержку) для собираемого пакета, отредактировав файл build/mt-dists/ru.mk.

Сделав все необходимые изменения выполняем сборку пакета MTOS:

    env LANG=C ./build/exportmt.pl --local --pack=MTOS --lang=ru --prod

В результате выполнения данной команды получим два архива с русской версией Movable Type — MTOS-4.1-ru.tar.gz и MTOS-4.1-ru.zip.
