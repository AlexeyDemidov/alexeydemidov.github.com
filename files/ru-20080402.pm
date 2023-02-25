# 
# Russian localization Copyright 2008 (c) by Alex L. Demidov 
#
# http://alexd.vinf.ru/
#
# $Id:$

package MT::L10N::ru;
use strict;
use MT::L10N;
use MT::L10N::en_us;
use vars qw( @ISA %Lexicon );
@ISA = qw( MT::L10N::en_us );

sub quant {
    my($handle, $num, @forms) = @_;

    return $num if @forms == 0; # what should this mean?

    # Note that the formatting of $num is preserved.
    return( $handle->numf($num) . ' ' . $handle->numerate($num, @forms) );
    # Most human languages put the number phrase before the qualified phrase.
}

sub numerate {
    # return this lexical item in a form appropriate to this number
    my($handle, $num, @forms) = @_;
    my $s = ($num == 1);

    return '' unless @forms;

    return $forms[0] if $num =~ /^[02-9]*1$/; 
    return $forms[0] if ( @forms == 1);

    return $forms[1] if $num =~ /^[02-9]*[234]$/; 
    return $forms[1] if ( @forms == 1);
    return $forms[2];
}
        
## The following is the translation table.

%Lexicon = (

## php/lib/archive_lib.php
	'Page' => 'Страница',
	'Individual' => 'Индивидуальный', 
	'Yearly' => 'Ежегодно',
	'Monthly' => 'Ежемесячно',
	'Daily' => 'Ежедневно',
	'Weekly' => 'Еженедельно',
	'Author' => 'Автор',
	'(Display Name not set)' => '(Имя не указано)',
	'Author Yearly' => 'По Авторам по годам',
	'Author Monthly' => 'По Авторам по месяцам',
	'Author Daily' => 'По Авторам по дням',
	'Author Weekly' => 'По Авторам по неделям',
	'Category Yearly' => 'Темы по годам',
	'Category Monthly' => 'Темы по месяцам',
	'Category Daily' => 'Темы по дням',
	'Category Weekly' => 'Темы по неделям',

## php/lib/block.mtsetvarblock.php
	'You used a [_1] tag without a valid name attribute.' => 'Вы использовали метку [_1] без аттрибута имя.',
	'\'[_1]\' is not a hash.' => '\'[_1]\' не является хэшем.',
	'Invalid index.' => 'Неверный индекс.',
	'\'[_1]\' is not an array.' => '\'[_1]\' не является массивом.',
	'\'[_1]\' is not a valid function.' => '\'[_1]\' не является функцией.',

## php/lib/captcha_lib.php
	'Captcha' => 'Captcha', 
	'Type the characters you see in the picture above.' => 'Введите символы которые Вы видите на изображении выше.',

## php/lib/block.mtsethashvar.php

## php/lib/block.mtauthorhaspage.php
	'No author available' => 'Не автора',

## php/lib/function.mtsetvar.php
	'[_1] [_2] [_3] is illegal.' => '[_1] [_2] [_3] неверно.',

## php/lib/block.mtif.php

## php/lib/block.mtentries.php
	'sort_by="score" must be used in combination with namespace.' => 'sort_by="score" должен использоваться в сочетании с namespace.',

## php/lib/function.mtentryclasslabel.php
	'page' => 'страница',
	'entry' => 'запись',
	'Entry' => 'Запись',

## php/lib/block.mtauthorhasentry.php

## php/lib/function.mtauthordisplayname.php

## php/lib/function.mtvar.php
	'\'[_1]\' is not a valid function for a hash.' => '\'[_1]\' не является верной функцией для хэша.',
	'\'[_1]\' is not a valid function for an array.' => '\'[_1]\' не является верной функцией для массива.',

## php/lib/function.mtremotesigninlink.php
	'TypeKey authentication is not enabled in this blog.  MTRemoteSignInLink can\'t be used.' => 'Авторизация через TypeKey отключена в этом блоге. MTRemoteSignInLink не может быть использован.',

## php/lib/MTUtil.php
	'userpic-[_1]-%wx%h%x' => 'userpic-[_1]-%wx%h%x', 

## php/lib/block.mtassets.php

## php/lib/function.mtproductname.php
	'[_1] [_2]' => '[_1] [_2]', 

## mt-check.cgi
#	'Movable Type System Check' => '', # Translate - Empty
#	'The mt-check.cgi script provides you with information on your system\'s configuration and determines whether you have all of the components you need to run Movable Type.' => '', # Translate - Empty
#	'The version of Perl installed on your server ([_1]) is lower than the minimum supported version ([_2]). Please upgrade to at least Perl [_2].' => '', # Translate - Empty
#	'Movable Type configuration file was not found.' => '', # Translate - Empty
	'System Information' => 'Информация о системе',
#	'Movable Type version:' => '', # Translate - Empty
#	'Current working directory:' => '', # Translate - Empty
#	'MT home directory:' => '', # Translate - Empty
#	'Operating system:' => '', # Translate - Empty
#	'Perl version:' => '', # Translate - Empty
#	'Perl include path:' => '', # Translate - Empty
#	'Web server:' => '', # Translate - Empty
#	'(Probably) Running under cgiwrap or suexec' => '', # Translate - Empty
#	'[_1] [_2] Modules' => '', # Translate - Empty
#	'The following modules are <strong>optional</strong>. If your server does not have these modules installed, you only need to install them if you require the functionality that the module provides.' => '', # Translate - Empty
#	'Some of the following modules are required by the various data storage options in Movable Type. In order run the system, your server needs to have DBI and at least one of the other modules installed.' => '', # Translate - Empty
#	'Either your server does not have [_1] installed, the version that is installed is too old, or [_1] requires another module that is not installed.' => '', # Translate - Empty
#	'Your server does not have [_1] installed, or [_1] requires another module that is not installed.' => '', # Translate - Empty
#	'Please consult the installation instructions for help in installing [_1].' => '', # Translate - Empty
#	'The DBD::mysql version you have installed is known to be incompatible with Movable Type. Please install the current release available from CPAN.' => '', # Translate - Empty
#	'The $mod is installed properly, but requires an updated DBI module. Please see note above regarding the DBI module requirements.' => '', # Translate - Empty
#	'Your server has [_1] installed (version [_2]).' => '', # Translate - Empty
#	'Movable Type System Check Successful' => '', # Translate - Empty
#	'You\'re ready to go!' => '', # Translate - Empty
#	'Your server has all of the required modules installed; you do not need to perform any additional module installations. Continue with the installation instructions.' => '', # Translate - Empty
	'CGI is required for all Movable Type application functionality.' => 'El CGI es requerido para todas las funciones del Sistema Movable Type.', # Translate - No russian chars
#	'Image::Size is required for file uploads (to determine the size of uploaded images in many different formats).' => '', # Translate - Empty
	'File::Spec is required for path manipulation across operating systems.' => 'File::Spec es requerido para la manipulación de la ubición de los archivos en el sistema operativo.', # Translate - No russian chars
#	'CGI::Cookie is required for cookie authentication.' => '', # Translate - Empty
	'DBI is required to store data in database.' => 'DBI es necesario para guardar información en bases de datos.', # Translate - No russian chars
#	'DBI and DBD::mysql are required if you want to use the MySQL database backend.' => '', # Translate - Empty
#	'DBI and DBD::Pg are required if you want to use the PostgreSQL database backend.' => '', # Translate - Empty
#	'DBI and DBD::SQLite are required if you want to use the SQLite database backend.' => '', # Translate - Empty
#	'DBI and DBD::SQLite2 are required if you want to use the SQLite 2.x database backend.' => '', # Translate - Empty
#	'HTML::Entities is needed to encode some characters, but this feature can be turned off using the NoHTMLEntities option in the configuration file.' => '', # Translate - Empty
#	'LWP::UserAgent is optional; It is needed if you wish to use the TrackBack system, the weblogs.com ping, or the MT Recently Updated ping.' => '', # Translate - Empty
#	'HTML::Parser is optional; It is needed if you wish to use the TrackBack system, the weblogs.com ping, or the MT Recently Updated ping.' => '', # Translate - Empty
#	'SOAP::Lite is optional; It is needed if you wish to use the MT XML-RPC server implementation.' => '', # Translate - Empty
#	'File::Temp is optional; It is needed if you would like to be able to overwrite existing files when you upload.' => '', # Translate - Empty
	'List::Util is optional; It is needed if you want to use the Publish Queue feature.' => 'Lista: Útiles opcionales; esto es necesario si usted desea utilizar la función cola de publicación', # Translate - No russian chars
#	'Image::Magick is optional; It is needed if you would like to be able to create thumbnails of uploaded images.' => '', # Translate - Empty
#	'Storable is optional; it is required by certain MT plugins available from third parties.' => '', # Translate - Empty
#	'Crypt::DSA is optional; if it is installed, comment registration sign-ins will be accelerated.' => '', # Translate - Empty
#	'MIME::Base64 is required in order to enable comment registration.' => '', # Translate - Empty
#	'XML::Atom is required in order to use the Atom API.' => '', # Translate - Empty
#	'Cache::Memcached and memcached server/daemon is required in order to use memcached as caching mechanism used by Movable Type.' => '', # Translate - Empty
#	'Archive::Tar is required in order to archive files in backup/restore operation.' => '', # Translate - Empty
#	'IO::Compress::Gzip is required in order to compress files in backup/restore operation.' => '', # Translate - Empty
#	'IO::Uncompress::Gunzip is required in order to decompress files in backup/restore operation.' => '', # Translate - Empty
#	'Archive::Zip is required in order to archive files in backup/restore operation.' => '', # Translate - Empty
#	'XML::SAX and/or its dependencies is required in order to restore.' => '', # Translate - Empty
#	'Digest::SHA1 and its dependencies are required in order to allow commenters to be authenticated by OpenID providers including Vox and LiveJournal.' => '', # Translate - Empty
#	'Mail::Sendmail is required for sending mail via SMTP Server.' => '', # Translate - Empty
	'The [_1] database driver is required to use [_2].' => 'Es necesario el controlador de la base de datos [_1] para usar [_2].', # Translate - No russian chars
#	'Checking for' => '', # Translate - Empty
#	'Installed' => '', # Translate - Empty
#	'Data Storage' => '', # Translate - Empty
#	'Required' => '', # Translate - Empty
	'Optional' => 'Опциональный',

## default_templates/commenter_notify.mtml
	'This email is to notify you that a new user has successfully registered on the blog \'[_1]\'. Listed below you will find some useful information about this new user.' => 'Это сообщение уведомляет Вас о том, что новый пользователь благополучно зарегистрировался на блоге \'[_1]\'. Ниже перечислена полезная информация о данном пользователе.',
	'New User Information:' => 'Информация о новом пользователе:',
	'Username: [_1]' => 'Имя пользователя: [_1]',
	'Full Name: [_1]' => 'Полное имя: [_1]',
	'Email: [_1]' => 'Email: [_1]',
	'To view or edit this user, please click on or cut and paste the following URL into a web browser:' => 'Для того, чтобы просмотреть или изменить информацию о данном пользователе перейдите по следующей ссылке:',

## default_templates/page.mtml
	'Header' => 'Шапка',
	'Page Detail' => 'Детали Страницы',
	'TrackBacks' => 'Трэкбэки',
	'Comments' => 'Комментарии',

## default_templates/recover-password.mtml
	'_USAGE_FORGOT_PASSWORD_1' => 'Вы запросили восстановление Вашего пароля к Movable Type. Ваш пароль был изменен в системе. Ваш новый пароль:',
	'_USAGE_FORGOT_PASSWORD_2' => 'Вы можете зайти в Movable Type по ссылке указанной ниже. После авторизации Вы можете изменить пароль на более запоминающийся.',
	'Mail Footer' => 'Подвал письма',

## default_templates/comment_throttle.mtml
	'If this was a mistake, you can unblock the IP address and allow the visitor to add it again by logging in to your Movable Type installation, going to Blog Config - IP Banning, and deleting the IP address [_1] from the list of banned addresses.' => 'Если это ошибка, то Вы можете разблокировать IP адрес и позволить посетителю добавить его заново. Для этого необходимо войти в Ваш Movable Type, зайти в Настройки Блога - IP блокирование и удалить адрес [_1] из списка заблокированных адресов.',
	'A visitor to your blog [_1] has automatically been banned by adding more than the allowed number of comments in the last [_2] seconds.' => 'Посетитель Вашего блога [_1] был автоматически заблокирован поскольку он превысил лимит количества новых комментариев за последние [quant,_2,секунду,секунды,секунд].',
	'This has been done to prevent a malicious script from overwhelming your weblog with comments. The banned IP address is' => 'Заблокированный IP адрес:',

## default_templates/dynamic_error.mtml
	'Page Not Found' => 'Страница не найдена',

## default_templates/sidebar.mtml
	'2-column layout - Sidebar' => '2 колонки - Боковое меню',
	'3-column layout - Primary Sidebar' => '3 колонки - Основное боковое меню',
	'3-column layout - Secondary Sidebar' => '3 колонки - Вспомогательное боковое меню',

## default_templates/footer-email.mtml
	'Powered by Movable Type [_1]' => 'Powered by Movable Type [_1]', 

## default_templates/sidebar_3col.mtml
	'About this Entry' => 'Об этой записи',
	'About this Archive' => 'Об этом архиве',
	'About Archives' => 'Об архивах',
	'This page contains links to all the archived content.' => 'Эта страница содержит архив ссылок на все записи в блоге.',
	'This page contains a single entry by [_1] published on <em>[_2]</em>.' => 'Эта страница содержит одну запись опубликованную <em>[_2]</em> автор которой [_1].',
	'<a href="[_1]">[_2]</a> was the previous entry in this blog.' => 'предыдущая запись - <a href="[_1]">[_2]</a>.',
	'<a href="[_1]">[_2]</a> is the next entry in this blog.' => 'следующая запись - <a href="[_1]">[_2]</a>.',
#	'This page is a archive of entries in the <strong>[_1]</strong> category from <strong>[_2]</strong>.' => '', # Translate - Empty
	'<a href="[_1]">[_2]</a> is the previous archive.' => 'предыдущий архив - <a href="[_1]">[_2]</a>.',
	'<a href="[_1]">[_2]</a> is the next archive.' => 'следующий архив - <a href="[_1]">[_2]</a> это следующий архив.',
	'This page is a archive of recent entries in the <strong>[_1]</strong> category.' => 'Эта страница содержит последние записи по теме <strong>[_1]</strong>.',
	'<a href="[_1]">[_2]</a> is the previous category.' => 'предыдущая тема - <a href="[_1]">[_2]</a>.',
	'<a href="[_1]">[_2]</a> is the next category.' => 'следующая тема - <a href="[_1]">[_2]</a>.',
	'This page is a archive of recent entries written by <strong>[_1]</strong> in <strong>[_2]</strong>.' => 'Эта страница содержит архив последних записей за <strong>[_2]</strong> автор которых <strong>[_1]</strong>.',
	'This page is a archive of recent entries written by <strong>[_1]</strong>.' => 'Эта страница содержит архив последних записей автор которых <strong>[_1]</strong>.',
	'This page is an archive of entries from <strong>[_2]</strong> listed from newest to oldest.' => 'Эта страница содержит архив записей за <strong>[_2]</strong>, в порядке от новых к старым.',
	'Find recent content on the <a href="[_1]">main index</a>.' => 'Смотрите последние записи на <a href="[_1]">главной странице</a>.',
	'Find recent content on the <a href="[_1]">main index</a> or look in the <a href="[_2]">archives</a> to find all content.' => 'Смотрите последние записи на <a href="[_2]">главной странице</a> или загляните в <a href="[_2]">архив</a>, где есть ссылки на все записи.',
	'Tag Cloud' => 'Облако Меток',
	'Author Archives' => 'Архивы по авторам',
	'[_1] ([_2])' => '[_1] ([_2])', 
	'[_1] <a href="[_2]">Archives</a>' => '<a href="[_2]">Архив</a> [_1]',
	'[_1]: Monthly Archives' => '[_1]: Архив по месяцам',
	'Subscribe to feed' => 'Подписка на RSS',
	'Subscribe to this blog\'s feed' => 'Подписаться на RSS',
	'Search results matching &ldquo;<$MTSearchString$>&rdquo;' => 'Результаты поиска соответствующие &ldquo;<$MTSearchString$>&rdquo;',
	'_MTCOM_URL' => 'http://www.movabletype.com/', 
	'Search' => 'Поиск',
	'Case sensitive' => 'Чуствительность к регистру',
	'Regex search' => 'Регулярные выражения',
	'Tags' => 'Метки',
	'Recent Entries' => 'Последние записи',
	'Photos' => 'Фотографии',
	'Categories' => 'Темы',

## default_templates/entry_listing.mtml
	'[_1] Archives' => 'Архив [_1]',
	'Recently in <em>[_1]</em> Category' => 'Записи по теме <em>[_1]</em>',
	'Recently by <em>[_1]</em>' => 'Записи от <em>[_1]</em>',
	'Entry Summary' => 'Аннотация Записи',
	'Main Index' => 'Оглавление',
	'Archives' => 'Архивы',

## default_templates/comment_form.mtml
	'Leave a comment' => 'Оставьте комментарий',
	'Name' => 'Имя',
	'Email Address' => 'Email', 
	'URL' => 'URL', 
	'Remember personal info?' => 'Запомнить введенную информацию?',
	'(You may use HTML tags for style)' => '(Для оформления можно использовать HTML)',
	'Preview' => 'Просмотр',
	'Submit' => 'Отправить',
	'Cancel' => 'Отмена',

## default_templates/tags.mtml

## default_templates/new-comment.mtml
	'An unapproved comment has been posted on your blog [_1], for entry #[_2] ([_3]). You need to approve this comment before it will appear on your site.' => 'На Вашем блоге [_1] кто-то прокомментировал запись [_2] ([_3]). Вам необходимо одобрить этот комментарий чтобы он появился на Вашем сайте.',
	'A new comment has been posted on your blog [_1], on entry #[_2] ([_3]).' => 'На Вашем блоге [_1] был размещен новый комментарий к записи [_2] ([_3]).',
	'Commenter name: [_1]' => 'Имя комментатора: [_1]',
	'Commenter email address: [_1]' => 'Email: [_1]', 
	'Commenter URL: [_1]' => 'URL: [_1]', 
	'Commenter IP address: [_1]' => 'IP адрес: [_1]',
	'Approve comment:' => 'Разрешить комментарий:',
	'View comment:' => 'Просмотр комментария:',
	'Edit comment:' => 'Изменить комментарий:',
	'Report comment as spam:' => 'Пометить комментарий как спам:',

## default_templates/comments.mtml
	'Comment Form' => 'Форма комментария',
	'[_1] Comments' => 'Комментариев: [_1]',
	'Comment Detail' => 'Развернутый комментарий',

## default_templates/archive_index.mtml
	'Monthly Archives' => 'Архивы по месяцам',
	'Category Monthly Archives' => 'Архивы по темам и по месяцам',
	'Author Monthly Archives' => 'Архивы по авторам и по месяцам',

## default_templates/main_index.mtml

## default_templates/comment_detail.mtml
	'By [_1] on [_2]' => '[_1] [_2]', 

## default_templates/trackbacks.mtml
	'[_1] TrackBacks' => 'Трэкбэков: [_1]',
	'Listed below are links to blogs that reference this entry: <a href="[_1]">[_2]</a>.' => 'Ниже указаны ссылки на блоги ссылающиеся на данную запись <a href="[_1]">[_2]</a>.',
	'TrackBack URL for this entry: <span id="trackbacks-link">[_1]</span>' => 'Трэкбэк URL для данной записи: <span id="trackbacks-link">[_1]</span>',
	'<a href="[_1]">[_2]</a> from [_3] on <a href="[_4]">[_5]</a>' => '<a href="[_1]">[_2]</a> от [_3] : <a href="[_4]">[_5]</a>',
	'[_1] <a href="[_2]">Read More</a>' => '[_1] <a href="[_2]">Читать далее</a>',

## default_templates/verify-subscribe.mtml
	'Thanks for subscribing to notifications about updates to [_1]. Follow the link below to confirm your subscription:' => 'Спасибо что подписались на уведомления об обновления на [_1]. Перейдите по следующей ссылке чтобы подтвердить Вашу подписку::',
	'If the link is not clickable, just copy and paste it into your browser.' => 'Если ссылка не нажимается, просто скопируйте её в Ваш броузер.',

## default_templates/categories.mtml

## default_templates/comment_response.mtml
	'Comment Submitted' => 'Комментарий отправлен',
	'Confirmation...' => 'Подтверждение...',
	'Your comment has been submitted!' => 'Ваш комментарий был успешно отправлен.',
	'Comment Pending' => 'Комментарий проверяется',
	'Thank you for commenting.' => 'Спасибо за Ваш комментарий.',
	'Your comment has been received and held for approval by the blog owner.' => 'Ваш комментарий получен и отложен до одобрения владельцем блога.',
	'Comment Submission Error' => 'Не удалось отправить комментарий',
	'Your comment submission failed for the following reasons:' => 'Ваш комментарий не прошел по следующей причине:',
	'Return to the <a href="[_1]">original entry</a>.' => 'Вернуться к <a href="[_1]">исходной записи</a>.',

## default_templates/notify-entry.mtml
	'A new [lc,_3] entitled \'[_1]\' has been published to [_2].' => 'Новая запись [lc,_3] озаглавленная \'[_1]\' была опубликована в [_2].',
	'View entry:' => 'Просмотр записи:',
	'View page:' => 'Просмотр страницы:',
	'[_1] Title: [_2]' => '[_1] Заголовок: [_2]',
	'Publish Date: [_1]' => 'Дата публикации: [_1]',
	'Message from Sender:' => 'Сообщение от:',
	'You are receiving this email either because you have elected to receive notifications about new content on [_1], or the author of the post thought you would be interested. If you no longer wish to receive these emails, please contact the following person:' => 'Вы получили данное сообщение либо потому, что Вы подписались на уведомления о новых публикация на [_1], или потому что автор данной заметки посчитал что Вы будете заинтересованы. Если Вы более не желаете получать подобные сообщения, пожалуйста свяжитесь со следующим человеком:',

## default_templates/entry_metadata.mtml
	'Permalink' => 'Постоянная ссылка',
	'Comments ([_1])' => 'Комментарии ([_1])',
	'TrackBacks ([_1])' => 'Трэкбэки ([_1])',

## default_templates/javascript.mtml
	'Thanks for signing in,' => 'Спасибо, что авторизовались,',
	'. Now you can comment.' => '. Теперь можете оставить комментарий.',
	'sign out' => 'выйти',
	'You do not have permission to comment on this blog.' => 'У Вас нет прав оставлять комментарии в этом блоге.',
	'Sign in' => 'Авторизуйтесь',
	' to comment on this entry.' => ' чтобы прокомментировать данную запись.',
	' to comment on this entry,' => ' чтобы прокомментировать данную запись,',
	'or ' => 'или ',
	'comment anonymously.' => 'оставьте комментарий анонимно',

## default_templates/entry.mtml
	'Entry Detail' => 'Запись полностью',

## default_templates/entry_summary.mtml
	'Entry Metadata' => 'Мета-данные Записи',
	'Continue reading <a rel="bookmark" href="[_1]">[_2]</a>.' => 'Читать далее: <a rel="bookmark" href="[_1]">[_2]</a>.',

## default_templates/commenter_confirm.mtml
	'Thank you registering for an account to comment on [_1].' => 'Спасибо что зарегистрировались на [_1] для комментирования.',
	'For your own security and to prevent fraud, we ask that you please confirm your account and email address before continuing. Once confirmed you will immediately be allowed to comment on [_1].' => 'Для Вашей собственной безопасности и для предотвращения обмана пожалуйста подтвердите Вашу учетную запись и адрес email перед тем как продолжите. После подтверждения Вы сможете оставлять комментарии в [_1].',
	'To confirm your account, please click on or cut and paste the following URL into a web browser:' => 'Для подтверждения Вашего аккаунта, пожалуйста перейдите по ссылке или скопируйте ее в Ваш броузер:',
	'If you did not make this request, or you don\'t want to register for an account to comment on [_1], then no further action is required.' => 'Если Вы не запрашивали регистрации или не желаете регистрироваться на [_1], то ни в каких действиях более нет необходимости.',
	'Thank you very much for your understanding.' => 'Спасибо за понимание.',
	'Sincerely,' => 'Искренне Ваш,',

## default_templates/new-ping.mtml
	'An unapproved TrackBack has been posted on your blog [_1], for entry #[_2] ([_3]). You need to approve this TrackBack before it will appear on your site.' => 'На Ваш блог [_1] для записи #[_2] ([_3]) был отправлен Трэкбэк. Вам необходимо его одобрить чтобы он появился на Вашем сайте.',
	'An unapproved TrackBack has been posted on your blog [_1], for category #[_2], ([_3]). You need to approve this TrackBack before it will appear on your site.' => 'На Ваш блог [_1] на тему #[_2], ([_3]) был отправлен Трэкбэк. Вам необходимо одобрить этот Трэкбэк чтобы он появился на Вашем сайте.',
	'A new TrackBack has been posted on your blog [_1], on entry #[_2] ([_3]).' => 'На Ваш блог [_1] на запись #[_2] ([_3]) был отправлен новый Трэкбэк.',
	'A new TrackBack has been posted on your blog [_1], on category #[_2] ([_3]).' => 'На Ваш блог [_1] на тему #[_2] ([_3]) был отправлен новый Трэкбэк.',
	'Excerpt' => 'Выжимка',
	'Title' => 'Заголовок',
	'Blog' => 'Блог',
	'IP address' => 'IP адрес',
	'Approve TrackBack' => 'Подтвердить Трэкбэк',
	'View TrackBack' => 'Посмотреть Трэкбэк',
	'Report TrackBack as spam' => 'Пожаловаться на спам',
	'Edit TrackBack' => 'Изменить Трэкбэк',

## default_templates/entry_detail.mtml

## default_templates/sidebar_2col.mtml

## default_templates/rss.mtml
	'Copyright [_1]' => 'Copyright [_1]', 

## default_templates/comment_preview.mtml
	'Comment on [_1]' => 'Комментарий по теме [_1]',
	'Previewing your Comment' => 'Предварительный просмотр комментария',

## default_templates/footer.mtml
	'Sidebar' => 'Боковое меню',
	'_POWERED_BY' => 'Powered by<br /><a href="http://www.movabletype.org/"><$MTProductName$></a>', 
	'This blog is licensed under a <a href="[_1]">Creative Commons License</a>.' => 'Этот блог лицензирован по <a href="[_1]">Лицензии Creative Commons</a>.',

## default_templates/search_results.mtml
	'Search Results' => 'Результат поиска',
	'Results matching &ldquo;[_1]&rdquo; from [_2]' => 'Результаты соотвествующие &ldquo;[_1]&rdquo; [_2]',
	'Results tagged &ldquo;[_1]&rdquo; from [_2]' => 'Результаты с меткой &ldquo;[_1]&rdquo; [_2]',
	'Results matching &ldquo;[_1]&rdquo;' => 'Результаты соответствующие &ldquo;[_1]&rdquo;',
	'Results tagged &ldquo;[_1]&rdquo;' => 'Результаты с меткой &ldquo;[_1]&rdquo;',
	'No results found for &ldquo;[_1]&rdquo;.' => 'Не найдено ничего соответствующего &ldquo;[_1]&rdquo;.',
	'Instructions' => 'Инструкции',
	'By default, this search engine looks for all words in any order. To search for an exact phrase, enclose the phrase in quotes:' => 'По умолчанию поиск будет производиться по всем словам в любом порядке. Чтобы искать точное соответствие заключите фразу в кавычки:',
	'movable type' => 'movable type', 
	'The search engine also supports AND, OR, and NOT keywords to specify boolean expressions:' => 'Поисковый движок также понимает ключевые слова AND, OR и NOT для указания булевых выражений',
	'personal OR publishing' => 'личный OR опубликованный',
	'publishing NOT personal' => 'опубликованный NOT личный',

## lib/MT/Util/Archive/Tgz.pm
	'Type must be tgz.' => 'Тип должен быть tgz.',
	'Could not read from filehandle.' => 'Невозможно прочитать из filehandle.',
	'File [_1] is not a tgz file.' => 'Файл [_1] не является файлом в формате tgz.',
	'File [_1] exists; could not overwrite.' => 'Файл [_1] уже существует: перезапись невозможна.',
	'Can\'t extract from the object' => 'Невозможно извлечь из объекта',
	'Can\'t write to the object' => 'Невозможно записать в объект',
	'Both data and file name must be specified.' => 'Должны быть указаны и имя файла и данные.',

## lib/MT/Util/Archive/Zip.pm
	'Type must be zip' => 'Тип должен быть zip',
	'File [_1] is not a zip file.' => '[_1] не является zip-файлов.',

## lib/MT/Util/Archive.pm
	'Type must be specified' => 'Тип должен быть указан',
	'Registry could not be loaded' => 'Регистр не может быть загружен',

## lib/MT/Util/Captcha.pm
	'Movable Type default CAPTCHA provider requires Image::Magick.' => 'Для CAPTCHA Movable Type необходим Image::Magick',
	'You need to configure CaptchaSourceImageBase.' => 'Необходимо настроить CaptchaSourceImageBase.',
	'Image creation failed.' => 'Не удалось создать изображение.',
	'Image error: [_1]' => 'Ошибка изображения: [_1]',

## lib/MT/DefaultTemplates.pm
	'Archive Index' => 'Список архивов',
	'Stylesheet' => 'Таблица стилей',
	'JavaScript' => 'JavaScript', 
	'RSD' => 'RSD', 
	'Atom' => 'Atom', 
	'RSS' => 'RSS', 
	'Entry Listing' => 'Список записей',
	'Comment Response' => 'Ответ на комментарий',
	'Displays error, pending or confirmation message for comments.' => 'Muestra mensajes de error o mensajes de pendiente y confirmación en los comentarios.', # Translate - No russian chars
	'Comment Preview' => 'Предварительный просмотр комментария',
	'Displays preview of comment.' => 'Muestra una previsualización del comentario.', # Translate - No russian chars
	'Dynamic Error' => 'Динамическая ошибка',
	'Displays errors for dynamically published templates.' => 'Muestra errores de las plantillas publicadas dinámicamente.', # Translate - No russian chars
	'Popup Image' => 'Всплывающее изображение',
	'Displays image when user clicks a popup-linked image.' => 'Muestra una imagen cuando el usuario hace clic en una imagen con enlace a una ventana emergente.', # Translate - No russian chars
	'Displays results of a search.' => 'Muestra los resultados de una búsqueda.', # Translate - No russian chars
	'Footer' => 'Подвал',
	'Sidebar - 2 Column Layout' => 'Боковое меню - 2 колонки',
	'Sidebar - 3 Column Layout' => 'Боковое меню - 3 колонки',
	'Comment throttle' => 'Aluvión de comentarios', # Translate - No russian chars
	'Commenter Confirm' => 'Confirmación de comentarista', # Translate - No russian chars
	'Commenter Notify' => 'Notificación de comentaristas', # Translate - No russian chars
	'New Comment' => 'Новый комментарий',
	'New Ping' => 'Новый пинг',
	'Entry Notify' => 'Уведомление о записи',
	'Password Recovery' => 'Восстановление пароля', 
	'Subscribe Verify' => 'Подтверждение подписки',

## lib/MT/Comment.pm
	'Comment' => 'Комментарий',
	'Load of entry \'[_1]\' failed: [_2]' => 'Fallo al cargar la entrada \'[_1]\': [_2]', # Translate - No russian chars
	'Load of blog \'[_1]\' failed: [_2]' => 'La carga del blog \'[_1]\' falló: [_2]', # Translate - No russian chars

## lib/MT/Compat/v3.pm
	'uses: [_1], should use: [_2]' => 'использует: [_1], а необходимо использовать: [_2]',
	'uses [_1]' => 'использует [_1]',
	'No executable code' => 'Выполняемый код отсутствует',
	'Publish-option name must not contain special characters' => 'Имя не может содержать спецсимволы',

## lib/MT/App/Comments.pm
	'Error assigning commenting rights to user \'[_1] (ID: [_2])\' for weblog \'[_3] (ID: [_4])\'. No suitable commenting role was found.' => 'Error asignando permisos para comentar al usuario \'[_1] (ID: [_2])\' para el weblog \'[_3] (ID: [_4])\'. No se encontró un rol adecuado.', # Translate - No russian chars
	'Invalid commenter login attempt from [_1] to blog [_2](ID: [_3]) which does not allow Movable Type native authentication.' => 'Intento de identificación de comentarista no válido desde [_1] en el blog [_2](ID: [_3]) que no permite la autentificación nativa de Movable Type.', # Translate - No russian chars
	'Invalid login.' => 'Неверный логин.',
	'Invalid login' => 'Неверный логин',
	'Successfully authenticated but signing up is not allowed.  Please contact system administrator.' => 'La identificación se ha producido con suceso pero la conexión ha sido rechazada.  Por favor contacte el administrador del sistema.', # Translate - No russian chars
	'You need to sign up first.' => 'Необходимо авторизоваться.',
	'Permission denied.' => 'Доступ запрещен.',
	'Login failed: permission denied for user \'[_1]\'' => 'Falló la identificación: permiso denegado al usuario \'[_1]\'', # Translate - No russian chars
	'Login failed: password was wrong for user \'[_1]\'' => 'Falló la identificación: contraseña errónea del usuario \'[_1]\'', # Translate - No russian chars
	'Failed login attempt by disabled user \'[_1]\'' => 'Intento fallido de inicio de sesión por un usuario deshabilitado \'[_1]\'', # Translate - No russian chars
	'Failed login attempt by unknown user \'[_1]\'' => 'Intento fallido de inicio de sesión por un usuario desconocido \'[_1]\'', # Translate - No russian chars
	'Signing up is not allowed.' => 'No está permitida la inscripción.', # Translate - No russian chars
	'Movable Type Account Confirmation' => 'Confirmación de cuenta - Movable Type', # Translate - No russian chars
	'System Email Address is not configured.' => 'La dirección de correo del sistema no está configurada.', # Translate - No russian chars
	'Commenter \'[_1]\' (ID:[_2]) has been successfully registered.' => 'El comentarista \'[_1]\' (ID:[_2]) se inscribió con éxito.', # Translate - No russian chars
	'Thanks for the confirmation.  Please sign in to comment.' => 'Gracias por la confirmación. Por favor, identifíquese para comentar.', # Translate - No russian chars
	'[_1] registered to the blog \'[_2]\'' => '[_1] registrado en el blog \'[_2]\'', # Translate - No russian chars
	'No id' => 'Нет id', 
	'No such comment' => 'Нет такого комментария',
	'IP [_1] banned because comment rate exceeded 8 comments in [_2] seconds.' => 'IP [_1] заблокирован 8 за [quant,_2,секунду,секунды,секунд] .',
	'IP Banned Due to Excessive Comments' => 'IP bloqueada debido al exceso de comentarios', # Translate - No russian chars
	'Invalid request' => 'Неверный запрос',
	'No entry_id' => 'Нет entry_id',
	'No such entry \'[_1]\'.' => 'Не такой записи \'[_1]\'.',
	'You are not allowed to add comments.' => 'У Вас нет прав добавлять комментарии.',
	'_THROTTLED_COMMENT' => 'Demasiados comentarios en un corto periodo de tiempo. Por favor, inténtelo dentro de un rato.', # Translate - No russian chars
	'Comments are not allowed on this entry.' => 'No se permiten comentarios en esta entrada.', # Translate - No russian chars
	'Comment text is required.' => 'El texto del comentario es obligatorio.', # Translate - No russian chars
	'An error occurred: [_1]' => 'Произошла ошибка: [_1]',
	'Registration is required.' => 'Требуется регистрация.',
	'Name and email address are required.' => 'El nombre y la dirección de correo-e son obligatorios.', # Translate - No russian chars
	'Invalid email address \'[_1]\'' => 'Dirección de correo-e no válida \'[_1]\'', # Translate - No russian chars
	'Invalid URL \'[_1]\'' => 'Неверный URL \'[_1]\'', 
	'Text entered was wrong.  Try again.' => 'El texto que introdujo es erróneo. Inténtelo de nuevo.', # Translate - No russian chars
	'Comment save failed with [_1]' => 'Fallo guardando comentario con [_1]', # Translate - No russian chars
	'Comment on "[_1]" by [_2].' => 'Comentario en "[_1]" por [_2].', # Translate - No russian chars
	'Commenter save failed with [_1]' => 'Fallo guardando comentarista con [_1]', # Translate - No russian chars
	'Publish failed: [_1]' => 'Falló la publicación: [_1]', # Translate - No russian chars
	'Failed comment attempt by pending registrant \'[_1]\'' => 'Falló el intento de comentar por el comentarista pendiente \'[_1]\'', # Translate - No russian chars
	'Registered User' => 'Зарегистрировать Пользователя',
	'The sign-in attempt was not successful; please try again.' => 'El intento de registro no tuvo éxito; por favor, inténtelo de nuevo.', # Translate - No russian chars
	'No entry was specified; perhaps there is a template problem?' => 'No se especificó ninguna entrada; ¿quizás hay un problema con la plantilla?', # Translate - No russian chars
	'Somehow, the entry you tried to comment on does not exist' => 'De alguna manera, la entrada en la que intentó comentar no existe', # Translate - No russian chars
	'Invalid commenter ID' => 'ID de comentarista no válido', # Translate - No russian chars
	'No entry ID provided' => 'ID de entrada no provista', # Translate - No russian chars
	'Permission denied' => 'Permiso denegado', # Translate - No russian chars
	'All required fields must have valid values.' => 'Todos los campos obligatorios deben tener valores válidos.', # Translate - No russian chars
	'Passwords do not match.' => 'Пароли не совпадают.',
	'Email Address is invalid.' => 'La dirección de correo no es válida.', # Translate - No russian chars
	'URL is invalid.' => 'La URL no es válida.', # Translate - No russian chars
	'Commenter profile has successfully been updated.' => 'Se actualizó con éxito el perfil del comentarista.', # Translate - No russian chars
	'Commenter profile could not be updated: [_1]' => 'No se pudo actualizar el perfil del comentarista: [_1]', # Translate - No russian chars

## lib/MT/App/ActivityFeeds.pm
	'Error loading [_1]: [_2]' => 'Ошибка загрузки [_1]: [_2]',
	'An error occurred while generating the activity feed: [_1].' => 'Произошла ошибка при генерации feed событий: [_1].',
	'No permissions.' => 'Нет прав.',
	'[_1] Weblog TrackBacks' => '[_1] Трэкбэки веблога',
	'All Weblog TrackBacks' => 'Все Трэкбэки веблога',
	'[_1] Weblog Comments' => '[_1] комментарии веблога',
	'All Weblog Comments' => 'Все комментарии веблога',
	'[_1] Weblog Entries' => '[_1] записи веблога',
	'All Weblog Entries' => 'Все записи веблога',
	'[_1] Weblog Activity' => '[_1] события веблога',
	'All Weblog Activity' => 'Все события в веблоге',
	'Movable Type System Activity' => 'Системные события Movable Type',
	'Movable Type Debug Activity' => 'Отладочные события Movable Type',
	'[_1] Weblog Pages' => 'Всего страниц блога: [_1]',
	'All Weblog Pages' => 'Все страницы веблога',

## lib/MT/App/Viewer.pm
	'Loading blog with ID [_1] failed' => 'Fallo al cargar el blog con el ID [_1]', # Translate - No russian chars
	'Template publishing failed: [_1]' => 'Fallo al publicar la plantilla: [_1]', # Translate - No russian chars
	'Invalid date spec' => 'Formato de fecha no válido', # Translate - No russian chars
	'Can\'t load template [_1]' => 'No se pudo cargar la plantilla [_1]', # Translate - No russian chars
	'Archive publishing failed: [_1]' => 'Fallo al publicar los archivos: [_1]', # Translate - No russian chars
	'Invalid entry ID [_1]' => 'Identificador de entrada no válido [_1]', # Translate - No russian chars
	'Entry [_1] is not published' => 'La entrada [_1] no está publicada', # Translate - No russian chars
	'Invalid category ID \'[_1]\'' => 'Identificador de categoría no válido \'[_1]\'', # Translate - No russian chars

## lib/MT/App/Search.pm
	'You are currently performing a search. Please wait until your search is completed.' => 'En estos momentos está realizando una búsqueda. Por favor, espere hasta que se complete.', # Translate - No russian chars
	'Search failed. Invalid pattern given: [_1]' => 'Falló la búsqueda. Patrón no válido: [_1]', # Translate - No russian chars
	'Search failed: [_1]' => 'Falló la búsqueda: [_1]', # Translate - No russian chars
	'No alternate template is specified for the Template \'[_1]\'' => 'No se especificó una plantilla alternativa para la Plantilla \'[_1]\'', # Translate - No russian chars
	'Opening local file \'[_1]\' failed: [_2]' => 'Не удалось открыть локальный файл \'[_1]\': [_2]',
	'Publishing results failed: [_1]' => 'Fallo al publicar los resultados: [_1]', # Translate - No russian chars
	'Search: query for \'[_1]\'' => 'Búsqueda: encontrar \'[_1]\'', # Translate - No russian chars
	'Search: new comment search' => 'Búsqueda: nueva búsqueda de comentarios', # Translate - No russian chars

## lib/MT/App/NotifyList.pm
	'Please enter a valid email address.' => 'Por favor, teclee una dirección de correo válida.', # Translate - No russian chars
	'Missing required parameter: blog_id. Please consult the user manual to configure notifications.' => 'Falta parámetro obligatorio: blog_id. Por favor, consulte el manual de usuario para configurar las notificaciones.', # Translate - No russian chars
	'An invalid redirect parameter was provided. The weblog owner needs to specify a path that matches with the domain of the weblog.' => 'Parámetro de redirección no válido. El dueño del weblog debe especificar una ruta que coincida con el del dominio del weblog.', # Translate - No russian chars
	'The email address \'[_1]\' is already in the notification list for this weblog.' => 'La dirección de correo-e \'[_1]\' ya está en la lista de notificaciones de este weblog.', # Translate - No russian chars
	'Please verify your email to subscribe' => 'Por favor, verifique su dirección de correo electrónico para la subscripción', # Translate - No russian chars
	'_NOTIFY_REQUIRE_CONFIRMATION' => 'Se envió un correo a [_1]. Para completar su suscripción,
por favor siga el enlace contenido en este correo. Esto verificará
que la dirección provista es correcta y le pertenece.',
	'The address [_1] was not subscribed.' => 'No se suscribió la dirección [_1].', # Translate - No russian chars
	'The address [_1] has been unsubscribed.' => 'Se desuscribió la dirección [_1].', # Translate - No russian chars

## lib/MT/App/Wizard.pm
	'The [_1] driver is required to use [_2].' => 'Es necesario el controlador [_1] para usar [_2].', # Translate - No russian chars
	'An error occurred while attempting to connect to the database.  Check the settings and try again.' => 'Ocurrió un error intentando conectar a la base de datos. Compruebe la configuración e inténtalo de nuevo.', # Translate - No russian chars
	'SMTP Server' => 'Servidor SMTP', # Translate - No russian chars
	'Sendmail' => 'Sendmail', # Translate - Not translated
	'Test email from Movable Type Configuration Wizard' => 'Mensaje de comprobación del asistente de configuración de Movable Type', # Translate - No russian chars
	'This is the test email sent by your new installation of Movable Type.' => 'Este es el mensaje de comprobación enviado por su nueva instalación de Movable Type.', # Translate - No russian chars
	'This module is needed to encode special characters, but this feature can be turned off using the NoHTMLEntities option in mt-config.cgi.' => 'Este módulo es necesario para codificar caracteres especiales, pero se puede desactivar esta característica utilizando la opción NoHTMLEntities en mt-config.cgi.', # Translate - No russian chars
	'This module is needed if you wish to use the TrackBack system, the weblogs.com ping, or the MT Recently Updated ping.' => 'Este módulo es necesario si desea usar el sistema de TrackBack, el ping a weblogs.com, o el ping a Actualizaciones Recientes de MT.', # Translate - No russian chars
	'This module is needed if you wish to use the MT XML-RPC server implementation.' => 'Este módulo es necesario si desea usar la implementación del servidor XML-RPC de MT.', # Translate - No russian chars
	'This module is needed if you would like to be able to overwrite existing files when you upload.' => 'Este módulo es necesario si desea poder sobreescribir los ficheros al subirlos.', # Translate - No russian chars
	'This module is needed if you would like to be able to create thumbnails of uploaded images.' => 'Este módulo es necesario si desea poder crear miniaturas de las imágenes subidas.', # Translate - No russian chars
	'This module is required by certain MT plugins available from third parties.' => 'Este módulo lo necesitan algunas extensiones de MT de terceras partes.', # Translate - No russian chars
	'This module accelerates comment registration sign-ins.' => 'Este módulo acelera el registro de identificación en los comentarios.', # Translate - No russian chars
	'This module is needed to enable comment registration.' => 'Este módulo es necesario para habilitar el registro en los comentarios.', # Translate - No russian chars
	'This module enables the use of the Atom API.' => 'Este módulo permite el uso del interfaz (API) de Atom.', # Translate - No russian chars
	'This module is required in order to archive files in backup/restore operation.' => 'Este módulo es necesario para archivar ficheros en las operaciones de copias de seguridad y restauración.', # Translate - No russian chars
	'This module is required in order to compress files in backup/restore operation.' => 'Este módulo es ncesario para comprimir ficheros en operaciones de copias de seguridad y restauración.', # Translate - No russian chars
	'This module is required in order to decompress files in backup/restore operation.' => 'Este módulo es neesario para descomprimir ficheros en las operaciones de copia de seguridad y restauración.', # Translate - No russian chars
	'This module and its dependencies are required in order to restore from a backup.' => 'Este módulo y sus dependencias son necesarios para restaurar una copia de seguridad.', # Translate - No russian chars
	'This module and its dependencies are required in order to allow commenters to be authenticated by OpenID providers including Vox and LiveJournal.' => 'Este módulo y sus dependencias son necesarios para permitir que los comentaristas se autentifiquen a través de proveedores de OpenID, incluyendo Vox y LiveJournal.', # Translate - No russian chars
	'This module is required for sending mail via SMTP Server.' => 'Este módulo es necesario para el envío de correo a través de servidores SMTP.', # Translate - No russian chars
	'This module is used in test attribute of MTIf conditional tag.' => 'Este módulo se utiliza en el atributo test de la etiqueta MTIf.', # Translate - No russian chars
	'This module is required for file uploads (to determine the size of uploaded images in many different formats).' => 'Este módulo es necesario para subir archivos (para determinar el tamaño de las imágenes en diferentes formatos).', # Translate - No russian chars
	'This module is required for cookie authentication.' => 'Este módulo es necsario para la autentificación con cookies.', # Translate - No russian chars

## lib/MT/App/Trackback.pm
	'Invalid entry ID \'[_1]\'' => 'Неверный ID записи \'[_1]\'',
	'You must define a Ping template in order to display pings.' => 'Для отображения пингов Вам необходимо определить шаблон &laquo;Пинг&raquo;.', 
	'Trackback pings must use HTTP POST' => 'Пинги Трэкбэков должны использовать метод HTTP POST', 
	'Need a TrackBack ID (tb_id).' => 'Необходим ID Трэкбэка (tb_id).', 
	'Invalid TrackBack ID \'[_1]\'' => 'Неверный ID Трэкбэка \'[_1]\'', 
	'You are not allowed to send TrackBack pings.' => 'Вам не разрешено отсылать пинги Трэкбэков.',
	'You are pinging trackbacks too quickly. Please try again later.' => 'Вы пингуете трэкбэки слишком часто. Пожалуйста, попробуйте позже.', 
	'Need a Source URL (url).' => 'Должен быть указан URL источника (url).', 
	'This TrackBack item is disabled.' => 'Этот элемент Трэкбэка отключен.', 
	'This TrackBack item is protected by a passphrase.' => 'Этот элемент Трэкбэка защищен паролем.',
	'TrackBack on "[_1]" from "[_2]".' => 'Трэкбэк на "[_1]" от "[_2]".', 
	'TrackBack on category \'[_1]\' (ID:[_2]).' => 'Трэкбэк на тему \'[_1]\' (ID:[_2]).', 
	'Can\'t create RSS feed \'[_1]\': ' => 'Не удалось создать RSS синдикацию \'[_1]\': ', 
	'New TrackBack Ping to Entry [_1] ([_2])' => 'Новый Трэкбэк Пинг на Запись [_1] ([_2])', 
	'New TrackBack Ping to Category [_1] ([_2])' => 'Новый Трэкбэк Пинг на Тему [_1] ([_2])',

## lib/MT/App/Upgrader.pm
	'Failed to authenticate using given credentials: [_1].' => 'Fallo al autentificar con las credenciales ofrecidas: [_1].', # Translate - No russian chars
	'You failed to validate your password.' => 'Falló al validar la contraseña.', # Translate - No russian chars
	'You failed to supply a password.' => 'No introdujo una contraseña.', # Translate - No russian chars
	'The e-mail address is required.' => 'La dirección de correo electrónico es necesaria.', # Translate - No russian chars
	'The path provided below is not writable.' => 'La ruta aquí abajo no está abierta en escritura', # Translate - No russian chars
	'Invalid session.' => 'Sesión no válida.', # Translate - No russian chars
	'No permissions. Please contact your administrator for upgrading Movable Type.' => 'Sin permisos. Por favor, contacte con su administrador para la actualización de Movable Type.', # Translate - No russian chars
	'Movable Type has been upgraded to version [_1].' => 'Movable Type ha sido actualizado a la versión [_1].', # Translate - No russian chars

## lib/MT/App/CMS.pm
	'No [_1] were found that match the given criteria.' => 'Ningún [_1] ha sido encontrado que corresponda al criterio dado.', # Translate - No russian chars
	'This action will restore your global templates to factory settings without creating a backup. Click OK to continue or Cancel to abort.' => 'Esta acción restaurará las plantillas globales con la configuración de fábrica sin crear una copia de seguridad. Haga clic en Aceptar para continuar o Cancelar para abortar.', # Translate - No russian chars
	'Invalid request.' => 'Неверный запрос.',
	'_WARNING_PASSWORD_RESET_MULTI' => 'Va a reiniciar la contraseña de los usuarios seleccionados. Se generarán nuevas contraseñas aleatorias y se enviarán directamente a sus respectivas direcciones de correo electrónico.\n\n¿Desea continuar?', # Translate - No russian chars
	'_WARNING_DELETE_USER_EUM' => 'Borrar un usuario es una acción irreversible que crea huérfanos en las entradas del usuario. Si desea retirar un usuario o bloquear su acceso al sistema, se recomienda deshabilitar su cuenta. ¿Está seguro de que desea borrar a los usuarios seleccionados\nPodrán re-crearse a sí mismos si el usuario seleccionado existe en el directorio externo.', # Translate - No russian chars
	'_WARNING_DELETE_USER' => 'Удаление пользователя это необратимая операция которая сделает все его записи сиротами? Если Вы хотите запретить доступ данному пользователю, то рекомендуентся его отключить. Вы уверены что хотите удалить это пользователя?',
	'All Assets' => 'Все медиа-ресурсы',
	'Published [_1]' => 'опубликованные [_1]',
	'Unpublished [_1]' => 'неопубликованные [_1]',
	'Scheduled [_1]' => 'запланированные [_1]',
	'My [_1]' => 'Мои [_1]',
	'[_1] with comments in the last 7 days' => '[_1] с комментариями за последние 7 дней',
	'[_1] posted between [_2] and [_3]' => '[_1] опубликованные между [_2] и [_3]',
	'[_1] posted since [_2]' => '[_1] опубликовано через [_2]',
	'[_1] posted on or before [_2]' => '[_1] опубликовано [_2] или ранее',
	'All comments by [_1] \'[_2]\'' => 'Все комментарии от [_1] \'[_2]\'',
	'Commenter' => 'Комментаторы',
	'All comments for [_1] \'[_2]\'' => 'Все комментарии на [_1] \'[_2]\'',
	'Comments posted between [_1] and [_2]' => 'Комментарии опубликованные между [_1] и [_2]',
	'Comments posted since [_1]' => 'Комментарии опубликованные начиная с [_1]',
	'Comments posted on or before [_1]' => 'Комментарии опубликованные [_1] или ранее',
	'Invalid blog' => 'Blog no válido', # Translate - No russian chars
	'Invalid password recovery attempt; can\'t recover password in this configuration' => 'Intento de recuperación de contraseña no válido; no se pudo recuperar la clave con esta configuración', # Translate - No russian chars
	'Invalid author_id' => 'author_id no válido', # Translate - No russian chars
	'Can\'t recover password in this configuration' => 'No se pudo recuperar la clave con esta configuración', # Translate - No russian chars
	'Invalid user name \'[_1]\' in password recovery attempt' => 'Nombre de usario no válido \'[_1]\' en intento de recuperación de contraseña', # Translate - No russian chars
	'User name or password hint is incorrect.' => 'El nombre del usuario o la contraseña es incorrecto.', # Translate - No russian chars
	'User has not set pasword hint; cannot recover password' => 'El usuario no ha configurado una pista para la contraseña; no se pudo recuperar', # Translate - No russian chars
	'Invalid attempt to recover password (used hint \'[_1]\')' => 'Intento inválido de recuperación de la contraseña (pista usada \'[_1]\')', # Translate - No russian chars
	'User does not have email address' => 'El usario sin dirección de correo electrónico', # Translate - No russian chars
	'Password was reset for user \'[_1]\' (user #[_2]). Password was sent to the following address: [_3]' => 'Se reinició la contraseña del usario \'[_1]\' (user #[_2]). Se envió la contraseña a las siguientes direcciones: [_3]', # Translate - No russian chars
	'Error sending mail ([_1]); please fix the problem, then try again to recover your password.' => 'Error enviando correo ([_1]); por favor, solvente el problema e inténte de nuevo la recuperación de la contraseña.', # Translate - No russian chars
	'(newly created user)' => '(новый пользователь)',
	'Untitled' => 'Без заголовка',
	'Files' => 'Файлы',
	'Roles' => 'Роли',
	'Users' => 'Пользователи',
	'User Associations' => 'Ассоциации пользователей', 
	'Role Users & Groups' => 'Роли Пользователей и Групп', 
	'Associations' => 'Ассоциации',
	'(Custom)' => '(Выборочный)', 
	'(user deleted)' => '(пользователь удален)',
	'The user' => 'Пользователь',
	'User' => 'Пользователь',
	'Invalid type' => 'Неверный тип',
	'Entries' => 'Записи',
	'New name of the tag must be specified.' => 'Должно быть указано новое имя метки.',
	'No such tag' => 'Нет такой метки',
	'None' => 'Нет',
	'You are not authorized to log in to this blog.' => 'У Вас нет прав доступа к этому блогу.',
	'No such blog [_1]' => 'Нет такого блога: [_1]',
	'Shared Template Modules' => 'Разделяемы шаблоны модулей',
	'Reuse elements of your site design or layout across all the blogs and sites managed within Movable Type.' => 'Используйте элементы дизайна Вашего сайта повторно во всех блогах и сайтах управляемых Movable Type.',
	'Userpics' => 'Аватары',
	'Allow authors and commenters to upload a photo of themselves to be displayed alongside their comments.' => 'Позволяет авторам и комментаторам самостоятельно загружать их фотографии которые будут отображаться рядом с комментариями.',
	'Template Sets' => 'Наборы шаблонов',
	'Template sets provide an easy way to bundle an entire design and install it into Movable Type.' => 'Наборы шаблонов посволяют легко упаковать весь дизайн и установить его в Movable Type.',
	'Blogs' => 'Блоги',
	'Blog Activity Feed' => 'RSS активности',
	'*User deleted*' => '*Пользователь удален*',
	'<a href="[_1]">QuickPost to [_2]</a> - Drag this link to your browser\'s toolbar then click it when you are on a site you want to blog about.' => '<a href="[_1]">QuickPost в [_2]</a> - Перетащите ссылку в адресную строку ваше броузера и нажмите её находясь на сайте, о которым Вы хотите написать заметку.',
	'All Feedback' => 'Все ответы',
	'Publishing' => 'Публикация',
	'Activity Log' => 'История действий',
	'System Activity Feed' => 'Синдикация системной активности',
	'Activity log for blog \'[_1]\' (ID:[_2]) reset by \'[_3]\'' => 'История действий для блога \'[_1]\' (ID:[_2]) очищена \'[_3]\'',
	'Activity log reset by \'[_1]\'' => 'История дествий очищена \'[_1]\'',
	'Please select a blog.' => 'Пожалуйста, выберите блог.',
	'Edit Template' => 'Редактирование Шаблона',
	'Go Back' => 'Вернуться',
	'Import/Export' => 'Импорт/Экспорт',
	'Invalid parameter' => 'Неверный параметр',
	'Permission denied: [_1]' => 'Доступ запрещен: [_1]',
	'Load failed: [_1]' => 'Загрузка не удалась: [_1]',
	'(no reason given)' => '(причина не указана)', 
	'Pages' => 'Страницы',
	'(untitled)' => '(без заголовка)',
	'index' => 'индексов',
	'archive' => 'архивов',
	'module' => 'модулей',
	'widget' => 'виджетов',
	'email' => 'email', 
	'system' => 'системы',
	'Templates' => 'Шаблоны',
	'One or more errors were found in this template.' => 'В этом шаблоне обнаружена одна или более ошибок.', 
	'General Settings' => 'Основные настройки',
	'Publishing Settings' => 'Настройки публикации',
	'Plugin Settings' => 'Настройки плугинов',
	'Settings' => 'Настройки',
	'Edit Comment' => 'Изменить комментарий',
	'Authenticated Commenters' => 'Авторизованные комментаторы',
	'Commenter Details' => 'Информация о комментаторе',
	'Assets' => 'Медиа-ресурсы',
	'New Entry' => 'Новая запись',
	'New Page' => 'Новая страница',
	'Create template requires type' => 'Создание шаблона требует тип',
	'Archive' => 'Архив',
	'Entry or Page' => 'Запись или страница',
	'New Template' => 'Новый шаблон',
	'New Blog' => 'Новый блог',
	'pages' => 'страницы',
	'Create User' => 'Создать пользователя',
	'User requires username' => 'Необходимо указать имя пользователя',
	'A user with the same name already exists.' => 'Пользователь с таким именем уже существует.',
	'User requires password' => 'Необходимо указать пароль пользователя',
	'User requires password recovery word/phrase' => 'Необходимо указать кодовую фразу для восстановления пароля',
	'Email Address is required for password recovery' => 'Для восстановления пароля нужен адрес email',
	'Website URL is imperfect' => 'URL Сайта несовершенен',
	'The value you entered was not a valid email address' => 'Значение которые Вы ввели не является адресом email',
	'The e-mail address you entered is already on the Notification List for this blog.' => 'Адрес который Вы указали уже есть в списках уведомлений этого блога.',
	'You did not enter an IP address to ban.' => 'Вы не указали IP для блокирования.',
	'The IP you entered is already banned for this blog.' => 'IP который Вы указали уже заблокирова для этого блога.',
	'You did not specify a blog name.' => 'Вы не указали имя блога.',
	'Site URL must be an absolute URL.' => 'URL Сайта должен быть абсолютным URL.',
	'Archive URL must be an absolute URL.' => 'URL Архива должен быть абсолютным URL.',
	'You did not specify an Archive Root.' => 'Вы не указали корень Архива.',
	'The name \'[_1]\' is too long!' => 'Имя \'[_1]\' слишком длинное!',
	'Folder \'[_1]\' created by \'[_2]\'' => 'Пользователь \'[_2]\' создал папку \'[_1]\'',
	'Category \'[_1]\' created by \'[_2]\'' => 'Пользователь \'[_2]\' создал тему \'[_1]\'',
	'The folder \'[_1]\' conflicts with another folder. Folders with the same parent must have unique basenames.' => 'Папка \'[_1]\' конфликтует с другой папкой. Папки с одним и тем же предком должны иметь разные имена.',
	'The category name \'[_1]\' conflicts with another category. Top-level categories and sub-categories with the same parent must have unique names.' => 'Имя темы \'[_1]\' конфликтует с другой темой. Темы высшего уровня и под-темы с одним и тем же предком должны иметь уникальные имена',
	'The category basename \'[_1]\' conflicts with another category. Top-level categories and sub-categories with the same parent must have unique basenames.' => 'Базовое имя темы \'[_1]\' конфликтует с базовым именем другой темы. Темы высшего уровня и подтемы с одним и тем же предком должны иметь уникальные имена.',
	'Saving permissions failed: [_1]' => 'Сохранение прав не удалось: [_1]',
	'Blog \'[_1]\' (ID:[_2]) created by \'[_3]\'' => 'Блог \'[_1]\' (ID:[_2]) был создан \'[_3]\'',
	'User \'[_1]\' (ID:[_2]) created by \'[_3]\'' => 'Пользователь \'[_1]\' (ID:[_2]) был создан \'[_3]\'',
	'Template \'[_1]\' (ID:[_2]) created by \'[_3]\'' => 'Шаблон \'[_1]\' (ID:[_2]) был создан \'[_3]\'',
	'You cannot delete your own association.' => 'Вы не можете удалять Ваши собственные ассоциации',
	'You cannot delete your own user record.' => 'Вы не можете удалить Вашу собственную учетную запись пользователя.',
	'You have no permission to delete the user [_1].' => 'У Вас нет прав удалить пользователя [_1].',
	'Blog \'[_1]\' (ID:[_2]) deleted by \'[_3]\'' => 'Блог \'[_1]\' (ID:[_2]) был удален \'[_3]\'',
	'Subscriber \'[_1]\' (ID:[_2]) deleted from address book by \'[_3]\'' => 'Подписчик \'[_1]\' (ID:[_2]) был удален из адреснной книги \'[_3]\'',
	'User \'[_1]\' (ID:[_2]) deleted by \'[_3]\'' => 'Пользователь \'[_1]\' (ID:[_2]) был удален \'[_3]\'',
	'Folder \'[_1]\' (ID:[_2]) deleted by \'[_3]\'' => 'Папка \'[_1]\' (ID:[_2]) была удалена \'[_3]\'',
	'Category \'[_1]\' (ID:[_2]) deleted by \'[_3]\'' => 'Тема \'[_1]\' (ID:[_2]) была удалена \'[_3]\'',
	'Comment (ID:[_1]) by \'[_2]\' deleted by \'[_3]\' from entry \'[_4]\'' => 'Комментарий (ID:[_1]) от \'[_2]\' был удален \'[_3]\' из записи \'[_4]\'',
	'Page \'[_1]\' (ID:[_2]) deleted by \'[_3]\'' => 'Страница \'[_1]\' (ID:[_2]) была удалена \'[_3]\'',
	'Entry \'[_1]\' (ID:[_2]) deleted by \'[_3]\'' => 'Запись \'[_1]\' (ID:[_2]) была удалена \'[_3]\'',
	'(Unlabeled category)' => '(Неотмеченная тема)',
	'Ping (ID:[_1]) from \'[_2]\' deleted by \'[_3]\' from category \'[_4]\'' => 'Ping (ID:[_1]) desde \'[_2]\' borrado por \'[_3]\' de la categoría \'[_4]\'', # Translate - No russian chars
	'(Untitled entry)' => '(Entrada sin título)', # Translate - No russian chars
	'Ping (ID:[_1]) from \'[_2]\' deleted by \'[_3]\' from entry \'[_4]\'' => 'Ping (ID:[_1]) desde \'[_2]\' borrado por \'[_3]\' de la entrada \'[_4]\'', # Translate - No russian chars
	'Template \'[_1]\' (ID:[_2]) deleted by \'[_3]\'' => '\'[_3]\' удалил шаблон \'[_1]\' (ID:[_2])',
	'Tag \'[_1]\' (ID:[_2]) deleted by \'[_3]\'' => '\'[_3]\' удалил метку \'[_1]\' (ID:[_2])',
	'File \'[_1]\' uploaded by \'[_2]\'' => '\'[_2]\' загрузил файл \'[_1]\'',
	'File \'[_1]\' (ID:[_2]) deleted by \'[_3]\'' => '\'[_3]\' удалил файл \'[_1]\' (ID:[_2])',
	'Permisison denied.' => 'Доступ запрещен.',
	'The Template Name and Output File fields are required.' => 'Los campos del nombre de la plantilla y el fichero de salida son obligatorios.', # Translate - No russian chars
	'Invalid type [_1]' => 'Неверный тип [_1]',
	'Save failed: [_1]' => 'Не удалось сохранить: [_1]',
	'Saving object failed: [_1]' => 'Сохранение объекта не удалосб: [_1]',
	'No Name' => 'Нет Имени', 
	'Notification List' => 'Список уведомлений',
	'IP Banning' => 'Блокировки IP',
	'Removing tag failed: [_1]' => 'Не удалось удалить метку: [_1]',
	'You can\'t delete that category because it has sub-categories. Move or delete the sub-categories first if you want to delete this one.' => 'No puede eliminar esa categoría porque tiene subcategorías. Mueva o elimine primero las categorías si desea eliminar ésta.', # Translate - No russian chars
	'Loading MT::LDAP failed: [_1].' => 'Не удалось загрузить MT::LDAP: [_1].',
	'Removing [_1] failed: [_2]' => 'Удаление [_1] не удалось: [_2]',
	'System templates can not be deleted.' => 'Системные шаблоны не могут быть удалены.',
	'Unknown object type [_1]' => 'Неизвестный тип объекта [_1]',
	'Can\'t load file #[_1].' => 'No se pudo cargar el fichero nº[_1].', # Translate - No russian chars
	'No such commenter [_1].' => 'No existe el comentarista [_1].', # Translate - No russian chars
	'User \'[_1]\' trusted commenter \'[_2]\'.' => 'Пользователь \'[_1]\' confió en el comentarista \'[_2]\'.',
	'User \'[_1]\' banned commenter \'[_2]\'.' => 'Пользователь \'[_1]\' bloqueó al comentarista \'[_2]\'.',
	'User \'[_1]\' unbanned commenter \'[_2]\'.' => 'Пользователь \'[_1]\' desbloqueó al comentarista \'[_2]\'.',
	'User \'[_1]\' untrusted commenter \'[_2]\'.' => 'Пользователь \'[_1]\' desconfió del comentarista \'[_2]\'.',
	'Need a status to update entries' => 'Нужен статус для обновления записей',
	'Need entries to update status' => 'Для обновления статуса нужны записи',
	'One of the entries ([_1]) did not actually exist' => 'Una de las entradas ([_1]) no existe actualmente', # Translate - No russian chars
	'[_1] \'[_2]\' (ID:[_3]) status changed from [_4] to [_5]' => '[_1] \'[_2]\' (ID:[_3]) статус изменен с [_4] на [_5]',
	'You don\'t have permission to approve this comment.' => 'У Вас нет прав одобрить этот комментарий.',
	'Comment on missing entry!' => 'Комментарий на отсутствующую запись!',
	'Commenters' => 'Комментаторы',
	'Orphaned comment' => 'Осиротевший комментарий',
	'Comments Activity Feed' => 'Feed комментариев',
	'Orphaned' => 'Осиротевший',
	'Global Templates' => 'Общие шаблоны',
	'Plugin Set: [_1]' => 'Набор плугинов: [_1]',
	'Individual Plugins' => 'Индивидуальные плугины',
	'Junk TrackBacks' => 'Мусорные Трэкбэки',
	'TrackBacks where <strong>[_1]</strong> is &quot;[_2]&quot;.' => 'Трэкбэки где <strong>[_1]</strong> есть &quot;[_2]&quot;.',
	'TrackBack Activity Feed' => 'Синдикация Трэкбэков',
	'No Excerpt' => 'нет аннотации',
	'No Title' => 'нет заголовка',
	'Orphaned TrackBack' => 'Осиротевшие Трэкбэки',
	'category' => 'тема',
	'Category' => 'Тема',
	'Asset' => 'Медиа-ресурсы',
	'Tag' => 'Метка',
	'Entry Status' => 'Статус записи',
	'[_1] Feed' => 'Синдикация [_1]',
	'(user deleted - ID:[_1])' => '(пользователь удален - ID:[_1])',
	'Invalid date \'[_1]\'; authored on dates must be in the format YYYY-MM-DD HH:MM:SS.' => 'Fecha no válida \'[_1]\'; debe tener el formato YYYY-MM-DD HH:MM:SS.', # Translate - No russian chars
	'Invalid date \'[_1]\'; authored on dates should be real dates.' => 'Fecha no válida \'[_1]\'; debe ser una fecha real.', # Translate - No russian chars
	'Saving [_1] failed: [_2]' => 'Сохранение [_1] не удалось: [_2]',
	'Saving entry \'[_1]\' failed: [_2]' => 'Сохранение записи \'[_1]\' не удалось: [_2]',
	'Removing placement failed: [_1]' => 'Fallo eliminando lugar: [_1]', # Translate - No russian chars
	'Saving placement failed: [_1]' => 'Fallo guardando situación: [_1]', # Translate - No russian chars
	'[_1] \'[_2]\' (ID:[_3]) edited and its status changed from [_4] to [_5] by user \'[_6]\'' => '[_1] \'[_2]\' (ID:[_3]) отредактирована пользователем \'[_6]\'и ее статус изменился с [_4] на [_5]',
	'[_1] \'[_2]\' (ID:[_3]) edited by user \'[_4]\'' => '[_1] \'[_2]\' (ID:[_3]) отредактирована пользователем \'[_4]\'',
	'No such [_1].' => 'Нет такого [_1].', 
	'Same Basename has already been used. You should use an unique basename.' => 'Ya se ha utilizado el mismo nombre base. Debe usar un nombre base único.', # Translate - No russian chars
	'Your blog has not been configured with a site path and URL. You cannot publish entries until these are defined.' => 'Su blog no tiene configurados la URL y la raíz del sitio. No puede publicar entradas hasta que no estén definidos.', # Translate - No russian chars
	'[_1] \'[_2]\' (ID:[_3]) added by user \'[_4]\'' => '[_1] \'[_2]\' (ID:[_3]) добавлена пользователем \'[_4]\'',
	'Error during publishing: [_1]' => 'Error durante la publicación: [_1]', # Translate - No russian chars
	'Subfolder' => 'Subfolder', # Translate - Not translated
	'Subcategory' => 'Подтема',
	'Saving category failed: [_1]' => 'Fallo guardando categoría: [_1]', # Translate - No russian chars
	'The [_1] must be given a name!' => '¡Debe dar un nombre a [_1]!', # Translate - No russian chars
	'Saving blog failed: [_1]' => 'Fallo guardando blog: [_1]', # Translate - No russian chars
	'Invalid ID given for personal blog clone source ID.' => 'Se introdujo un ID no válido para el ID de blog fuente de clonación.', # Translate - No russian chars
	'If personal blog is set, the default site URL and root are required.' => 'Si se selecciona un blog personal, se necesitará su URL predefinida y raíz.', # Translate - No russian chars
	'Feedback Settings' => 'Configuración de respuestas', # Translate - No russian chars
	'Publish error: [_1]' => 'Error de publicación: [_1]', # Translate - No russian chars
	'Unable to create preview file in this location: [_1]' => 'Imposible crear vista previa del archivo en este lugar: [_1]', # Translate - No russian chars
	'New [_1]' => 'Новый [_1]', 
	'Publish Site' => 'Опубликовать сайт',
	'index template \'[_1]\'' => 'шаблон индекса \'[_1]\'',
	'[_1] \'[_2]\'' => '[_1] \'[_2]\'',
	'No permissions' => 'Не прав',
	'Ping \'[_1]\' failed: [_2]' => 'Пинг \'[_1]\' не прошел: [_2]',
	'Create Role' => 'Создать роль',
	'Role name cannot be blank.' => 'Название роли не может быть пустым.',
	'Another role already exists by that name.' => 'Ya existe otro rol con ese nombre.', # Translate - No russian chars
	'You cannot define a role without permissions.' => 'No puede definir un rol sin permisos.', # Translate - No russian chars
	'No such entry \'[_1]\'' => 'Не такой записи \'[_1]\'',
	'No email address for user \'[_1]\'' => 'No hay dirección de correo electrónico asociada al usario \'[_1]\'', # Translate - No russian chars
	'No valid recipients found for the entry notification.' => 'No se encontraron destinatarios válidos para la notificación de la entrada.', # Translate - No russian chars
	'[_1] Update: [_2]' => '[_1] Обновление: [_2]',
	'Error sending mail ([_1]); try another MailTransfer setting?' => 'Error enviando correo electrónico ([_1]); ¿quizás probando con otra configuración para MailTransfer?', # Translate - No russian chars
	'Archive Root' => 'Корень архива',
	'Site Root' => 'Корень сайта',
	'Upload File' => 'Загрузить файл',
	'Can\'t load blog #[_1].' => 'Невозможно загрузить блог nº[_1].',
	'Please select a file to upload.' => 'Por favor, seleccione el fichero a transferir', # Translate - No russian chars
	'Invalid filename \'[_1]\'' => 'Nombre de fichero no válido \'[_1]\'', # Translate - No russian chars
	'Please select an audio file to upload.' => 'Por favor, seleccione el fichero de audio a transferir.', # Translate - No russian chars
	'Please select an image to upload.' => 'Por favor, seleccione una imagen a transferir.', # Translate - No russian chars
	'Please select a video to upload.' => 'Por favor, seleccione un video a transferir. Please select a video to upload.', # Translate - No russian chars
	'Before you can upload a file, you need to publish your blog.' => 'Antes de transferir ficheros, debe publicar su blog.', # Translate - No russian chars
	'Invalid extra path \'[_1]\'' => 'Ruta extra no válida \'[_1]\'', # Translate - No russian chars
	'Can\'t make path \'[_1]\': [_2]' => 'No se puede crear la ruta \'[_1]\': [_2]', # Translate - No russian chars
	'Invalid temp file name \'[_1]\'' => 'Nombre de fichero temporal no válido \'[_1]\'', # Translate - No russian chars
	'Error opening \'[_1]\': [_2]' => 'Error abriendo \'[_1]\': [_2]', # Translate - No russian chars
	'Error deleting \'[_1]\': [_2]' => 'Error borrando \'[_1]\': [_2]', # Translate - No russian chars
	'File with name \'[_1]\' already exists. (Install File::Temp if you\'d like to be able to overwrite existing uploaded files.)' => 'Ya existe un fichero con el nombre \'[_1]\'. (Instale File::Temp si desea sobreescribir ficheros transferidos existentes).', # Translate - No russian chars
	'Error creating temporary file; please check your TempDir setting in your coniguration file (currently \'[_1]\') this location should be writable.' => 'Error creando un fichero temporal; por favor, compruebe que se puede escribir en la ruta especificada en la opción TempDir en el fichero de configuración (actualmente \'[_1]\').', # Translate - No russian chars
	'unassigned' => 'неприсвоенный',
	'File with name \'[_1]\' already exists; Tried to write to tempfile, but open failed: [_2]' => 'Ya existe un fichero con el nombre \'[_1]\'; se intentó escribir en un fichero temporal, pero hubo un error al abrirlo: [_2]', # Translate - No russian chars
	'Could not create upload path \'[_1]\': [_2]' => 'No se pudo crear la ruta de transferencias \'[_1]\': [_2]', # Translate - No russian chars
	'Error writing upload to \'[_1]\': [_2]' => 'Error escribiendo transferencia a \'[_1]\': [_2]', # Translate - No russian chars
	'Search & Replace' => 'Поиск и Замена',
	'Entry Body' => 'Тело записи',
	'Extended Entry' => 'Расширенная запись',
	'Keywords' => 'Ключевые слова',
	'Basename' => 'Базовое имя',
	'Comment Text' => 'Текст комментария',
	'IP Address' => 'IP адрес',
	'Source URL' => 'исходный URL',
	'Blog Name' => 'Название блога',
	'Page Body' => 'Cuerpo de la página', # Translate - No russian chars
	'Extended Page' => 'Расширенная страница',
	'Template Name' => 'Имя шаблона',
	'Text' => 'Текст',
	'Linked Filename' => 'Fichero enlazado', # Translate - No russian chars
	'Output Filename' => 'Fichero salida', # Translate - No russian chars
	'Filename' => 'Имя файла',
	'Description' => 'Описание',
	'Label' => 'Метка',
	'Log Message' => 'Действие',
	'Username' => 'Логин',
	'Display Name' => 'Имя',
	'Site URL' => 'URL сайта',
	'Invalid date(s) specified for date range.' => 'Se especificaron fechas no válidas para el rango.', # Translate - No russian chars
	'Error in search expression: [_1]' => 'Error en la expresión de búsqueda: [_1]', # Translate - No russian chars
	'Saving object failed: [_2]' => 'Fallo al guardar objeto: [_2]', # Translate - No russian chars
	'You do not have export permissions' => 'No tiene permisos de exportación', # Translate - No russian chars
	'You do not have import permissions' => 'No tiene permisos de importación', # Translate - No russian chars
	'You do not have permission to create users' => 'No tiene permisos para crear usarios', # Translate - No russian chars
	'You need to provide a password if you are going to create new users for each user listed in your blog.' => 'Si va a crear nuevos usuarios por cada usuario listado en su blog, debe proveer una contraseña.', # Translate - No russian chars
	'Importer type [_1] was not found.' => 'No se encontró el tipo de importador [_1].', # Translate - No russian chars
	'Saving map failed: [_1]' => 'Fallo guardando mapa: [_1]', # Translate - No russian chars
	'Add a [_1]' => 'Añador un [_1]', # Translate - No russian chars
	'No label' => 'Sin título', # Translate - No russian chars
	'Category name cannot be blank.' => 'El nombre de la categoría no puede estar en blanco.', # Translate - No russian chars
	'Populating blog with default templates failed: [_1]' => 'Falló el guardando del blog con las plantillas por defecto: [_1]', # Translate - No russian chars
	'Setting up mappings failed: [_1]' => 'Fallo la configuración de mapeos: [_1]', # Translate - No russian chars
	'Error: Movable Type cannot write to the template cache directory. Please check the permissions for the directory called <code>[_1]</code> underneath your blog directory.' => 'Error: Movable Type no puede escribir en el directorio de caché de las plantillas. Por favor, compruebe los permisos del directorio llamado <code>[_1]</code> dentro del directorio de su blog.', # Translate - No russian chars
	'Error: Movable Type was not able to create a directory to cache your dynamic templates. You should create a directory called <code>[_1]</code> underneath your blog directory.' => 'Error: Movable Type no pudo crear un directorio para cachear las plantillas dinámicas. Debe crear un directorio llamado <code>[_1]</code> dentro del directorio de su blog.', # Translate - No russian chars
	'That action ([_1]) is apparently not implemented!' => '¡La acción ([_1]) aparentemente no está implementada!', # Translate - No russian chars
	'Error saving entry: [_1]' => 'Error guardando entrada: [_1]', # Translate - No russian chars
	'Select Blog' => 'Выберите блог',
	'Selected Blog' => 'Выбранный блог',
	'Type a blog name to filter the choices below.' => 'Наберит название для ограничения списка.',
	'Select a System Administrator' => 'Выберите системного администратора',
	'Selected System Administrator' => 'Выбранный системный администратор',
	'Type a username to filter the choices below.' => 'Наберит имя для ограничения списка.',
	'System Administrator' => 'Системный администратор',
	'Error saving file: [_1]' => 'Ошибка сохранения файла: [_1]',
	'represents a user who will be created afterwards' => 'Этот пользователь будет создан',
	'Select Blogs' => 'Выбраные блоги',
	'Blogs Selected' => 'Выбраные блоги',
	'Search Blogs' => 'Поиск блогов',
	'Select Users' => 'Выберите пользователей',
	'Users Selected' => 'Выбранные пользователи',
	'Search Users' => 'Поиск пользователей',
	'Select Roles' => 'Seleccionar roles', # Translate - No russian chars
	'Role Name' => 'Nombre del rol', # Translate - No russian chars
	'Roles Selected' => 'Roles seleccionados', # Translate - No russian chars
	'' => '', 
	'Grant Permissions' => 'Добавить права',
	'Backup' => 'Резервная копия',
	'Backup & Restore' => 'Резервное копирование и восстановление',
	'Temporary directory needs to be writable for backup to work correctly.  Please check TempDir configuration directive.' => 'Debe poderse escribir en el directorio temporal para que las copias de seguridad funcionen correctamente. Por favor, compruebe la opción de configuración TempDir.', # Translate - No russian chars
	'Temporary directory needs to be writable for restore to work correctly.  Please check TempDir configuration directive.' => 'Debe poder escribirse en el directorio temporal para que las copias de seguridad funcionen correctamente. Por favor, compruebe la opción de configuración TempDir.', # Translate - No russian chars
	'Blog(s) (ID:[_1]) was/were successfully backed up by user \'[_2]\'' => 'Las copias de seguridad de el/los blog(s) (ID:[_1]) se hizo/hicieron correctamente por el usuario  \'[_2]\'', # Translate - No russian chars
	'Movable Type system was successfully backed up by user \'[_1]\'' => 'El usuario \'[_1]\' realizó con éxito una copia de seguridad del sistema de Movable Type', # Translate - No russian chars
	'[_1] is not a number.' => '[_1] no es un número.', # Translate - No russian chars
	'Copying file [_1] to [_2] failed: [_3]' => 'Fallo copiandi fichero [_1] en [_2]: [_3]', # Translate - No russian chars
	'Specified file was not found.' => 'No se encontró el fichero especificado.', # Translate - No russian chars
	'[_1] successfully downloaded backup file ([_2])' => '[_1] descargó con éxito el fichero de copia de seguridad ([_2])', # Translate - No russian chars
	'Restore' => 'Восстановление',
	'Please use xml, tar.gz, zip, or manifest as a file extension.' => 'Por favor, use xml, tar.gz, zip, o manifest como extensión de ficheros.', # Translate - No russian chars
	'Unknown file format' => 'Formato de fichero desconocido', # Translate - No russian chars
	'Some [_1] were not restored because their parent objects were not restored.' => 'Algunos [_1] no se restauraron porque sus objetos ascendentes no se restauraron.', # Translate - No russian chars
	'Some objects were not restored because their parent objects were not restored.  Detailed information is in the <a href="javascript:void(0);" onclick="closeDialog(\'[_1]\');">activity log</a>.' => 'Algunos objetos no se restauraron porque sus objetos padres no se restauraron. Dispone de información detallada en el <a href="javascript:void(0);" onclick="closeDialog(\'[_1]\');">registro de actividad</a>.', # Translate - No russian chars
	'Successfully restored objects to Movable Type system by user \'[_1]\'' => 'El usuario \'[_1]\' restauró objetos en el sistema Movable Type con éxito.', # Translate - No russian chars
	'[_1] is not a directory.' => '[_1] не является каталогом.',
	'Error occured during restore process.' => 'Ocurrió un error durante el proceso de restauración.', # Translate - No russian chars
	'MT::Asset#[_1]: ' => 'MT::Asset#[_1]: ', # Translate - Not translated
	'Some of files could not be restored.' => 'Algunos ficheros no se restauraron.', # Translate - No russian chars
	'Uploaded file was not a valid Movable Type backup manifest file.' => 'El fichero transferido no era un fichero no válido de manifiesto de copia de seguridad de Movable Type.', # Translate - No russian chars
	'Please upload [_1] in this page.' => 'Por favor, transfiera [_1] a esta página.', # Translate - No russian chars
	'File was not uploaded.' => 'El fichero no fue transferido.', # Translate - No russian chars
	'Restoring a file failed: ' => 'Falló la restauración de un fichero:', # Translate - No russian chars
	'Some objects were not restored because their parent objects were not restored.' => 'Algunos objetos no se restauraron porque sus objetos ascendentes tampoco fueron restaurados.', # Translate - No russian chars
	'Some of the files were not restored correctly.' => 'No se restauraron correctamente algunos de los ficheros.', # Translate - No russian chars
	'Detailed information is in the <a href=\'javascript:void(0)\' onclick=\'closeDialog(\"[_1]\")\'>activity log</a>.' => 'La información detallada se encuentra en el <a href=\'javascript:void(0)\' onclick=\'closeDialog(\"[_1]\")\'>registro de actividad</a>.', # Translate - No russian chars
	'[_1] has canceled the multiple files restore operation prematurely.' => '[_1] canceló prematuramente la operación de restauración de varios ficheros.', # Translate - No russian chars
	'Changing Site Path for the blog \'[_1]\' (ID:[_2])...' => 'Modificando la Ruta del Sitio del blog \'[_1]\' (ID:[_2])...', # Translate - No russian chars
	'Removing Site Path for the blog \'[_1]\' (ID:[_2])...' => 'Borrando la Ruta del Sitio del blog \'[_1]\' (ID:[_2])...', # Translate - No russian chars
	'Changing Archive Path for the blog \'[_1]\' (ID:[_2])...' => 'Modificando la Ruta de Archivos del blog \'[_1]\' (ID:[_2])...', # Translate - No russian chars
	'Removing Archive Path for the blog \'[_1]\' (ID:[_2])...' => 'Borrando la Ruta de Archivos del blog \'[_1]\' (ID:[_2])...', # Translate - No russian chars
	'failed' => 'отказ',
	'ok' => 'ok', # Translate - Not translated
	'Changing file path for the asset \'[_1]\' (ID:[_2])...' => 'Изменение пути для медиа-файла \'[_1]\' (ID:[_2])...',
	'Some of the actual files for assets could not be restored.' => 'No se pudieron restaurar algunos ficheros multimedia.', # Translate - No russian chars
	'Parent comment id was not specified.' => 'Не указан ID родительского комментария.',
	'Parent comment was not found.' => 'Родительский комментарий не найден.',
	'You can\'t reply to unapproved comment.' => 'Вы не можете отвечать на неодобренный комментарий.',
	'You can\'t reply to unpublished comment.' => 'Вы не можете отвечать на неопубликованный комментарий.',
	' (Backup from [_1])' => ' (Copia de [_1])', # Translate - No russian chars
	'Error creating new template: ' => 'Ошибка создания нового шаблона: ',
	'Skipping template \'[_1]\' since it appears to be a custom template.' => 'Ignorando plantilla \'[_1]\' ya que parecer ser una plantilla personalizada.', # Translate - No russian chars
	'Refreshing template <strong>[_3]</strong> with <a href="?__mode=view&amp;blog_id=[_1]&amp;_type=template&amp;id=[_2]">backup</a>' => 'Reactualizar los modelos <strong>[_3]</strong> desde <a href="?__mode=view&amp;blog_id=[_1]&amp;_type=template&amp;id=[_2]">guardar</a>', # Translate - No russian chars
	'Skipping template \'[_1]\' since it has not been changed.' => 'Шаблон \'[_1]\' пропущен поскольку он был изменен.',
	'entries' => 'записи',
	'This is You' => 'Это Вы',
	'Handy Shortcuts' => 'Полезные ссылки',
	'Movable Type News' => 'Новости Movable Type',
	'Blog Stats' => 'Статистика блога',
	'Refresh Blog Templates' => 'Обновить шаблоны блога',
	'Refresh Global Templates' => 'Обновить глобальные шаблоны',
	'Publish Entries' => 'Опубликовать записи',
	'Unpublish Entries' => 'Отменить публикацию записей',
	'Add Tags...' => 'Добавить метки...',
	'Tags to add to selected entries' => 'Метки для назначения выбранным записям',
	'Remove Tags...' => 'Удалить метки...',
	'Tags to remove from selected entries' => 'Метки которые необходимо удалить',
	'Batch Edit Entries' => 'Множественно редактирование записей',
	'Publish Pages' => 'Опубликовать страницы',
	'Unpublish Pages' => 'Отменить публикацию страниц',
	'Tags to add to selected pages' => 'Метки для назначение выбранным страницам',
	'Tags to remove from selected pages' => 'Метки для удаления с выбранных страниц',
	'Batch Edit Pages' => 'Пакетное редактирование страниц',
	'Tags to add to selected assets' => 'Метки для назначения выбранным медиа-файлам',
	'Tags to remove from selected assets' => 'Метки для удаление с выбранных медиа-файлов',
	'Unpublish TrackBack(s)' => 'Отменить публикацию Трэкбэк(ов)',
	'Unpublish Comment(s)' => 'Отменить публикацию комментария(ев)',
	'Trust Commenter(s)' => 'Доверить комментаторам',
	'Untrust Commenter(s)' => 'Untrust комментатора',
	'Ban Commenter(s)' => 'Заблокировать комментатора',
	'Unban Commenter(s)' => 'Разблокировать комментатора',
	'Recover Password(s)' => 'Восстановить пароль',
	'Delete' => 'Удалить',
	'Refresh Template(s)' => 'Обновить шаблон(ы)',
	'Publish Template(s)' => 'Опубликовать шаблон(ы)',
	'Non-spam TrackBacks' => 'Трэкбэки не отмеченные как спам',
	'TrackBacks on my entries' => 'Трэкбэки на мои записи',
	'Published TrackBacks' => 'Опубликованные Трэкбэки',
	'Unpublished TrackBacks' => 'Неопубликованные Трэкбэки',
	'TrackBacks marked as Spam' => 'Трэкбэки отмеченные как спам',
	'All TrackBacks in the last 7 days' => 'Все Трэкбэки за последние 7 дней',
	'Non-spam Comments' => 'Не-спам комментарии',
	'Comments on my entries' => 'Комментарии на мои записи',
	'Pending comments' => 'Ожидающие комментарии',
	'Spam Comments' => 'Спам комментарии',
	'Published comments' => 'Опубликованные комментарии',
	'My comments' => 'Мои комментарии',
	'Comments in the last 7 days' => 'Все комментарии за последние 7 дней',
	'All comments in the last 24 hours' => 'Все комментарии за последние 24 часа',
	'Index Templates' => 'Шаблоны индексов',
	'Archive Templates' => 'Шаблоны архивов',
	'Template Modules' => 'Шаблоны модулей',
	'E-mail Templates' => 'Шаблоны email',
	'Backup Templates' => 'Сделать резервную копию шаблонов',
	'System Templates' => 'Системные шаблоны',
	'Tags with entries' => 'Метки с записями',
	'Tags with pages' => 'Метки со страницами',
	'Tags with assets' => 'Метки с мультимедиа-файлами',
	'Enabled Users' => 'Активные пользователи',
	'Disabled Users' => 'Отключеные пользователи',
	'Pending Users' => 'Ожидающие пользователи',
	'Authors' => 'Авторы',
	'Create' => 'Создать',
	'Manage' => 'Управление',
	'Design' => 'Дизайн',
	'Preferences' => 'Установки',
	'Tools' => 'Инструменты',
	'Folders' => 'Папки',
	'General' => 'Основное',
	'Feedback' => 'Ответы',
	'Plugins' => 'Плугины',
	'Blog Settings' => 'Настройки блога',
	'Address Book' => 'Адресная книга',
	'Import' => 'Импорт',
	'Export' => 'Экспорт',
	'System Overview' => 'Обзор системы',
	'/' => '/', # Translate - Not translated
	'<' => '<', # Translate - Not translated

## lib/MT/AtomServer.pm
	'PreSave failed [_1]' => 'Fallo en \'PreSave\' [_1]', # Translate - No russian chars
	'User \'[_1]\' (user #[_2]) added [lc,_4] #[_3]' => 'Usuario \'[_1]\' (usuario #[_2]) añadido [lc,_4] #[_3]', # Translate - No russian chars
	'User \'[_1]\' (user #[_2]) edited [lc,_4] #[_3]' => 'Usuario \'[_1]\' (usuario #[_2]) editado [lc,_4] #[_3]', # Translate - No russian chars
	'Perl module Image::Size is required to determine width and height of uploaded images.' => 'El módulo de Perl Image::Size es necesario para obtener las dimensiones de las imágenes transferidas.', # Translate - No russian chars

## lib/MT/Plugin.pm
	'Publish' => 'Опубликовать',
	'My Text Format' => 'Мой формат текста',

## lib/MT/Page.pm
	'Folder' => 'Папка',
	'Load of blog failed: [_1]' => 'Fallo en la carga del blog: [_1]', # Translate - No russian chars

## lib/MT/ObjectDriver/Driver/DBD/SQLite.pm
	'Can\'t open \'[_1]\': [_2]' => 'Не удалось открыть \'[_1]\': [_2]',

## lib/MT/Log.pm
	'System' => 'Система',
	'Page # [_1] not found.' => 'Страница [_1] не найдена.',
	'Entry # [_1] not found.' => 'Запись [_1] не найдена.',
	'Comment # [_1] not found.' => 'Комментарий [_1] не найден.',
	'TrackBack # [_1] not found.' => 'Трэкбэк [_1] не найден.',

## lib/MT/ObjectAsset.pm
	'Asset Placement' => 'Расположение медиа-ресурсов',

## lib/MT/Entry.pm
	'Draft' => 'Черновик',
	'Review' => 'Revisar', # Translate - No russian chars
	'Future' => 'Futuro', # Translate - No russian chars

## lib/MT/BasicAuthor.pm
	'authors' => 'autores', # Translate - No russian chars

## lib/MT/BackupRestore.pm
	'Backing up [_1] records:' => 'Резервное копирование [_1] записей:',
	'[_1] records backed up...' => 'записи [_1] сохраняююся...',
	'[_1] records backed up.' => 'записи [_1] сохранены.',
	'There were no [_1] records to be backed up.' => 'Не найдено записей [_1] для резервного копирования.',
	'Can\'t open directory \'[_1]\': [_2]' => 'Невозможно открыть каталог \'[_1]\': [_2]',
	'No manifest file could be found in your import directory [_1].' => 'No se encontró fichero de manifiesto en el directorio de importación [_1].', # Translate - No russian chars
	'Can\'t open [_1].' => 'Невозможно открыть [_1].',
	'Manifest file [_1] was not a valid Movable Type backup manifest file.' => 'El fichero [_1] no es un fichero válido de manifiesto para copias de seguridad de Movable Type.', # Translate - No russian chars
	'Manifest file: [_1]' => 'Fichero de manifiesto: [_1]', # Translate - No russian chars
	'Path was not found for the file ([_1]).' => 'No se encontró la ruta del archivo ([_1]).', # Translate - No russian chars
	'[_1] is not writable.' => 'No puede escribirse en [_1].', # Translate - No russian chars
	'Error making path \'[_1]\': [_2]' => 'Error creando la ruta \'[_1]\': [_2]', # Translate - No russian chars
	'Copying [_1] to [_2]...' => 'Copiando [_1] a [_2]...', # Translate - No russian chars
	'Failed: ' => 'Falló: ', # Translate - No russian chars
	'Done.' => 'Hecho.', # Translate - No russian chars
	'Restoring asset associations ... ( [_1] )' => 'Restaurando asociaciones de ficheros multimedia ... ( [_1] )', # Translate - No russian chars
	'Restoring asset associations in entry ... ( [_1] )' => 'Restaurando asociaciones de ficheros multimedia en la entrada ... ( [_1] )', # Translate - No russian chars
	'Restoring asset associations in page ... ( [_1] )' => 'Restaurando asociaciones de ficheros multimedia en página ... ( [_1] )', # Translate - No russian chars
	'Restoring url of the assets ( [_1] )...' => 'Restaurando url de ficheros multimedia ( [_1] )...', # Translate - No russian chars
	'Restoring url of the assets in entry ( [_1] )...' => 'Restaurando url de ficheros multimedia en la entrada ( [_1] )...', # Translate - No russian chars
	'Restoring url of the assets in page ( [_1] )...' => 'Restaurando url de ficheros multimedia en la página ( [_1] )...', # Translate - No russian chars
	'ID for the file was not set.' => 'El ID del fichero no está establecido.', # Translate - No russian chars
	'The file ([_1]) was not restored.' => 'No se restauró el fichero ([_1]).', # Translate - No russian chars
	'Changing path for the file \'[_1]\' (ID:[_2])...' => 'Cambiando la ruta del fichero \'[_1]\' (ID:[_2])...', # Translate - No russian chars

## lib/MT/Bootstrap.pm
	'Got an error: [_1]' => 'Ocurrió un error en: [_1]', # Translate - No russian chars

## lib/MT/Session.pm
	'Session' => 'Сессия',

## lib/MT/BackupRestore/BackupFileHandler.pm
	'Uploaded file was backed up from Movable Type with the newer schema version ([_1]) than the one in this system ([_2]).  It is not safe to restore the file to this version of Movable Type.' => 'Se hizo una copia de segurodad del fichero transferido desde Movable Type con una versión más reciente del esquema ([_1]) que el de este sistema ([_2]). No es seguro restaurar el fichero en esta versión de Movable Type.', # Translate - No russian chars
	'[_1] is not a subject to be restored by Movable Type.' => '[_1] no es un elemento para ser restaurado por Movable Type.', # Translate - No russian chars
	'[_1] records restored.' => '[_1] registros restaurados.', # Translate - No russian chars
	'Restoring [_1] records:' => 'Restaurando [_1] registros:', # Translate - No russian chars
	'User with the same name as the name of the currently logged in ([_1]) found.  Skipped the record.' => 'Se encontró un usuario con el mismo nombre que la persona identificada ([_1]). Saltar la identificación.', # Translate - No russian chars
	'User with the same name \'[_1]\' found (ID:[_2]).  Restore replaced this user with the data backed up.' => 'Se encontró un usuario con el mismo nombre \'[_1]\' (ID:[_2]). La restauración reemplazó este usuario con los datos de la copia de seguridad.', # Translate - No russian chars
	'Tag \'[_1]\' exists in the system.' => 'La etiqueta \'[_1]\' existe en el sistema.', # Translate - No russian chars
	'[_1] records restored...' => '[_1] registros restaurados...', # Translate - No russian chars

## lib/MT/BackupRestore/ManifestFileHandler.pm

## lib/MT/Scorable.pm
	'Object must be saved first.' => 'Primero debe guardarse el objeto.', # Translate - No russian chars
	'Already scored for this object.' => 'Ya puntuado en este objeto.', # Translate - No russian chars
	'Could not set score to the object \'[_1]\'(ID: [_2])' => 'No pudo darse puntuación al objeto \'[_1]\'(ID: [_2])', # Translate - No russian chars

## lib/MT/Import.pm
	'Can\'t rewind' => 'No se pudo reiniciar', # Translate - No russian chars
	'No readable files could be found in your import directory [_1].' => 'No se encontrón ningún fichero legible en su directorio de importación [_1].', # Translate - No russian chars
	'Importing entries from file \'[_1]\'' => 'Importando entradas desde el fichero \'[_1]\'', # Translate - No russian chars
	'Couldn\'t resolve import format [_1]' => 'No se pudo resolver el formato de importación [_1]', # Translate - No russian chars
	'Movable Type' => 'Movable Type', # Translate - Not translated
	'Another system (Movable Type format)' => 'Otro sistema (formato Movable Type)', # Translate - No russian chars

## lib/MT/IPBanList.pm
	'IP Ban' => 'IP блокировка',
	'IP Bans' => 'IP блокировки',

## lib/MT/WeblogPublisher.pm
	'yyyy/index.html' => 'гггг/index.html',
	'yyyy/mm/index.html' => 'гггг/мм/index.html',
	'yyyy/mm/day-week/index.html' => 'гггг/мм/день-недели/index.html',
	'yyyy/mm/entry-basename.html' => 'гггг/мм/заголовок-записи.html',
	'yyyy/mm/entry_basename.html' => 'гггг/мм/заголовок-записи.html',
	'yyyy/mm/entry-basename/index.html' => 'гггг/мм/заголовок-записи/index.html',
	'yyyy/mm/entry_basename/index.html' => 'гггг/мм/заголовок_записи/index.html',
	'yyyy/mm/dd/entry-basename.html' => 'гггг/мм/дд/заголовок-записи.html',
	'yyyy/mm/dd/entry_basename.html' => 'гггг/мм/дд/заголовок_записи.html',
	'yyyy/mm/dd/entry-basename/index.html' => 'гггг/мм/дд/заголовок-записи/index.html',
	'yyyy/mm/dd/entry_basename/index.html' => 'гггг/мм/дд/заголовок_записи/index.html',
	'category/sub-category/entry-basename.html' => 'тема/под-тема/заголовок-записи.html',
	'category/sub-category/entry-basename/index.html' => 'тема/под-тема/заголовок-записи/index.html',
	'category/sub_category/entry_basename.html' => 'тема/под_тема/заголовок_записи.html',
	'category/sub_category/entry_basename/index.html' => 'тема/под_тема/заголовок_записи/index.html',
	'folder-path/page-basename.html' => 'ruta-carpeta/título-página.html', # Translate - No russian chars
	'folder-path/page-basename/index.html' => 'carpeta-path/título-página/index.html', # Translate - No russian chars
	'folder_path/page_basename.html' => 'ruta_carpeta/título_pagina.html', # Translate - No russian chars
	'folder_path/page_basename/index.html' => 'ruta_carpeta/título_pagina/index.html', # Translate - No russian chars
	'folder/sub_folder/index.html' => 'папка/под_папка/index.html',
	'folder/sub-folder/index.html' => 'папка/под-папка/index.html',
	'yyyy/mm/dd/index.html' => 'гггг/мм/дд/index.html',
	'category/sub-category/index.html' => 'тема/под-тема/index.html',
	'category/sub_category/index.html' => 'тема/под_тема/index.html',
	'Archive type \'[_1]\' is not a chosen archive type' => 'El tipo de archivos \'[_1]\' no es un tipo de archivos seleccionado', # Translate - No russian chars
	'Parameter \'[_1]\' is required' => 'El parámetro \'[_1]\' es necesario', # Translate - No russian chars
	'You did not set your blog publishing path' => 'No configuró la ruta de publicación del blog', # Translate - No russian chars
	'The same archive file exists. You should change the basename or the archive path. ([_1])' => 'Ya existe el fichero del mismo archivo. Debe modificar el título o la ruta. ([_1])', # Translate - No russian chars
	'An error occurred publishing [_1] \'[_2]\': [_3]' => 'Un error se ha producido durante la publicación', # Translate - No russian chars
	'An error occurred publishing date-based archive \'[_1]\': [_2]' => 'Ocurrió un error publicando el archivo de fechas \'[_1]\': [_2]', # Translate - No russian chars
	'Writing to \'[_1]\' failed: [_2]' => 'Fallo escribiendo en \'[_1]\': [_2]', # Translate - No russian chars
	'Renaming tempfile \'[_1]\' failed: [_2]' => 'Fallo renombrando el fichero temporal \'[_1]\': [_2]', # Translate - No russian chars
	'Template \'[_1]\' does not have an Output File.' => 'La plantilla \'[_1]\' no tiene un fichero de salida.', # Translate - No russian chars
	'An error occurred while publishing scheduled entries: [_1]' => 'Ocurrió un error durante la publicación de las entradas programadas: [_1]', # Translate - No russian chars
	'YEARLY_ADV' => 'по годам',
	'MONTHLY_ADV' => 'по месяцам',
	'CATEGORY_ADV' => 'по темам',
	'PAGE_ADV' => 'по страницам',
	'INDIVIDUAL_ADV' => 'по записям',
	'DAILY_ADV' => 'по дням',
	'WEEKLY_ADV' => 'по неделям',
	'Author (#[_1])' => 'Автор (#[_1])',
	'AUTHOR_ADV' => 'по авторам',
	'AUTHOR-YEARLY_ADV' => 'по авторам, по годам',
	'AUTHOR-MONTHLY_ADV' => 'по авторам, по месяцам',
	'AUTHOR-WEEKLY_ADV' => 'по авторам, по неделям',
	'AUTHOR-DAILY_ADV' => 'по авторам, по дням',
	'CATEGORY-YEARLY_ADV' => 'по темам, по годам',
	'CATEGORY-MONTHLY_ADV' => 'по темам, по месяцам',
	'CATEGORY-DAILY_ADV' => 'по темам, по дням',
	'CATEGORY-WEEKLY_ADV' => 'по темам, по неделям',
	'author-display-name/index.html' => 'pseudónimo-autor/index.html', # Translate - No russian chars
	'author_display_name/index.html' => 'pseudónimo_autor/index.html', # Translate - No russian chars
	'author-display-name/yyyy/index.html' => 'pseudónimo-autor/гггг/index.html',
	'author_display_name/yyyy/index.html' => 'pseudónimo_autor/гггг/index.html',
	'author-display-name/yyyy/mm/index.html' => 'pseudónimo-autor/гггг/мм/index.html',
	'author_display_name/yyyy/mm/index.html' => 'pseudónimo_autor/гггг/мм/index.html',
	'author-display-name/yyyy/mm/day-week/index.html' => 'pseudónimo-autor/гггг/мм/día-semana/index.html',
	'author_display_name/yyyy/mm/day-week/index.html' => 'pseudónimo_autor/гггг/мм/día-semana/index.html',
	'author-display-name/yyyy/mm/dd/index.html' => 'pseudónimo-autor/гггг/мм/дд/index.html',
	'author_display_name/yyyy/mm/dd/index.html' => 'pseudónimo_autor/гггг/мм/дд/index.html',
	'category/sub-category/yyyy/index.html' => 'categoría/под-тема/гггг/index.html',
	'category/sub_category/yyyy/index.html' => 'categoría/под_тема/гггг/index.html',
	'category/sub-category/yyyy/mm/index.html' => 'categoría/под-тема/гггг/мм/index.html',
	'category/sub_category/yyyy/mm/index.html' => 'categoría/под_тема/гггг/мм/index.html',
	'category/sub-category/yyyy/mm/dd/index.html' => 'categoría/под-тема/гггг/мм/дд/index.html',
	'category/sub_category/yyyy/mm/dd/index.html' => 'categoría/под_тема/гггг/мм/дд/index.html',
	'category/sub-category/yyyy/mm/day-week/index.html' => 'categoría/под-тема/гггг/мм/día-semana/index.html',
	'category/sub_category/yyyy/mm/day-week/index.html' => 'categoría/под_тема/гггг/мм/día-semana/index.html',

## lib/MT/Asset.pm
	'Location' => 'Расположение',

## lib/MT/ObjectTag.pm
	'Tag Placement' => 'Gestión de Etiqueta', # Translate - No russian chars
	'Tag Placements' => 'Gestión de las Etiquetas', # Translate - No russian chars

## lib/MT/ImportExport.pm
	'No Blog' => 'Sin Blog', # Translate - No russian chars
	'Need either ImportAs or ParentAuthor' => 'Necesita ImportAs o ParentAuthor', # Translate - No russian chars
	'Creating new user (\'[_1]\')...' => 'Creando usario (\'[_1]\')...', # Translate - No russian chars
	'Saving user failed: [_1]' => 'Fallo guardando usario: [_1]', # Translate - No russian chars
	'Assigning permissions for new user...' => 'Asignar permisos al nuevo usario...', # Translate - No russian chars
	'Saving permission failed: [_1]' => 'Fallo guardando permisos: [_1]', # Translate - No russian chars
	'Creating new category (\'[_1]\')...' => 'Creando nueva categoría (\'[_1]\')...', # Translate - No russian chars
	'Invalid status value \'[_1]\'' => 'Valor de estado no válido \'[_1]\'', # Translate - No russian chars
	'Invalid allow pings value \'[_1]\'' => 'Valor no válido de permiso de pings \'[_1]\'', # Translate - No russian chars
	'Can\'t find existing entry with timestamp \'[_1]\'... skipping comments, and moving on to next entry.' => 'No se encontró una entrada existente con la fecha \'[_1]\'... ignorando comentarios, y pasando a la siguiente entrada.', # Translate - No russian chars
	'Importing into existing entry [_1] (\'[_2]\')' => 'Importando en entrada existente [_1] (\'[_2]\')', # Translate - No russian chars
	'Saving entry (\'[_1]\')...' => 'Guardando entrada (\'[_1]\')...', # Translate - No russian chars
	'ok (ID [_1])' => 'ok (ID [_1])', # Translate - Not translated
	'Saving entry failed: [_1]' => 'Fallo guardando entrada: [_1]', # Translate - No russian chars
	'Creating new comment (from \'[_1]\')...' => 'Creando nuevo comentario (de \'[_1]\')...', # Translate - No russian chars
	'Saving comment failed: [_1]' => 'Fallo guardando comentario: [_1]', # Translate - No russian chars
	'Entry has no MT::Trackback object!' => '¡La entrada no tiene objeto MT::Trackback!', # Translate - No russian chars
	'Creating new ping (\'[_1]\')...' => 'Creando nuevo ping (\'[_1]\')...', # Translate - No russian chars
	'Saving ping failed: [_1]' => 'Fallo guardando ping: [_1]', # Translate - No russian chars
	'Export failed on entry \'[_1]\': [_2]' => 'Fallo de exportación en la entrada \'[_1]\': [_2]', # Translate - No russian chars
	'Invalid date format \'[_1]\'; must be \'MM/DD/YYYY HH:MM:SS AM|PM\' (AM|PM is optional)' => 'Formato de fecha \'[_1]\' no válido; debe ser \'MM/DD/AAAA HH:MM:SS AM|PM\' (AM|PM es opcional)', # Translate - No russian chars

## lib/MT/Association.pm
	'Association' => 'Asociación', # Translate - No russian chars
	'association' => 'Asociación', # Translate - No russian chars
	'associations' => 'Asociaciones', # Translate - No russian chars

## lib/MT/Category.pm
	'Categories must exist within the same blog' => 'Las categorías deben existir en el mismo blog', # Translate - No russian chars
	'Category loop detected' => 'Bucle de categorías detectado', # Translate - No russian chars

## lib/MT/Blog.pm
	'First Blog' => 'Primer blog', # Translate - No russian chars
	'No default templates were found.' => 'No se encontraron plantillas predefinidas.', # Translate - No russian chars
	'Cloned blog... new id is [_1].' => 'Blog clonado... el nuevo identificador es [_1]', # Translate - No russian chars
	'Cloning permissions for blog:' => 'Clonando permisos para el blog:', # Translate - No russian chars
	'[_1] records processed...' => 'Procesados [_1] registros...', # Translate - No russian chars
	'[_1] records processed.' => 'Procesados [_1] registros.', # Translate - No russian chars
	'Cloning associations for blog:' => 'Clonando asociaciones para el blog:', # Translate - No russian chars
	'Cloning entries for blog...' => 'Clonando entradas para el blog...', # Translate - No russian chars
	'Cloning categories for blog...' => 'Clonando categorías para el blog...', # Translate - No russian chars
	'Cloning entry placements for blog...' => 'Clonando situación de entradas para el blog...', # Translate - No russian chars
	'Cloning comments for blog...' => 'Clonando comentarios para el blog...', # Translate - No russian chars
	'Cloning entry tags for blog...' => 'Clonando etiquetas de entradas para el blog...', # Translate - No russian chars
	'Cloning TrackBacks for blog...' => 'Clonando TrackBacks para el blog...', # Translate - No russian chars
	'Cloning TrackBack pings for blog...' => 'Clonando pings de TrackBack para el blog...', # Translate - No russian chars
	'Cloning templates for blog...' => 'Clonando plantillas para el blog...', # Translate - No russian chars
	'Cloning template maps for blog...' => 'Clonando mapas de plantillas para el blog...', # Translate - No russian chars
	'blog' => 'блог',
	'blogs' => 'блоги',

## lib/MT/App.pm
	'First Weblog' => 'Primer weblog', # Translate - No russian chars
	'Error loading blog #[_1] for user provisioning. Check your NewUserTemplateBlogId setting.' => 'Error de telécargamiento #[_1] que comprende la creación de Usuarios. Por favor, verifique sus parámetros NewUserTemplateBlogId.', # Translate - No russian chars
	'Error provisioning blog for new user \'[_1]\' using template blog #[_2].' => 'Un error se ha producido en la creación del blog para el nuevo usuario \'[_1]\'utilizando la plantilla del blog #[_2].', # Translate - No russian chars
	'Error creating directory [_1] for blog #[_2].' => 'Error creando el directorio [_1] para el blog #[_2].', # Translate - No russian chars
	'Error provisioning blog for new user \'[_1] (ID: [_2])\'.' => 'Un error se ha producido en la creación del blog por el nuevo usuario \'[_1] (ID: [_2])\'.', # Translate - No russian chars
	'Blog \'[_1] (ID: [_2])\' for user \'[_3] (ID: [_4])\' has been created.' => 'Blog \'[_1] (ID: [_2])\' para el usuario \'[_3] (ID: [_4])\' ha sido creado.', # Translate - No russian chars
	'Error assigning blog administration rights to user \'[_1] (ID: [_2])\' for blog \'[_3] (ID: [_4])\'. No suitable blog administrator role was found.' => 'Error de asignación de los derechos para el usuario \'[_1] (ID: [_2])\' para el blog \'[_3] (ID: [_4])\'. Ningún rol de administrador adecuado ha sido encontrado.', # Translate - No russian chars
	'The login could not be confirmed because of a database error ([_1])' => 'No se pudo confirmar el acceso debido a un error de la base de datos ([_1])', # Translate - No russian chars
	'Our apologies, but you do not have permission to access any blogs within this installation. If you feel you have reached this message in error, please contact your Movable Type system administrator.' => 'Lo sentimos, pero no tiene permisos para acceder a ninguno de los blogs en esta instalación. Si cree que este mensaje se le muestra por error, por favor, contacte con su administrador de Movable Type.', # Translate - No russian chars
	'This account has been disabled. Please see your system administrator for access.' => 'Esta cuenta fue deshabilitada. Por favor, póngase en contacto con el administrador del sistema.', # Translate - No russian chars
	'Failed login attempt by pending user \'[_1]\'' => 'Intento fallido de inicio de sesión de un usuario pendiente \'[_1]\'', # Translate - No russian chars
	'This account has been deleted. Please see your system administrator for access.' => 'Esta cuenta fue eliminada. Por favor, póngase en contacto con el administrador del sistema.', # Translate - No russian chars
	'User cannot be created: [_1].' => 'No se pudo crear al usuario: [_1].', # Translate - No russian chars
	'User \'[_1]\' has been created.' => 'El usuario \'[_1]\' ha sido creado', # Translate - No russian chars
	'User \'[_1]\' (ID:[_2]) logged in successfully' => 'Usuario \'[_1]\' (ID:[_2]) inició una sesión correctamente', # Translate - No russian chars
	'Invalid login attempt from user \'[_1]\'' => 'Intento de acceso no válido del usuario \'[_1]\'', # Translate - No russian chars
	'User \'[_1]\' (ID:[_2]) logged out' => 'Usuario \'[_1]\' (ID:[_2]) se desconectó', # Translate - No russian chars
	'User requires password.' => 'El usuario necesita una contraseña.', # Translate - No russian chars
	'User requires password recovery word/phrase.' => 'El usuario necesita una palabra/frase para la recuperación de contraseña.', # Translate - No russian chars
	'User requires username.' => 'El usuario necesita un nombre.', # Translate - No russian chars
	'User requires display name.' => 'El usuario necesita un pseudónimo.', # Translate - No russian chars
	'Email Address is required for password recovery.' => 'La dirección de correo es necesaria para la recuperación de contraseña.', # Translate - No russian chars
	'Something wrong happened when trying to process signup: [_1]' => 'Algo mal ocurrió durante el proceso de alta: [_1]', # Translate - No russian chars
	'New Comment Added to \'[_1]\'' => 'Новый комментарий к записи \'[_1]\'',
	'Close' => 'Закрыть',
	'The file you uploaded is too large.' => 'Файл, который Вы загрузили, слишком большой.',
	'Unknown action [_1]' => 'Неизвестное действие [_1]',
	'Warnings and Log Messages' => 'Mensajes de alerta y registro', # Translate - No russian chars
	'Removed [_1].' => 'Удален [_1].',

## lib/MT/PluginData.pm
	'Plugin Data' => 'Данные плугина',

## lib/MT/ConfigMgr.pm
	'Alias for [_1] is looping in the configuration.' => 'Alias de [_1] está generando un bucle en la configuración.', # Translate - No russian chars
	'Error opening file \'[_1]\': [_2]' => 'Error abriendo el fichero \'[_1]\': [_2]', # Translate - No russian chars
	'Config directive [_1] without value at [_2] line [_3]' => 'Directiva de configuración [_1] sin valor en [_2] línea [_3]', # Translate - No russian chars
	'No such config variable \'[_1]\'' => 'No existe tal variable de configuración \'[_1]\'', # Translate - No russian chars

## lib/MT/Auth/MT.pm
	'Failed to verify current password.' => 'Текущий пароль не совпадает.',
	'Password hint is required.' => 'Требуется подсказка пароля.',

## lib/MT/Auth/OpenID.pm
	'The address entered does not appear to be an OpenID' => 'La dirección introducida no parecer ser un OpenID', # Translate - No russian chars
	'The text entered does not appear to be a web address' => 'El texto introducido no parece ser una dirección web', # Translate - No russian chars
	'Unable to connect to [_1]: [_2]' => 'Невозможно соединиться с [_1]: [_2]',
	'Could not verify the OpenID provided: [_1]' => 'Невозможно проверть провайдера OpenID: [_1]',
	'Couldn\'t save the session' => 'No se pudo guardar la sesión', # Translate - No russian chars

## lib/MT/Auth/TypeKey.pm
	'Sign in requires a secure signature.' => 'La identificación necesita una firma segura.', # Translate - No russian chars
	'The sign-in validation failed.' => 'Falló el registro de validación.', # Translate - No russian chars
	'This weblog requires commenters to pass an email address. If you\'d like to do so you may log in again, and give the authentication service permission to pass your email address.' => 'Este weblog obliga a que los comentaristas den su dirección de correo electrónico. Si lo desea puede iniciar una sesión de nuevo, y dar al servicio de autentificación permisos para pasar la dirección de correo electrónico.', # Translate - No russian chars
	'This blog requires commenters to provide an email address' => 'Para hacer comentarios en este blog debe tener una dirección de correo electrónico', # Translate - No russian chars
	'Couldn\'t get public key from url provided' => 'No se pudo obtener la clave pública desde la URL indicada', # Translate - No russian chars
	'No public key could be found to validate registration.' => 'No se encontró la clave pública para validar el registro.', # Translate - No russian chars
	'TypeKey signature verif\'n returned [_1] in [_2] seconds verifying [_3] with [_4]' => 'La firma TypeKey signature verif\'n returned [_1] in [_2] seconds verifying [_3] with [_4]', # Translate - No russian chars
	'The TypeKey signature is out of date ([_1] seconds old). Ensure that your server\'s clock is correct' => 'La firma TypeKey está caducada ([_1] segundos vieja). Asegúrese de que el reloj de su servidor está en hora', # Translate - No russian chars

## lib/MT/Util.pm
	'moments from now' => 'через момент',
	'moments ago' => 'только что',
	'[quant,_1,hour,hours] from now' => 'через [quant,_1,час,часа,часов]',
	'[quant,_1,hour,hours] ago' => '[quant,_1,час,часа,часов] назад',
	'[quant,_1,minute,minutes] from now' => 'через [quant,_1,минуту,минуты,минут]',
	'[quant,_1,minute,minutes] ago' => '[quant,_1,минуту,минуты,минут] назад',
	'[quant,_1,day,days] from now' => 'через [quant,_1,день,дня,дней]',
	'[quant,_1,day,days] ago' => '[quant,_1,день,дня,дней] назад',
	'less than 1 minute from now' => 'менее чем через минуту',
	'less than 1 minute ago' => 'менее чем минуту назад',
	'[quant,_1,hour,hours], [quant,_2,minute,minutes] from now' => 'через [quant,_1,час,часа,часов], [quant,_2,минуту,минуты,минут]',
	'[quant,_1,hour,hours], [quant,_2,minute,minutes] ago' => '[quant,_1,час,часа,часов], [quant,_2,минуту,минуты,минут] назад',
	'[quant,_1,day,days], [quant,_2,hour,hours] from now' => 'через [quant,_1,день,дня,дней], [quant,_2,час,часа,часов]',
	'[quant,_1,day,days], [quant,_2,hour,hours] ago' => '[quant,_1,день,дня,дней], [quant,_2,час,часа,часов]',

## lib/MT/Folder.pm

## lib/MT/Trackback.pm
	'TrackBack' => 'Трэкбэк',

## lib/MT/TheSchwartz/Error.pm
	'Job Error' => 'Ошибка задачи',

## lib/MT/TheSchwartz/Job.pm
	'Job' => 'Задача',

## lib/MT/TheSchwartz/ExitStatus.pm
	'Job Exit Status' => 'Status Fin de Tarea', # Translate - No russian chars

## lib/MT/TheSchwartz/FuncMap.pm
	'Job Function' => 'Функция задачи',

## lib/MT/JunkFilter.pm
	'Action: Junked (score below threshold)' => 'Acción: Basura (puntuación bajo nivel)', # Translate - No russian chars
	'Action: Published (default action)' => 'Acción: Publicado (acción predefinida)', # Translate - No russian chars
	'Junk Filter [_1] died with: [_2]' => 'Filtro basura [_1] murió con: [_2]', # Translate - No russian chars
	'Unnamed Junk Filter' => 'Filtro basura sin nombre', # Translate - No russian chars
	'Composite score: [_1]' => 'Puntuación compuesta: [_1]', # Translate - No russian chars

## lib/MT/Author.pm
	'The approval could not be committed: [_1]' => 'La aprobación no pudo realizarse: [_1]', # Translate - No russian chars

## lib/MT/Template/Context.pm
	'The attribute exclude_blogs cannot take \'all\' for a value.' => 'El atributo exclude_blogs no puede tomar el valor \'all\'.', # Translate - No russian chars

## lib/MT/Template/ContextHandlers.pm
	'Remove this widget' => 'Удалить виджет',
	'[_1]Publish[_2] your site to see these changes take effect.' => '[_1]Опубликуйте[_2] Ваш блог чтобы изменения вступили в действие.',
	'Actions' => 'Действия',
	'Warning' => 'Предупреждение',
	'http://www.movabletype.org/documentation/appendices/tags/%t.html' => 'http://www.movabletype.org/documentation/appendices/tags/%t.html', # Translate - Not translated
	'No [_1] could be found.' => '[_1] не найдены.',
	'Invalid tag [_1] specified.' => 'Especificada etiqueta no válida [_1].', # Translate - No russian chars
	'Recursion attempt on [_1]: [_2]' => 'Intento de recursión en [_1]: [_2]', # Translate - No russian chars
	'Can\'t find included template [_1] \'[_2]\'' => 'No se encontró la plantilla incluída [_1] \'[_2]\'', # Translate - No russian chars
	'Can\'t find blog for id \'[_1]' => 'No se pudo encontrar un blog con el id \'[_1]', # Translate - No russian chars
	'Can\'t find included file \'[_1]\'' => 'No se encontró el fichero incluido \'[_1]\'', # Translate - No russian chars
	'Error opening included file \'[_1]\': [_2]' => 'Error abriendo el fichero incluido \'[_1]\': [_2]', # Translate - No russian chars
	'Recursion attempt on file: [_1]' => 'Intento de recursión en fichero: [_1]', # Translate - No russian chars
	'Unspecified archive template' => 'Archivo de plantilla no especificado', # Translate - No russian chars
	'Error in file template: [_1]' => 'Error en fichero de plantilla: [_1]', # Translate - No russian chars
	'Can\'t load template' => 'No se pudo cargar la plantilla', # Translate - No russian chars
	'Can\'t find template \'[_1]\'' => 'No se encontró la plantilla \'[_1]\'', # Translate - No russian chars
	'Can\'t find entry \'[_1]\'' => 'No se encontró la entrada \'[_1]\'', # Translate - No russian chars
	'[_1] is not a hash.' => '[_1] no es un hash.', # Translate - No russian chars
	'You used an \'[_1]\' tag outside of the context of a author; perhaps you mistakenly placed it outside of an \'MTAuthors\' container?' => 'Utilizó una etiqueta \'[_1]\' fuera del contexto de un autor; ¿quizás la situó por error fuera de un contenedor \'MTAuthors\'?', # Translate - No russian chars
	'You have an error in your \'[_2]\' attribute: [_1]' => 'Tiene un error en su atributo \'[_2]\': [_1]', # Translate - No russian chars
	'You have an error in your \'tag\' attribute: [_1]' => 'Tiene un error en el atributo \'tag\': [_1]', # Translate - No russian chars
	'No such user \'[_1]\'' => 'No existe el usario \'[_1]\'', # Translate - No russian chars
	'You used an \'[_1]\' tag outside of the context of an entry; perhaps you mistakenly placed it outside of an \'MTEntries\' container?' => 'Utilizó una etiqueta \'[_1]\' fuera del contexto de una entrada; ¿quizás la puso por error fuera de un contenedor \'MTEntries\'?', # Translate - No russian chars
	'You used <$MTEntryFlag$> without a flag.' => 'Usó <$MTEntryFlag$> sin \'flag\'.', # Translate - No russian chars
	'You used an [_1] tag for linking into \'[_2]\' archives, but that archive type is not published.' => 'Usó una etiqueta [_1] enlazando los archivos \'[_2]\', pero el tipo de archivo no está publicado.', # Translate - No russian chars
	'Could not create atom id for entry [_1]' => 'No se pudo crear un identificador atom en la entrada [_1]', # Translate - No russian chars
	'To enable comment registration, you need to add a TypeKey token in your weblog config or user profile.' => 'Para habilitar el registro de comentarios, debe añadir un token de TypeKey a la configuración de su weblog o al perfil de su usario.', # Translate - No russian chars
	'The MTCommentFields tag is no longer available; please include the [_1] template module instead.' => 'La etiqueta MTCommentFields no está más disponible; por favor incluya el módulo de platilla [_1] que lo remplaza', # Translate - No russian chars
	'You used an [_1] tag without a date context set up.' => 'Usó una etiqueta [_1] sin un contexto de fecha configurado.', # Translate - No russian chars
	'You used an \'[_1]\' tag outside of the context of a comment; perhaps you mistakenly placed it outside of an \'MTComments\' container?' => 'Utilizó una etiqueta \'[_1]\' fuera del contexto de un comentario; ¿quizás la puso por error fuera de un contenedor \'MTComments\'?', # Translate - No russian chars
	'[_1] can be used only with Daily, Weekly, or Monthly archives.' => '[_1] sólo se puede usar con los archivos diarios, semanales o mensuales.', # Translate - No russian chars
	'Group iterator failed.' => 'Fallo en iterador de grupo.', # Translate - No russian chars
	'You used an [_1] tag outside of the proper context.' => 'Usó una etiqueta [_1] fuera del contexto correcto.', # Translate - No russian chars
	'Could not determine entry' => 'No se pudo determinar la entrada', # Translate - No russian chars
	'Invalid month format: must be YYYYMM' => 'Formato de mes no válido: debe ser YYYYMM', # Translate - No russian chars
	'No such category \'[_1]\'' => 'No existe la categoría \'[_1]\'', # Translate - No russian chars
	'[_1] cannot be used without publishing Category archive.' => '[_1] No se puede usar sin publicar archivos por categorías.', # Translate - No russian chars
	'<\$MTCategoryTrackbackLink\$> must be used in the context of a category, or with the \'category\' attribute to the tag.' => '<\$MTCategoryTrackbackLink\$> debe utilizarse en el contexto de una categoría, o con el atributo \'category\' en la etiqueta.', # Translate - No russian chars
	'You failed to specify the label attribute for the [_1] tag.' => 'No especificó el atributo título en la etiqueta [_1].', # Translate - No russian chars
	'You used an \'[_1]\' tag outside of the context of a ping; perhaps you mistakenly placed it outside of an \'MTPings\' container?' => 'Utilizó una etiqueta \'[_1]\' fuera del contexto de un ping; ¿quizás la situó por error fuera de un contenedor \'MTPings\'?', # Translate - No russian chars
	'[_1] used outside of [_2]' => '[_1] utilizado fuera de [_2]', # Translate - No russian chars
	'MT[_1] must be used in a [_2] context' => 'MT[_1] debe utilizarse en el contexto de [_2]', # Translate - No russian chars
	'Cannot find package [_1]: [_2]' => 'No se encontró el paquete [_1]: [_2]', # Translate - No russian chars
	'Error sorting [_2]: [_1]' => 'Ошибка сортировки [_2]: [_1]', 
	'Edit' => 'Изменить', 
	'You used an \'[_1]\' tag outside of the context of an asset; perhaps you mistakenly placed it outside of an \'MTAssets\' container?' => 'Utilizó una etiqueta \'[_1]\' fuera del contexto de un medio, ¿quizás la situó fuera de un contenedor \'MTAssets\' container?', # Translate - No russian chars
	'You used an \'[_1]\' tag outside of the context of an page; perhaps you mistakenly placed it outside of an \'MTPages\' container?' => 'Utilizó una etiqueta \'[_1]\' fuera del contexto de una página, ¿quizás la situó fuera de un contenedor \'MTPages\'?', # Translate - No russian chars
	'You used an [_1] without a author context set up.' => 'Utilizó un [_1] sin establecer un contexto de autor.', # Translate - No russian chars
	'Can\'t load user.' => 'No se pudor cargar el usuario.', # Translate - No russian chars
	'Division by zero.' => 'Деление на ноль.',

## lib/MT/TBPing.pm

## lib/MT/Mail.pm
	'Unknown MailTransfer method \'[_1]\'' => 'MailTransfer método desconocido \'[_1]\'', # Translate - No russian chars
	'Sending mail via SMTP requires that your server have Mail::Sendmail installed: [_1]' => 'El envío de mensajes a través de SMTP necesita que su servidor tenga Mail::Sendmail instalado: [_1]', # Translate - No russian chars
	'Error sending mail: [_1]' => 'Error enviado correo: [_1]', # Translate - No russian chars
	'You do not have a valid path to sendmail on your machine. Perhaps you should try using SMTP?' => 'No tiene configurada una ruta válida a sendmail en su máquina. ¿Quizás está intentando usar SMTP?', # Translate - No russian chars
	'Exec of sendmail failed: [_1]' => 'Fallo la ejecución de sendmail: [_1]', # Translate - No russian chars

## lib/MT/XMLRPC.pm
	'No WeblogsPingURL defined in the configuration file' => 'WeblogsPingURL no está definido en el fichero de configuración', # Translate - No russian chars
	'No MTPingURL defined in the configuration file' => 'MTPingURL no está definido en el fichero de configuración', # Translate - No russian chars
	'HTTP error: [_1]' => 'Error HTTP: [_1]', # Translate - No russian chars
	'Ping error: [_1]' => 'Error de ping: [_1]', # Translate - No russian chars

## lib/MT/Tag.pm
	'Tag must have a valid name' => 'La etiqueta debe tener un nombre válido', # Translate - No russian chars
	'This tag is referenced by others.' => 'Esta etiqueta está referenciada por otros.', # Translate - No russian chars

## lib/MT/FileMgr/Local.pm
	'Renaming \'[_1]\' to \'[_2]\' failed: [_3]' => 'Не удалось переименовать \'[_1]\' в \'[_2]\': [_3]',
	'Deleting \'[_1]\' failed: [_2]' => 'Не удалось удалить \'[_1]\': [_2]',

## lib/MT/FileMgr/FTP.pm
	'Creating path \'[_1]\' failed: [_2]' => 'Не удалось создать \'[_1]\': [_2]',

## lib/MT/FileMgr/SFTP.pm
	'SFTP connection failed: [_1]' => 'Fallo en la conexión SFTP: [_1]', # Translate - No russian chars
	'SFTP get failed: [_1]' => 'Falló la orden \'get\' en el SFTP: [_1]', # Translate - No russian chars
	'SFTP put failed: [_1]' => 'Falló la orden \'put\' en el SFTP: [_1]', # Translate - No russian chars

## lib/MT/FileMgr/DAV.pm
	'DAV connection failed: [_1]' => 'Falló la conexión DAV: [_1]', # Translate - No russian chars
	'DAV open failed: [_1]' => 'Falló la orden \'open\' en el DAV: [_1]', # Translate - No russian chars
	'DAV get failed: [_1]' => 'Falló la orden \'get\' en el DAV: [_1]', # Translate - No russian chars
	'DAV put failed: [_1]' => 'Falló la orden \'put\' en el DAV: [_1]', # Translate - No russian chars

## lib/MT/Config.pm
	'Configuration' => 'Конфигурация',

## lib/MT/XMLRPCServer.pm
	'Invalid timestamp format' => 'Formato de fecha no válido', # Translate - No russian chars
	'No web services password assigned.  Please see your user profile to set it.' => 'No se ha establecido la contraseña de servicios web.  Por favor, vaya al perfil de su usario para configurarla.', # Translate - No russian chars
	'Requested permalink \'[_1]\' is not available for this page' => 'El enlace permanente solicitado \'[_1]\' no está disponible para esta página', # Translate - No russian chars
	'Saving folder failed: [_1]' => 'Fallo al guardar la carpeta: [_1]', # Translate - No russian chars
	'No blog_id' => 'Sin blog_id', # Translate - No russian chars
	'Invalid blog ID \'[_1]\'' => 'Identificador de blog  \'[_1]\' no válido', # Translate - No russian chars
	'Value for \'mt_[_1]\' must be either 0 or 1 (was \'[_2]\')' => 'El valor de \'mt_[_1]\' debe ser 0 ó 1 (era \'[_2]\')', # Translate - No russian chars
	'Not privileged to edit entry' => 'No tiene permisos para editar la entrada', # Translate - No russian chars
	'Entry \'[_1]\' ([lc,_5] #[_2]) deleted by \'[_3]\' (user #[_4]) from xml-rpc' => 'Entrada \'[_1]\' ([lc,_5] #[_2]) borrada por \'[_3]\' (usuario #[_4]) para xml-rpc', # Translate - No russian chars
	'Not privileged to get entry' => 'No tiene permisos para obtener la entrada', # Translate - No russian chars
	'Not privileged to set entry categories' => 'No tiene permisos para establecer categorías en las entradas', # Translate - No russian chars
	'Not privileged to upload files' => 'No tiene privilegios para transferir ficheros', # Translate - No russian chars
	'No filename provided' => 'No se especificó el nombre del fichero ', # Translate - No russian chars
	'Error writing uploaded file: [_1]' => 'Error escribiendo el fichero transferido: [_1]', # Translate - No russian chars
	'Template methods are not implemented, due to differences between the Blogger API and the Movable Type API.' => 'Los métodos de las plantillas no están implementados, debido a las diferencias entre Blogger API y Movable Type API.', # Translate - No russian chars

## lib/MT/Notification.pm
	'Contact' => 'Контакт',
	'Contacts' => 'Контакты',

## lib/MT/Core.pm
	'Create Blogs' => 'Создание блогов',
	'Manage Plugins' => 'Управление плугинами',
	'Manage Templates' => 'Управление шаблонами',
	'View System Activity Log' => 'Просмотр системного лога действий',
	'Blog Administrator' => 'Администратор блога',
	'Configure Blog' => 'Настройка блога',
	'Set Publishing Paths' => 'Установить пути для публикации',
	'Manage Categories' => 'Управление темами',
	'Manage Tags' => 'Управление метками',
	'Manage Address Book' => 'Редактировать адресную книгу',
	'View Activity Log' => 'Просмотр лога активности',
	'Create Entries' => 'Создать записи',
	'Send Notifications' => 'Отослать уведомления',
	'Edit All Entries' => 'Изменить все записи',
	'Manage Pages' => 'Страницы',
	'Publish Blog' => 'Опубликовать блог',
	'Save Image Defaults' => 'Сохранить настройки изображений по умолчанию',
	'Manage Assets' => 'Управление медиа-ресурсами',
	'Post Comments' => 'Оставить комментарий',
	'Manage Feedback' => 'Управление комментариями',
	'MySQL Database' => 'База данных MySQL',
	'PostgreSQL Database' => 'База данных PostgreSQL',
	'SQLite Database' => 'База данных SQLite',
	'SQLite Database (v2)' => 'база данных SQLite (v2)',
	'Convert Line Breaks' => 'Преобразование окончаний строк',
	'Rich Text' => 'Текст с форматированием',
	'Movable Type Default' => 'Movable Type по умолчанию',
	'weblogs.com' => 'weblogs.com', # Translate - Not translated
	'technorati.com' => 'technorati.com', # Translate - Not translated
	'google.com' => 'google.com', # Translate - Not translated
	'Classic Blog' => 'Классический Блог',
	'Publishes content.' => 'Опубликовать содержимое.',
	'Synchronizes content to other server(s).' => 'Sincroniza el contenido con otros servidores.', # Translate - No russian chars
	'zip' => 'zip', # Translate - Not translated
	'tar.gz' => 'tar.gz', # Translate - Not translated
	'Entries List' => 'Список записей',
	'Blog URL' => 'URL блога',
	'Blog ID' => 'ID блога',
	'Entry Excerpt' => 'Выжимка записи',
	'Entry Link' => 'Ссылка на запись',
	'Entry Extended Text' => 'Расширенный текст записи',
	'Entry Title' => 'Заголовок записи',
	'If Block' => 'Блок If',
	'If/Else Block' => 'Блок If/Else',
	'Include Template Module' => 'Включить модуль шаблона',
	'Include Template File' => 'Включить файл шаблона',
	'Get Variable' => 'Get Variable', # Translate - Not translated
	'Set Variable' => 'Set Variable', # Translate - Not translated
	'Set Variable Block' => 'Set Variable Block', # Translate - Not translated
	'Publish Scheduled Entries' => 'Опубликовать запланированные записи',
	'Junk Folder Expiration' => 'Caducidad de la carpeta basura', # Translate - No russian chars
	'Remove Temporary Files' => 'Удалить временные файлы',
	'Remove Expired User Sessions' => 'Удалить старые сессии пользователей',

## lib/MT/Auth.pm
	'Bad AuthenticationModule config \'[_1]\': [_2]' => 'Configuración incorrecta de AuthenticationModule \'[_1]\': [_2]', # Translate - No russian chars
	'Bad AuthenticationModule config' => 'Configuración incorrecta de AuthenticationModule', # Translate - No russian chars

## lib/MT/Role.pm
	'Role' => 'Роль',

## lib/MT/Asset/Video.pm
	'Video' => 'Видео',
	'Videos' => 'Видео',
	'video' => 'видео',

## lib/MT/Asset/Audio.pm
	'Audio' => 'Аудио',
	'audio' => 'аудио',

## lib/MT/Asset/Image.pm
	'Image' => 'Изображение',
	'Images' => 'Изображения',
	'Actual Dimensions' => 'Размеры',
	'[_1] x [_2] pixels' => '[_1] x [_2] пикселей',
	'Error cropping image: [_1]' => 'Ошибка обработки изображения: [_1]',
	'Error scaling image: [_1]' => 'Ошибка масштабирования изображения: [_1]',
	'Error converting image: [_1]' => 'Ошибка конвертирования изображения: [_1]',
	'Error creating thumbnail file: [_1]' => 'Ошибка создания уменьшенного изображения: [_1]',
	'%f-thumb-%wx%h%x' => '%f-thumb-%wx%h%x', # Translate - Not translated
	'Can\'t load image #[_1]' => 'Невозможно загрузить изображение [_1]',
	'View image' => 'Просмотр изображения',
	'Permission denied setting image defaults for blog #[_1]' => 'Доступ запрещен при установке настроек изображений для блога [_1]',
	'Thumbnail image for [_1]' => 'Уменьшенное изображение для [_1]',
	'Invalid basename \'[_1]\'' => 'Неверное базовое имя \'[_1]\'',
	'Error writing to \'[_1]\': [_2]' => 'Ошибка записи в \'[_1]\': [_2]',
	'Popup Page for [_1]' => 'Всплывающая страница для [_1]',

## lib/MT/Image.pm
	'File size exceeds maximum allowed: [_1] > [_2]' => 'El tamaño del fichero excede el máximo permitido: [_1] > [_2]', # Translate - No russian chars
	'Can\'t load Image::Magick: [_1]' => 'No se pudo cargar Image::Magick: [_1]', # Translate - No russian chars
	'Reading file \'[_1]\' failed: [_2]' => 'Fallo leyendo archivo \'[_1]\': [_2]', # Translate - No russian chars
	'Reading image failed: [_1]' => 'Fallo leyendo imagen: [_1]', # Translate - No russian chars
	'Scaling to [_1]x[_2] failed: [_3]' => 'El escalado a [_1]x[_2] falló: [_3]', # Translate - No russian chars
	'Cropping a [_1]x[_1] square at [_2],[_3] failed: [_4]' => 'Fallo recortando un cuadrado [_1]x[_1] en [_2],[_3]: [_4]', # Translate - No russian chars
	'Converting image to [_1] failed: [_2]' => 'Fallo convirtiendo una imagen a [_1]: [_2]', # Translate - No russian chars
	'Can\'t load IPC::Run: [_1]' => 'No se pudo cargar IPC::Run: [_1]', # Translate - No russian chars
	'Cropping to [_1]x[_1] failed: [_2]' => 'Fallo recortando a [_1]x[_1]: [_2]', # Translate - No russian chars
	'Converting to [_1] failed: [_2]' => 'Fallo convirtiendo a [_1]: [_2]', # Translate - No russian chars
	'You do not have a valid path to the NetPBM tools on your machine.' => 'No posee una ruta válida a las herramientas NetPBMYou en su máquina.', # Translate - No russian chars

## lib/MT/TaskMgr.pm
	'Unable to secure lock for executing system tasks. Make sure your TempDir location ([_1]) is writable.' => 'No fue posible asegurar el bloqueo para la ejecución de tareas del sistema. Asegúrese de que se puede escribir en el directorio TempDir ([_1]).', # Translate - No russian chars
	'Error during task \'[_1]\': [_2]' => 'Error durante la tarea \'[_1]\': [_2]', # Translate - No russian chars
	'Scheduled Tasks Update' => 'Actualización de tareas programadas', # Translate - No russian chars
	'The following tasks were run:' => 'Se ejecutaron las siguientes tareas:', # Translate - No russian chars

## lib/MT/TemplateMap.pm
	'Archive Mapping' => 'Archive Mapping', # Translate - Not translated
	'Archive Mappings' => 'Archive Mappings', # Translate - Not translated

## lib/MT/Permission.pm
	'Permission' => 'права доступа',
	'Permissions' => 'Права доступа',

## lib/MT/Builder.pm
	'<[_1]> at line [_2] is unrecognized.' => 'No se reconoció a <[_1]> en la línea [_2].', # Translate - No russian chars
	'<[_1]> with no </[_1]> on line #' => '<[_1]> sin </[_1]> en la línea #', # Translate - No russian chars
	'<[_1]> with no </[_1]> on line [_2].' => '<[_1]> sin </[_1]> en la línea [_2].', # Translate - No russian chars
	'<[_1]> with no </[_1]> on line [_2]' => '<[_1]> sin </[_1]> en la línea [_2]', # Translate - No russian chars
	'Error in <mt:[_1]> tag: [_2]' => 'Error en la etiqueta <mt:[_1]>: [_2]', # Translate - No russian chars
	'Unknown tag found: [_1]' => 'Se encontró una etiqueta desconocida: [_1]', # Translate - No russian chars

## lib/MT/ObjectScore.pm
	'Object Score' => 'Score del Objeto', # Translate - No russian chars
	'Object Scores' => 'Scores de los Objetos', # Translate - No russian chars

## lib/MT/Template.pm
	'Template' => 'Шаблон',
	'Error reading file \'[_1]\': [_2]' => 'Ошибка чтения файла \'[_1]\': [_2]',
	'Publish error in template \'[_1]\': [_2]' => 'Ошибка публикации шаблона \'[_1]\': [_2]',
	'Template with the same name already exists in this blog.' => 'Шаблон с таким же названием уже существует в данном блоге.',
	'You cannot use a [_1] extension for a linked file.' => 'No puede usar una extensión [_1] para un fichero enlazado.', # Translate - No russian chars
	'Opening linked file \'[_1]\' failed: [_2]' => 'Fallo abriendo fichero enlazado\'[_1]\': [_2]', # Translate - No russian chars
	'Index' => 'Индекс',
	'Category Archive' => 'Архив тем',
	'Comment Listing' => 'Список комментариев',
	'Ping Listing' => 'Список пингов',
	'Comment Error' => 'Ошибка комментария',
	'Uploaded Image' => 'Загрузка изображения',
	'Module' => 'Модуль',
	'Widget' => 'Виджет',

## lib/MT/Plugin/JunkFilter.pm
	'[_1]: [_2][_3] from rule [_4][_5]' => '[_1]: [_2][_3] из правила [_4][_5]',
	'[_1]: [_2][_3] from test [_4]' => '[_1]: [_2][_3] из теста [_4]',

## lib/MT/Worker/Publish.pm
	'Publishing: [quant,_1,file,files]...' => 'Публикуются: [quant,_1,файл,файла,файлов]...',
	'-- set complete ([quant,_1,file,files] in [_2] seconds)' => '-- conjunto completo ([quant,_1,файл,файла,файлов] за [quant,_2,секунду,секунды,секунд])',

## lib/MT/Component.pm
	'Loading template \'[_1]\' failed: [_2]' => 'Fallo cargando plantilla \'[_1]\': [_2]', # Translate - No russian chars

## lib/MT/Upgrade.pm
	'Comment Posted' => 'Comentario publicado', # Translate - No russian chars
	'Your comment has been posted!' => '¡El comentario ha sido publicado!', # Translate - No russian chars
	'[_1]: [_2]' => '[_1]: [_2]', # Translate - Not translated
	'Migrating Nofollow plugin settings...' => 'Migrando ajustes de la extensión Nofollow...', # Translate - No russian chars
	'Updating system search template records...' => 'Actualizando registros de las plantillas de búsqueda del sistema...', # Translate - No russian chars
	'Custom ([_1])' => 'Personalizado ([_1])', # Translate - No russian chars
	'This role was generated by Movable Type upon upgrade.' => 'Este rol fue generado por Movable Type durante la actualización.', # Translate - No russian chars
	'Migrating permission records to new structure...' => 'Migrando registros de permisos a la nueva estructura...', # Translate - No russian chars
	'Migrating role records to new structure...' => 'Migrando registros de roles a la nueva estructura...', # Translate - No russian chars
	'Migrating system level permissions to new structure...' => 'Migrando permisos a nivel del sistema a la nueva estructura...', # Translate - No russian chars
	'Invalid upgrade function: [_1].' => 'Función de actualización no válida: [_1].', # Translate - No russian chars
	'Error loading class [_1].' => 'Error cargando clase [_1].', # Translate - No russian chars
	'Creating initial blog and user records...' => 'Creando registros iniciales de blog y usuario...', # Translate - No russian chars
	'Error saving record: [_1].' => 'Error guardando el registro: [_1].', # Translate - No russian chars
	'I just finished installing Movable Type [_1]!' => '¡Acabo de finalizar la instalación de Movable Type [_1]!', # Translate - No russian chars
	'Welcome to my new blog powered by Movable Type. This is the first post on my blog and was created for me automatically when I finished the installation process. But that is ok, because I will soon be creating posts of my own!' => 'Bienvenido a mi nuevo blog de Movable Type. Esta es la primera entrada en mi blog y fue creada automáticamente al finalizar el proceso de instalación. ¡Pronto crearé mis propias entradas!', # Translate - No russian chars
	'Movable Type also created a comment for me as well so that I could see what a comment will look like on my blog once people start submitting comments on all the posts I will write.' => 'Movable Type también creó un comentario, para que pueda ver cómo quedarían una vez que los lectores comiencen a enviarme comentarios en las entradas que escriba.', # Translate - No russian chars
	'Can administer the blog.' => 'Может администрировать блог.',
	'Editor' => 'Редактор',
	'Can upload files, edit all entries/categories/tags on a blog and publish the blog.' => 'Puede subir ficheros, editar notas/categorías/etiquetas en un blog determinado y publicar otra vez.', # Translate - No russian chars
	'Can create entries, edit their own, upload files and publish.' => 'Может создавать записи, редактировать собственные, загружать файлы и публиковать.',
	'Designer' => 'Дизайнер',
	'Can edit, manage and publish blog templates.' => 'Puede editar, administrar y publicar otra vez las plantillas del blog', # Translate - No russian chars
	'Webmaster' => 'Webmaster', # Translate - Not translated
	'Can manage pages and publish blog templates.' => 'Puede administrar las páginas y publicar otra vez las plantillas del blog', # Translate - No russian chars
	'Contributor' => 'Colaborador', # Translate - No russian chars
	'Can create entries, edit their own and comment.' => 'Puede crear entradas, editar las suyas y comentar.', # Translate - No russian chars
	'Moderator' => 'Moderador', # Translate - No russian chars
	'Can comment and manage feedback.' => 'Puede comentar y administrar las respuestas.', # Translate - No russian chars
	'Can comment.' => 'Puede comentar.', # Translate - No russian chars
	'Removing Dynamic Site Bootstrapper index template...' => 'Borrando plantilla índice del arranque dinámico...', # Translate - No russian chars
	'Creating new template: \'[_1]\'.' => 'Creando nueva plantilla: \'[_1]\'.', # Translate - No russian chars
	'Mapping templates to blog archive types...' => 'Mapeando plantillas con tipos de archivo de blogs...', # Translate - No russian chars
	'Renaming PHP plugin file names...' => 'Renombrando nombre de ficheros de la extensión de PHP...', # Translate - No russian chars
	'Error renaming PHP files. Please check the Activity Log.' => 'Error al renombrar ficheros PHP. Por favor, compruebe el registro de actividad.', # Translate - No russian chars
	'Cannot rename in [_1]: [_2].' => 'No se pudo renombrar en [_1]: [_2].', # Translate - No russian chars
	'Updating widget template records...' => 'Actualizando registros de plantillas de widgets...', # Translate - No russian chars
	'Removing unused template maps...' => 'Borrando mapas de plantillas no usados...', # Translate - No russian chars
	'Upgrading table for [_1] records...' => 'Actualización de las tablas para [_1] los registros...', # Translate - No russian chars
	'Upgrading database from version [_1].' => 'Actualizando base de datos desde la versión [_1].', # Translate - No russian chars
	'Database has been upgraded to version [_1].' => 'Se actualizó la base de datos a la versión [_1].', # Translate - No russian chars
	'User \'[_1]\' upgraded database to version [_2]' => 'Usuario \'[_1]\' actualizó la base de datos a la versión [_2]', # Translate - No russian chars
	'Plugin \'[_1]\' upgraded successfully to version [_2] (schema version [_3]).' => 'Extensión \'[_1]\' actualizada con éxito a la versión [_2] (versión del esquema [_3]).', # Translate - No russian chars
	'User \'[_1]\' upgraded plugin \'[_2]\' to version [_3] (schema version [_4]).' => 'Usuario \'[_1]\' actualizó la extensión \'[_2]\' a la versión [_3] (versión del esquema [_4]).', # Translate - No russian chars
	'Plugin \'[_1]\' installed successfully.' => 'La extensión \'[_1]\' se actualizó correctamente.', # Translate - No russian chars
	'User \'[_1]\' installed plugin \'[_2]\', version [_3] (schema version [_4]).' => 'Usuario \'[_1]\' instaló la extensión \'[_2]\', versión [_3] (versión del esquema [_4]).', # Translate - No russian chars
	'Setting your permissions to administrator.' => 'Estableciendo permisos de administrador.', # Translate - No russian chars
	'Creating configuration record.' => 'Creando registro de configuración.', # Translate - No russian chars
	'Creating template maps...' => 'Creando mapas de plantillas...', # Translate - No russian chars
	'Mapping template ID [_1] to [_2] ([_3]).' => 'Mapeando ID plantilla [_1] a [_2] ([_3]).', # Translate - No russian chars
	'Mapping template ID [_1] to [_2].' => 'Mapeando ID plantilla [_1] a [_2].', # Translate - No russian chars
	'Error loading class: [_1].' => 'Error cargando la clase: [_1].', # Translate - No russian chars
	'Error saving [_1] record # [_3]: [_2]... [_4].' => 'Error guardando [_1] registro # [_3]: [_2]... [_4].', # Translate - No russian chars
	'Creating entry category placements...' => 'Creando situaciones de categorías de entradas...', # Translate - No russian chars
	'Updating category placements...' => 'Actualizando situación de categorías...', # Translate - No russian chars
	'Assigning comment/moderation settings...' => 'Asignando opciones de comentarios/moderación...', # Translate - No russian chars
	'Setting blog basename limits...' => 'Estableciendo los límites del nombre base del blog...', # Translate - No russian chars
	'Setting default blog file extension...' => 'Estableciendo extensión predefinida de fichero de blog...', # Translate - No russian chars
	'Updating comment status flags...' => 'Actualizando estados de comentarios...', # Translate - No russian chars
	'Updating commenter records...' => 'Actualizando registros de comentaristas...', # Translate - No russian chars
	'Assigning blog administration permissions...' => 'Asignando permisos de administración de blogs...', # Translate - No russian chars
	'Setting blog allow pings status...' => 'Estableciendo el estado de recepción de pings en los blogs...', # Translate - No russian chars
	'Updating blog comment email requirements...' => 'Actualizando los requerimientos del correo de los comentarios...', # Translate - No russian chars
	'Assigning entry basenames for old entries...' => 'Asignando nombre base de entradas en entradas antiguas...', # Translate - No russian chars
	'Updating user web services passwords...' => 'Actualizando contraseñas de servicios web...', # Translate - No russian chars
	'Updating blog old archive link status...' => 'Actualizando el estado de los enlaces de archivado antiguos...', # Translate - No russian chars
	'Updating entry week numbers...' => 'Actualizando números de semana de entradas...', # Translate - No russian chars
	'Updating user permissions for editing tags...' => 'Actualizando los permisos de los usuarios para la edición de etiquetas...', # Translate - No russian chars
	'Setting new entry defaults for blogs...' => 'Configurando los nuevos valores predefinidos de las entradas en los blogs...', # Translate - No russian chars
	'Migrating any "tag" categories to new tags...' => 'Migrando cualquier categoría "tag" a nuevas etiquetas...', # Translate - No russian chars
	'Assigning custom dynamic template settings...' => 'Asignando opciones de plantillas dinámicas personalizadas...', # Translate - No russian chars
	'Assigning user types...' => 'Asignando tipos de usario...', # Translate - No russian chars
	'Assigning category parent fields...' => 'Asignando campos de ancentros en las categorías...', # Translate - No russian chars
	'Assigning template build dynamic settings...' => 'Asignando opciones de construcción de plantillas dinámicas...', # Translate - No russian chars
	'Assigning visible status for comments...' => 'Asignando estado de visibilidad a los comentarios...', # Translate - No russian chars
	'Assigning junk status for comments...' => 'Asignando el estado spam para los comentarios...', # Translate - No russian chars
	'Assigning visible status for TrackBacks...' => 'Asignando estado de visiblidad para los TrackBacks...', # Translate - No russian chars
	'Assigning junk status for TrackBacks...' => 'Asignando el estado spam para los TrackBacks...', # Translate - No russian chars
	'Assigning basename for categories...' => 'Asignando nombre base a las categorías...', # Translate - No russian chars
	'Assigning user status...' => 'Asignando estado de usuarios...', # Translate - No russian chars
	'Migrating permissions to roles...' => 'Migrando permisos a roles...', # Translate - No russian chars
	'Populating authored and published dates for entries...' => 'Rellenando fechas de creación y publicación de las entradas...', # Translate - No russian chars
	'Classifying category records...' => 'Clasificando registros de categorías...', # Translate - No russian chars
	'Classifying entry records...' => 'Clasificando registros de entradas...', # Translate - No russian chars
	'Merging comment system templates...' => 'Combinando plantillas de comentarios del sistema...', # Translate - No russian chars
	'Populating default file template for templatemaps...' => 'Rellenando plantilla predefinida de ficheros para los templatemaps...', # Translate - No russian chars
	'Assigning user authentication type...' => 'Asignando tipo de autentificación de usuarios...', # Translate - No russian chars
	'Adding new feature widget to dashboard...' => 'Añadiendo un nuevo widget al panel de control...', # Translate - No russian chars
	'Moving OpenID usernames to external_id fields...' => 'Moviendo los nombres de usuarios de OpenID a campos external_id...', # Translate - No russian chars
	'Assigning blog template set...' => 'Asignando conjunto de plantillas...', # Translate - No russian chars
	'Assigning blog page layout...' => 'Asignando disposición de las páginas...', # Translate - No russian chars

## lib/MT/Placement.pm
	'Category Placement' => 'Gestión de Categorías', # Translate - No russian chars

## lib/MT.pm.pre
	'Powered by [_1]' => 'Powered by [_1]', # Translate - Not translated
	'Version [_1]' => 'Версия [_1]',
	'http://www.sixapart.com/movabletype/' => 'http://www.sixapart.com/movabletype/', # Translate - Not translated
	'OpenID URL' => 'OpenID URL', # Translate - Not translated
	'Sign in using your OpenID identity.' => 'Авторизоваться с помощью OpenID.',
	'OpenID is an open and decentralized single sign-on identity system.' => 'OpenID es un sistema abierto y descentralizado de identificación.', # Translate - No russian chars
	'Sign In' => 'Вход',
	'Learn more about OpenID.' => 'Más información sobre OpenID.', # Translate - No russian chars
	'Your LiveJournal Username' => 'Su usuario de LiveJournal', # Translate - No russian chars
	'Sign in using your Vox blog URL' => 'Identifíquese usando la URL de su blog de Vox', # Translate - No russian chars
	'Learn more about LiveJournal.' => 'Más información sobre LiveJournal.', # Translate - No russian chars
	'Your Vox Blog URL' => 'La URL de su blog de Vox', # Translate - No russian chars
	'Learn more about Vox.' => 'Подробнее о Vox.',
	'TypeKey is a free, open system providing you a central identity for posting comments on weblogs and logging into other websites. You can register for free.' => 'TypeKey es un sistema abierto y gratuito que provee identificación centralizada para publicar comentarios en weblogs y registrarse en otros webs. Puede darse de alta gratuitamente.', # Translate - No russian chars
	'Sign in or register with TypeKey.' => 'Авторизоваться с помощью TypeKey.',
	'Hello, world' => 'Hola, mundo', # Translate - No russian chars
	'Hello, [_1]' => 'Hola, [_1]', # Translate - No russian chars
	'Message: [_1]' => 'Mensaje: [_1]', # Translate - No russian chars
	'If present, 3rd argument to add_callback must be an object of type MT::Component or MT::Plugin' => 'Si está presente, el tercer argumento de add_callback debe ser un objeto de tipo MT::Component o MT::Plugin', # Translate - No russian chars
	'4th argument to add_callback must be a CODE reference.' => 'El cuarto argumento de add_callback debe ser una referencia de código.', # Translate - No russian chars
	'Two plugins are in conflict' => 'Dos extensiones están en conflicto', # Translate - No russian chars
	'Invalid priority level [_1] at add_callback' => 'Nivel de prioridad [_1] no válido en add_callback', # Translate - No russian chars
	'Unnamed plugin' => 'Extensión sin nombre', # Translate - No russian chars
	'[_1] died with: [_2]' => '[_1] murió: [_2]', # Translate - No russian chars
	'Bad ObjectDriver config' => 'Configuración de ObjectDriver incorrecta', # Translate - No russian chars
	'Bad CGIPath config' => 'Configuración CGIPath incorrecta', # Translate - No russian chars
	'Missing configuration file. Maybe you forgot to move mt-config.cgi-original to mt-config.cgi?' => 'Archivo de configuración no encontrado. ¿Quizás olvidó renombrar mt-config.cgi-original a mt-config.cgi?', # Translate - No russian chars
	'Plugin error: [_1] [_2]' => 'Error en la extensión: [_1] [_2]', # Translate - No russian chars
	'Loading template \'[_1]\' failed.' => 'Fallo cargando la plantilla \'[_1]\'.', # Translate - No russian chars
	'__PORTAL_URL__' => '__PORTAL_URL__', # Translate - Not translated
	'http://www.movabletype.org/documentation/' => 'http://www.movabletype.org/documentation/', # Translate - Not translated
	'OpenID' => 'OpenID', # Translate - Not translated
	'LiveJournal' => 'LiveJournal', # Translate - Not translated
	'Vox' => 'Vox', # Translate - Not translated
	'TypeKey' => 'TypeKey', # Translate - Not translated
	'Movable Type default' => 'Movable Type умолчание',

## lib/MT.pm

## mt-static/mt.js
	'delete' => 'стереть',
	'remove' => 'удалить',
	'enable' => 'разрешить',
	'disable' => 'запретить',
	'You did not select any [_1] to [_2].' => 'Вы не выбрали ни одного [_1] из [_2].',
	'Are you sure you want to [_2] this [_1]?' => 'Вы уверены что хотите [_2] этот [_1]?',
	'Are you sure you want to [_3] the [_1] selected [_2]?' => 'Вы уверены что хотите [_3] [_1] выбранные [_2]?',
	'Are you certain you want to remove this role? By doing so you will be taking away the permissions currently assigned to any users and groups associated with this role.' => 'Вы уверены что хотите удалить эту роль.',
	'Are you certain you want to remove these [_1] roles? By doing so you will be taking away the permissions currently assigned to any users and groups associated with these roles.' => 'Вы уверены что хотите удалить эти [_1] ролей?.',
	'You did not select any [_1] [_2].' => 'Вы не выбрали ни одного [_1] [_2].',
	'You can only act upon a minimum of [_1] [_2].' => 'Вы можете выбрать максимум [_1] [_2].',
	'You can only act upon a maximum of [_1] [_2].' => 'Вы можете выбрать минимум [_1] [_2].',
	'You must select an action.' => 'Вы должны выбрать действие.',
	'to mark as spam' => 'пометить как спам',
	'to remove spam status' => 'убрать отметку спам',
	'Enter email address:' => 'Введите адрес email:',
	'Enter URL:' => 'Введите URL:',
	'The tag \'[_2]\' already exists. Are you sure you want to merge \'[_1]\' with \'[_2]\'?' => 'Метка \'[_2]\' уже существует. Вы уверены что хотите объеденить \'[_1]\' с \'[_2]\'?',
	'The tag \'[_2]\' already exists. Are you sure you want to merge \'[_1]\' with \'[_2]\' across all weblogs?' => 'Метка \'[_2]\' уже существует. Вы уверены что хотите объеденить \'[_1]\' с \'[_2]\' во всех веблогах?',
	'Loading...' => 'Загрузка...',
	'[_1] &ndash; [_2] of [_3]' => '[_1] &ndash; [_2] из [_3]',
	'[_1] &ndash; [_2]' => '[_1] &ndash; [_2]', # Translate - Not translated

## mt-static/js/assetdetail.js
	'No Preview Available' => 'Просмотр не доступен',
	'View uploaded file' => 'Просмотреть загруженный файл',

## mt-static/js/dialog.js
	'(None)' => '(Ничего)',

## search_templates/results_feed_rss2.tmpl
	'Search Results for [_1]' => 'Resultados de la búsqueda sobre [_1]', # Translate - No russian chars

## search_templates/results_feed.tmpl

## search_templates/default.tmpl
	'SEARCH FEED AUTODISCOVERY LINK PUBLISHED ONLY WHEN A SEARCH HAS BEEN EXECUTED' => 'EL ENLACE DE AUTODESCUBRIMIENTO DE LA FUENTE DE SINDICACIÓN DE BÚSQUEDAS SOLO SE PUBLICA CUANDO SE HA REALIZADO UNA BÚSQUEDA', # Translate - No russian chars
	'Blog Search Results' => 'Результаты поиска в блоге',
	'Blog search' => 'Поиск в блоге',
	'STRAIGHT SEARCHES GET THE SEARCH QUERY FORM' => 'STRAIGHT SEARCHES GET THE SEARCH QUERY FORM', # Translate - Not translated
	'Search this site' => 'Поиск на сайте',
	'Match case' => 'Match case', # Translate - Not translated
	'SEARCH RESULTS DISPLAY' => 'MOSTRAR RESULTADOS DE LA BÚSQUEDA', # Translate - No russian chars
	'Matching entries from [_1]' => 'Entradas coincidentes de [_1]', # Translate - No russian chars
	'Entries from [_1] tagged with \'[_2]\'' => 'Entradas de [_1] etiquetadas en \'[_2]\'', # Translate - No russian chars
	'Posted <MTIfNonEmpty tag="EntryAuthorDisplayName">by [_1] </MTIfNonEmpty>on [_2]' => 'Publicado <MTIfNonEmpty tag="EntryAuthorDisplayName">por [_1] </MTIfNonEmpty>en [_2]', # Translate - No russian chars
	'Showing the first [_1] results.' => 'Mostrando los primeros [_1] resultados.', # Translate - No russian chars
	'NO RESULTS FOUND MESSAGE' => 'MENSAJE DE NINGÚN RESULTADO ENCONTRADO', # Translate - No russian chars
	'Entries matching \'[_1]\'' => 'Entradas coincidentes con \'[_1]\'', # Translate - No russian chars
	'Entries tagged with \'[_1]\'' => 'Entradas etiquetadas en \'[_1]\'', # Translate - No russian chars
	'No pages were found containing \'[_1]\'.' => 'No se encontraron páginas que contuvieran \'[_1]\'.', # Translate - No russian chars
	'By default, this search engine looks for all words in any order. To search for an exact phrase, enclose the phrase in quotes' => 'Por defecto, este motor de búsquedas, trata de encontrar todas las palabras en cualquier orden. Para buscar una frase exacta, acote la frase con comillas dobles', # Translate - No russian chars
	'The search engine also supports AND, OR, and NOT keywords to specify boolean expressions' => 'El motor de búsqueda también soporta las palabras claves AND, OR y NOT para especificar expresiones lógicas (booleanas)', # Translate - No russian chars
	'END OF ALPHA SEARCH RESULTS DIV' => 'FIN DE LOS RESULTADOS DE BÚSQUEDA - ALPHA DIV', # Translate - No russian chars
	'BEGINNING OF BETA SIDEBAR FOR DISPLAY OF SEARCH INFORMATION' => 'COMIENZO DE LA BARRA LATERAL BETA PARA MOSTRAR LA INFORMACIÓN DE BÚSQUEDA', # Translate - No russian chars
	'SET VARIABLES FOR SEARCH vs TAG information' => 'ESPECIFICAR VARIABLES PARA LA BÚSQUEDA vs información de etiqueta', # Translate - No russian chars
	'If you use an RSS reader, you can subscribe to a feed of all future entries tagged \'[_1]\'.' => 'Si usa un lector de RSS, puede suscribirse a la fuente de todas las futuras entradas con la etiqueta \'[_1]\'.', # Translate - No russian chars
	'If you use an RSS reader, you can subscribe to a feed of all future entries matching \'[_1]\'.' => 'Si usa un lector de RSS, puede suscribirse a la fuente de sindicación de todas las futuras entradas que contengan \'[_1]\'.', # Translate - No russian chars
	'SEARCH/TAG FEED SUBSCRIPTION INFORMATION' => 'INFORMACIÓN DE SUSCRIPCIÓN A LA FUENTE DE BÚSQUEDA/ETIQUETA', # Translate - No russian chars
	'Feed Subscription' => 'Suscripción de sindicación', # Translate - No russian chars
	'http://www.sixapart.com/about/feeds' => 'http://www.sixapart.com/about/feeds', # Translate - Not translated
	'What is this?' => '¿Qué es esto?', # Translate - No russian chars
	'TAG LISTING FOR TAG SEARCH ONLY' => 'LISTA DE ETIQUETAS PARA LA BÚSQUEDA DE SOLO ETIQUETAS', # Translate - No russian chars
	'Other Tags' => 'Otras etiquetas', # Translate - No russian chars
	'END OF PAGE BODY' => 'FIN DEL CUERPO DE LA PÁGINA', # Translate - No russian chars
	'END OF CONTAINER' => 'FIN DEL CONTENEDOR', # Translate - No russian chars

## search_templates/comments.tmpl
	'Search for new comments from:' => 'Buscar nuevos comentarios desde:', # Translate - No russian chars
	'the beginning' => 'el principio', # Translate - No russian chars
	'one week back' => 'hace una semana', # Translate - No russian chars
	'two weeks back' => 'hace dos semanas', # Translate - No russian chars
	'one month back' => 'hace un mes', # Translate - No russian chars
	'two months back' => 'hace dos meses', # Translate - No russian chars
	'three months back' => 'hace tres meses', # Translate - No russian chars
	'four months back' => 'hace cuatro meses', # Translate - No russian chars
	'five months back' => 'hace cinco meses', # Translate - No russian chars
	'six months back' => 'hace seis meses', # Translate - No russian chars
	'one year back' => 'hace un año', # Translate - No russian chars
	'Find new comments' => 'Encontrar nuevos comentarios', # Translate - No russian chars
	'Posted in [_1] on [_2]' => 'Publicado en [_1] el [_2]', # Translate - No russian chars
	'No results found' => 'No se encontraron resultados', # Translate - No russian chars
	'No new comments were found in the specified interval.' => 'No se encontraron nuevos comentarios en el intervalo especificado', # Translate - No russian chars
	'Select the time interval that you\'d like to search in, then click \'Find new comments\'' => 'Seleccione el intervalo temporal en el que desea buscar, y luego haga clic en \'Buscar nuevos comentarios\'', # Translate - No russian chars

## tmpl/wizard/start.tmpl
	'Welcome to Movable Type' => 'Добро пожаловать в Movable Type',
	'Configuration File Exists' => 'Configuración de archivos existentes', # Translate - No russian chars
	'A configuration (mt-config.cgi) file already exists, <a href="[_1]">sign in</a> to Movable Type.' => 'Una configuración del archivo (mt-config,cgi) existe, <a href="[_1]>identificarse</a> a Movable Type.', # Translate - No russian chars
	'To create a new configuration file using the Wizard, remove the current configuration file and then refresh this page' => 'Para crear una nueva configuración del archivo usando Wizard, borre la configuración actual del archivo y actualice la página', # Translate - No russian chars
	'Movable Type requires that you enable JavaScript in your browser. Please enable it and refresh this page to proceed.' => 'Movable Type necesita que JavaScript esté disponible en el navegador. Por favor, active JavaScript y recargue esta página para continuar.', # Translate - No russian chars
	'This wizard will help you configure the basic settings needed to run Movable Type.' => 'Este asistente le ayudará a configurar las opciones básicas necesarias para ejecutar Movable Type.', # Translate - No russian chars
	'<strong>Error: \'[_1]\' could not be found.</strong>  Please move your static files to the directory first or correct the setting if it is incorrect.' => '<strong>Error: \'[_1]\' no ha sido encontrado.</strong> Por favor,mueva sus archivos estáticos al primer directorio o corrija la configuración si no es correcta.', # Translate - No russian chars
	'Configure Static Web Path' => 'Configurar ruta del web estático', # Translate - No russian chars
	'Movable Type ships with directory named [_1] which contains a number of important files such as images, javascript files and stylesheets.' => 'Movable Type viene con un directorio nombrado [_1] el cual contiene un número de archivos importantes tales como imágenes, archivos javascript y hojas de estilo en cascadas.', # Translate - No russian chars
	'The [_1] directory is in the main Movable Type directory which this wizard script resides, but due to your web server\'s configuration, the [_1] directory is not accessible in this location and must be moved to a web-accessible location (e.g., your web document root directory).' => 'El directorio [_1] está en el directorio principal de Movable Type que recide en el script de instalación, pero depende de la configuración de su web server, el directorio [_1] no es accesible en este lugar y debe ser removido a un lugar de web accesible (e.g., su documento de raíz del directorio web)', # Translate - No russian chars
	'This directory has either been renamed or moved to a location outside of the Movable Type directory.' => 'Este directorio o se ha renombrado o movido a un lugar fuera del directorio de Movable Type.', # Translate - No russian chars
	'Once the [_1] directory is in a web-accessible location, specify the location below.' => 'Cuando el directorio [_1] esté en un lugar accesible vía web, especifique el lugar debajo.', # Translate - No russian chars
	'This URL path can be in the form of [_1] or simply [_2]' => 'La dirección URL puede estar en la forma de [_1] o simplemente [_2]', # Translate - No russian chars
	'This path must be in the form of [_1]' => 'Esta ruta debe estar en la forma [_1]', # Translate - No russian chars
	'Static web path' => 'Ruta estática del web', # Translate - No russian chars
	'Static file path' => 'Ruta estática de los ficheros', # Translate - No russian chars
	'Begin' => 'Comenzar', # Translate - No russian chars

## tmpl/wizard/packages.tmpl
	'Requirements Check' => 'Comprobación de requerimientos', # Translate - No russian chars
	'The following Perl modules are required in order to make a database connection.  Movable Type requires a database in order to store your blog\'s data.  Please install one of the packages listed here in order to proceed.  When you are ready, click the \'Retry\' button.' => 'Los siguientes módulos de Perl son necesarios para la conexión con la base de datos. Movable Type necesita una base de datos para guardar los datos del blog. Por favor, instale los paquetes listados aquí para continuar. Cuando lo haya hecho, haga clic en el botón \'Reintentar\'.', # Translate - No russian chars
	'All required Perl modules were found.' => 'Se encontraron todos los módulos de Perl necesarios.', # Translate - No russian chars
	'You are ready to proceed with the installation of Movable Type.' => 'Está listo para continuar con la instalación de Movable Type.', # Translate - No russian chars
	'Continue' => 'Продолжить',
	'Some optional Perl modules could not be found. <a href="javascript:void(0)" onclick="[_1]">Display list of optional modules</a>' => 'No se encontraron algunos módulos opcionales de Perl. <a href="javascript:void(0)" onclick="[_1]">Mostrar lista de módulos opcionales</a>', # Translate - No russian chars
	'One or more Perl modules required by Movable Type could not be found.' => 'No se encontraron uno o varios módulos de Perl necesarios.', # Translate - No russian chars
	'The following Perl modules are required for Movable Type to run properly. Once you have met these requirements, click the \'Retry\' button to re-test for these packages.' => 'Los siguientes módulos de Perl son necesarios para que Movable Type se ejecute correctamente. Una vez los haya instalado, haga clic en el botón \'Reintentar\' para realizar la comprobación nuevamente.', # Translate - No russian chars
	'Some optional Perl modules could not be found. You may continue without installing these optional Perl modules. They may be installed at any time if they are needed. Click \'Retry\' to test for the modules again.' => 'No se encontraron algunos módulos opcionales de Perl. Puede continuar sin instalarlos. Podrá instalarlos cuando le sean necesarios. Haga clic en \'Reintentar\' para comprobar los módulos otra vez.', # Translate - No russian chars
	'Missing Database Modules' => 'Módulos de base de datos no encontrados', # Translate - No russian chars
	'Missing Optional Modules' => 'Módulos opcionales no encontrados', # Translate - No russian chars
	'Missing Required Modules' => 'Módulos necesarios no encontrados', # Translate - No russian chars
	'Minimal version requirement: [_1]' => 'Versión mínima requerida: [_1]', # Translate - No russian chars
	'Learn more about installing Perl modules.' => 'Más información sobre la instalación de módulos de Perl.', # Translate - No russian chars
	'Your server has all of the required modules installed; you do not need to perform any additional module installations.' => 'El servidor tiene instalados todos los módulos necesarios; no necesita realizar ninguna instalación adicional.', # Translate - No russian chars
	'Back' => 'Вернуться',
	'Retry' => 'Reintentar', # Translate - No russian chars

## tmpl/wizard/optional.tmpl
	'Mail Configuration' => 'Configuración del correo electrónico', # Translate - No russian chars
	'Your mail configuration is complete.' => 'Se ha completado la configuración del correo.', # Translate - No russian chars
	'Check your email to confirm receipt of a test email from Movable Type and then proceed to the next step.' => 'Compruebe su correo para confirmar la recepción del mensaje de prueba de Movable Type y luego continúe con el paso siguiente.', # Translate - No russian chars
	'Show current mail settings' => 'Mostrar configuración actual del correo', # Translate - No russian chars
	'Periodically Movable Type will send email to inform users of new comments as well as other other events. For these emails to be sent properly, you must instruct Movable Type how to send email.' => 'Periódicamente, Movable Type enviará un correo para informar a los usuarios sobre los nuevos comentarios y otros eventos. Para que estos correos se envíen correctamente, debe decirle a Movable Type cómo enviarlos.', # Translate - No russian chars
	'An error occurred while attempting to send mail: ' => 'Ocurrió un error intentando enviar un mensaje de correo electrónico: ', # Translate - No russian chars
	'Send email via:' => 'Enviar correo vía:', # Translate - No russian chars
	'Select One...' => 'Выберити один...',
	'sendmail Path' => 'Ruta de sendmail', # Translate - No russian chars
	'The physical file path for your sendmail binary.' => 'Ruta física del fichero binario de sendmail.', # Translate - No russian chars
	'Outbound Mail Server (SMTP)' => 'Servidor de correo saliente (SMTP)', # Translate - No russian chars
	'Address of your SMTP Server.' => 'Dirección del servidor SMTP.', # Translate - No russian chars
	'Mail address for test sending' => 'Dirección de correo electrónico para comprobación de envío', # Translate - No russian chars
	'Send Test Email' => 'Enviar mensaje de comprobación', # Translate - No russian chars

## tmpl/wizard/cfg_dir.tmpl
	'Temporary Directory Configuration' => 'Configuración del directorio temporal', # Translate - No russian chars
	'You should configure you temporary directory settings.' => 'Debe configurar las opciones del directorio temporal.', # Translate - No russian chars
	'Your TempDir has been successfully configured. Click \'Continue\' below to continue configuration.' => 'TempDir se ha configurado con éxito. Para continuar con la configuración, haga clic a \'Continuar\' abajo.', # Translate - No russian chars
	'[_1] could not be found.' => '[_1] no pudo encontrarse.', # Translate - No russian chars
	'TempDir is required.' => 'TempDir es necesario.', # Translate - No russian chars
	'TempDir' => 'TempDir', # Translate - Not translated
	'The physical path for temporary directory.' => 'La ruta al directorio temporal.', # Translate - No russian chars
	'Test' => 'Test', # Translate - Not translated

## tmpl/wizard/complete.tmpl
	'Configuration File' => 'Archivo de configuración', # Translate - No russian chars
	'The [_1] configuration file can\'t be located.' => 'El archivo de configuración [_1] no puede ser localizado', # Translate - No russian chars
	'Please use the configuration text below to create a file named \'mt-config.cgi\' in the root directory of [_1] (the same directory in which mt.cgi is found).' => 'Utilice por favor el texto de la configuración abajo para crear un archivo nombrado \'mt-config.cgi\' en la raíz del directorio de [_1] (el mismo directorio en el cual se encuentra mt.cgi).', # Translate - No russian chars
	'The wizard was unable to save the [_1] configuration file.' => 'El asistente de instalación no ha podido guardar el [_1] archivo de configuración.', # Translate - No russian chars
	'Confirm your [_1] home directory (the directory that contains mt.cgi) is writable by your web server and then click \'Retry\'.' => 'Confirme su [_1] directorio de inicio (el directorio que contiene mt.cgi) es posible de escribir su web server y de hacer clic \'Comprobación\'.', # Translate - No russian chars
	'Congratulations! You\'ve successfully configured [_1].' => '¡Felicidades! Ha configurado con éxito [_1].', # Translate - No russian chars
	'Your configuration settings have been written to the following file:' => 'Sus parámetros de configuración han sido escritos en los siguientes archivos:', # Translate - No russian chars
	'To reconfigure the settings, click the \'Back\' button below.' => 'Para reconfigurar sus parámetros, haga clic en el botón \'Volver\' aquí abajo.', # Translate - No russian chars
	'Show the mt-config.cgi file generated by the wizard' => 'Mostrar el archivo mt-config.cgi generado por el asistente de instalación', # Translate - No russian chars
	'I will create the mt-config.cgi file manually.' => 'Recrearé de nuevo el fichero mt-config.cgi manualmente.', # Translate - No russian chars

## tmpl/wizard/blog.tmpl
	'Setup Your First Blog' => 'Configure su primer blog', # Translate - No russian chars
	'In order to properly publish your blog, you must provide Movable Type with your blog\'s URL and the path on the filesystem where its files should be published.' => 'Para publicar correctamente el blog, debe proveer a Movable Type la URL del blog y la ruta en el sistema donde se publicarán sus ficheros.', # Translate - No russian chars
	'My First Blog' => 'Mi primer blog', # Translate - No russian chars
	'Publishing Path' => 'Ruta de publicación', # Translate - No russian chars
	'Your \'Publishing Path\' is the path on your web server\'s file system where Movable Type will publish all the files for your blog. Your web server must have write access to this directory.' => 'La \'Ruta de publicación\' es la ruta en el sistema de archivos del servidor donde Movable Type publicará todos los ficheros del blog. El servidor web debe poder escribir en este directorio.', # Translate - No russian chars

## tmpl/wizard/configure.tmpl
	'Database Configuration' => 'Configuración de la base de datos', # Translate - No russian chars
	'You must set your Database Path.' => 'Debe definir la ruta de la base de datos.', # Translate - No russian chars
	'You must set your Database Name.' => 'Debe introducir el nombre de la base de datos.', # Translate - No russian chars
	'You must set your Username.' => 'Debe introducir el nombre del usuario.', # Translate - No russian chars
	'You must set your Database Server.' => 'Debe introducir el servidor de base de datos.', # Translate - No russian chars
	'Your database configuration is complete.' => 'Se ha completado la configuración de la base de datos.', # Translate - No russian chars
	'You may proceed to the next step.' => 'Puede continuar con el siguiente paso.', # Translate - No russian chars
	'Please enter the parameters necessary for connecting to your database.' => 'Por favor, introduzca los parámetros necesarios para la conexión con la base de datos.', # Translate - No russian chars
	'Show Current Settings' => 'Mostrar configuración actual', # Translate - No russian chars
	'Database Type' => 'Tipo de base de datos', # Translate - No russian chars
	'If your database type is not listed in the menu above, then you need to <a target="help" href="[_1]">install the Perl module necessary to connect to your database</a>.  If this is the case, please check your installation and <a href="javascript:void(0)" onclick="[_2]">re-test your installation</a>.' => 'Si su tipo de base de datos no está listada en el menú de abajo, entonces deberá <a target="help" href="[_1]">instalar los módulos de Perl necesarios para la conexión con la base de datos</a>.  Si este es el caso, por favor, compruebe su instalación y <a href="javascript:void(0)" onclick="[_2]">compruebe de nuevo su instalación</a>.', # Translate - No russian chars
	'Database Path' => 'Ruta de la base de datos', # Translate - No russian chars
	'The physical file path for your SQLite database. ' => 'La ruta física del fichero de la base de datos SQLite.', # Translate - No russian chars
	'A default location of \'./db/mt.db\' will store the database file underneath your Movable Type directory.' => 'La base de datos se guarda por defecto en \'./db/mt.db\' bajo el directorio de Movable Type.', # Translate - No russian chars
	'Database Server' => 'Servidor de base de datos', # Translate - No russian chars
	'This is usually \'localhost\'.' => 'Generalmente es \'localhost\'.', # Translate - No russian chars
	'Database Name' => 'Nombre de la base de datos', # Translate - No russian chars
	'The name of your SQL database (this database must already exist).' => 'El nombre de su base de datos SQL (esta base de datos debe existir).', # Translate - No russian chars
	'The username to login to your SQL database.' => 'El nombre de usuario para acceder a la base de datos SQL.', # Translate - No russian chars
	'Password' => 'Пароль',
	'The password to login to your SQL database.' => 'La contraseña para acceder a la base de datos SQL.', # Translate - No russian chars
	'Show Advanced Configuration Options' => 'Mostrar opciones de configuración avanzadas', # Translate - No russian chars
	'Database Port' => 'Puerto de la base de datos', # Translate - No russian chars
	'This can usually be left blank.' => 'Generalmente puede dejarse en blanco.', # Translate - No russian chars
	'Database Socket' => 'Socket de la base de datos', # Translate - No russian chars
	'Publish Charset' => 'Código de caracteres', # Translate - No russian chars
	'MS SQL Server driver must use either Shift_JIS or ISO-8859-1.  MS SQL Server driver does not support UTF-8 or any other character set.' => 'El controlador de MS SQL Server debe usar Shift_JIS o ISO-8859-1. El controlador de MS SQL Server no soporta ni UTF-8 ni ningún otro código de caracteres.', # Translate - No russian chars
	'Test Connection' => 'Probar la Conexión', # Translate - No russian chars

## tmpl/error.tmpl
	'Missing Configuration File' => 'Fichero de configuración no encontrado', # Translate - No russian chars
	'_ERROR_CONFIG_FILE' => 'El fichero de configuración de Your Movable Type no existe o no se puede leer correctamente. Por favor, consulte la sección <a href="javascript:void(0)">Instalación y configuración</a> del manual de Movable Type manual para más información.', # Translate - No russian chars
	'Database Connection Error' => 'Error de conexión a la base de datos', # Translate - No russian chars
	'_ERROR_DATABASE_CONNECTION' => 'Las opciones de configuración de su base de datos o son incorrectas o no están presentes en el fichero de configuración de Movable Type. Por favor, consulte la sección <a href="javascript:void(0)">Instalación y configuración</a> del manual de Movable Type para más información', # Translate - No russian chars
	'CGI Path Configuration Required' => 'Se necesita la configuración de la ruta de CGI', # Translate - No russian chars
	'_ERROR_CGI_PATH' => 'La opción de configuración CGIPath no es válida o no se encuentra en el fichero de configuración de Movable Type. Por favor, consulte la sección <a href="javascript:void(0)">Instalación y configuración</a> del manual de Movable Type manual para más información.', # Translate - No russian chars
	'An error occurred' => 'Произошла ошибка',

## tmpl/cms/list_asset.tmpl
	'You have successfully deleted the asset(s).' => 'Se borraron con éxito los ficheros multimedia seleccionados.', # Translate - No russian chars
	'Quickfilters' => 'Быстрые фильтры',
	'Showing only: [_1]' => 'Показ ограничен: [_1]',
	'Remove filter' => 'Удалить фильтр',
	'All [_1]' => 'Все [_1]',
	'change' => 'изменить',
	'[_1] where [_2] is [_3]' => '[_1] где [_2] [_3]',
	'Show only assets where' => 'Mostrar solo los ficheros multimedia donde', # Translate - No russian chars
	'type' => 'tipo', # Translate - No russian chars
	'tag (exact match)' => 'метка (точное совпадение)',
	'tag (fuzzy match)' => 'метка (неточное совпадение)',
	'is' => 'есть',
	'Filter' => 'Фильтр',

## tmpl/cms/edit_role.tmpl
	'Edit Role' => 'Изменить роль',
	'Your changes have been saved.' => 'Изменения были сохранены.',
	'List Roles' => 'Listar roles', # Translate - No russian chars
	'[quant,_1,User,Users] with this role' => '[quant,_1,Пользователей,Пользователя,Пользователей] с данной ролью',
	'You have changed the privileges for this role. This will alter what it is that the users associated with this role will be able to do. If you prefer, you can save this role with a different name.  Otherwise, be aware of any changes to users with this role.' => 'Ha cambiado los provilegios de este rol.  Esto va cambiar las posibilidades de maniobra de los usuarios asociados a este rol. Si usted prefiere, puede guardar este rol con otro nombre diferente.', # Translate - No russian chars
	'Role Details' => 'Detalles de los roles', # Translate - No russian chars
	'Created by' => 'Creado por', # Translate - No russian chars
	'Privileges' => 'Privilegios', # Translate - No russian chars
	'Check All' => 'Seleccionar todos', # Translate - No russian chars
	'Uncheck All' => 'Deseleccionar todos', # Translate - No russian chars
	'Administration' => 'Administración', # Translate - No russian chars
	'Authoring and Publishing' => 'Creación y publicación', # Translate - No russian chars
	'Designing' => 'Diseño', # Translate - No russian chars
	'Commenting' => 'Comentar', # Translate - No russian chars
	'Duplicate Roles' => 'Duplicar roles', # Translate - No russian chars
	'These roles have the same privileges as this role' => 'Estos roles tienen privilegios parecidos a este rol', # Translate - No russian chars
	'Save changes to this role (s)' => 'Сохранить изменения этой роли (s)',
	'Save Changes' => 'Сохранить изменения',

## tmpl/cms/recover_password_result.tmpl
	'Recover Passwords' => 'Recuperar contraseñas', # Translate - No russian chars
	'No users were selected to process.' => 'No se seleccionaron usarios a procesar.', # Translate - No russian chars
	'Return' => 'Вернуться',

## tmpl/cms/edit_commenter.tmpl
	'The commenter has been trusted.' => 'El comentarista ahora es de confianza.', # Translate - No russian chars
	'The commenter has been banned.' => 'Se bloqueó al comentarista.', # Translate - No russian chars
	'Useful links' => 'Полезные ссылки',
	'Comments from [_1]' => 'Комментарии от [_1]',
	'commenter' => 'комментатор',
	'commenters' => 'комментаторы',
	'to act upon' => 'выполнить на',
	'Trust user (t)' => 'Доверять пользователю (t)',
	'Trust' => 'Доверять',
	'Untrust user (t)' => 'Недоверять пользователю (t)',
	'Untrust' => 'Недоверять',
	'Ban user (b)' => 'Заблокировать пользователя (b)',
	'Ban' => 'Заблокировать',
	'Unban user (b)' => 'Разблокировать пользователя (b)',
	'Unban' => 'Разблокировать',
	'The Name of the commenter' => 'El nombre del comentarista', # Translate - No russian chars
	'View all comments with this name' => 'Mostrar todos los comentarios con este nombre', # Translate - No russian chars
	'Identity' => 'Identidad', # Translate - No russian chars
	'The Identity of the commenter' => 'La identidad del comentarista', # Translate - No russian chars
	'Email' => 'Correo electrónico', # Translate - No russian chars
	'The Email of the commenter' => 'La dirección de correo del comentarista', # Translate - No russian chars
	'Withheld' => 'Retener', # Translate - No russian chars
	'View all comments with this email address' => 'Ver todos los comentarios de esta dirección de correo-e', # Translate - No russian chars
	'The URL of the commenter' => 'La URL del comentarista', # Translate - No russian chars
	'View all comments with this URL address' => 'Ver todos los comentarios con esta URL', # Translate - No russian chars
	'Status' => 'Статус',
	'The trusted status of the commenter' => 'El estado de la confianza en el comentarista', # Translate - No russian chars
	'Trusted' => 'De confianza', # Translate - No russian chars
	'Banned' => 'Заблокированный',
	'Authenticated' => 'Autentificado', # Translate - No russian chars
	'View all commenters' => 'Ver todos los comentaristas', # Translate - No russian chars

## tmpl/cms/preview_entry.tmpl
	'Preview [_1]' => 'Просмотр [_1]',
	'Re-Edit this [_1]' => 'Редактировать эту [_1]',
	'Re-Edit this [_1] (e)' => 'Редактировать эту [_1] (e)',
	'Save this [_1]' => 'Сохранить этот [_1]',
	'Save this [_1] (s)' => 'Сохранить этот [_1] (s)',
	'Cancel (c)' => 'Отмена (c)',

## tmpl/cms/cfg_system_general.tmpl
	'System: General Settings' => 'Системы: Базовые установки',
	'Your settings have been saved.' => 'Установки сохранены.',
	'(No blog selected)' => '(блог не выбран)',
	'Select blog' => 'Выберите блог',
	'You must set a valid Default Site URL.' => 'Вы должны указать URL для сайта по умолчанию.',
	'You must set a valid Default Site Root.' => 'Вы должны указать путь для сайта по умолчанию.',
	'System Email' => 'Системный email',
	'The email address used in the From: header of each email sent from the system.  The address is used in password recovery, commenter registration, comment, trackback notification and a few other minor events.' => 'Этот адрес эл. почты используется в заголовке From: каждого сообщения посылаемого системой. Этот адрес используется для восстановления пароля, регистрации комментаторов, комментариев, уведомлений о трэкбэков и нескольких других событий.',
	'Save changes to these settings (s)' => 'Сохранить изменения данных настроек (s)',

## tmpl/cms/view_log.tmpl
	'The activity log has been reset.' => 'История действий была очищена.',
	'All times are displayed in GMT[_1].' => 'Время показано как GMT[_1].',
	'All times are displayed in GMT.' => 'Время показано как GMT.',
	'Show only errors' => 'Показывать только ошибки',
	'System Activity Log' => 'Системная история действий',
	'Filtered' => 'Отфильтровано',
	'Filtered Activity Feed' => 'Feed отфильтрованой истории действий',
	'Download Filtered Log (CSV)' => 'Скачать отфильтрованую историю (CSV)',
	'Download Log (CSV)' => 'Скачать историю (CSV)',
	'Clear Activity Log' => 'Очистить историю действий',
	'Are you sure you want to reset the activity log?' => 'Вы уверены что хотите очистить историю действий?',
	'Showing all log records' => 'Показаны все записи',
	'Showing log records where' => 'Показаны записи где',
	'Reset' => 'Сбросить',
	'Show log records where' => 'Показывать только записи где',
	'level' => 'уровень',
	'classification' => 'классификация',
	'Security' => 'Безопаснось',
	'Error' => 'Ошибка',
	'Information' => 'Информация',
	'Debug' => 'Отладка',
	'Security or error' => 'Безопасность/Ошибка',
	'Security/error/warning' => 'Безопасность/ошибка/предупреждение',
	'Not debug' => 'Без отладки',
	'Debug/error' => 'Отладка/ошибка',

## tmpl/cms/edit_template.tmpl
	'Create Template' => 'Создать шаблон',
	'A saved version of this [_1] was auto-saved [_3]. <a href="[_2]">Recover auto-saved content</a>' => 'Версия этого [_1] была сохранена [_3]. <a href="[_2]">Восстановить автосохраненное содержание</a>',
	'You have successfully recovered your saved [_1].' => 'Recuperó con éxito la versión guardada de [_1].', # Translate - No russian chars
	'An error occurred while trying to recover your saved [_1].' => 'Ocurrió un error intentando recuperar la versión guardada de [_1].', # Translate - No russian chars
	'Your template changes have been saved.' => 'Ваши изменения шаблона были сохранены.',
	'<a href="[_1]" class="rebuild-link">Publish</a> this template.' => '<a href="[_1]" class="rebuild-link">Опубликовать</a> этот шаблон.',
	'Your [_1] has been published.' => 'Ваша [_1] была опубликована.',
	'Useful Links' => 'Полезные ссылки',
	'_external_link_target' => '_new', # Translate - No russian chars
	'View Published Template' => 'Посмотреть опубликованный шаблон',
	'List [_1] templates' => 'Список шаблонов [_1]',
	'Template tag reference' => 'Referencia de las etiquetas de plantillas', # Translate - No russian chars
	'Includes and Widgets' => 'Шаблоны и Виджеты ',
	'create' => 'создать',
	'Tag Documentation' => 'Документация по тэгам',
	'Unrecognized Tags' => 'Неопознанные тэги',
	'Save (s)' => 'Сохранить (s)',
	'Save' => 'Сохранить',
	'Save and Publish this template (r)' => 'Сохранить и опубликовать этот шаблон (r)',
	'Save &amp; Publish' => 'Сохранить и Опубликовать',
	'You have unsaved changes to this template that will be lost.' => 'Ваши несохраненные изменения шаблона будут потеряны.',
	'You must set the Template Name.' => 'Необходимо указать имя шаблона.',
	'You must set the template Output File.' => 'Необходимо указать имя файла для шаблона.',
	'Please wait...' => 'Пожалуйста ждите...',
	'Error occurred while updating archive maps.' => 'Во время обновления карт шаблонов произошла ошибка.',
	'Archive map has been successfully updated.' => 'Карта архивов была успешно обновлена.',
	'Are you sure you want to remove this template map?' => 'Вы уверены что хотите удалить карту архивов?',
	'Module Body' => 'Тело модуля',
	'Template Body' => 'Тело шаблона',
	'Syntax Highlight On' => 'Подсветка синтаксиса включена.',
	'Syntax Highlight Off' => 'Подсветка синтаксиса выключена.',
	'Insert...' => 'Вставить...',
	'Template Type' => 'Тип шаблонов',
	'Custom Index Template' => 'Plantilla índice personalizada', # Translate - No russian chars
	'Output File' => 'Имя файла',
	'Publish Options' => 'Настройки публикации',
	'Enable dynamic publishing for this template' => 'Activar la publicación dinámica de esta plantilla', # Translate - No russian chars
	'Publish this template automatically when rebuilding index templates' => 'Публиковать этот шаблон автоматически при перегенерации индексных шаблонов',
	'Link to File' => 'Ссылка на файл',
	'Create Archive Mapping' => 'Создать Archive Mapping',
	'Type' => 'Тип',
	'Add' => 'Добавить',
	'Auto-saving...' => 'Авто-сохранение...',
	'Last auto-save at [_1]:[_2]:[_3]' => 'Последний раз сохранено в [_1]:[_2]:[_3]',

## tmpl/cms/list_association.tmpl
	'Members' => 'участники',
	'permission' => 'права',
	'permissions' => 'права',
	'Remove selected permissions (x)' => 'Удалить выбранные права (x)',
	'Revoke Permission' => 'Лишить прав',
	'[_1] <em>[_2]</em> is currently disabled.' => '[_1] <em>[_2]</em> в текущий момент отключено',
	'Grant Permission' => 'Дать права',
	'You can not create permissions for disabled users.' => 'Вы не можете давать права отключеным пользователям',
	'Assign Role to User' => 'Назначить пользователю роль',
	'Add a user to this blog' => 'Добавить пользователя в этот блог',
	'Grant permission to a user' => 'Дать пользователю права',
	'You have successfully revoked the given permission(s).' => 'Вы успешно сняли права.',
	'You have successfully granted the given permission(s).' => 'Вы успешно дали права.',
	'No permissions could be found.' => 'Не найдено никаких прав.',
	'Created By' => 'Автор',
	'Created On' => 'Дата создания',

## tmpl/cms/edit_asset.tmpl
	'Edit Asset' => 'Изменить файл',
	'Your asset changes have been made.' => 'Ваши изменения применены.',
	'Stats' => 'Статистика',
	'[_1] - Created by [_2]' => 'Создано [_1] [_2]',
	'[_1] - Modified by [_2]' => '[_1] - Изменен [_2]',
	'Appears in...' => 'Используеться в ...',
	'Published on [_1]' => 'Опубликовано на [_1]',
	'Show all entries' => 'Показать все записи',
	'Show all pages' => 'Показать все страницы',
	'This asset has not been used.' => 'Этот медиа-ресурс нигде не используется.',
	'Related Assets' => 'Связанные медиа-ресурсы',
	'No thumbnail image' => 'Нет миниатюры',
	'You must specify a label for the asset.' => 'Вы должны указать метку для данного медиа-ресурса.',
	'Previous' => 'Предыдущая',
	'Next' => 'Следующая',
	'[_1] is missing' => '[_1] отсутствует',
	'View Asset' => 'Просмотреть медиа-ресурс',
	'Embed Asset' => 'Вставить медиа-ресурс',
	'Save changes to this asset (s)' => 'Сохранить изменения данного медиа-ресурса (s)',

## tmpl/cms/list_comment.tmpl
	'Manage Comments' => 'Управление комментариями',
	'The selected comment(s) has been approved.' => 'Выбранные комментарии были одобрены.',
	'All comments reported as spam have been removed.' => 'Se ha borrado los comentarios marcados como spam.', # Translate - No russian chars
	'The selected comment(s) has been unapproved.' => 'Se ha desaprobado los comentarios seleccionados.', # Translate - No russian chars
	'The selected comment(s) has been reported as spam.' => 'Se ha marcado como spam los comentarios seleccionados.', # Translate - No russian chars
	'The selected comment(s) has been recovered from spam.' => 'Se ha recuperado del spam los comentarios seleccionados.', # Translate - No russian chars
	'The selected comment(s) has been deleted from the database.' => 'Los comentarios seleccionados fueron eliminados de la base de datos.', # Translate - No russian chars
	'One or more comments you selected were submitted by an unauthenticated commenter. These commenters cannot be Banned or Trusted.' => 'Uno o más comentarios de los que seleccionó fueron enviados por un comentarista no autentificado. No se puede bloquear o dar confianza a estos comentaristas.', # Translate - No russian chars
	'No comments appeared to be spam.' => 'Нет комментариев похожих на спам.',
	'[_1] (Disabled)' => '[_1] (Отключено)',
	'Set Web Services Password' => 'Установить пароль для Веб-Сервисов',
	'[_1] on entries created within the last [_2] days' => '[_1] en entradas creadas en los últimos [_2] días', # Translate - No russian chars
	'[_1] on entries created more than [_2] days ago' => '[_1] en entradas creadas hace más de [_2] días', # Translate - No russian chars
	'[_1] where [_2] [_3]' => '[_1] где [_2] [_3]',

## tmpl/cms/cfg_entry.tmpl
	'Entry Settings' => 'Настройки записи',
	'Your preferences have been saved.' => 'Ваши настройки были сохранены.',
	'Display Settings' => 'Настройки отображения',
	'Entry Listing Default' => 'Список записей по умолчанию',
	'Select the number of days of entries or the exact number of entries you would like displayed on your blog.' => 'Seleccione el número de días de entradas o el número exacto de entradas que desea mostrar en el blog.', # Translate - No russian chars
	'Days' => 'Дней',
	'Entry Order' => 'Порядок записей',
	'Select whether you want your entries displayed in ascending (oldest at top) or descending (newest at top) order.' => 'Seleccione si quiere mostrar las entradas en orden ascendente (antiguas primero) o descendente (recientes primero).', # Translate - No russian chars
	'Ascending' => 'Возрастающий',
	'Descending' => 'Убывающий',
	'Excerpt Length' => 'Длина выжимки',
	'Enter the number of words that should appear in an auto-generated excerpt.' => 'Teclee el número de palabras que desea mostrar en el resumen autogenerado.', # Translate - No russian chars
	'Date Language' => 'Язык дат',
	'Select the language in which you would like dates on your blog displayed.' => 'Seleccione el idioma en el que desea que se visualicen las fechas en su weblog.', # Translate - No russian chars
	'Czech' => 'Чешский',
	'Danish' => 'Датский',
	'Dutch' => 'Голландский',
	'English' => 'Английский',
	'Estonian' => 'Эстонский',
	'French' => 'Французский',
	'German' => 'Немецкий',
	'Icelandic' => 'Исландский',
	'Italian' => 'Итальянский',
	'Japanese' => 'Японский',
	'Norwegian' => 'Норвежский',
	'Polish' => 'Польский',
	'Portuguese' => 'Португальский',
	'Russian' => 'Русский',
	'Slovak' => 'Словацкий',
	'Slovenian' => 'Словенский',
	'Spanish' => 'Испанский',
	'Suomi' => 'Финский',
	'Swedish' => 'Шведский',
	'Basename Length' => 'Длина базового имени',
	'Specifies the default length of an auto-generated basename. The range for this setting is 15 to 250.' => 'Especifique la longitud predefinida de los nombres base autogenerados. El rango para esta opción es de entre 15 y 250.', # Translate - No russian chars
	'New Entry Defaults' => 'Умолчания для новой записи',
	'Specifies the default Entry Status when creating a new entry.' => 'Especifica el estado predefinido de las nuevas entradas.', # Translate - No russian chars
	'Unpublished' => 'Не опубликовано',
	'Published' => 'Опубликовано',
	'Text Formatting' => 'Формат текста',
	'Specifies the default Text Formatting option when creating a new entry.' => 'Especifica el formato de texto predeterminado para las entradas nuevas.', # Translate - No russian chars
	'Accept Comments' => 'Принимать комментарии',
	'Specifies the default Accept Comments setting when creating a new entry.' => 'Indica el valor predefinido para la opción Aceptar comentarios al crear nuevas entradas.', # Translate - No russian chars
	'Setting Ignored' => 'Настройка проигнорирована',
	'Note: This option is currently ignored since comments are disabled either blog or system-wide.' => 'Nota: Actualmente, se ignora esta opción ya que los comentarios están desactivados en el blog o en todo el sistema.', # Translate - No russian chars
	'Accept TrackBacks' => 'Принимать Трэкбэки',
	'Specifies the default Accept TrackBacks setting when creating a new entry.' => 'Indica el valor predefinido de la opción Aceptar TrackBacks al crear nuevas entradas.', # Translate - No russian chars
	'Note: This option is currently ignored since TrackBacks are disabled either blog or system-wide.' => 'Nota: Actualmente, se ignora esta opción ya que los TrackBacks están desactivados en el blog o en todo el sistema.', # Translate - No russian chars
	'Replace Word Chars' => 'Заменять символы в словах',
	'Smart Replace' => 'Хитрая замена',
	'Replace UTF-8 characters frequently used by word processors with their more common web equivalents.' => 'Заменить UTF-8 символы более распространненными веб аналогами.',
	'No substitution' => 'Без подстановки',
	'Character entities (&amp#8221;, &amp#8220;, etc.)' => 'Спецсимволы (&amp#8221;, &amp#8220;, etc.)', 
	'ASCII equivalents (&quot;, \', ..., -, --)' => 'ASCII-эквивалент (&quot;, \', ..., -, --)',
	'Replace Fields' => 'Заменять в полях',
	'Extended entry' => 'Расширенная запись',
	'Default Editor Fields' => 'Поля редактора по умолчанию',
	'Editor Fields' => 'Поля редактора',
	'_USAGE_ENTRYPREFS' => 'Seleccione el conjunto de campos que se mostrarán en el editor de entradas.', # Translate - No russian chars
	'Body' => 'Тело',
	'Action Bars' => 'Панели инструментов',
	'Select the location of the entry editor&rsquo;s action bar.' => 'Seleccione la posición de la barra de acciones del editor de entradas.', # Translate - No russian chars
	'Top' => 'Вверху',
	'Both' => 'Вверху и внизу',
	'Bottom' => 'Внизу',

## tmpl/cms/edit_ping.tmpl
	'Edit Trackback' => 'Изменить Трэкбэк',
	'The TrackBack has been approved.' => 'Se aprobó el TrackBack.', # Translate - No russian chars
	'List &amp; Edit TrackBacks' => 'Listar &amp; editar TrackBacks', # Translate - No russian chars
	'View Entry' => 'Просмотреть запись',
	'Save changes to this TrackBack (s)' => 'Guardar cambios de este TrackBack (s)', # Translate - No russian chars
	'Delete this TrackBack (x)' => 'Borrar este TrackBack (x)', # Translate - No russian chars
	'Ban This IP' => 'Заблокировать данный IP адрес',
	'Update the status of this TrackBack' => 'Actualizar el estado del TrackBack', # Translate - No russian chars
	'Approved' => 'Autorizado', # Translate - No russian chars
	'Unapproved' => 'No aprobado', # Translate - No russian chars
	'Reported as Spam' => 'Marcado como spam', # Translate - No russian chars
	'Junk' => 'Мусор',
	'View all TrackBacks with this status' => 'Ver TrackBacks con este estado', # Translate - No russian chars
	'Spam Details' => 'Detalles de spam', # Translate - No russian chars
	'Total Feedback Rating: [_1]' => 'Puntuación total de respuestas: [_1]', # Translate - No russian chars
	'Score' => 'Puntuación', # Translate - No russian chars
	'Results' => 'Resultados', # Translate - No russian chars
	'Source Site' => 'Sitio de origen', # Translate - No russian chars
	'Search for other TrackBacks from this site' => 'Buscar otros TrackBacks en este sitio', # Translate - No russian chars
	'Source Title' => 'Título de origen', # Translate - No russian chars
	'Search for other TrackBacks with this title' => 'Buscar otros TrackBacks con este título', # Translate - No russian chars
	'Search for other TrackBacks with this status' => 'Buscar otros TrackBacks con este estado', # Translate - No russian chars
	'Target Entry' => 'Entrada destinataria', # Translate - No russian chars
	'Entry no longer exists' => 'La entrada ya no existe.', # Translate - No russian chars
	'No title' => 'Sin título', # Translate - No russian chars
	'View all TrackBacks on this entry' => 'Mostrar todos los TrackBacks de esta entrada', # Translate - No russian chars
	'Target Category' => 'Categoría de destinación ', # Translate - No russian chars
	'Category no longer exists' => 'Ya no existe la categoría', # Translate - No russian chars
	'View all TrackBacks on this category' => 'Mostrar todos los TrackBacks de esta categoría', # Translate - No russian chars
	'Date' => 'Дата',
	'View all TrackBacks created on this day' => 'Mostrar todos los TrackBacks creados este día', # Translate - No russian chars
	'IP' => 'IP', # Translate - Not translated
	'View all TrackBacks from this IP address' => 'Mostrar todos los TrackBacks enviados desde esta dirección IP', # Translate - No russian chars
	'TrackBack Text' => 'Texto del TrackBack', # Translate - No russian chars
	'Excerpt of the TrackBack entry' => 'Resumen de la entrada del TrackBack', # Translate - No russian chars

## tmpl/cms/edit_category.tmpl
	'Edit Category' => 'Изменить тему',
	'Your category changes have been made.' => 'Ваши изменения темы были сохранены.',
	'You must specify a label for the category.' => 'Debe especificar un título para la categoría.', # Translate - No russian chars
	'_CATEGORY_BASENAME' => 'Базовое имя',
	'This is the basename assigned to your category.' => 'El nombre base asignado a la categoría.', # Translate - No russian chars
	'Unlock this category&rsquo;s output filename for editing' => 'Desbloquear el nombre del fichero de saluda de la categoría para su edición', # Translate - No russian chars
	'Warning: Changing this category\'s basename may break inbound links.' => 'Предупреждение: Изменение базового имени темы может сломать входящие ссылки.',
	'Inbound TrackBacks' => 'Входяшие Трэкбэки',
	'Accept Trackbacks' => 'Принимать Трэкбэки',
	'If enabled, TrackBacks will be accepted for this category from any source.' => 'Si se habilita, en esta categoría se aceptarán los TrackBacks de cualquier fuente.', # Translate - No russian chars
	'View TrackBacks' => 'Посмотреть Трэкбэки',
	'TrackBack URL for this category' => 'URL de TrackBack para esta categoría', # Translate - No russian chars
	'_USAGE_CATEGORY_PING_URL' => 'Esta es la URL que usuarán otros para enviar TrackBacks a su weblog. Si desea que cualquiera envíe TrackBacks a su weblog cuando escriban una entrada sobre esta categoría, haga pública esta URL. Si desea que sólo un grupo selecto de personas le hagan TrackBack, envíeles la URL de forma privada. Para incluir una lista de TrackBacks en la plantilla índice principal, compruebe la documentación de las etiquetas de plantilla relacionadas con los TrackBacks.', # Translate - No russian chars
	'Passphrase Protection' => 'Защита паролем',
	'Outbound TrackBacks' => 'Исходящие Трэкбэки',
	'Trackback URLs' => 'URLы Трэкбэков',
	'Enter the URL(s) of the websites that you would like to send a TrackBack to each time you create an entry in this category. (Separate URLs with a carriage return.)' => 'Introduzca las URLs de los webs  a los que quiere enviar un TrackBack cada vez que cree una entrada en esta categoría. (Separe las URLs con un retorno de carro).', # Translate - No russian chars
	'Save changes to this category (s)' => 'Сохранить изменения этой темы (s)',

## tmpl/cms/export.tmpl
	'You must select a blog to export.' => 'Debe seleccionar un blog para la exportación.', # Translate - No russian chars
	'_USAGE_EXPORT_1' => 'Экспортируются записи, комментарии и трэкбэки блога. Экспорт не является <em>полной</em> резервной копией блога.',
	'Blog to Export' => 'Блог для экспортирования',
	'Select a blog for exporting.' => 'Выберите блог для экспорта.',
	'Change blog' => 'Изменить блог',
	'Export Blog (s)' => 'Экспортировать блог (s)',
	'Export Blog' => 'Экспортировать блог',

## tmpl/cms/edit_comment.tmpl
	'The comment has been approved.' => 'Se ha aprobado el comentario.', # Translate - No russian chars
	'Save changes to this comment (s)' => 'Guardar cambios de este comentario (s)', # Translate - No russian chars
	'comment' => 'комментарий',
	'comments' => 'комментарии',
	'Delete this comment (x)' => 'Borrar este comentario (x)', # Translate - No russian chars
	'Previous Comment' => 'Comentario anterior', # Translate - No russian chars
	'Next Comment' => 'Comentario siguiente', # Translate - No russian chars
	'View entry comment was left on' => 'Mostrar la entrada donde se realizó el comentario', # Translate - No russian chars
	'Reply to this comment' => 'Responder al comentario', # Translate - No russian chars
	'Update the status of this comment' => 'Actualizar el estado del comentario', # Translate - No russian chars
	'View all comments with this status' => 'Ver comentarios con este estado', # Translate - No russian chars
	'The name of the person who posted the comment' => 'El nombre de la persona que publicó el comentario', # Translate - No russian chars
	'(Trusted)' => '(De confianza)', # Translate - No russian chars
	'Ban Commenter' => 'Bloquear Comentarista', # Translate - No russian chars
	'Untrust Commenter' => 'Comentarista no fiable', # Translate - No russian chars
	'(Banned)' => '(Bloqueado)', # Translate - No russian chars
	'Trust Commenter' => 'Comentados Fiable', # Translate - No russian chars
	'Unban Commenter' => 'Desbloquear Comentarista', # Translate - No russian chars
	'Pending' => 'Pendiente', # Translate - No russian chars
	'View all comments by this commenter' => 'Ver todos los comentarios de este comentarista', # Translate - No russian chars
	'Email address of commenter' => 'Dirección de correo del comentarista', # Translate - No russian chars
	'None given' => 'No se indicó ninguno', # Translate - No russian chars
	'URL of commenter' => 'URL del comentarista', # Translate - No russian chars
	'Link' => 'Un vínculo', # Translate - No russian chars
	'View all comments with this URL' => 'Ver todos los comentarios con esta URL', # Translate - No russian chars
	'[_1] this comment was made on' => '[_1] este comentario fue hecho en', # Translate - No russian chars
	'[_1] no longer exists' => '[_1] no existe más largo', # Translate - No russian chars
	'View all comments on this [_1]' => 'Ver todos los comentario en este [_1]', # Translate - No russian chars
	'Date this comment was made' => 'Fecha de cuando se hizo el comentario', # Translate - No russian chars
	'View all comments created on this day' => 'Ver todos los comentarios creados este día', # Translate - No russian chars
	'IP Address of the commenter' => 'Dirección IP del comentarista', # Translate - No russian chars
	'View all comments from this IP address' => 'Ver todos los comentarios procedentes de esta dirección IP', # Translate - No russian chars
	'Fulltext of the comment entry' => 'Texto completo de la entrada del comentario', # Translate - No russian chars
	'Responses to this comment' => 'Respuestas al comentario', # Translate - No russian chars

## tmpl/cms/import_others.tmpl
	'Start title HTML (optional)' => 'HTML de comienzo de título (opcional)', # Translate - No russian chars
	'End title HTML (optional)' => 'HTML de final de título (opcional)', # Translate - No russian chars
	'If the software you are importing from does not have title field, you can use this setting to identify a title inside the body of the entry.' => 'Si el software desde el que va a importar no tiene un campo de título, puede usar esta opción para identificar un título dentro del cuerpo de la entrada.', # Translate - No russian chars
	'Default entry status (optional)' => 'Estado predefinido de las entradas (opcional)', # Translate - No russian chars
	'If the software you are importing from does not specify an entry status in its export file, you can set this as the status to use when importing entries.' => 'Si el software desde el que va a importar no especifica un estado para la entrada en su fichero de exportación, puede establecer éste como el estado a utilizar al importar las entradas.', # Translate - No russian chars
	'Select an entry status' => 'Seleccione un estado para las entradas', # Translate - No russian chars

## tmpl/cms/list_notification.tmpl
	'You have added [_1] to your address book.' => 'Ha añadido [_1] a su agenda de direcciones.', # Translate - No russian chars
	'You have successfully deleted the selected contacts from your address book.' => 'Ha borrado con éxito los contactos seleccionados de su agenda.', # Translate - No russian chars
	'Download Address Book (CSV)' => 'Descargar agenda de direcciones (CSV)', # Translate - No russian chars
	'contact' => 'контак',
	'contacts' => 'контакты',
	'Delete selected [_1] (x)' => 'Удалить выбранные [_1] (x)',
	'Create Contact' => 'Создать контакт',
	'Website URL' => 'URL сайта',
	'Add Contact' => 'Добавить контак',

## tmpl/cms/cfg_comments.tmpl
	'Comment Settings' => 'Настройки комментариев',
	'Note: Commenting is currently disabled at the system level.' => 'Примечание: комментарии на данный момент отключены в системе.',
	'Comment authentication is not available because one of the needed modules, MIME::Base64 or LWP::UserAgent is not installed. Talk to your host about getting this module installed.' => 'Авторизация комментариев невозможно поскольку необходимые модули, MIME::Base64 или LWP::UserAgent не установлены. Обратитесь к Вашему хостеру чтобы установить эти модули.',
	'If enabled, comments will be accepted.' => 'Если включено, то комментарии будут приниматься.',
	'Commenting Policy' => 'Политика комментариев',
	'Immediately approve comments from' => 'Разрешить принимать комментарии сразу же',
	'Specify what should happen to comments after submission. Unapproved comments are held for moderation.' => 'Укажите, что должно происходить с комментариями после их отправки. Неодобреные комментарии будут отложены для рассмотрения',
	'No one' => 'Никому',
	'Trusted commenters only' => 'Только доверенным комментаторам',
	'Any authenticated commenters' => 'Любым авторизовавшимся комментаторам',
	'Anyone' => 'Всем',
	'Allow HTML' => 'Разрешить HTML',
	'If enabled, users will be able to enter a limited set of HTML in their comments. If not, all HTML will be stripped out.' => 'Если разрешено, то пользователи смогут использовать ограниченный набор HTML тэгов в их комментариях. В противном случае вся HTML разметка будет отфильтрована.',
	'Limit HTML Tags' => 'Ограничить HTML тэги',
	'Specifies the list of HTML tags allowed by default when cleaning an HTML string (a comment, for example).' => 'Укажите список HTML тэгов разрешенных по умолчанию (например, для комментариев).',
	'Use defaults' => 'Использовать настройки по умолчанию',
	'([_1])' => '([_1])', # Translate - Not translated
	'Use my settings' => 'Использовать мои настройки',
	'Apply \'nofollow\' to URLs' => 'Применить \'nofollow\' к URLам',
	'This preference affects both comments and TrackBacks.' => 'Данная установка применяется и к Трэкбэкам и к комментариям.',
	'If enabled, all URLs in comments and TrackBacks will be assigned a \'nofollow\' link relation.' => 'Если включено, то все ссылки в комментариях и Трэкбэках будут иметь \'nofollow\' аттрибут.',
	'Disable \'nofollow\' for trusted commenters' => 'Отключить \'nofollow\' для доверенных комментаторов.',
	'If enabled, the \'nofollow\' link relation will not be applied to any comments left by trusted commenters.' => 'Если включено, то ссылки оставленые доверенными комментаторами не будут иметь атрибут \'nofollow\'.',
	'E-mail Notification' => 'Уведомления по email',
	'Specify when Movable Type should notify you of new comments if at all.' => 'Укажите, должен ли Movable Type посылать уведомления о новых комментариях.',
	'On' => 'Вкл',
	'Only when attention is required' => 'Только по необходимости',
	'Off' => 'Выкл',
	'Comment Display Options' => 'Настройки отображения комментариев',
	'Comment Order' => 'Порядок комментариев',
	'Select whether you want visitor comments displayed in ascending (oldest at top) or descending (newest at top) order.' => 'Seleccione si desea que los comentarios de visitantes se muestren en orden ascendente (el más antiguo arriba) o descendente (el más reciente arriba).', # Translate - No russian chars
	'Auto-Link URLs' => 'Auto-Link URLs', # Translate - Not translated
	'If enabled, all non-linked URLs will be transformed into links to that URL.' => 'Если включено, то все URL\'ы будут преобразованы в ссылки автоматически.',
	'Specifies the Text Formatting option to use for formatting visitor comments.' => 'Укажите настройки форматирования текста которые будут доступны для текста комментариев.',
	'CAPTCHA Provider' => 'CAPTCHA провайдер',
	'none' => 'нет',
	'No CAPTCHA provider available' => 'Не доступных провайдеровCAPTCHA.',
	'No CAPTCHA provider is available in this system.  Please check to see if Image::Magick is installed, and CaptchaSourceImageBase directive points to captcha-source directory under mt-static/images.' => 'В системе нет доступных CAPTCHA-провайдеров. Проверьте, установлен ли Image::Magick и указывает ли директива CaptchaSourceImageBase в подкаталог для изображений captcha в mt-static/images.',
	'Use Comment Confirmation Page' => 'Использовать страницу подтверждения комментария',
	'Use comment confirmation page' => 'Использовать страницу подтверждения комментария',

## tmpl/cms/restore.tmpl
	'Restore from a Backup' => 'Восстановить из резервной копии',
	'Perl module XML::SAX and/or its dependencies are missing - Movable Type can not restore the system without it.' => 'Модуль Perl XML::SAX и/или его зависимости отсутствуют - Movable Type не сможет восстановить систему без них.',
	'Backup file' => 'Файл резервной копии',
	'If your backup file is located on your computer, you can upload it here.  Otherwise, Movable Type will automatically look in the \'import\' folder of your Movable Type directory.' => 'Si su fichero de copia de seguridad está situado en su PC, puede subirlo desde aquí. Si no, Movable Type comprobará automáticamente la carpeta \'import\' en el directorio de Movable Type.', # Translate - No russian chars
	'Options' => 'Опции',
	'Check this and files backed up from newer versions can be restored to this system.  NOTE: Ignoring Schema Version can damage Movable Type permanently.' => 'Activa esta opción y los ficheros con copias de seguridad de versiones más recientes podrán restaurarse en este sistema. NOTA: Ignorar la versión del esquema puede dañar Movable Type permanentemente.', # Translate - No russian chars
	'Ignore schema version conflicts' => 'Игнорировать конфликты версий схемы',
	'Check this and existing global templates will be overwritten from the backup file.' => 'Переписывать существующие глобальные шаблоны',
	'Overwrite global templates.' => 'Перезаписывать глобальные шаблоны.',
	'Restore (r)' => 'Восстановить (r)',

## tmpl/cms/edit_entry.tmpl
	'Edit Page' => 'Редактировать страницу',
	'Create Page' => 'Создать страницу',
	'Add folder' => 'Добавить папку',
	'Add folder name' => 'Добавить имя папки',
#	'Add new folder parent' => '', # Translate - Empty
	'Save this page (s)' => 'Сохранить эту страницу (s)',
	'Preview this page (v)' => 'Просмотреть эту страницы (v)',
	'Delete this page (x)' => 'Удалить эту страницу (x)',
	'View Page' => 'Просмотреть страницу',
	'Edit Entry' => 'Редактировать запись',
	'Create Entry' => 'Создать запись',
	'Add category' => 'Добавить тему',
	'Add category name' => 'Добавить название темы',
	'Add new category parent' => 'Добавить новый предок темы',
	'Manage Entries' => 'Управление записями',
	'Save this entry (s)' => 'Сохранить эту запись (s)',
	'Preview this entry (v)' => 'Просмотреть эту запись (v)',
	'Delete this entry (x)' => 'Удалить эту запись (x)',
	'A saved version of this entry was auto-saved [_2]. <a href="[_1]">Recover auto-saved content</a>' => 'Копия этой записи была автоматически сохранена [_2]. <a href="[_1]">Восстановить автосохраненное содержание</a>',
	'A saved version of this page was auto-saved [_2]. <a href="[_1]">Recover auto-saved content</a>' => 'Копия этой страницы была автоматически сохранена [_2]. <a href="[_1]">Восстановить автосохраненное содержание</a>',
	'This entry has been saved.' => 'Запись сохранена.',
	'This page has been saved.' => 'Страница сохранена.',
	'One or more errors occurred when sending update pings or TrackBacks.' => 'Ocurrieron uno o más errores durante el envío de pings o TrackBacks.', # Translate - No russian chars
	'_USAGE_VIEW_LOG' => 'Compruebe el error en el <a href="[_1]">Registro de actividad</a>.', # Translate - No russian chars
	'Your customization preferences have been saved, and are visible in the form below.' => 'Se guardaron los cambios en las preferencias y pueden verse en el siguiente formulario.', # Translate - No russian chars
	'Your changes to the comment have been saved.' => 'Se guardaron sus cambios al comentario.', # Translate - No russian chars
	'Your notification has been sent.' => 'Se envió su notificación.', # Translate - No russian chars
	'You have successfully recovered your saved entry.' => 'Ha recuperado con éxito la entrada guardada.', # Translate - No russian chars
	'You have successfully recovered your saved page.' => 'Ha recuperado con éxito la página guardada.', # Translate - No russian chars
	'An error occurred while trying to recover your saved entry.' => 'Ocurrió un error durante la recuperación de la entrada guardada.', # Translate - No russian chars
	'An error occurred while trying to recover your saved page.' => 'Ocurrió un error durante la recuperación de la página guardada.', # Translate - No russian chars
	'You have successfully deleted the checked comment(s).' => 'Eliminó correctamente los comentarios marcados.', # Translate - No russian chars
	'You have successfully deleted the checked TrackBack(s).' => 'Eliminó correctamente los TrackBacks marcados.', # Translate - No russian chars
	'Change Folder' => 'Изменить папку',
	'Unpublished (Draft)' => 'Не опубликовано (Черновик)',
	'Unpublished (Review)' => 'Не опубликовано (Редактирование)',
	'Scheduled' => 'Запланировано',
	'View' => 'Просмотр',
	'Share' => 'Уведомить',
	'<a href="[_2]">[quant,_1,comment,comments]</a>' => '<a href="[_2]">[quant,_1,комментарий,комментария,комментариев]</a>',
	'<a href="[_2]">[quant,_1,trackback,trackbacks]</a>' => '<a href="[_2]">[quant,_1,трэкбэк,трэкбэка,трэкбэков]</a>',
	'You must configure this blog before you can publish this entry.' => 'Вам надо сконфигурировать Ваш блог перед тем как Вы сможете опубликовать эту запись.',
	'You must configure this blog before you can publish this page.' => 'Вам надо сконфигурировать Ваш блог перед тем как Вы сможете опубликовать эту страницу.',
	'[_1] - Published by [_2]' => 'Опубликовано [_1] [_2]',
	'[_1] - Edited by [_2]' => 'Отредактировно [_1] [_2]',
	'Publish On' => 'Опубликовано',
	'Publish Date' => 'Дата публикации',
	'Select entry date' => 'Seleccionar fecha de la entrada', # Translate - No russian chars
	'Unlock this entry&rsquo;s output filename for editing' => 'Разблокировать для редактирования имя файла для данной записи',
	'Warning: If you set the basename manually, it may conflict with another entry.' => 'Внимание: если Вы измените базовое имя вручную, то может возникнуть конфликт с уже существующими записями.',
	'Warning: Changing this entry\'s basename may break inbound links.' => 'Внимание: изменение базового имени этой записи может поломать внешний входящие ссылки.',
	'edit' => 'изменить',
	'close' => 'закрыть',
	'Accept' => 'Принимать',
	'Outbound TrackBack URLs' => 'Исходящие Трэкбэк URLы',
	'View Previously Sent TrackBacks' => 'Просмотреть Трэкбэки отосланные ранее',
	'You have unsaved changes to this entry that will be lost.' => 'Ваша изменения этой записи не сохранены и будут потеряны.',
	'You have unsaved changes to this page that will be lost.' => 'Ваши изменения этой страницы не сохранены и будут потеряны.',
	'Enter the link address:' => 'Introduzca la dirección del enlace:', # Translate - No russian chars
	'Enter the text to link to:' => 'Introduzca el texto del enlace:', # Translate - No russian chars
	'Your entry screen preferences have been saved.' => 'Ваши настройки отображения экрана записи были сохранены.',
	'Your entry screen preferences have been saved. Please refresh the page to reorder the custom fields.' => 'Ваши настройки отображения экрана записи сохранены. Пожалуйста, обратитесь к странице чтобы перупорядочить поля.',
	'Are you sure you want to use the Rich Text editor?' => 'Вы уверены что хотите использовать Редактор с расширеным форматированием?',
	'Remove' => 'Удалить',
	'Make primary' => 'Сделать основным',
	'Display Options' => 'Настройки отображения',
	'Fields' => 'Поля',
	'Reset display options' => 'Сбросить установки отображения',
	'Reset display options to blog defaults' => 'Сбросить установки отображения в настройки по умолчанию для блога',
	'Reset defaults' => 'Сбросить по умолчанию',
	'Save display options' => 'Сохранить настройки отображения',
	'OK' => 'Принять',
	'Close display options' => 'Закрыть настройки отображения',
	'Extended' => 'Расширенный',
	'Format:' => 'Формат:',
	'(comma-delimited list)' => '(lista separada por comas)', # Translate - No russian chars
	'(space-delimited list)' => '(lista separada por espacios)', # Translate - No russian chars
	'(delimited by \'[_1]\')' => '(separado por \'[_1]\')', # Translate - No russian chars
	'None selected' => 'Ничего не выбрано',

## tmpl/cms/list_blog.tmpl
	'You have successfully deleted the blogs from the Movable Type system.' => 'Вы успешно удалили блоги из системы Movable Type.',
	'You have successfully refreshed your templates.' => 'Шаблоны были успешно обновлены.',
	'Create Blog' => 'Создать блог',

## tmpl/cms/rebuilding.tmpl
	'Publishing...' => 'Публикация...',
	'Publishing [_1]...' => 'Публикуется [_1]...',
	'Publishing [_1] [_2]...' => 'Публикуется [_1] [_2]...',
	'Publishing [_1] dynamic links...' => 'Публикуються динамические ссылоки [_1] ...',
	'Publishing [_1] archives...' => 'Публикуется архив [_1]...',
	'Publishing [_1] templates...' => 'Публикуются шаблоны [_1]...',

## tmpl/cms/include/notification_table.tmpl
	'Date Added' => 'Дата добавлена',
	'Click to edit contact' => 'Нажмите для редактировани контакта',
	'Save changes' => 'Сохранить изменения',

## tmpl/cms/include/asset_upload.tmpl
	'Before you can upload a file, you need to publish your blog. [_1]Configure your blog\'s publishing paths[_2] and rebuild your blog.' => 'Antes de subir un fichero, debe publicar el blog. [_1]Configure las rutas de publicación del blog[_2] y reconstrúyalo.', # Translate - No russian chars
	'Your system or blog administrator needs to publish the blog before you can upload files. Please contact your system or blog administrator.' => 'Перед тем, как Вы сможете загружать файлы, Ваш администратор должен опубликовать блог. Свяэитесь с Вашим администратором',
	'Close (x)' => 'Закрыть (x)',
	'Select File to Upload' => 'Выберите файл для загрузки',
	'_USAGE_UPLOAD' => 'Вы можете загрузить файл во вложенную папку, которая будет создана если она еще не существует.',
	'Upload Destination' => 'Загрузить в',
	'Choose Folder' => 'Выберите папку',
	'Upload (s)' => 'Загрузить (s)',
	'Upload' => 'Загрузить',
	'Back (b)' => 'Возврат (b)',
	'Cancel (x)' => 'Отмена (x)',

## tmpl/cms/include/member_table.tmpl
	'user' => 'usario', # Translate - No russian chars
	'users' => 'usarios', # Translate - No russian chars
	'Are you sure you want to remove the selected user from this blog?' => '¿Está seguro de que desea borrar al usuario seleccionado de este blog?', # Translate - No russian chars
	'Are you sure you want to remove the [_1] selected users from this blog?' => '¿Está seguro de que desea borrar a los [_1] usuarios seleccionados de este blog?', # Translate - No russian chars
	'Remove selected user(s) (r)' => 'Borrar usuarios seleccionados (r)', # Translate - No russian chars
	'_USER_ENABLED' => 'Habilitado', # Translate - No russian chars
	'Trusted commenter' => 'Comentarista de confianza', # Translate - No russian chars
	'Remove this role' => 'Удалить эту роль',

## tmpl/cms/include/backup_start.tmpl
	'Backing up Movable Type' => 'Резервное копирование Movable Type',

## tmpl/cms/include/author_table.tmpl
	'_USER_DISABLED' => 'Deshabilitado', # Translate - No russian chars

## tmpl/cms/include/import_start.tmpl
	'Importing...' => 'Importando...', # Translate - No russian chars
	'Importing entries into blog' => 'Importando entradas en el blog', # Translate - No russian chars
	'Importing entries as user \'[_1]\'' => 'Importando entradas como usario \'[_1]\'', # Translate - No russian chars
	'Creating new users for each user found in the blog' => 'Creando nuevos usarios para cada usario encontrado en el blog', # Translate - No russian chars

## tmpl/cms/include/ping_table.tmpl
	'to publish' => 'para publicar', # Translate - No russian chars
	'Publish selected [_1] (p)' => 'Опубликовать выбранные [_1] (p)',
	'Report selected [_1] as Spam (j)' => 'Marcar como spam [_1] seleccionados (j)', # Translate - No russian chars
	'Spam' => 'Спам',
	'Report selected [_1] as Not Spam and Publish (j)' => 'Desmarcar como spam y publicar [_1] seleccionados (j)', # Translate - No russian chars
	'Not Spam' => 'Не спам',
	'Are you sure you want to remove all TrackBacks reported as spam?' => 'Вы уверены что хотите удалить все Трэкбэки помеченные как спам?',
	'Deletes all [_1] reported as Spam' => 'Удалить все [_1] помеченные как спам',
	'Empty' => 'Пустой',
	'From' => 'Откуда',
	'Target' => 'Куда',
	'Only show published TrackBacks' => 'Показывать только опубликованные Трэкбэки',
	'Only show pending TrackBacks' => 'Показывать только ожидающие Трэкбэки',
	'Edit this TrackBack' => 'Изменить этот Трекбек',
	'Go to the source entry of this TrackBack' => 'Ir a la entrada de origen de este TrackBack', # Translate - No russian chars
	'View the [_1] for this TrackBack' => 'Mostrar [_1] de este TrackBack', # Translate - No russian chars
	'Search for all comments from this IP address' => 'Buscar todos los comentarios enviados desde esta dirección IP', # Translate - No russian chars

## tmpl/cms/include/anonymous_comment.tmpl
	'Anonymous Comments' => 'Анонимные комментарии',
	'Require E-mail Address for Anonymous Comments' => 'Требовать email адрес для анонимных комментариев',
	'If enabled, visitors must provide a valid e-mail address when commenting.' => 'Если включено, пользователи должны будут ввести существующий адрес email.',

## tmpl/cms/include/log_table.tmpl
	'No log records could be found.' => 'Не найдено записей в истории действий.',
	'_LOG_TABLE_BY' => 'Кто',
	'IP: [_1]' => 'IP: [_1]', # Translate - Not translated
	'[_1]' => '[_1]', # Translate - Not translated

## tmpl/cms/include/login_mt.tmpl

## tmpl/cms/include/comment_table.tmpl
	'Publish selected comments (a)' => 'Опубликовать выбранные комментарии (a)',
	'Delete selected comments (x)' => 'Удалить выбранные комментарии (x)',
	'Report selected comments as Spam (j)' => 'Пометить выбранные комментарии как спам (j)',
	'Report selected comments as Not Spam and Publish (j)' => 'Desmarcar como spam y publicar los comentarios seleccionados (j)', # Translate - No russian chars
	'Are you sure you want to remove all comments reported as spam?' => '¿Está seguro de que desea borrar todos los comentarios marcados como spam?', # Translate - No russian chars
	'Delete all comments reported as Spam' => 'Borrar todos los comentarios marcados como spam', # Translate - No russian chars
	'Entry/Page' => 'Запись/Страница',
	'Only show published comments' => 'Mostrar solo comentarios publicados', # Translate - No russian chars
	'Only show pending comments' => 'Mostrar solo comentarios pendientes', # Translate - No russian chars
	'Edit this comment' => 'Editar este comentario', # Translate - No russian chars
	'([quant,_1,reply,replies])' => '([quant,_1,ответ,ответа,ответов])',
	'Reply' => 'Responder', # Translate - No russian chars
	'Blocked' => 'Bloqueado', # Translate - No russian chars
	'Edit this [_1] commenter' => 'Editar comentarista [_1]', # Translate - No russian chars
	'Search for comments by this commenter' => 'Buscar comentarios de este comentarista', # Translate - No russian chars
	'Anonymous' => 'Anónimo', # Translate - No russian chars
	'View this entry' => 'Ver esta entrada', # Translate - No russian chars
	'View this page' => 'Ver esta página', # Translate - No russian chars

## tmpl/cms/include/category_selector.tmpl
	'Add sub category' => 'Добавить подтему',
	'Add new' => 'Добавить новую',

## tmpl/cms/include/tools_content_nav.tmpl

## tmpl/cms/include/cfg_content_nav.tmpl
	'Registration' => 'Регистрация',
	'Web Services' => 'Веб-сервисы',

## tmpl/cms/include/backup_end.tmpl
	'All of the data has been backed up successfully!' => 'Все данные были успешно сохранены!',
	'Download This File' => 'Сохранить этот файл',
	'_BACKUP_TEMPDIR_WARNING' => 'La copia de seguridad se realizó con éxito en el directorio [_1]. Descargue y <strong>borre luego</strong> los ficheros listados abajo desde [_1] <strong>inmediatamente</strong>, porque los ficheros de la copia de seguridad contiene información sensible.', # Translate - No russian chars
	'_BACKUP_DOWNLOAD_MESSAGE' => 'La descarga del fichero de la copia de seguridad comenzará automáticamente dentro de unos segundos. Si por alguna razón no lo hace, haga clic <a href="javascript:(void)" onclick="submit_form()">aquí</a> para comenzar la descarga manualmente. Por favor, tenga en cuenta que solo puede descargar el fichero de la copia de seguridad una vez por sesión.', # Translate - No russian chars
	'An error occurred during the backup process: [_1]' => 'Во время процесса резервного копирования произошла ошибка: [_1]',

## tmpl/cms/include/footer.tmpl
	'Hey, this is a Beta version of MT: Don\'t use it in production! And you\'ll want to upgrade to the release version by January 31, 2008. (<a href="[_1]" target="_blank">License details</a>)' => 'Esta es una versión Beta de MT: ¡no la use en producción! Para actualizar, espere a la versión estable que se publicará el 31 de enero de 2008 (<a href="[_1]" target="_blank">Detalles de la licencia</a>)', # Translate - No russian chars
	'Dashboard' => 'Панель управления',
	'Compose Entry' => 'Создать запись',
	'System Settings' => 'Установки системы',
	'Help' => 'Помощь',
	'<a href="[_1]"><mt:var name="mt_product_name"></a> version [_2]' => '<a href="[_1]"><mt:var name="mt_product_name"></a> версия [_2]',
	'with' => 'с',

## tmpl/cms/include/commenter_table.tmpl
	'Last Commented' => 'Últimos comentados', # Translate - No russian chars
	'Only show trusted commenters' => 'Mostrar solo comentaristas de confianza', # Translate - No russian chars
	'Only show banned commenters' => 'Mostrar solo comentaristas bloqueados', # Translate - No russian chars
	'Only show neutral commenters' => 'Mostrar solo comentaristas neutrales', # Translate - No russian chars
	'Edit this commenter' => 'Изменить данного комментатора',
	'View this commenter&rsquo;s profile' => 'Просмотреть профиль данного комментатора',

## tmpl/cms/include/list_associations/page_title.tmpl
	'Permissions for [_1]' => 'Права доступа для [_1]',
	'Permissions: System-wide' => 'Права доступа: Для всей системы',
	'Users for [_1]' => 'Пользователи [_1]',

## tmpl/cms/include/calendar.tmpl
	'_LOCALE_WEEK_START' => '1', # Translate - No russian chars
	'Sunday' => 'Воскресенье',
	'Monday' => 'Понедельник',
	'Tuesday' => 'Вторник',
	'Wednesday' => 'Среда',
	'Thursday' => 'Четверг',
	'Friday' => 'Пятница',
	'Saturday' => 'Суббота',
	'S|M|T|W|T|F|S' => 'Вс|Пн|Вт|Ср|Чт|Пт|Сб',
	'January' => 'Январь',
	'Febuary' => 'Февраль',
	'March' => 'Март',
	'April' => 'Апрель',
	'May' => 'Май',
	'June' => 'Июнь',
	'July' => 'Июль',
	'August' => 'Август',
	'September' => 'Сентябрь',
	'October' => 'Октябрь',
	'November' => 'Ноябрь',
	'December' => 'Декабрь',
	'Jan' => 'Янв',
	'Feb' => 'Фев',
	'Mar' => 'Мар',
	'Apr' => 'Апр',
	'_SHORT_MAY' => 'Май',
	'Jun' => 'Июнь',
	'Jul' => 'Июль',
	'Aug' => 'Авг',
	'Sep' => 'Сен',
	'Oct' => 'Окт',
	'Nov' => 'Нояб',
	'Dec' => 'Дек',
	'[_1:calMonth] [_2:calYear]' => '[_1:calMonth] [_2:calYear]', # Translate - Not translated

## tmpl/cms/include/users_content_nav.tmpl
	'Profile' => 'Профиль',
	'Details' => 'Детали',

## tmpl/cms/include/pagination.tmpl

## tmpl/cms/include/copyright.tmpl
	'Copyright &copy; 2001-[_1] Six Apart. All Rights Reserved.' => 'Copyright &copy; 2001-[_1] Six Apart. All Rights Reserved.', # Translate - Not translated

## tmpl/cms/include/import_end.tmpl
	'All data imported successfully!' => 'Все данные успешно импортированы!',
	'Make sure that you remove the files that you imported from the \'import\' folder, so that if/when you run the import process again, those files will not be re-imported.' => 'Asegúrese de borrar los ficheros importados del directorio \'import\', para evitar procesarlos de nuevo al ejecutar en otra ocasión el proceso de importación.', # Translate - No russian chars
	'An error occurred during the import process: [_1]. Please check your import file.' => 'Ocurrió un error durante el proceso de importación: [_1]. Por favor, compruebe su fichero de importación.', # Translate - No russian chars

## tmpl/cms/include/itemset_action_widget.tmpl
	'More actions...' => 'Другие действия...',
	'Plugin Actions' => 'Действия плугинов',
	'Go' => 'Выполнить',

## tmpl/cms/include/template_table.tmpl
	'template' => 'шаблон',
	'templates' => 'шаблоны',
	'Linked' => 'Enlazado', # Translate - No russian chars
	'Linked Template' => 'Plantilla enlazada', # Translate - No russian chars
	'Dynamic' => 'Dinámico', # Translate - No russian chars
	'Dynamic Template' => 'Plantilla dinámica', # Translate - No russian chars
	'Published w/Indexes' => 'Publicando con índices', # Translate - No russian chars
	'Published Template w/Indexes' => 'Plantilla publicada con índices', # Translate - No russian chars
	'-' => '-', # Translate - Not translated
	'Yes' => 'Да',
	'No' => 'Нет',

## tmpl/cms/include/blog-left-nav.tmpl
	'Creating' => 'Создание',
	'List Entries' => 'Listar entradas', # Translate - No russian chars
	'List uploaded files' => 'Lista de ficheros transferidos', # Translate - No russian chars
	'Community' => 'Сообщество',
	'List Comments' => 'Listar comentarios', # Translate - No russian chars
	'List Commenters' => 'Listar comentaristas', # Translate - No russian chars
	'List TrackBacks' => 'Listar TrackBacks', # Translate - No russian chars
	'Edit Address Book' => 'Editar agenda de direcciones', # Translate - No russian chars
	'Configure' => 'Configurar', # Translate - No russian chars
	'List Users &amp; Groups' => 'Lisar usuarios &amp; grupos', # Translate - No russian chars
	'Users &amp; Groups' => 'Usuarios &amp; grupos', # Translate - No russian chars
	'List &amp; Edit Templates' => 'Listar y editar plantillas', # Translate - No russian chars
	'Edit Categories' => 'Editar categorías', # Translate - No russian chars
	'Edit Tags' => 'Editar etiquetas', # Translate - No russian chars
	'Edit Weblog Configuration' => 'Editar configuración del weblog', # Translate - No russian chars
	'Utilities' => 'Herramientas', # Translate - No russian chars
	'Search &amp; Replace' => 'Поиск и Замена',
	'_SEARCH_SIDEBAR' => 'Поиск',
	'Backup this weblog' => 'Hacer una copia de seguridad de este weblog', # Translate - No russian chars
	'Import &amp; Export Entries' => 'Importar &amp; Exportar entradas', # Translate - No russian chars
	'Import / Export' => 'Importar / Exportar', # Translate - No russian chars
	'Rebuild Site' => 'Reconstruir sitio', # Translate - No russian chars
	'View Site' => 'Просмотр сайта',

## tmpl/cms/include/cfg_system_content_nav.tmpl

## tmpl/cms/include/entry_table.tmpl
	'Save these entries (s)' => 'Grabar estas entradas (s)', # Translate - No russian chars
	'Republish selected entries (r)' => 'Republicar entradas seleccionadas (r)', # Translate - No russian chars
	'Delete selected entries (x)' => 'Borrar entradas seleccionadas (x)', # Translate - No russian chars
	'Save these pages (s)' => 'Сохранить эти страницы (s)',
	'Republish selected pages (r)' => 'Republicar páginas seleccionadas (r)', # Translate - No russian chars
	'Delete selected pages (x)' => 'Удалить выбранные страницы (x)',
	'to republish' => 'опубликовать заново',
	'Republish' => 'Опубликовать заново',
	'Last Modified' => 'Последние изменения',
	'Created' => 'Создано',
	'Only show unpublished entries' => 'Mostrar solo las entradas no publicadas', # Translate - No russian chars
	'Only show unpublished pages' => 'Mostrar solo las páginas no publicadas', # Translate - No russian chars
	'Only show published entries' => 'Mostrar solo las entradas publicadas', # Translate - No russian chars
	'Only show published pages' => 'Mostrar solo las páginas publicadas', # Translate - No russian chars
	'Only show entries for review' => 'Mostrar solo las entradas para revisar', # Translate - No russian chars
	'Only show pages for review' => 'Mostrar solo las páginas para revisar', # Translate - No russian chars
	'Only show scheduled entries' => 'Mostrar solo las entradas programadas', # Translate - No russian chars
	'Only show scheduled pages' => 'Mostrar solo las páginas programadas', # Translate - No russian chars
	'View entry' => 'Просмотр записи',
	'View page' => 'Просмотр страницы',
	'No entries could be found. <a href="[_1]">Create an entry</a> now.' => 'Не найдено ни одной записи. <a href="[_1]">Создать новую запись</a>.',
	'No page could be found. <a href="[_1]">Create a page</a> now.' => 'Не найдено ни одной страницы. <a href="[_1]">Создайте новую страницу</a>.',

## tmpl/cms/include/feed_link.tmpl
	'Activity Feed' => 'Синдикация истории действий',
	'Disabled' => 'Отключено',

## tmpl/cms/include/display_options.tmpl
	'_DISPLAY_OPTIONS_SHOW' => 'Показывать',
	'[quant,_1,row,rows]' => '[quant,_1,строка,строки,строк]',
	'Compact' => 'Компактное',
	'Expanded' => 'Расширенное',
	'Action Bar' => 'Панель инструментов',
	'Date Format' => 'Формат дат',
	'Relative' => 'Относительно',
	'Full' => 'Полный',

## tmpl/cms/include/asset_table.tmpl
	'asset' => 'fichero multimedia', # Translate - No russian chars
	'assets' => 'ficheros multimedia', # Translate - No russian chars
	'Delete selected assets (x)' => 'Borrar los ficheros multimedia seleccionados (x)', # Translate - No russian chars
	'Size' => 'Размер',
	'Asset Missing' => 'Медиа-ресурсы отсутстуют',

## tmpl/cms/include/listing_panel.tmpl
	'Step [_1] of [_2]' => 'Шаг [_1] из [_2]',
	'Go to [_1]' => 'Перейти к [_1]',
	'Sorry, there were no results for your search. Please try searching again.' => 'Lo siento, no se encontraron resultados para la búsqueda. Por favor, intente buscar de nuevo.', # Translate - No russian chars
	'Sorry, there is no data for this object set.' => 'Lo siento, no hay datos para este conjunto de objetos.', # Translate - No russian chars
	'Confirm (s)' => 'Подтверждаю (s)',
	'Confirm' => 'Подтверждаю',
	'Continue (s)' => 'Продолжить (s)',

## tmpl/cms/include/archetype_editor.tmpl
	'Decrease Text Size' => 'Aumentar tamaño de texto', # Translate - No russian chars
	'Increase Text Size' => 'Disminuir tamaño de texto', # Translate - No russian chars
	'Bold' => 'Negrita', # Translate - No russian chars
	'Italic' => 'Cursiva', # Translate - No russian chars
	'Underline' => 'Subrayado', # Translate - No russian chars
	'Strikethrough' => 'Tachado', # Translate - No russian chars
	'Text Color' => 'Color de texto', # Translate - No russian chars
	'Email Link' => 'Enlace de correo', # Translate - No russian chars
	'Begin Blockquote' => 'Comenzar cita', # Translate - No russian chars
	'End Blockquote' => 'Finalizar cita', # Translate - No russian chars
	'Bulleted List' => 'Viñeta', # Translate - No russian chars
	'Numbered List' => 'Numeración', # Translate - No russian chars
	'Left Align Item' => 'Alinear elemento a la izquierda', # Translate - No russian chars
	'Center Item' => 'Centrar elemento', # Translate - No russian chars
	'Right Align Item' => 'Alinear elemento a la derecha', # Translate - No russian chars
	'Left Align Text' => 'Alinear texto a la izquierda', # Translate - No russian chars
	'Center Text' => 'Centrar texto', # Translate - No russian chars
	'Right Align Text' => 'Alinear texto a la derecha', # Translate - No russian chars
	'Insert Image' => 'Вставить изображение',
	'Insert File' => 'Вставить файл',
	'WYSIWYG Mode' => 'Modo con formato (WYSIWYG)', # Translate - No russian chars
	'HTML Mode' => 'Modo HTML', # Translate - No russian chars

## tmpl/cms/include/chromeless_footer.tmpl
	'<a href="[_1]">Movable Type</a> version [_2]' => '<a href="[_1]">Movable Type</a> версия [_2]',

## tmpl/cms/include/header.tmpl
	'Hi [_1],' => 'Здраствуй, [_1],',
	'Logout' => 'Выйти',
	'Select another blog...' => 'Выберите другой блог...',
	'Create a new blog' => 'Создать новый блог',
	'Write Entry' => 'Написать статью',
	'Blog Dashboard' => 'Панель управления блога',
	'Search (q)' => 'Поиск (q)',

## tmpl/cms/include/overview-left-nav.tmpl
	'List Weblogs' => 'Список Веблогов',
	'Weblogs' => 'Weblogs', # Translate - Not translated
	'List Users and Groups' => 'Listar usuarios y grupos', # Translate - No russian chars
	'List Associations and Roles' => 'Listar asociaciones y roles', # Translate - No russian chars
	'List Plugins' => 'Listar extensiones', # Translate - No russian chars
	'Aggregate' => 'Listar', # Translate - No russian chars
	'List Tags' => 'Listar etiquetas', # Translate - No russian chars
	'Edit System Settings' => 'Editar configuración del sistema', # Translate - No russian chars
	'Show Activity Log' => 'Mostrar histórico de actividad', # Translate - No russian chars

## tmpl/cms/include/archive_maps.tmpl
	'Path' => 'Путь',
	'Custom...' => 'Custom...', # Translate - Not translated

## tmpl/cms/include/blog_table.tmpl
	'Delete selected blogs (x)' => 'Удалить выбранные блоги (x)',

## tmpl/cms/error.tmpl

## tmpl/cms/pinging.tmpl
	'Trackback' => 'Трэкбэк',
	'Pinging sites...' => 'Пингуем сайты...',

## tmpl/cms/cfg_spam.tmpl
	'Spam Settings' => 'Настройки анти-спам',
	'Your spam preferences have been saved.' => 'Настройки анти-спам сохранены.',
	'Auto-Delete Spam' => 'Удалять спам автоматически',
	'If enabled, feedback reported as spam will be automatically erased after a number of days.' => 'Если включено, то комментарии отмеченные как спам будут удалены автоматически через определенное количество дней.',
	'Delete Spam After' => 'Удалять спам после',
	'When an item has been reported as spam for this many days, it is automatically deleted.' => 'Cuando un elemento haya estado marcado como spam durante esta cantidad de días, será borrado automáticamente.', # Translate - No russian chars
	'days' => 'дней',
	'Spam Score Threshold' => 'Уровень оценки спама',
	'Comments and TrackBacks receive a spam score between -10 (complete spam) and +10 (not spam). Feedback with a score which is lower than the threshold shown above will be reported as spam.' => 'Los comentarios y TrackBacks se puntúan como spam con valores entre -10 (spam total) y +10 (no spam). Las respuestas con una puntuación que sea menor del límite mostrado arriba, se marcarán como spam.', # Translate - No russian chars
	'Less Aggressive' => 'Менее агрессивно',
	'Decrease' => 'Уменьшить',
	'Increase' => 'Увеличить',
	'More Aggressive' => 'Более агрессивно',

## tmpl/cms/cfg_archives.tmpl
	'Error: Movable Type was not able to create a directory for publishing your blog. If you create this directory yourself, assign sufficient permissions that allow Movable Type to create files within it.' => 'Error: Movable Type no pudo crear un directorio para publicar el blog. Si desea crear el directorio usted mismo, asigne suficientes permisos para que Movable Type pueda crear ficheros en él.', # Translate - No russian chars
	'Your blog\'s archive configuration has been saved.' => 'Настройки архивов Вашего блога были сохранены.',
	'You have successfully added a new archive-template association.' => 'Agregó correctamente una nueva asociación archivo-plantilla.', # Translate - No russian chars
	'You may need to update your \'Master Archive Index\' template to account for your new archive configuration.' => 'Podría tener que actualizar la plantilla \'Archivo índice maestro\' para tener en cuenta la nueva configuración del archivado.', # Translate - No russian chars
	'The selected archive-template associations have been deleted.' => 'Las asociaciones seleccionadas archivos-plantillas fueron eliminadas.', # Translate - No russian chars
	'You must set your Local Site Path.' => 'Debe definir la ruta local de su sitio.', # Translate - No russian chars
	'You must set a valid Site URL.' => 'Debe establecer una URL de sitio válida.', # Translate - No russian chars
	'You must set a valid Local Site Path.' => 'Debe establecer una ruta local de sitio válida.', # Translate - No russian chars
	'Publishing Paths' => 'Пути для публикации',
	'The URL of your website. Do not include a filename (i.e. exclude index.html). Example: http://www.example.com/blog/' => 'URL Вашего сайта. Не должно включать имя фалй (например, index.html). Пример: http://www.example.com/blog/',
	'Unlock this blog&rsquo;s site URL for editing' => 'Разюлокировать URL сайта для редактирования',
	'Warning: Changing the site URL can result in breaking all the links in your blog.' => 'Внимание: изменение этого URL может привести к битым ссылкам на Ваш блог.',
	'The path where your index files will be published. An absolute path (starting with \'/\') is preferred, but you can also use a path relative to the Movable Type directory. Example: /home/melody/public_html/blog' => 'По данному пути будут публиковаться Ваши индексные файлы. Предпочтительно указать абсолютный путь (начинающийся с \'/\'), но также можно указать путь относительно каталога Movable Type. Пример: /home/melody/public_html/blog',
	'Unlock this blog&rsquo;s site path for editing' => 'Разблокировать путь сайта блога для редактирования',
	'Note: Changing your site root requires a complete publish of your site.' => 'Примечание: Изменение корня сайта требует полной повторной публикации сайта.',
	'Advanced Archive Publishing' => 'Усовершенствованная публикация архивов',
	'Select this option only if you need to publish your archives outside of your Site Root.' => 'Seleccione esta opción solo si necesita publicar sus archivos fuera de la raíz de su sitio.', # Translate - No russian chars
	'Publish archives outside of Site Root' => 'Публиковать архивы вне корня сайта.',
	'Archive URL' => 'URL de archivos', # Translate - No russian chars
	'Enter the URL of the archives section of your website. Example: http://archives.example.com/' => 'Introduzca la URL de la sección de archivos de su web. Ejemplo: http://archivos.ejemplo.com/', # Translate - No russian chars
	'Unlock this blog&rsquo;s archive url for editing' => 'Desbloquear la URL de archivos de este blog para su edición', # Translate - No russian chars
	'Warning: Changing the archive URL can result in breaking all the links in your blog.' => 'Aviso: La modificación de la URL de archivos pueden romper todos los enlaces en el blog.', # Translate - No russian chars
	'Enter the path where your archive files will be published. Example: /home/melody/public_html/archives' => 'Introduzca la ruta donde se publicarán los ficheros de los archivos. Ejemplo: /home/melody/public_html/archivos', # Translate - No russian chars
	'Warning: Changing the archive path can result in breaking all the links in your blog.' => 'Aviso: La modificación de la ruta de los archivos puede romper todos los enlaces en su blog.', # Translate - No russian chars
	'Publishing Options' => 'Настройки публикации',
	'Preferred Archive Type' => 'Предпочтительный тип архива',
	'Used for creating links to an archived entry (permalink). Select from the archive types used in this blogs archive templates.' => 'Используется для создание ссылок на архивные записи (permalink). Выберите из типов архивов используемых в архивных шаблонах данного блога',
	'No archives are active' => 'Нет активных архивов',
	'Publishing Method' => 'Метод публикации',
	'Publish all templates statically' => 'Публиковать все шаблоны статически',
	'Publish only Archive Templates dynamically' => 'Публиковать динамически только Архивные шаблоны',
	'Set each template\'s Publish Options separately' => 'Установить настройки публикации для каждого шаблона',
	'Publish all templates dynamically' => 'Публиковать все документы динамически',
	'Use Publishing Queue' => 'Использовать очередь публикации',
	'Requires the use of a cron job to publish pages in the background.' => 'Для публикации страниц в фоне необходимо настроить cron.',
	'Use background publishing queue for publishing static pages for this blog' => 'Использовать фоновую очердь для публикации статических страниц этого блога.',
	'Enable Dynamic Cache' => 'Использовать динамический кэш',
	'Turn on caching.' => 'Включить кэш.',
	'Enable caching' => 'Разрешить кэширование',
	'Enable Conditional Retrieval' => 'Activar recuperación condicional', # Translate - No russian chars
	'Turn on conditional retrieval of cached content.' => 'Activar recuperación condicional de los contenidos cacheados.', # Translate - No russian chars
	'Enable conditional retrieval' => 'Activar recuperación condicional', # Translate - No russian chars
	'File Extension for Archive Files' => 'Расширение файла для архивов',
	'Enter the archive file extension. This can take the form of \'html\', \'shtml\', \'php\', etc. Note: Do not enter the leading period (\'.\').' => 'Introduzca la extensión de los archivos. Puede ser \'html\', \'shtml\', \'php\', etc. Nota: No introduzca el punto separador de la extensión (\'.\').', # Translate - No russian chars

## tmpl/cms/backup.tmpl
	'What to backup' => 'Что сохранить',
	'This option will backup Users, Roles, Associations, Blogs, Entries, Categories, Templates and Tags.' => 'Эта опция сохранит Пользователей, Роли, Ассоциации, Блоги, Записи, Темы, Шаблоны и Метки.',
	'Everything' => 'Все',
	'Choose blogs...' => 'Выберите блог...',
	'Archive Format' => 'Формат архива',
	'The type of archive format to use.' => 'Тип формата архива для использования.',
	'Don\'t compress' => 'Не сжимать',
	'Target File Size' => 'Целевой размер файла',
	'Approximate file size per backup file.' => 'Примерный размер для каждого файла копии.',
	'Don\'t Divide' => 'Не разбивать',
	'Make Backup (b)' => 'Создать резервную копия (b)',
	'Make Backup' => 'Создать резервную копию',

## tmpl/cms/search_replace.tmpl
	'You must select one or more item to replace.' => 'Debe seleccionar uno o más elementos a reemplazar.', # Translate - No russian chars
	'Search Again' => 'Искать заново',
	'Submit search (s)' => 'Искать (s)',
	'Replace' => 'Reemplazar', # Translate - No russian chars
	'Replace Checked' => 'Reemplazar selección', # Translate - No russian chars
	'Case Sensitive' => 'Distinguir mayúsculas y minúsculas', # Translate - No russian chars
	'Regex Match' => 'Совпадение регулярного выражения',
	'Limited Fields' => 'Campos limitados', # Translate - No russian chars
	'Date Range' => 'Интервал дат',
	'Reported as Spam?' => '¿Marcado como spam?', # Translate - No russian chars
	'Search Fields:' => 'Искать в полях:',
	'_DATE_FROM' => '_FECHA_DESDE EL', # Translate - No russian chars
	'_DATE_TO' => '_FECHA_AL', # Translate - No russian chars
	'Successfully replaced [quant,_1,record,records].' => 'Успешно заменено [quanta,_1,запись,записи,записей].',
	'Showing first [_1] results.' => 'Показан [_quant,_1,результат,результата,результатов] с начала.',
	'Show all matches' => 'Показаны все совпадения',
	'[quant,_1,result,results] found' => 'обнаружено [quant,_1,результат,результата,результатов]',

## tmpl/cms/cfg_plugin.tmpl
	'System Plugin Settings' => 'Настройки системных плугинов',
	'http://plugins.movabletype.org/' => 'http://plugins.movabletype.org/', # Translate - Not translated
	'Find Plugins' => 'Поиск плугинов',
	'Plugin System' => 'Система плугинов',
	'Manually enable or disable plugin-system functionality. Re-enabling plugin-system functionality, will return all plugins to their original state.' => 'Activa o desactiva manualmente las funcionalidades de las extensiones del sistema. La reactivación de las extensiones del sistema hace que las extensiones vuelvan a su estado original.', # Translate - No russian chars
	'Disable plugin functionality' => 'iones de las extensiones', # Translate - No russian chars
	'Disable Plugins' => 'Отключить плугины',
	'Enable plugin functionality' => 'Activar las funciones de las extensiones', # Translate - No russian chars
	'Enable Plugins' => 'Активировать плугины',
	'Your plugin settings have been saved.' => 'Se guardó la configuración de la extensión.', # Translate - No russian chars
	'Your plugin settings have been reset.' => 'Se reinició la configuración de la extensión.', # Translate - No russian chars
	'Your plugins have been reconfigured. Since you\'re running mod_perl, you will need to restart your web server for these changes to take effect.' => 'Se reconfiguraron las extensiones. Debido a que está ejecutando mod_perl, deberá reiniciar el servidor web para que estos cambios tengan efecto.', # Translate - No russian chars
	'Your plugins have been reconfigured.' => 'Se reconfiguraron las extensiones.', # Translate - No russian chars
	'Are you sure you want to reset the settings for this plugin?' => '¿Está seguro de que desea reiniciar la configuración de esta extensión?', # Translate - No russian chars
	'Are you sure you want to disable plugin functionality?' => '¿Está seguro de querer desactivar la funcinalidad de las extensiones?', # Translate - No russian chars
	'Disable this plugin?' => '¿Desactivar esta extensión?', # Translate - No russian chars
	'Are you sure you want to enable plugin functionality? (This will re-enable any plugins that were not individually disabled.)' => '¿Está seguro de querer artivar la funcionalidad de las extensiones?  (Esto reactivará cada extensión que no haya sido desactivada individualmente.)', # Translate - No russian chars
	'Enable this plugin?' => 'Включить данный плугин?',
	'Failed to Load' => 'Falló al cargar', # Translate - No russian chars
	'(Disable)' => '(Выключен)',
	'Enabled' => 'Включен',
	'(Enable)' => '(Включен)',
	'Settings for [_1]' => 'Настройки для [_1]',
	'This plugin has not been upgraded to support Movable Type [_1]. As such, it may not be 100% functional. Furthermore, it will require an upgrade once you have upgraded to the next Movable Type major release (when available).' => 'Esta extensión no se ha actualizado para soportar Movable Type [_1]. Por tanto, podría no ser 100% funcional. Además, necesitará una actualización cuando se actualice a la siguiente versión superior de Movable Type (cuando esté disponible).', # Translate - No russian chars
	'Plugin error:' => 'Error de la extensión:', # Translate - No russian chars
	'Info' => 'Информация',
	'Resources' => 'Ресурсы',
	'Run [_1]' => 'Ejecutar [_1]', # Translate - No russian chars
	'Documentation for [_1]' => 'Документация для [_1]',
	'Documentation' => 'Документация',
	'More about [_1]' => 'Подробнее о [_1]',
	'Plugin Home' => 'Домашняя страница плугина',
	'Author of [_1]' => 'Автор [_1]',
	'Tags:' => 'Метки:',
	'Tag Attributes:' => 'Atributos de etiquetas:', # Translate - No russian chars
	'Text Filters' => 'Filtros de texto', # Translate - No russian chars
	'Junk Filters:' => 'Filtros de basura:', # Translate - No russian chars
	'Reset to Defaults' => 'Reiniciar con los valores predefinidos', # Translate - No russian chars
	'No plugins with blog-level configuration settings are installed.' => 'No hay extensiones instaladas con configuración a nivel del sistema.', # Translate - No russian chars
	'No plugins with configuration settings are installed.' => 'Ningún plugin que haya sido configurado ha sido instalado.', # Translate - No russian chars

## tmpl/cms/edit_folder.tmpl
	'Edit Folder' => 'Editar carpeta', # Translate - No russian chars
	'Your folder changes have been made.' => 'Se han realizado los cambios en la carpeta.', # Translate - No russian chars
	'You must specify a label for the folder.' => 'Debe especificar una etiqueta para la carpeta.', # Translate - No russian chars
	'Save changes to this folder (s)' => 'Сохранить изменения этой папки (s)',

## tmpl/cms/refresh_results.tmpl
	'Template Refresh' => 'Обновление шаблонов',
	'No templates were selected to process.' => 'Нет ни одного выбранного шаблона для обработки.',
	'Return to templates' => 'Вернуться к шаблонам',

## tmpl/cms/system_check.tmpl
	'User Counts' => 'Количество пользователей',
	'Number of users in this system.' => 'Количество пользователей в данной системе.',
	'Total Users' => 'Всего пользователей',
	'Active Users' => 'Активных пользователей',
	'Users who have logged in within 90 days are considered <strong>active</strong> in Movable Type license agreement.' => 'Пользователи которые заходили в течении последних 90 дней считаются <strong>активными</strong> по лицензии Movable Type.',
	'Movable Type could not find the script named \'mt-check.cgi\'. To resolve this issue, please ensure that the mt-check.cgi script exists and/or the CheckScript configuration parameter references it properly.' => 'Movable Type no ha podido encontrar el script nombrado \'mt-check.cgi\'. Para resolver este problema, asegurese de que el script mt-check.cgi script existe y/o que la configuración de los parámetros de MTCheckScript este correctamente referenciado.', # Translate - No russian chars

## tmpl/cms/login.tmpl
	'Your Movable Type session has ended.' => 'Ваша сессия Movable Type закончилась.',
	'Your Movable Type session has ended. If you wish to sign in again, you can do so below.' => 'Su sesión de Movable Type finalizó. Si desea identificarse de nuevo, hágalo abajo.', # Translate - No russian chars
	'Your Movable Type session has ended. Please sign in again to continue this action.' => 'Su sesión de Movable Type finalizó. Por favor, identifíquese de nuevo para continuar con esta acción.', # Translate - No russian chars
	'Forgot your password?' => 'Забыли пароль?',
	'Sign In (s)' => 'Войти (s)',

## tmpl/cms/preview_strip.tmpl
	'Save this entry' => 'Сохранить запись',
	'Re-Edit this entry' => 'Продолжить редактирование',
	'Re-Edit this entry (e)' => 'Продолжить редактирование (e)',
	'Save this page' => 'Сохранить страницу',
	'Re-Edit this page' => 'Продолжить редактирование',
	'Re-Edit this page (e)' => 'Продолжить редактирование (e)',
	'You are previewing the entry titled &ldquo;[_1]&rdquo;' => 'Предварительный просмотр записи &ldquo;[_1]&rdquo;',
	'You are previewing the page titled &ldquo;[_1]&rdquo;' => 'Предварительный просмотр страницы &ldquo;[_1]&rdquo;',

## tmpl/cms/setup_initial_blog.tmpl
	'Create Your First Blog' => 'Создать Ваш первый блог',
	'The blog name is required.' => 'Нужно задать имя блога.',
	'The blog URL is required.' => 'Нужно задать URL блога.',
	'The publishing path is required.' => 'Необходим путь для публикации.',
	'The timezone is required.' => 'Необходимо указать часовой пояс.',
	'Template Set' => 'Набор шаблонов',
	'Select the templates you wish to use for this new blog.' => 'Выберите набор шаблонов который Вы желаете использовать для нового блога.',
	'Timezone' => 'Часовой пояс',
	'Select your timezone from the pulldown menu.' => 'Выберите часовой пояс из меню.',
	'Time zone not selected' => 'Часовой пояс не указан.',
	'UTC+13 (New Zealand Daylight Savings Time)' => 'UTC+13 (Летнее время Н.Зеландия)',
	'UTC+12 (International Date Line East)' => 'UTC+12 (Петропавловск-Камчатский)',
	'UTC+11' => 'UTC+11 (Магадан)',
	'UTC+10 (East Australian Time)' => 'UTC+10 (Хабаровск,Владивосток)',
	'UTC+9.5 (Central Australian Time)' => 'UTC+9.5 (Центральноавстралийское время)',
	'UTC+9 (Japan Time)' => 'UTC+9 (Чита, Якутск)',
	'UTC+8 (China Coast Time)' => 'UTC+8 (Иркутск)',
	'UTC+7 (West Australian Time)' => 'UTC+7 (Красноярск, Новокузнецк)',
	'UTC+6.5 (North Sumatra)' => 'UTC+6.5 (Северная Суматра)',
	'UTC+6 (Russian Federation Zone 5)' => 'UTC+6 (Новосибирск, Омск)',
	'UTC+5.5 (Indian)' => 'UTC+5.5 (Индия)',
	'UTC+5 (Russian Federation Zone 4)' => 'UTC+5 (Екатеринбург)',
	'UTC+4 (Russian Federation Zone 3)' => 'UTC+4 (Самара, Ижевск)',
	'UTC+3.5 (Iran)' => 'UTC+3.5 (Иран)',
	'UTC+3 (Baghdad Time/Moscow Time)' => 'UTC+3 (Московское время)',
	'UTC+2 (Eastern Europe Time)' => 'UTC+2 (Восточная Европа, Калининград)',
	'UTC+1 (Central European Time)' => 'UTC+1 (Центральная Европа)',
	'UTC+0 (Universal Time Coordinated)' => 'UTC+0 (Гринвич)',
	'UTC-1 (West Africa Time)' => 'UTC-1 (Западная Африка)',
	'UTC-2 (Azores Time)' => 'UTC-2 (Азоры)',
	'UTC-3 (Atlantic Time)' => 'UTC-3 (Атлантика)',
	'UTC-3.5 (Newfoundland)' => 'UTC-3.5 (Ньюфаундленд)',
	'UTC-4 (Atlantic Time)' => 'UTC-4 (Атлантическое побережье США)',
	'UTC-5 (Eastern Time)' => 'UTC-5 (Североамериканское восточное время)',
	'UTC-6 (Central Time)' => 'UTC-6 (Центральное время США, Мексика)',
	'UTC-7 (Mountain Time)' => 'UTC-7 (Горное время США, Мексика)',
	'UTC-8 (Pacific Time)' => 'UTC-8 (Североамериканское тихоокеанское время)',
	'UTC-9 (Alaskan Time)' => 'UTC-9 (Аляска)',
	'UTC-10 (Aleutians-Hawaii Time)' => 'UTC-10 (Гавайи)',
	'UTC-11 (Nome Time)' => 'UTC-11 (Самоа)',
	'Finish install (s)' => 'Завершить установку (s)',
	'Finish install' => 'Завершить установку',
	'Back (x)' => 'Назад (x)',

## tmpl/cms/list_tag.tmpl
	'Your tag changes and additions have been made.' => 'Ваши изменения меток были сохранены.',
	'You have successfully deleted the selected tags.' => 'Вы успешно удалили выбранные метки.',
	'tag' => 'метка',
	'tags' => 'метки',
	'Specify new name of the tag.' => 'Укажите новое название метки',
	'Tag Name' => 'Название метки',
	'Click to edit tag name' => 'Нажмите для изменения имени метки',
	'Rename [_1]' => 'Переименовать [_1]',
	'Rename' => 'Переименовать',
	'Show all [_1] with this tag' => 'Показать все [_1] с этой меткой',
	'[quant,_1,_2,_3]' => '[quant,_1,_2,_3]', # Translate - Not translated
	'[quant,_1,entry,entries]' => '[quant,_1,запись,записи,записей]',
	'The tag \'[_2]\' already exists. Are you sure you want to merge \'[_1]\' with \'[_2]\' across all blogs?' => 'La etiqueta \'[_2]\' ya existe.  ¿Está seguro de querer combinar \'[_1]\' con \'[_2]\' en todos los blogs?', # Translate - No russian chars
	'An error occurred while testing for the new tag name.' => 'Ocurrió un error mientras se probaba el nuevo nombre de la etiqueta.', # Translate - No russian chars

## tmpl/cms/list_ping.tmpl
	'Manage Trackbacks' => 'Управление Трэкбэками',
	'The selected TrackBack(s) has been approved.' => 'Выбраные Трэкбэки были одобрены.',
	'All TrackBacks reported as spam have been removed.' => 'Se han elimitado todos los TrackBacks marcadoscomo spam.', # Translate - No russian chars
	'The selected TrackBack(s) has been unapproved.' => 'Se han desaprobado los TrackBacks seleccionados.', # Translate - No russian chars
	'The selected TrackBack(s) has been reported as spam.' => 'Se han marcado como spam los TrackBacks seleccionados.', # Translate - No russian chars
	'The selected TrackBack(s) has been recovered from spam.' => 'Se han recuperado del spam los TrackBacks seleccionados.', # Translate - No russian chars
	'The selected TrackBack(s) has been deleted from the database.' => 'Se eliminaron de la base de datos los TrackBacks seleccionados.', # Translate - No russian chars
	'No TrackBacks appeared to be spam.' => 'Ningún TrackBacks parece ser spam.', # Translate - No russian chars
	'Show only [_1] where' => 'Mostrar solo [_1] donde', # Translate - No russian chars
	'status' => 'состояние',
	'approved' => 'одобрены',
	'unapproved' => 'не одобрены',

## tmpl/cms/list_member.tmpl
	'Manage Users' => 'Управление пользователями',
	'Are you sure you want to remove this role?' => 'Вы уверены что хотите удалить эту роль?',
	'Show only users where' => 'Показывать только пользователей которые',
	'role' => 'роль',
	'enabled' => 'включено',
	'disabled' => 'отключено',
	'pending' => 'ожидает',

## tmpl/cms/upgrade.tmpl
	'Time to Upgrade!' => 'Пора обновиться!',
	'Upgrade Check' => 'Comprobar actualización', # Translate - No russian chars
	'The version of Perl installed on your server ([_1]) is lower than the minimum supported version ([_2]).' => 'La versión de Perl instalada en su servidor ([_1]) es menor que la versión mínima soporta ([_2]).', # Translate - No russian chars
	'While Movable Type may run, it is an <strong>untested and unsupported environment</strong>.  We strongly recommend upgrading to at least Perl [_1].' => 'Aunque Movable Type podría ejecutarse, <strong>esta configuración no está probada ni ni soportada</strong>.  Le recomendamos que actualice Perl a la versión [_1].', # Translate - No russian chars
	'Do you want to proceed with the upgrade anyway?' => '¿Desea proceder en cualquier caso con la actualización?', # Translate - No russian chars
	'Yes (s)' => 'Да (s)',
	'View MT-Check (x)' => 'Посмотреть MT-Check (x)',
	'A new version of Movable Type has been installed.  We\'ll need to complete a few tasks to update your database.' => 'Se ha instalado una nueva versión de Movable Type.  Debemos realizar algunas tareas para actualizar su base de datos.', # Translate - No russian chars
	'Information about this upgrade can be found <a href=\'[_1]\' target=\'_blank\'>here</a>.' => 'Informaciones sobre esta actualización pueden ser encontradas <a href=\'[_1]\' target=\'_blank\'>aquí</a>.', # Translate - No russian chars
	'In addition, the following Movable Type components require upgrading or installation:' => 'Además, los siguientes componentes de Movable Type necesitan actualización o instalación:', # Translate - No russian chars
	'The following Movable Type components require upgrading or installation:' => 'Los siguientes componentes de Movable Type necesitan actualización o instalación:', # Translate - No russian chars
	'Begin Upgrade' => 'Comenzar actualización', # Translate - No russian chars
	'Congratulations, you have successfully upgraded to Movable Type [_1].' => 'Felicidades, actualizó con éxito a Movable Type [_1].', # Translate - No russian chars
	'Return to Movable Type' => 'Volver a Movable Type', # Translate - No russian chars
	'Your Movable Type installation is already up to date.' => 'Su instalación de Movable Type ya está actualizada.', # Translate - No russian chars

## tmpl/cms/cfg_web_services.tmpl
	'Web Services Settings' => 'Настройки веб-сервисов',
	'Your blog preferences have been saved.' => 'Настройки Вашего блога сохранены.',
	'Six Apart Services' => 'Сервисы Six Apart',
	'Your TypeKey token is used to access Six Apart services like its free Authentication service.' => 'Ваш TypeKey токен используеться для доступа к сервисам Six Apart, например, бесплатному сервису аутентификации.',
	'TypeKey is enabled.' => 'TypeKey включен.',
	'TypeKey token:' => 'TypeKey ', # Translate - No russian chars
	'Clear TypeKey Token' => 'Очистить токен TypeKey',
	'Please click the Save Changes button below to disable authentication.' => 'Пожалуйста, нажмите кнопку Сохранить Изменения для отключения аутентификации.',
	'TypeKey is not enabled.' => 'TypeKey отключен.',
	'or' => 'или',
	'Obtain TypeKey token' => 'Получить токен TypeKey',
	'Please click the Save Changes button below to enable TypeKey.' => 'Por favor, haga clic en el botón Guardar cambios para activar TypeKey.', # Translate - No russian chars
	'External Notifications' => 'Внешние уведомления',
	'Notify of blog updates' => 'Уведомлять об обновлении блога',
	'When this blog is updated, Movable Type will automatically notify the selected sites.' => 'Movable Type автоматически уведомит выбранные сайт когда блог будет обновлен.',
	'Note: This option is currently ignored since outbound notification pings are disabled system-wide.' => 'Примечание: Эта опция будет проигнорирована поскольку исходящие пинг отключены в системе.',
	'Others:' => 'Другие:',
	'(Separate URLs with a carriage return.)' => '(Вводите URL построчно.)',
	'Recently Updated Key' => 'Обновленный ключ',
	'If you have received a recently updated key (by virtue of your purchase), enter it here.' => 'Если Вы получили новый ключ (после покупки), введите его здесь.',

## tmpl/cms/list_role.tmpl
	'Roles: System-wide' => 'Роли: Вся система',
	'You have successfully deleted the role(s).' => 'Вы успешно удалили роль или роли.',
	'roles' => 'роли',
	'_USER_STATUS_CAPTION' => 'статус',
	'Role Is Active' => 'Роль активна',
	'Role Not Being Used' => 'Роль не используется',

## tmpl/cms/dialog/asset_upload.tmpl
	'You need to configure your blog.' => 'Вам необходимо настроить Ваш блог.',
	'Your blog has not been published.' => 'Ваш блог не был опубликован.',

## tmpl/cms/dialog/restore_upload.tmpl
	'Restore: Multiple Files' => 'Восстановление: несколько файлов',
	'Canceling the process will create orphaned objects.  Are you sure you want to cancel the restore operation?' => 'La cancelación del proceso creará objetos huérfanos. ¿Está seguro de que desea cancelar la operación de restauración?', # Translate - No russian chars
	'Please upload the file [_1]' => 'Por favor, suba el fichero [_1]', # Translate - No russian chars

## tmpl/cms/dialog/asset_list.tmpl
	'Insert Asset' => 'Вставить медиа-ресурс',
	'Upload New File' => 'Загрузить новый файл',
	'Upload New Image' => 'Загрузить новое изображение',
	'Asset Name' => 'Имя медиа-ресурса',
	'Next (s)' => 'Следующий (s)',
	'Insert (s)' => 'Вставить (s)',
	'Insert' => 'Вставить',
	'No assets could be found.' => 'Не найдено ни одного файла мультимедиа.',

## tmpl/cms/dialog/create_association.tmpl
	'No roles exist in this installation. [_1]Create a role</a>' => 'Ningún rol existe en esta instalación. [_1]Crear un rol</a>', # Translate - No russian chars
	'No groups exist in this installation. [_1]Create a group</a>' => 'Ningún grupo existe en esta instalación. [_1]Crear un grupo</a>', # Translate - No russian chars
	'No users exist in this installation. [_1]Create a user</a>' => 'Ningún usuario existe en esta instalación. [_1]Crear un usuario</a>', # Translate - No russian chars
	'No blogs exist in this installation. [_1]Create a blog</a>' => 'Ningún blog existe en esta instalación. [_1]Crear un blog</a>', # Translate - No russian chars

## tmpl/cms/dialog/recover.tmpl
	'Your password has been changed, and the new password has been sent to your email address ([_1]).' => 'Ваш пароль был изменен на новый и выслан на Ваш адрес электоронной почты ([_1]).',
	'Sign in to Movable Type (s)' => 'Войти Movable Type (s)',
	'Sign in to Movable Type' => 'Войти в Movable Type',
	'Password recovery word/phrase' => 'Слово/фраза для восстановления пароля',
	'Recover (s)' => 'Восстановить (s)',
	'Recover' => 'Восстановить',
	'Go Back (x)' => 'Вернуться',

## tmpl/cms/dialog/comment_reply.tmpl
	'Reply to comment' => 'Responder al comentario', # Translate - No russian chars
	'On [_1], [_2] commented on [_3]' => 'En [_1], [_2] comentó en [_3]', # Translate - No russian chars
	'Preview of your comment' => 'Vista previa del comentario', # Translate - No russian chars
	'Your reply:' => 'Su respuesta:', # Translate - No russian chars
	'Submit reply (s)' => 'Отправить ответ (s)',
	'Preview reply (v)' => 'Просмотреть ответ (v)',
	'Re-edit reply (r)' => 'Изменить ответ (r)',
	'Re-edit' => 'Изменить',

## tmpl/cms/dialog/asset_options.tmpl
	'File Options' => 'Опции файлов',
	'The file named \'[_1]\' has been uploaded. Size: [quant,_2,byte,bytes].' => 'Файл \'[_1]\' был загружен. Размер: [quant,_2,байт,байта,байтов].',
	'Create entry using this uploaded file' => 'Создать запись используя этот файл',
	'Create a new entry using this uploaded file.' => 'Создать новую запись использующую этот файл.',
	'Finish (s)' => 'Завершить (s)',
	'Finish' => 'Завершить',

## tmpl/cms/dialog/refresh_templates.tmpl
	'Refresh Template Set' => 'Обновление набора шаблонов',
	'Refresh [_1] template set' => 'Обновить набор шаблонов для [_1]',
	'Updates current templates while retaining any user-created or user-modified templates.' => 'Обновить текущий шаблоны исключая созданные или изменненые пользователем.',
	'Apply a new template set' => 'Применить новый набор шаблонов',
	'Deletes all existing templates and install the selected template set.' => 'Удалить все существующие шаблоны и установить выбранные набор шаблонов.',
	'Reset to factory defaults' => 'Сбросить в заводские настройки',
	'Deletes all existing templates and installs factory default template set.' => 'Удалить все существующие шаблоны и установить заводской набор шаблонов по умолчанию.',
	'Make backups of existing templates first' => 'Сделать резервные копии текущих шаблонов',
	'You have requested to <strong>refresh the current template set</strong>. This action will:' => 'Вы выбрали <strong>обновление текущего набора шаблонов</strong>. Эта операция включает следующие:',
	'potentially install new templates' => 'возможно будут установлены новые шаблоны',
	'overwrite some existing templates with new template code' => 'некоторые из существующих шаблонов будут заменены новым кодом шаблонов',
	'backups will be made of your templates and can be accessed through your backup filter' => 'будет сделана резервная копия Ваших шаблонов которые можно будет увидеть через фильтр резервных копий',
	'You have requested to <strong>apply a new template set</strong>. This action will:' => 'Вы выбрали <strong>применить новый набор шаблонов</strong>. Будет выполнено следующее:',
	'delete all of the templates in your blog' => 'будут удалены все шаблоны Вашего блога',
	'install new templates from the selected template set' => 'будут установлены новые шаблоны из выбраного набора',
	'Are you sure you wish to continue?' => 'Вы уверены что хотите продолжить?',

## tmpl/cms/dialog/adjust_sitepath.tmpl
	'Confirm Publishing Configuration' => 'Confirmar configuración de publicación', # Translate - No russian chars
	'URL is not valid.' => 'La URL no es válida.', # Translate - No russian chars
	'You can not have spaces in the URL.' => 'No puede introducir espacios en la URL.', # Translate - No russian chars
	'You can not have spaces in the path.' => 'No puede introducir espacios en la ruta.', # Translate - No russian chars
	'Path is not valid.' => 'La ruta no es válida.', # Translate - No russian chars

## tmpl/cms/dialog/asset_replace.tmpl
	'A file named \'[_1]\' already exists. Do you want to overwrite this file?' => 'El fichero llamado \'[_1]\' ya existe. ¿Desea sobreescribirlo?', # Translate - No russian chars

## tmpl/cms/dialog/restore_end.tmpl
	'An error occurred during the restore process: [_1] Please check your restore file.' => 'Ocurrió un error durante el proceso de restauración: [_1] Por favor, compruebe el fichero de restauración.', # Translate - No russian chars
	'View Activity Log (v)' => 'Посмотреть историю действий (v)',
	'All data restored successfully!' => '¡Se restauraron todos los datos correctamente!', # Translate - No russian chars
	'Close (s)' => 'Закрыть (s)',
	'Next Page' => 'Следующая страница',
	'The page will redirect to a new page in 3 seconds. [_1]Stop the redirect.[_2]' => 'La página le redireccionará a una nueva en 3 segundos. [_1]Parar la redirección.[_2]', # Translate - No russian chars

## tmpl/cms/dialog/restore_start.tmpl
	'Restoring...' => 'Restaurando...', # Translate - No russian chars

## tmpl/cms/dialog/entry_notify.tmpl
	'Send a Notification' => 'Разослать уведомления',
	'You must specify at least one recipient.' => 'Необходимо указать хотябы одного адресата.',
	'Your blog\'s name, this entry\'s title and a link to view it will be sent in the notification.  Additionally, you can add a  message, include an excerpt of the entry and/or send the entire entry.' => 'В уведомление будут включены название Вашего блога, заголовок этой записи и ссылка. Дополнительно Вы можете добавить в сообщение ткст, включая краткое изложение записи и/или полный текст записи',
	'Recipients' => 'Получатели',
	'Enter email addresses on separate lines, or comma separated.' => 'Перечислите email адреса построчно или через запятую.',
	'All addresses from Address Book' => 'Все адреса из адресной книги',
	'Optional Message' => 'Сообщение (необязательно)',
	'Optional Content' => 'Содержание (необязательно)',
	'(Entry Body will be sent without any text formatting applied)' => '(Тело сообщения будет отослано без форматирования)',
	'Send notification (s)' => 'Отправить уведомление (s)',
	'Send' => 'Отправить',

## tmpl/cms/dialog/asset_options_image.tmpl
	'Display image in entry' => 'Mostrar imagen en la entrada', # Translate - No russian chars
	'Alignment' => 'Alineación', # Translate - No russian chars
	'Left' => 'Izquierda', # Translate - No russian chars
	'Center' => 'Centro', # Translate - No russian chars
	'Right' => 'Derecha', # Translate - No russian chars
	'Use thumbnail' => 'Usar miniatura', # Translate - No russian chars
	'width:' => 'ancho:', # Translate - No russian chars
	'pixels' => 'píxeles', # Translate - No russian chars
	'Link image to full-size version in a popup window.' => 'Enlazar la versión original de la imagen en un popup.', # Translate - No russian chars
	'Remember these settings' => 'Recordar estas opciones', # Translate - No russian chars

## tmpl/cms/restore_end.tmpl
	'Make sure that you remove the files that you restored from the \'import\' folder, so that if/when you run the restore process again, those files will not be re-restored.' => 'Asegúrese de que elimina los ficheros que ha restaurado de la carpeta \'importar\', por si ejecuta el proceso en otra ocasión que éstos no vuelvan a restaurar.', # Translate - No russian chars
	'An error occurred during the restore process: [_1] Please check activity log for more details.' => 'Ocurrió un error durante el proceso de restauración: [_1] Por favor, compruebe el registro de actividad para más detalles.', # Translate - No russian chars

## tmpl/cms/import.tmpl
	'You must select a blog to import.' => 'Debe seleccionar un blog a importar.', # Translate - No russian chars
	'Transfer weblog entries into Movable Type from other Movable Type installations or even other blogging tools or export your entries to create a backup or copy.' => 'Transfiere las entradas de un weblog en Movable Type desde otras instalaciones de Movable Type o incluso otras herramientas de blogs, o exporta sus entradas para crear una copia de seguridad.', # Translate - No russian chars
	'Import data into' => 'Importar datos en', # Translate - No russian chars
	'Select a blog to import.' => 'Seleccione un blog para importar.', # Translate - No russian chars
	'Importing from' => 'Importar desde', # Translate - No russian chars
	'Ownership of imported entries' => 'Autoría de las entradas importadas', # Translate - No russian chars
	'Import as me' => 'Importar como yo mismo', # Translate - No russian chars
	'Preserve original user' => 'Preservar autor original', # Translate - No russian chars
	'If you choose to preserve the ownership of the imported entries and any of those users must be created in this installation, you must define a default password for those new accounts.' => 'Si selecciona preservar la autoría de las entradas importadas y se debe crear alguno de estos usarios durante en esta instalación, debe establecer una contraseña predefinida para estas nuevas cuentas.', # Translate - No russian chars
	'Default password for new users:' => 'Contraseña para los nuevos usuarios:', # Translate - No russian chars
	'You will be assigned the user of all imported entries.  If you wish the original user to keep ownership, you must contact your MT system administrator to perform the import so that new users can be created if necessary.' => 'Se le asignarán todas las entradas importadas. Si desea que las entradas mantengan los propietarios originales, debe contacar con su administrador de Movable Type para que él realice la importación y así se puedan crear los nuevos usuarios en caso de ser necesario.', # Translate - No russian chars
	'Upload import file (optional)' => 'Subir fichero de importación (opcional)', # Translate - No russian chars
	'If your import file is located on your computer, you can upload it here.  Otherwise, Movable Type will automatically look in the \'import\' folder of your Movable Type directory.' => 'Si el fichero de importación está situado en su PC, puede subirlo aquí. Si no, Movable Type comprobará automáticamente la carpeta \'folder\' en el directorio de Movable Type.', # Translate - No russian chars
	'More options' => 'Más opciones', # Translate - No russian chars
	'Import File Encoding' => 'Codificación del fichero de importación', # Translate - No russian chars
	'By default, Movable Type will attempt to automatically detect the character encoding of your import file.  However, if you experience difficulties, you can set it explicitly.' => 'Por defecto, Movable Type intentará detectar automáticamente la codificación del fichero a importar. Sin embargo, si experimenta dificultados, puede especificarlo explícitamente.', # Translate - No russian chars
	'<mt:var name="display_name">' => '<mt:var name="display_name">', # Translate - Not translated
	'Default category for entries (optional)' => 'Categoría predefinida de las entradas (opcional)', # Translate - No russian chars
	'You can specify a default category for imported entries which have none assigned.' => 'Puede especificar una categoría predefinida para las entradas importadas que no tengan ninguna asignada.', # Translate - No russian chars
	'Select a category' => 'Seleccione una categoría', # Translate - No russian chars
	'Import Entries (s)' => 'Importar entradas (s)', # Translate - No russian chars
	'Import Entries' => 'Importar entradas', # Translate - No russian chars

## tmpl/cms/list_folder.tmpl
	'Manage Folders' => 'Управление папками',
	'Your folder changes and additions have been made.' => 'Ваши изменения папки были сохранены.',
	'You have successfully deleted the selected folder.' => 'Вы успешно удалили выбранную папку.',
	'Delete selected folders (x)' => 'Удалить отмеченные папки (x)',
	'Create top level folder' => 'Создать папку верхнего уровня',
	'New Parent [_1]' => 'Новый корень [_1]',
	'Create Folder' => 'Создать папку',
	'Top Level' => 'Корень',
	'Create Subfolder' => 'Создать под-папку',
	'Move Folder' => 'Переместить папку',
	'Move' => 'Переместить',
	'[quant,_1,page,pages]' => '[quant,_1,страница,страници,страниц]',
	'No folders could be found.' => 'Не найдено ни одной папки.',

## tmpl/cms/cfg_trackbacks.tmpl
	'TrackBack Settings' => 'Настройки Трэкбэков',
	'Your TrackBack preferences have been saved.' => 'Настройки Трэкбэков были сохранены.',
	'Note: TrackBacks are currently disabled at the system level.' => 'Примечание: на данный момент Трэкбэки отключены в системе.',
	'If enabled, TrackBacks will be accepted from any source.' => 'Если разрешено, то Трэкбэки будут приниматься от любых источников.',
	'TrackBack Policy' => 'Политика Трэкбэков',
	'Moderation' => 'Модерация',
	'Hold all TrackBacks for approval before they\'re published.' => 'Все Трэкбэки должны быть одобрены перед публикацией.',
	'Specify when Movable Type should notify you of new TrackBacks if at all.' => 'Укажите, должен ли Movable Type уведомлять Вас о новых Трэкбэках.',
	'TrackBack Options' => 'Настройки Трэкбэков',
	'TrackBack Auto-Discovery' => 'Авто-обнаружение Трэкбэков',
	'If you turn on auto-discovery, when you write a new entry, any external links will be extracted and the appropriate sites automatically sent TrackBacks.' => 'Если Вы включите автоматическое обнаружение Трэкбэков, то при написании новой статьи все упомянутые в ней ссылки будут проверены и на соответствующие сайты будут посланы Трэкбэки.',
	'Enable External TrackBack Auto-Discovery' => 'Разрешить автообнаружение внешних Трэкбэков',
	'Setting Notice' => 'Замечание',
	'Note: The above option may be affected since outbound pings are constrained system-wide.' => 'Примечание: вышеуказанные настройки могут быть изменены поскольку исходящие пинги ограничены системными настройками.',
	'Note: The above option is currently ignored since outbound pings are disabled system-wide.' => 'Примечание: настройка на данный момент проигнорирована поскольку исходящие пинг отключены в системе.',
	'Enable Internal TrackBack Auto-Discovery' => 'Разрешить автообнаружение внутренних Трэкбэков',

## tmpl/cms/cfg_system_users.tmpl
	'System: User Settings' => 'Система: Настройка пользователей',
	'(None selected)' => '(Нет выбранных)',
	'User Registration' => 'Регистрация пользователей',
	'Allow Registration' => 'Разрешить регистрацию',
	'Select a system administrator you wish to notify when commenters successfully registered themselves.' => 'Seleccione un administrar del sistema a quien desee que se le remitan notificaciones cuando los comentaristas se registren.', # Translate - No russian chars
	'Allow commenters to register to Movable Type' => 'Разрешить комментаторам регистрироваться в Movable Type',
	'Notify the following administrators upon registration:' => 'Уведомлять следующих администраторов о регистрациях:',
	'Select Administrators' => 'Выберите администраторов',
	'Clear' => 'Очистить',
	'Note: System Email Address is not set. Emails will not be sent.' => 'Примечание: Системный адрес Email не установлен. Почта не будет отсылаться.',
	'New User Defaults' => 'Настройки по умолчанию для новых пользователей',
	'Personal blog' => 'Личный блог',
	'Check to have the system automatically create a new personal blog when a user is created in the system. The user will be granted a blog administrator role on the blog.' => 'Verifique si tiene el sistema automático de creación de un nuevo blog personal cuando un usuario se crea en el sistema.  El usuario sera promovido al rol de administrador en el blog.', # Translate - No russian chars
	'Automatically create a new blog for each new user' => 'Автоматически создавать новый блог для каждого нового пользователя',
	'Personal blog clone source' => 'Источник для клонирования личного блога',
	'Select a blog you wish to use as the source for new personal blogs. The new blog will be identical to the source except for the name, publishing paths and permissions.' => 'Seleccionar el blog que usted desee utilizar como fuente para los nuevos blogs personales. El nuevo blog será así idéntificado a la fuente, a excepción del nombre, las rutas de publicación y las permisiones.', # Translate - No russian chars
	'Default Site URL' => 'URL сайта по умолчанию',
	'Define the default site URL for new blogs. This URL will be appended with a unique identifier for the blog.' => 'Defina por defecto la URL del sitio para los nuevos blogs.  Esta URL ', # Translate - No russian chars
	'Default Site Root' => 'Корневой каталог сайта',
	'Define the default site root for new blogs. This path will be appended with a unique identifier for the blog.' => 'Defina por defecto la ruta de publicación para los nuevos blogs. Esta ruta será completada con un identificador único para el blog', # Translate - No russian chars
	'Default User Language' => 'Язык пользователей по умолчанию',
	'Define the default language to apply to all new users.' => 'Establezca el idioma predefinido a aplicar a los nuevos usuarios.', # Translate - No russian chars
	'Default Timezone' => 'Часовой пояс по умолчанию',
	'Default Tag Delimiter' => 'Разделитель меток',
	'Define the default delimiter for entering tags.' => 'Seleccione el separador predefinido al introducir etiquetas.', # Translate - No russian chars
	'Comma' => 'Запятая',
	'Space' => 'Пробел',

## tmpl/cms/upgrade_runner.tmpl
	'Initializing database...' => 'Inicializando base la de datos...', # Translate - No russian chars
	'Upgrading database...' => 'Actualizando la base de datos...', # Translate - No russian chars
	'Installation complete!' => '¡Instalación finalizada!', # Translate - No russian chars
	'Upgrade complete!' => '¡Actualización finalizada!', # Translate - No russian chars
	'Starting installation...' => 'Comenzando la instalación...', # Translate - No russian chars
	'Starting upgrade...' => 'Comenzando actualización...', # Translate - No russian chars
	'Error during installation:' => 'Error durante la instalación:', # Translate - No russian chars
	'Error during upgrade:' => 'Error durante la actualización:', # Translate - No russian chars
	'Return to Movable Type (s)' => 'Volver a Movable Type (s)', # Translate - No russian chars
	'Your database is already current.' => 'Su base de datos está al día.', # Translate - No russian chars

## tmpl/cms/list_template.tmpl
	'Blog Templates' => 'Шаблоны блога',
	'Blog Publishing Settings' => 'Настройки публикации блога',
	'All Templates' => 'Все шаблоны',
	'You have successfully deleted the checked template(s).' => 'Отмеченые шаблоны были удалены.',
	'Your templates have been published.' => 'Шаблоны были опубликованы.',
	'Create Archive Template:' => 'Создать архивный шаблон:',
	'Create [_1] template' => 'Создать новый шаблон для [_1]',

## tmpl/cms/install.tmpl
	'Create Your Account' => 'Создать Ваш Аккаунт',
	'The initial account name is required.' => 'Se necesita el nombre de la cuenta inicial.', # Translate - No russian chars
	'Password recovery word/phrase is required.' => 'Se necesita la palabra/frase de recuperación de contraseña.', # Translate - No russian chars
	'Do you want to proceed with the installation anyway?' => 'Ву уверены что хотите продолжить установку?',
	'Before you can begin blogging, you must create an administrator account for your system. When you are done, Movable Type will then initialize your database.' => 'Antes de poder comenzar a publicar, debe crear una cuenta de administrador para el sistema. Cuando lo haya hecho, Movable Type inicializará la base de datos.', # Translate - No russian chars
	'To proceed, you must authenticate properly with your LDAP server.' => 'Para proceder, debe autentificarse correctamente en su servidor LDAP.', # Translate - No russian chars
	'The name used by this user to login.' => 'El nombre utilizado por este usario para iniciar su sesión.', # Translate - No russian chars
	'The name used when published.' => 'El nombre utilizado al publicar.', # Translate - No russian chars
	'The user&rsquo;s email address.' => 'La dirección de correo electrónico del usuario', # Translate - No russian chars
	'Language' => 'Язык',
	'The user&rsquo;s preferred language.' => 'El idioma preferido del usuario.', # Translate - No russian chars
	'Select a password for your account.' => 'Seleccione una contraseña para su cuenta.', # Translate - No russian chars
	'Password Confirm' => 'Подтверждение пароля',
	'Repeat the password for confirmation.' => 'Repita la contraseña para confirmación.', # Translate - No russian chars
	'This word or phrase will be required to recover your password if you forget it.' => 'Esta palabra o frase será necesaria para recuperar su contraseña en caso de olvido.', # Translate - No russian chars
	'Your LDAP username.' => 'Su usuario en el servidor LDAP.', # Translate - No russian chars
	'Enter your LDAP password.' => 'Su contraseña en el servidor LDAP.', # Translate - No russian chars

## tmpl/cms/list_banlist.tmpl
	'IP Banning Settings' => 'Настройки блокировок IP',
	'IP addresses' => 'Адреса IP',
	'Delete selected IP Address (x)' => 'Удалить выбранные IP адреса (x)',
	'You have added [_1] to your list of banned IP addresses.' => 'Agregó [_1] a su lista de direcciones IP bloqueadas.', # Translate - No russian chars
	'You have successfully deleted the selected IP addresses from the list.' => 'Eliminó correctamente las direcciones IP seleccionadas.', # Translate - No russian chars
	'Ban IP Address' => 'Bloquear la dirección IP', # Translate - No russian chars
	'Date Banned' => 'Fecha de bloqueo', # Translate - No russian chars

## tmpl/cms/dashboard.tmpl
	'Select a Widget...' => 'Выберите виджет...',
	'Your Dashboard has been updated.' => 'Ваша Панель Управления обновлена.',
	'You have attempted to use a feature that you do not have permission to access. If you believe you are seeing this message in error contact your system administrator.' => 'Ha intentado usar una característica para la que no tiene permisos. Si cree que está viendo este mensaje por error, contacte con sus administrador del sistema.', # Translate - No russian chars
	'The directory you have configured for uploading avatars is not writable. In order to enable users to upload userpics, please make the following directory writable by your web server: [_1]' => 'No se puede escribir en el directorio configurado para subir los avatares. Para permitir a los usuarios que suban sus avatares, por favor, asegúrese de que el servidor web puede escribir en el siguiente directorio: [_1]', # Translate - No russian chars
	'Your dashboard is empty!' => 'Ваша Панель Управления пуста!',

## tmpl/cms/edit_author.tmpl
	'Edit Profile' => 'Изменить личные данные',
	'This profile has been updated.' => 'Личные данные были обновлены.',
	'A new password has been generated and sent to the email address [_1].' => 'Se ha generado y enviado a la dirección de correo electrónico [_1] una nueva contraseña.', # Translate - No russian chars
	'Your Web services password is currently' => 'Ваш текущий пароль для веб-сервисов',
	'_WARNING_PASSWORD_RESET_SINGLE' => 'Va a reiniciar la contraseña de "[_1]". Se enviará una nueva contraseña aleatoria que se enviará directamente a su dirección de correo electrónico ([_2]). ¿Desea continuar?', # Translate - No russian chars
	'Error occurred while removing userpic.' => 'Ocurrió un error durante la eliminación del avatar.', # Translate - No russian chars
	'Status of user in the system. Disabling a user removes their access to the system but preserves their content and history.' => 'Estado del usuario en el sistema. Al deshabilitar el usuario, se impide su acceso al sistema pero se preservan sus contenidos e históricos.', # Translate - No russian chars
	'_USER_PENDING' => 'Pendiente', # Translate - No russian chars
	'The username used to login.' => 'El nombre de usuario utilizado para la identificación en el sistema.', # Translate - No russian chars
	'External user ID' => 'Usuario externo ID', # Translate - No russian chars
	'The email address associated with this user.' => 'La dirección de correo asociada a este usuario.', # Translate - No russian chars
	'The URL of the site associated with this user. eg. http://www.movabletype.com/' => 'La URL del sitio asociada al usuario. p.e. http://www.movabletype.com/', # Translate - No russian chars
	'Userpic' => 'Avatar', # Translate - No russian chars
	'The image associated with this user.' => 'La imagen asociada al usuario.', # Translate - No russian chars
	'Select Userpic' => 'Выбрать Аватар',
	'Remove Userpic' => 'Удалить Аватар',
	'Change Password' => 'Изменить пароль',
	'Current Password' => 'Текущий пароль',
	'Existing password required to create a new password.' => 'La contraseña actual es necesaria para crear una nueva.', # Translate - No russian chars
	'Initial Password' => 'Пароль',
	'Enter preferred password.' => 'Введите пароль.',
	'New Password' => 'Новый пароль',
	'Enter the new password.' => 'Введите пароль.',
	'Confirm Password' => 'Введите пароль еще раз для проверки',
	'This word or phrase will be required to recover a forgotten password.' => 'Esta palabra o frase será necesaria para recuperar una contraseña olvidada.', # Translate - No russian chars
	'Preferred language of this user.' => 'Язык по умолчанию.',
	'Text Format' => 'Формат текст',
	'Preferred text format option.' => 'Предпочтительный формат текста.',
	'(Use Blog Default)' => '(Использовать настройки блога)',
	'Tag Delimiter' => 'Разделитель меток',
	'Preferred method of separating tags.' => 'Предпочтительный разделитель меток.',
	'Web Services Password' => 'Пароль для веб-сервисов',
	'For use by Activity feeds and with XML-RPC and Atom-enabled clients.' => 'Utilizada por las fuentes de sindicación de actividad y los clientes XML-RPC y Atom.', # Translate - No russian chars
	'Reveal' => 'Показать',
	'System Permissions' => 'Права доступа',
	'Create personal blog for user' => 'Создать персональный блог пользователя',
	'Create User (s)' => 'Создать пользователя (s)',
	'Save changes to this author (s)' => 'Guardar cambios de este autor (s)', # Translate - No russian chars
	'_USAGE_PASSWORD_RESET' => 'Puede iniciar la recuperación de la contraseña en nombre de este usuario. Si lo hace, se enviará un correo a <strong>[_1]</strong> con una nueva contraseña aleatoria.', # Translate - No russian chars
	'Initiate Password Recovery' => 'Iniciar recuperación de contraseña', # Translate - No russian chars

## tmpl/cms/cfg_prefs.tmpl
	'You must set your Blog Name.' => 'Debe configurar el nombre del blog.', # Translate - No russian chars
	'You did not select a timezone.' => 'No seleccionó ninguna zona horaria.', # Translate - No russian chars
	'Name your blog. The blog name can be changed at any time.' => 'Nombre del blog. Se puede modificar en cualquier momento.', # Translate - No russian chars
	'Enter a description for your blog.' => 'Введите описание Вашего блога.',
	'License' => 'Лицензия',
	'Your blog is currently licensed under:' => 'Ваш блог сейчас имеет следующую лицензию:',
	'Change license' => 'Изменить лицензию',
	'Remove license' => 'Удалить лицензию',
	'Your blog does not have an explicit Creative Commons license.' => 'У Вашего блога нет определенной лицензии Creative Commons.',
	'Select a license' => 'Выбрать лицензию',

## tmpl/cms/list_entry.tmpl
	'Entries Feed' => 'RSS Feed записей',
	'Pages Feed' => 'RSS Feed страниц',
	'The entry has been deleted from the database.' => 'Записи были удалены из базы данных.',
	'The page has been deleted from the database.' => 'Страницы были удалены из базы данных.',
	'Show only entries where' => 'Показывать только записи где',
	'Show only pages where' => 'Показывать только страницы где',
	'published' => 'опубликовано',
	'unpublished' => 'не опубликовано',
	'scheduled' => 'запланировано',
	'Select An Asset:' => 'Выбрать медиа-ресурс:',
	'Asset Search...' => 'Поиск медиа-ресурса...',
	'Recent Assets...' => 'Последние медиа-ресурсы...',
	'Select A User:' => 'Выбрать пользователя:',
	'User Search...' => 'Поиск пользователя...',
	'Recent Users...' => 'Последние пользователи...',

## tmpl/cms/cfg_registration.tmpl
	'Registration Settings' => 'Настройки регистрации',
	'Allow registration for Movable Type.' => 'Расшерить регистрацию Movable Type.',
	'Registration Not Enabled' => 'Регистрация отключена',
	'Note: Registration is currently disabled at the system level.' => 'Примечание: В текущий момент регистрация отключена в системе.',
	'Authentication Methods' => 'Методы аутентификации',
	'Note: You have selected to accept comments from authenticated commenters only but authentication is not enabled. In order to receive authenticated comments, you must enable authentication.' => 'Nota: Seleccionó aceptar comentarios solo de comentaristas autentificados, pero la autentificación no está activada. Para recibir comentarios autentificados, debe activar la autentificación.', # Translate - No russian chars
	'Native' => 'Встроенный',
	'Require E-mail Address for Comments via TypeKey' => 'Requerir dirección de correo en los comentarios vía TypeKey', # Translate - No russian chars
	'If enabled, visitors must allow their TypeKey account to share e-mail address when commenting.' => 'Si está activado, los visitantes deberán permitir en su cuenta de TypeKey que comparta la dirección de correo al comentar.', # Translate - No russian chars
	'Setup TypeKey' => 'Настройка TypeKey',
	'OpenID providers disabled' => 'OpenID провайдеры отключены',
	'Required module (Digest::SHA1) for OpenID commenter authentication is missing.' => 'No se encuentra el módulo necesario (Digest::SHA1) para la autentificación de comentaristas con OpenID.', # Translate - No russian chars

## tmpl/cms/edit_blog.tmpl
	'Your blog configuration has been saved.' => 'Se ha guardado la configuración de su blog.', # Translate - No russian chars
	'You must set your Site URL.' => 'Debe definir la URL de su sitio.', # Translate - No russian chars
	'Your Site URL is not valid.' => 'La URL de su sitio no es válida.', # Translate - No russian chars
	'You can not have spaces in your Site URL.' => 'No puede haber espacios en la URL de su sitio.', # Translate - No russian chars
	'You can not have spaces in your Local Site Path.' => 'No puede haber espacios en la ruta local de su sitio.', # Translate - No russian chars
	'Your Local Site Path is not valid.' => 'La ruta local de su sitio no es válida.', # Translate - No russian chars
	'Blog Details' => 'Информация о блоге',
	'Enter the URL of your public website. Do not include a filename (i.e. exclude index.html). Example: http://www.example.com/weblog/' => 'Introduzca la URL de su web público. No incluya ningún nombre de fichero (p.e. index.html). Ejemplo: http://www.ejemplo.com/weblog/', # Translate - No russian chars
	'Enter the path where your main index file will be located. An absolute path (starting with \'/\') is preferred, but you can also use a path relative to the Movable Type directory. Example: /home/melody/public_html/weblog' => 'Introduzca la ruta donde se situará el fichero índice principal. Se aconseja una ruta absoluta (que comienzan con \'/\'), pero también puede especificar una ruta relativa al directorio de Movable Type. Ejemplo: /home/melody/public_html/weblog', # Translate - No russian chars
	'Create Blog (s)' => 'Crear blog (s)', # Translate - No russian chars

## tmpl/cms/widget/blog_stats.tmpl
	'Error retrieving recent entries.' => 'Ошибка загрузки последних записей..',
	'Loading recent entries...' => 'Загрузка последних записей...',
	'Jan.' => 'Янв',
	'Feb.' => 'Фев',
	'July.' => 'Июль',
	'Aug.' => 'Авг',
	'Sept.' => 'Сен',
	'Oct.' => 'Окт',
	'Nov.' => 'Ноя',
	'Dec.' => 'Дек',
	'Movable Type was unable to locate your \'mt-static\' directory. Please configure the \'StaticFilePath\' configuration setting in your mt-config.cgi file, and create a writable \'support\' directory underneath your \'mt-static\' directory.' => 'Movable Type no pudo localizar el directorio \'mt-static\'. Por favor, configure la opción \'StaticFilePath\' en el fichero mt-config.cgi y cree un directorio \'support\' en el que se pueda escribir dentro del directorio \'mt-static\'.', # Translate - No russian chars
	'Movable Type was unable to write to its \'support\' directory. Please create a directory at this location: [_1], and assign permissions that will allow the web server write access to it.' => 'Movable Type no pudo escribir en el directorio \'support\'. Por favor, cree un directorio en este lugar: [_1], y asígnele permisos para permitir que el servidor web pueda acceder y escribir en él.', # Translate - No russian chars
	'[_1] [_2] - [_3] [_4]' => '[_1] [_2] - [_3] [_4]', # Translate - Not translated
	'You have <a href=\'[_3]\'>[quant,_1,comment,comments] from [_2]</a>' => 'У Вас <a href=\'[_3]\'>[quant,_1,комментарий,комментария,комментариев] от [_2]</a>',
	'You have <a href=\'[_3]\'>[quant,_1,entry,entries] from [_2]</a>' => 'У Вас <a href=\'[_3]\'>[quant,_1,запись,записи,записей] от [_2]</a>',

## tmpl/cms/widget/blog_stats_recent_entries.tmpl
	'[quant,_1,entry,entries] tagged &ldquo;[_2]&rdquo;' => '[quant,_1,запись,записи,записей] с меткой &ldquo;[_2]&rdquo;',
	'...' => '...', # Translate - Not translated
	'Posted by [_1] [_2] in [_3]' => 'Опубликовал [_1] [_2] в теме [_3]',
	'Posted by [_1] [_2]' => 'Опубликовано [_1] [_2]',
	'Tagged: [_1]' => 'Метки: [_1]',
	'View all entries tagged &ldquo;[_1]&rdquo;' => 'Просмотреть все записи с меткой &ldquo;[_1]&rdquo;',
	'No entries available.' => 'Нет доступных записей.',

## tmpl/cms/widget/new_user.tmpl
	'Welcome to Movable Type, the world\'s most powerful blogging, publishing and social media platform. To help you get started we have provided you with links to some of the more common tasks new users like to perform:' => 'Добро пожаловать в Movable Type, самую мощную в мире систему для блоггинга, публикаций и социальных . Для того, чтобы помочь Вам начать мы предоставили несколько ссылок на наиболее часто встречающиеся задачи которые приходиться решать новым пользователям:',
	'Write your first post' => 'Напишите Ваше первое сообщение',
	'What would a blog be without content? Start your Movable Type experience by creating your very first post.' => 'Что такое блог без содержания? Начните Ваше знакомство с Movable Type с написания Ваше самого первого сообщения.',
	'Design your blog' => 'Оформите Ваш блог.',
	'Customize the look and feel of your blog quickly by selecting a design from one of our professionally designed themes.' => 'Измените оформление Вашего блога выбрав одну из наших тем разработанных профессионалами.',
	'Explore what\'s new in Movable Type 4' => 'Узнайте что нового в Movable Type 4',
	'Whether you\'re new to Movable Type or using it for the first time, learn more about what this tool can do for you.' => 'Если Вы только познакомились с Movable Type, изучите этот продукт подробнее.',

## tmpl/cms/widget/new_install.tmpl
	'Thank you for installing Movable Type' => 'Спасибо, что установили Movable Type',
	'Congratulations on installing Movable Type, the world\'s most powerful blogging, publishing and social media platform. To help you get started we have provided you with links to some of the more common tasks new users like to perform:' => 'Поздравляем с установкой Movable Type, самой мощной в мире платформы для блоггинга, публикаций и социальных сетей:',
	'Add more users to your blog' => 'Добавить пользователей в этот блог',
	'Start building your network of blogs and your community now. Invite users to join your blog and promote them to authors.' => 'Начните строить Вашу сеть блогов и Вашу коммунити прямо сейчас. Пригласите пользователей присоединиться к Вашему блогу и сделайте их авторами.',

## tmpl/cms/widget/new_version.tmpl
	'What\'s new in Movable Type [_1]' => 'Что нового в Movable Type [_1]',
	'Congratulations, you have successfully installed Movable Type [_1]. Listed below is an overview of the new features found in this release.' => 'Поздравляем, Вы успешно установили Movable Type [_1]! Ниже перечислены новые возможности доступные этой версии.',

## tmpl/cms/widget/mt_shortcuts.tmpl
	'Trackbacks' => 'Трэкбэки',
	'Import Content' => 'Импорт содержания',
	'Blog Preferences' => 'Установки блога',

## tmpl/cms/widget/this_is_you.tmpl
	'This is you' => 'Это Вы.',
	'Your <a href="[_1]">last entry</a> was [_2] in <a href="[_3]">[_4]</a>.' => 'Ваша <a href="[_1]">последняя запись</a> была [_2] в блоге <a href="[_3]">[_4]</a>.',
	'You have <a href="[_1]">[quant,_2,draft,drafts]</a>.' => 'У Вас <a href="[_1]">[quant,_2,черновик,червновика,черновиков]</a>.',
	'You\'ve written <a href="[_1]">[quant,_2,entry,entries]</a> with <a href="[_3]">[quant,_4,comment,comments]</a>.' => 'Вы создали <a href="[_1]">[quant,_2,запись,записи,записей]</a> с <a href="[_3]">[quant,_4,комментарием,комментариями]</a>.',
	'You\'ve written <a href="[_1]">[quant,_2,entry,entries]</a>.' => 'Вы создали <a href="[_1]">[quant,_2,запись,записи,записей]</a>.',
	'Edit your profile' => 'Изменить Ваши данные',

## tmpl/cms/widget/blog_stats_entry.tmpl
	'Most Recent Entries' => 'Последние записи',
	'View all entries' => 'Просмотр всех записей',

## tmpl/cms/widget/blog_stats_comment.tmpl
	'Most Recent Comments' => 'Последние комментарии',
	'[_1] [_2], [_3] on [_4]' => '[_1] [_2], [_3] на  [_4]', 
	'View all comments' => 'Просмотреть все комментарии',
	'No comments available.' => 'Нет доступных комментариев.',

## tmpl/cms/widget/blog_stats_tag_cloud.tmpl

## tmpl/cms/widget/mt_news.tmpl
	'News' => 'Новости',
	'MT News' => 'Новости MT',
	'Learning MT' => 'Изучаем MT', # Translate - Not translated
	'Hacking MT' => 'Hacking MT', # Translate - Not translated
	'Pronet' => 'Pronet', # Translate - Not translated
	'No Movable Type news available.' => 'Нет новостей о Movable Type.',
	'No Learning Movable Type news available.' => 'Нет новостей о Learning Movable Type.',

## tmpl/cms/widget/custom_message.tmpl
	'Welcome to [_1].' => 'Добро пожаловать в [_1].',
	'You can manage your blog by selecting an option from the menu located to the left of this message.' => 'Puede administrar su blog seleccionando una opción del menú situado a la izquierda de este mensaje.', # Translate - No russian chars
	'If you need assistance, try:' => 'Si necesita ayuda, consulte:', # Translate - No russian chars
	'Movable Type User Manual' => 'Manual del usuario de Movable Type', # Translate - No russian chars
	'http://www.sixapart.com/movabletype/support' => 'http://www.sixapart.com/movabletype/support', # Translate - Not translated
	'Movable Type Technical Support' => 'Soporte técnico de Movable Type', # Translate - No russian chars
	'Movable Type Community Forums' => 'Foros comunitarios de Movable Type', # Translate - No russian chars
	'Save Changes (s)' => 'Сохранить изменения (s)',
	'Change this message.' => 'Cambiar este mensaje.', # Translate - No russian chars
	'Edit this message.' => 'Editar este mensaje.', # Translate - No russian chars

## tmpl/cms/list_category.tmpl
	'Your category changes and additions have been made.' => 'Изменения темы были сохранены.',
	'You have successfully deleted the selected category.' => 'Вы успешно удалили выбранную тему.',
	'categories' => 'темы',
	'Delete selected category (x)' => 'Удалить выбранные темы (x)',
	'Create top level category' => 'Создать тему верхего уровня',
	'Create Category' => 'Создать тему',
	'Collapse' => 'Contraer', # Translate - No russian chars
	'Expand' => 'Ampliar', # Translate - No russian chars
	'Create Subcategory' => 'Создать под-тему',
	'Move Category' => 'Переместить тему',
	'[quant,_1,TrackBack,TrackBacks]' => '[quant,_1,Трэкбэк,Трэкбэка,Трэкбэков]',
	'No categories could be found.' => 'Темы не найдены.',

## tmpl/cms/cfg_system_feedback.tmpl
	'System: Feedback Settings' => 'Система: Настройки обратной связи',
	'Your feedback preferences have been saved.' => 'Ваши настройки обратной связи были сохранены.',
	'Feedback: Master Switch' => 'Feedback: Главный Рубильник',
#	'This will override all individual blog settings.' => '', # Translate - Empty
	'Disable comments for all blogs' => 'Отключить комментарии во всех блогах',
	'Disable TrackBacks for all blogs' => 'Отключить Трэкбэки во всех блогах',
	'Outbound Notifications' => 'Исходящие уведомления',
	'Notification pings' => 'Уведомляющие пинги',
	'This feature allows you to disable sending notification pings when a new entry is created.' => 'Эта опция позволяет отключить посылку пингов уведомления при создании новой записи.',
	'Disable notification pings for all blogs' => 'Отключить уведомляющие пинги для всех блогов',
	'Limit outbound TrackBacks and TrackBack auto-discovery for the purposes of keeping your installation private.' => 'Ограничить исходящие Трэкбэки и авто-нахождение Трэкбэков с целью сохранения приватности Вашей установки.',
	'Allow to any site' => 'Разрешить для любого сайта',
	'(No outbound TrackBacks)' => '(Нет исходящих Трэкбэков)',
	'Only allow to blogs on this installation' => 'Только блогам в этой системе',
	'Only allow the sites on the following domains:' => 'Только сайтам на следующих доменах:',

## tmpl/cms/popup/rebuilt.tmpl
	'Success' => 'OK', # Translate - No russian chars
	'All of your files have been published.' => 'Все файлы были опубликованы.',
	'Your [_1] archives have been published.' => 'Ваши архивы [_1] были опубликованы.',
	'Your [_1] templates have been published.' => 'Ваши шаблоны [_1] были опубликованы.',
	'View your site.' => 'Посмотреть Ваш сайт.',
	'View this page.' => 'Посмотреть эту страницу.',
	'Publish Again (s)' => 'Опубликовать еще раз (s)',
	'Publish Again' => 'Опубликовать еще раз.',

## tmpl/cms/popup/rebuild_confirm.tmpl
	'Publish [_1]' => 'Опубликовать [_1]',
	'Publish <em>[_1]</em>' => 'Опубликовать <em>[_1]</em>',
	'_REBUILD_PUBLISH' => 'Опубликовать',
	'All Files' => 'Все файлы',
	'Index Template: [_1]' => 'Шаблон индекса: [_1]',
	'Only Indexes' => 'Только индексы',
	'Only [_1] Archives' => 'Только архивы [_1]',
	'Publish (s)' => 'Опубликовать (s)',

## tmpl/cms/popup/pinged_urls.tmpl
	'Successful Trackbacks' => 'Успешные Трэкбэки',
	'Failed Trackbacks' => 'Отвергнутые Трэкбэки',
	'To retry, include these TrackBacks in the Outbound TrackBack URLs list for your entry.' => 'Для повторения попытки перечислите эти Трэкбэки в списке исходящих URL Трэкбэков Вашей записи.',

## tmpl/cms/restore_start.tmpl
	'Restoring Movable Type' => 'Восстановление Movable Type',

## tmpl/cms/list_author.tmpl
	'Users: System-wide' => 'Пользователи: Вся система',
	'_USAGE_AUTHORS_LDAP' => 'Lista de todos los usuarios en el sistema de Movable Type. Puede editar los permisos del usuario haciendo clic en el nombre. Puede deshabilitar usuarios activando las casillas junto a su nombre y presionando el botón Deshabilitar. De esta forma, el usuario no podrá acceder a Movable Type.', # Translate - No russian chars
	'You have successfully disabled the selected user(s).' => 'Ha deshabilitado con éxito el/los usuario/s seleccionado/s.', # Translate - No russian chars
	'You have successfully enabled the selected user(s).' => 'Ha habilitado con éxito el/los usuario/s seleccionado/s.', # Translate - No russian chars
	'You have successfully deleted the user(s) from the Movable Type system.' => 'Ha borrado con éxito el/los usuario/s seleccionado/s del sistema de Movable Type.', # Translate - No russian chars
	'The deleted user(s) still exist in the external directory. As such, they will still be able to login to Movable Type Enterprise.' => 'Este usuario borrado aún existe en el directorio externo. Como tal, aún podrán acceder a Movable Type Enterprise.', # Translate - No russian chars
	'You have successfully synchronized users\' information with the external directory.' => 'Sincronizó con éxito la información de los usuarios con el directorio externo.', # Translate - No russian chars
	'Some ([_1]) of the selected user(s) could not be re-enabled because they were no longer found in the external directory.' => 'Algunos ([_1]) de los usuarios seleccionados no pudieron rehabilitarse porque ya no se encuentra en el directorio externo.', # Translate - No russian chars
	'An error occured during synchronization.  See the <a href=\'[_1]\'>activity log</a> for detailed information.' => 'Ocurrió un error durante la sincronización. Para información más detallada, consulte el <a href=\'[_1]\'>registro de actividad</a>.', # Translate - No russian chars
	'Enable selected users (e)' => 'Habilitar usuarios seleccionados (e)', # Translate - No russian chars
	'_USER_ENABLE' => 'Включить',
	'_NO_SUPERUSER_DISABLE' => 'No puede deshabilitarse porque es un administrador del sistema de Movable Type', # Translate - No russian chars
	'Disable selected users (d)' => 'Deshabilitar usuarios seleccionados (d)', # Translate - No russian chars
	'_USER_DISABLE' => 'Отключить',
	'Showing All Users' => 'Показаны все пользователи',

## tmpl/comment/error.tmpl
	'Go Back (s)' => 'Volver', # Translate - No russian chars

## tmpl/comment/signup_thanks.tmpl
	'Thanks for signing up' => 'Gracias por inscribirse', # Translate - No russian chars
	'Before you can leave a comment you must first complete the registration process by confirming your account. An email has been sent to [_1].' => 'Antes de poder comentar, debe completar el proceso de registro confirmando su cuenta. Se le ha enviado un correo a [_1].', # Translate - No russian chars
	'To complete the registration process you must first confirm your account. An email has been sent to [_1].' => 'Para completar el proceso de registro, primeramente debe confirmar su cuenta. Se le ha enviado un correo a [_1].', # Translate - No russian chars
	'To confirm and activate your account please check your inbox and click on the link found in the email we just sent you.' => 'Para confirmar y activar su cuenta, por favor, compruebe su correo y haga clic en el correo que le acabamos de enviar.', # Translate - No russian chars
	'Return to the original entry.' => 'Volver a la entrada original.', # Translate - No russian chars
	'Return to the original page.' => 'Volver a la página original.', # Translate - No russian chars

## tmpl/comment/profile.tmpl
	'Your Profile' => 'Su perfil', # Translate - No russian chars
	'Your login name.' => 'Nombre de su usuario.', # Translate - No russian chars
	'The name appears on your comment.' => 'El nombre que aparece en su comentario.', # Translate - No russian chars
	'Your email address.' => 'Dirección de correo electrónico.', # Translate - No russian chars
	'Select a password for yourself.' => 'Seleccione su contraseña.', # Translate - No russian chars
	'Password recovery' => 'Recuperar contraseña', # Translate - No russian chars
	'This word or phrase will be required to recover the password if you forget it.' => 'Se solicitará esta palabra o frase para recuperar la contraseña si la olvida.', # Translate - No russian chars
	'The URL of your website. (Optional)' => 'La URL del sitio web (opcional)', # Translate - No russian chars
	'Return to the <a href="[_1]">original page</a>.' => 'Volver a la <a href="[_1]">página original</a>.', # Translate - No russian chars

## tmpl/comment/login.tmpl
	'Sign in to comment' => 'Войдите для комментирования',
	'Sign in using' => 'Войти используя',
	'Remember me?' => 'Запомнить?',
	'Not a member?&nbsp;&nbsp;<a href="[_1]">Sign Up</a>!' => 'Не зарегистрированы?&nbsp;&nbsp;¡<a href="[_1]">Подпишитесь</a>!',

## tmpl/comment/register.tmpl
	'Create an account' => 'Crear una cuenta', # Translate - No russian chars
	'Register' => 'Registrarse', # Translate - No russian chars

## tmpl/comment/signup.tmpl

## tmpl/feeds/feed_entry.tmpl
	'Unpublish' => 'Отменить публикацию',
	'More like this' => 'Ещё похожее на это',
	'From this blog' => 'Из этого блога',
	'From this author' => 'От этого автора',
	'On this day' => 'За этот день',

## tmpl/feeds/feed_comment.tmpl
	'On this entry' => 'По этой записи',
	'By commenter identity' => 'По логину комментатора',
	'By commenter name' => 'По имени комментатора',
	'By commenter email' => 'По email комментатора',
	'By commenter URL' => 'По URL комментатора',

## tmpl/feeds/error.tmpl
	'Movable Type Activity Log' => 'Registro de actividad de Movable Type', # Translate - No russian chars

## tmpl/feeds/login.tmpl
	'This link is invalid. Please resubscribe to your activity feed.' => 'Este enlace no es válido. Por favor, resuscríbase a la fuente de sindicación de actividades.', # Translate - No russian chars

## tmpl/feeds/feed_page.tmpl

## tmpl/feeds/feed_ping.tmpl
	'Source blog' => 'Blog origen', # Translate - No russian chars
	'By source blog' => 'Por blog origen', # Translate - No russian chars
	'By source title' => 'Por título origen', # Translate - No russian chars
	'By source URL' => 'Por URL origen', # Translate - No russian chars

## plugins/StyleCatcher/lib/StyleCatcher/CMS.pm
	'Your mt-static directory could not be found. Please configure \'StaticFilePath\' to continue.' => 'No se encontró el directorio mt-static. Por favor, configure el \'StaticFilePath\' para continuar.', # Translate - No russian chars
	'Could not create [_1] folder - Check that your \'themes\' folder is webserver-writable.' => 'No se pudo crear el directorio [_1] - Compruebe que el servidor web puede escribir en la carpeta \'themes\'.', # Translate - No russian chars
	'Error downloading image: [_1]' => 'Error descargando imagen: [_1]', # Translate - No russian chars
	'Successfully applied new theme selection.' => 'Se aplicó con éxito la nueva selección de estilo.', # Translate - No russian chars
	'Invalid URL: [_1]' => 'URL no válida: [_1]', # Translate - No russian chars

## plugins/StyleCatcher/tmpl/view.tmpl
	'Select a Style' => 'Выбор стиля',
	'3-Columns, Wide, Thin, Thin' => '3 колонки, широкая, узкая, узкая',
	'3-Columns, Thin, Wide, Thin' => '3 колонки, узкая, широкая, узкая',
	'2-Columns, Thin, Wide' => '2 колонки, узкая, широкая',
	'2-Columns, Wide, Thin' => '2 колонки, широкая, узкая',
	'2-Columns, Wide, Medium' => '2 колонки, широкая, средняя',
	'None available' => 'Нет доступных',
	'Applying...' => 'Применение...',
	'Apply Design' => 'Применить оформление',
	'Error applying theme: ' => 'Error aplicando tema:', # Translate - No russian chars
	'The selected theme has been applied, but as you have changed the layout, you will need to republish your blog to apply the new layout.' => 'Выбраная темы была применена, но поскольку вы изменили расположение, необходимо опубликовать сайт заново.',
	'The selected theme has been applied!' => 'Выбраная тема была применена!',
	'Error loading themes! -- [_1]' => 'Ошибка загрузки тем! -- [_1]',
	'Stylesheet or Repository URL' => 'Таблица стилей или URL репозитария',
	'Stylesheet or Repository URL:' => 'Таблица стилей или URL репозитария:',
	'Download Styles' => 'Загрузить стили',
	'Current theme for your weblog' => 'Текущая тема Вашего веблога',
	'Current Style' => 'Текущий стиль',
	'Locally saved themes' => 'Локально сохраненные шаблоны',
	'Saved Styles' => 'Сохраненные шаблоны',
	'Default Styles' => 'Шаблоны по умолчанию',
	'Single themes from the web' => 'Одиночные темы из сети',
	'More Styles' => 'Ещё стили',
	'Selected Design' => 'Выбор дизайна',
	'Layout' => 'Расположение',

## plugins/StyleCatcher/stylecatcher.pl
	'StyleCatcher lets you easily browse through styles and then apply them to your blog in just a few clicks. To find out more about Movable Type styles, or for new sources for styles, visit the <a href=\'http://www.sixapart.com/movabletype/styles\'>Movable Type styles</a> page.' => 'StyleCatcher le permite navegar fácilmente por los estilos y aplicarlos a su blog fácilmente. Para más información sobre los estilos de Movable Type, o para encontrar más repositorios de estilos, visite la página de <a href=\'http://www.sixapart.com/movabletype/styles\'>estilos de Movable Type</a>.', # Translate - No russian chars
	'MT 4 Style Library' => 'Библиотека стилей MT 4',
	'A collection of styles compatible with Movable Type 4 default templates.' => 'Una colección de estilos compatible con las plantillas predefinidas de Movable Type.', # Translate - No russian chars
	'MT 3 Style Library' => 'Librería de estilos de MT 3', # Translate - No russian chars
	'A collection of styles compatible with Movable Type 3.3+ default templates.' => 'Una colección de estilos compatible con las plantillas predefinidas de Movable 3.3+.', # Translate - No russian chars
	'Styles' => 'Стили',

## plugins/WXRImporter/WXRImporter.pl
	'Import WordPress exported RSS into MT.' => 'Importar WordPress exported RSS hacia MT.', # Translate - No russian chars
	'WordPress eXtended RSS (WXR)' => 'RSS Extendido de WordPress (WXR)', # Translate - No russian chars
	'Download WP attachments via HTTP.' => 'Descargar adjuntos de WP vía HTTP.', # Translate - No russian chars

## plugins/WXRImporter/lib/WXRImporter/WXRHandler.pm
	'File is not in WXR format.' => 'El fichero no está en el formato WXR.', # Translate - No russian chars
	'Duplicate asset (\'[_1]\') found.  Skipping.' => 'Se encontró un duplicado del fichero multimedia (\'[_1]\'). Ignorado.', # Translate - No russian chars
	'Saving asset (\'[_1]\')...' => 'Guardando elemento (\'[_1]\')...', # Translate - No russian chars
	' and asset will be tagged (\'[_1]\')...' => ' y el elemento será etiquetado (\'[_1]\')...', # Translate - No russian chars
	'Duplicate entry (\'[_1]\') found.  Skipping.' => 'Se encontró un duplicado de la entrada (\'[_1]\'). Ignorada.', # Translate - No russian chars
	'Saving page (\'[_1]\')...' => 'Guardando página (\'[_1]\')...', # Translate - No russian chars

## plugins/WXRImporter/lib/WXRImporter/Import.pm

## plugins/WXRImporter/tmpl/options.tmpl
	'Before you import WordPress posts to Movable Type, we recommend that you <a href=\'[_1]\'>configure your blog\'s publishing paths</a> first.' => 'Antes de importar las entradas de WordPress a Movable Type, le recomendamos que primero <a href=\'[_1]\'>configure las rutas de publicación del blog</a>.', # Translate - No russian chars
	'Upload path for this WordPress blog' => 'Ruta de transferencia para este blog de WordPress', # Translate - No russian chars
	'Replace with' => 'Reemplazar con', # Translate - No russian chars
	'Download attachments' => 'Descargar adjuntos', # Translate - No russian chars
	'Requires the use of a cron job to download attachments from WordPress powered blog in the background.' => 'Necesita el uso de una tarea del cron para descargar los adjuntos de un blog de WordPress en segundo plano.', # Translate - No russian chars
	'Download attachments (images and files) from the imported WordPress powered blog.' => 'Descargar adjuntos (imágenes y ficheros) de un blog importado de WordPress.', # Translate - No russian chars

## plugins/Markdown/Markdown.pl
	'A plain-text-to-HTML formatting plugin.' => 'Un plugin de formateo plain-text hacia HTML', # Translate - No russian chars
	'Markdown' => 'Markdown', # Translate - Not translated
	'Markdown With SmartyPants' => 'Markdown и SmartyPants',

## plugins/Markdown/SmartyPants.pl
	'Easily translates plain punctuation characters into \'smart\' typographic punctuation.' => 'Traduce fácilmente los carácteres de puntuación clásicos dentro de \'inteligente\' tipografía de puntuación.', # Translate - No russian chars

## plugins/Textile/textile2.pl
	'A humane web text generator.' => 'Un generador de texto web humano', # Translate - No russian chars
	'Textile 2' => 'Textile 2', # Translate - Not translated

## plugins/Cloner/cloner.pl
	'Clones a blog and all of its contents.' => 'Clona un blog y todos sus contenidos.', # Translate - No russian chars
	'Cloning blog \'[_1]\'...' => 'Clonando un blog', # Translate - No russian chars
	'Finished! You can <a href="javascript:void(0);" onclick="closeDialog(\'[_1]\');">return to the blog listing</a> or <a href="javascript:void(0);" onclick="closeDialog(\'[_2]\');">configure the Site root and URL of the new blog</a>.' => '¡Finalizó! Puede <a href="javascript:void(0);" onclick="closeDialog(\'[_1]\');">regresar a la lista de blogs</a> o <a href="javascript:void(0);" onclick="closeDialog(\'[_2]\');">configurar la Raíz del sitio y URL del nuevo blog</a>.', # Translate - No russian chars
	'No blog was selected to clone.' => 'Ningún blog ha sido seleccionado para ser clonado.', # Translate - No russian chars
	'This action can only be run for a single blog at a time.' => 'Esta acción solo puede ser ejecutada para un blog a la vez.', # Translate - No russian chars
	'Invalid blog_id' => 'blog_id no válido', # Translate - No russian chars
	'Clone Blog' => 'Клонировать блог',

## plugins/MultiBlog/lib/MultiBlog.pm
	'The include_blogs, exclude_blogs, blog_ids and blog_id attributes cannot be used together.' => 'Los atributos include_blogs, exclude_blogs, blog_ids y blog_id no se pueden usar juntos.', # Translate - No russian chars
	'The attribute exclude_blogs cannot take "all" for a value.' => 'El atributo exclude_blogs no puede tener el valor "all".', # Translate - No russian chars
	'The value of the blog_id attribute must be a single blog ID.' => 'El valor del atributo blog_id debe ser el ID de un solo blog.', # Translate - No russian chars
	'The value for the include_blogs/exclude_blogs attributes must be one or more blog IDs, separated by commas.' => 'El valor de los atributos include_blogs/exclude_blogs debe ser uno o más IDs de blogs, separados por comas.', # Translate - No russian chars

## plugins/MultiBlog/lib/MultiBlog/Tags.pm
#	'MTMultiBlog tags cannot be nested.' => '', # Translate - Empty
#	'Unknown "mode" attribute value: [_1]. Valid values are "loop" and "context".' => '', # Translate - Empty

## plugins/MultiBlog/multiblog.pl
	'MultiBlog allows you to publish content from other blogs and define publishing rules and access controls between them.' => 'MultiBlog позволяет публиковать контент из других блогов и определять правила публикования и контроль доступа между ними.',
	'MultiBlog' => 'MultiBlog', # Translate - Not translated
	'Create Trigger' => 'Создать новый триггер',
	'Weblog Name' => 'Имя веблога',
	'Search Weblogs' => 'Поиск веблогов',
	'When this' => 'Когда это',
	'* All Weblogs' => '* Все веблоги',
	'Select to apply this trigger to all weblogs' => 'Выберите чтобы применить этот триггер ко все веблогам',
	'saves an entry' => 'сохраняет запись',
	'publishes an entry' => 'публикует запись',
	'publishes a comment' => 'публикует комментарий',
	'publishes a TrackBack' => 'публикует Трэкбэк',
	'rebuild indexes.' => 'перестроить индексы.',
	'rebuild indexes and send pings.' => 'перестроить индексы и послать пинги.',

## plugins/MultiBlog/tmpl/system_config.tmpl
	'Default system aggregation policy' => 'Política predefinida de agregación del sistema', # Translate - No russian chars
	'Allow' => 'Permitir', # Translate - No russian chars
	'Disallow' => 'No permitir', # Translate - No russian chars
	'Cross-blog aggregation will be allowed by default.  Individual blogs can be configured through the blog-level MultiBlog settings to restrict access to their content by other blogs.' => 'La agregación cruzada de blogs estará permitida por defecto. Los blogs individuales se podrán configurar a través de sus ajustes de MultiBlog para restringir a otros blogs el acceso a sus contenidos.', # Translate - No russian chars
	'Cross-blog aggregation will be disallowed by default.  Individual blogs can be configured through the blog-level MultiBlog settings to allow access to their content by other blogs.' => 'La agregación cruzada de blogs no estará permitida por defecto. Individualmente se podrá configurar a los blogs a través de sus ajustes de MultiBlog para permitir a otros blogs el acceso a sus contenidos.', # Translate - No russian chars

## plugins/MultiBlog/tmpl/blog_config.tmpl
	'When' => 'Cuando', # Translate - No russian chars
	'Any Weblog' => 'Cualquier weblog', # Translate - No russian chars
	'Weblog' => 'Weblog', # Translate - Not translated
	'Trigger' => 'Inductor', # Translate - No russian chars
	'Action' => 'Acción', # Translate - No russian chars
	'Content Privacy' => 'Privacidad de contenidos', # Translate - No russian chars
	'Specify whether other blogs in the installation may publish content from this blog. This setting takes precedence over the default system aggregation policy found in the system-level MultiBlog configuration.' => 'Especifique si otros blogs de la instalación podrán publicar contenidos de este blog. Esta opción tiene prioridad sobre la política predefinida de agregación del sistema que se encuentra en la configuración a nivel del sistema de MultiBlog.', # Translate - No russian chars
	'Use system default' => 'Utilizar valor predefinido del sistema', # Translate - No russian chars
	'MTMultiBlog tag default arguments' => 'Argumentos predefinidos de la etiqueta MTMultiBlog', # Translate - No russian chars
	'Enables use of the MTMultiBlog tag without include_blogs/exclude_blogs attributes. Comma-separated BlogIDs or \'all\' (include_blogs only) are acceptable values.' => 'Perimite el uso de la etiqueta MTMultiBlog sin los atributos include_blogs/exclude_blogs. Se aceptan como valores BlogIDs separados por comas o \'all\' (include_blogs solamente).', # Translate - No russian chars
	'Include blogs' => 'Incluir blogs', # Translate - No russian chars
	'Exclude blogs' => 'Excluir blogs', # Translate - No russian chars
	'Rebuild Triggers' => 'Eventos de republicación', # Translate - No russian chars
	'Create Rebuild Trigger' => 'Crear un evento de republicación', # Translate - No russian chars
	'You have not defined any rebuild triggers.' => 'No ha definido ningún inductor de reconstrucción.', # Translate - No russian chars

## plugins/MultiBlog/tmpl/dialog_create_trigger.tmpl
	'Create MultiBlog Trigger' => 'Crear inductor de MultiBlog', # Translate - No russian chars

## plugins/spamlookup/lib/spamlookup.pm
	'Failed to resolve IP address for source URL [_1]' => 'Fallo al resolver la dirección IP de origen de la URL [_1]', # Translate - No russian chars
	'Moderating: Domain IP does not match ping IP for source URL [_1]; domain IP: [_2]; ping IP: [_3]' => 'Moderación: La IP del dominio no coincide con la IP del ping de la URL [_1]; IP del dominio: [_2]; IP del ping: [_3]', # Translate - No russian chars
	'Domain IP does not match ping IP for source URL [_1]; domain IP: [_2]; ping IP: [_3]' => 'IP del dominio no coincide con la IP del ping de la URL [_1]; IP del dominio: [_2]; IP del ping: [_3]', # Translate - No russian chars
	'No links are present in feedback' => 'No hay enlaces presentes en la respuesta', # Translate - No russian chars
	'Number of links exceed junk limit ([_1])' => 'Número de enlaces superior al límite ([_1])', # Translate - No russian chars
	'Number of links exceed moderation limit ([_1])' => 'Número de enlaces superior al límite de moderación ([_1])', # Translate - No russian chars
	'Link was previously published (comment id [_1]).' => 'El enlace se publicó anteriormente (id del comentario [_1]).', # Translate - No russian chars
	'Link was previously published (TrackBack id [_1]).' => 'El enlace se publicó anteriormente (id del TrackBack [_1]).', # Translate - No russian chars
	'E-mail was previously published (comment id [_1]).' => 'El correo se publicó anteriormente (id del comentario [_1]).', # Translate - No russian chars
	'Word Filter match on \'[_1]\': \'[_2]\'.' => 'Coincidencia del filtro de palabras en \'[_1]\': \'[_2]\'.', # Translate - No russian chars
	'Moderating for Word Filter match on \'[_1]\': \'[_2]\'.' => 'Coincidencia del filtro de palabras en \'[_1]\': \'[_2]\'.', # Translate - No russian chars
	'domain \'[_1]\' found on service [_2]' => 'dominio \'[_1]\' encontrado en el servicio \'[_2]\'', # Translate - No russian chars
	'[_1] found on service [_2]' => '[_1] encontrado en el servicio [_2]', # Translate - No russian chars

## plugins/spamlookup/spamlookup_words.pl
	'SpamLookup module for moderating and junking feedback using keyword filters.' => 'Módulo SpamLookup para la moderación y marcado como spam de respuestas mediante filtros de palabras claves.', # Translate - No russian chars
	'SpamLookup Keyword Filter' => 'Filtro de palabras claves de SpamLookup', # Translate - No russian chars

## plugins/spamlookup/spamlookup.pl
#	'SpamLookup module for using blacklist lookup services to filter feedback.' => '', # Translate - Empty
#	'SpamLookup IP Lookup' => '', # Translate - Empty
#	'SpamLookup Domain Lookup' => '', # Translate - Empty
#	'SpamLookup TrackBack Origin' => '', # Translate - Empty
#	'Despam Comments' => '', # Translate - Empty
#	'Despam TrackBacks' => '', # Translate - Empty
#	'Despam' => '', # Translate - Empty

## plugins/spamlookup/spamlookup_urls.pl
#	'SpamLookup - Link' => '', # Translate - Empty
#	'SpamLookup module for junking and moderating feedback based on link filters.' => '', # Translate - Empty
#	'SpamLookup Link Filter' => '', # Translate - Empty
#	'SpamLookup Link Memory' => '', # Translate - Empty
#	'SpamLookup Email Memory' => '', # Translate - Empty

## plugins/spamlookup/tmpl/url_config.tmpl
	'Link filters monitor the number of hyperlinks in incoming feedback. Feedback with many links can be held for moderation or scored as junk. Conversely, feedback that does not contain links or only refers to previously published URLs can be positively rated. (Only enable this option if you are sure your site is already spam-free.)' => 'Los filtros de enlaces comprueban el número de hiperenlaces en las respuestas entrantes. Las respuestas con demasiados enlaces se moderarán o se puntuarán como basura. Las respuestas que no contengan enlaces o que solo se refieran a URLs publicadas anteriormente recibirán puntuación positiva. (Habilite esta opción solo si está seguro de que su sitio está libre de spam).', # Translate - No russian chars
	'Link Limits' => 'Límites de enlaces', # Translate - No russian chars
	'Credit feedback rating when no hyperlinks are present' => 'Puntuar positivamente si no hay hiperenlaces', # Translate - No russian chars
	'Adjust scoring' => 'Ajustar puntuación', # Translate - No russian chars
	'Score weight:' => 'Peso de la puntuación:', # Translate - No russian chars
	'Moderate when more than' => 'Moderar cuando se dan más de', # Translate - No russian chars
	'link(s) are given' => 'enlaces', # Translate - No russian chars
	'Junk when more than' => 'Marcar como basura cuando se dan más de', # Translate - No russian chars
	'Link Memory' => 'Memoria de enlaces', # Translate - No russian chars
	'Credit feedback rating when &quot;URL&quot; element of feedback has been published before' => 'Puntuar positivamente cuando un hiperenlace se ha publicado anteriormente', # Translate - No russian chars
	'Only applied when no other links are present in message of feedback.' => 'Solo se aplica si no hay otros enlaces presentes en el mensaje de la respuesta.', # Translate - No russian chars
	'Exclude URLs from comments published within last [_1] days.' => 'Excluir URLs de los comentarios publicados en los últimos [_1] días.', # Translate - No russian chars
	'Email Memory' => 'Memoria de correos', # Translate - No russian chars
	'Credit feedback rating when previously published comments are found matching on the &quot;Email&quot; address' => 'Puntuar positivamente si se encuentran comentarios con la dirección de correo publicados anteriormente', # Translate - No russian chars
	'Exclude Email addresses from comments published within last [_1] days.' => 'Excluir direcciones de correo de los comentarios publicados en los últimos [_1] días.', # Translate - No russian chars

## plugins/spamlookup/tmpl/lookup_config.tmpl
	'Lookups monitor the source IP addresses and hyperlinks of all incoming feedback. If a comment or TrackBack comes from a blacklisted IP address or contains a blacklisted domain, it can be held for moderation or scored as junk and placed into the blog\'s Junk folder. Additionally, advanced lookups on TrackBack source data can be performed.' => 'Lookups vigila el origen de las direcciones IP y los hiperenlaces de todas las respuestas entrantes. Si un comentario un TrackBack proviene de una dirección IP o un dominio incluídos en las listas negras, se retendrán para su moderación o se puntuarán como basura y se situarán en la carpeta Basura del blog. Además, se podrán realizar comprobaciones avanzadas sobre la fuente de datos de los TrackBacks.', # Translate - No russian chars
	'IP Address Lookups' => 'Verificar una Dirección IP', # Translate - No russian chars
	'Moderate feedback from blacklisted IP addresses' => 'Moderar respuestas de direcciones IP que estén en listas negras', # Translate - No russian chars
	'Junk feedback from blacklisted IP addresses' => 'Marcar como basura las respuestas de direcciones IP que estén en listas negras', # Translate - No russian chars
	'Less' => 'Menos', # Translate - No russian chars
	'More' => 'Más', # Translate - No russian chars
	'block' => 'bloquear', # Translate - No russian chars
	'IP Blacklist Services' => 'Servicios de listas negras de IPs', # Translate - No russian chars
	'Domain Name Lookups' => 'Verificar el Nombre de un Dominio', # Translate - No russian chars
	'Moderate feedback containing blacklisted domains' => 'Moderar respuestas que contengan dominios que estén en listas negras', # Translate - No russian chars
	'Junk feedback containing blacklisted domains' => 'Marcar como spam las respuestas de dominios que estén en listas negras', # Translate - No russian chars
	'Domain Blacklist Services' => 'Servicios de listas negras de dominios', # Translate - No russian chars
	'Advanced TrackBack Lookups' => 'Comprobaciones avanzadas de TrackBacks', # Translate - No russian chars
	'Moderate TrackBacks from suspicious sources' => 'Moderar TrackBacks de origen sospechoso', # Translate - No russian chars
	'Junk TrackBacks from suspicious sources' => 'Marcar como basura los TrackBacks de origen sospechoso', # Translate - No russian chars
	'Lookup Whitelist' => 'Verificar la lista blanca', # Translate - No russian chars
	'To prevent lookups for some IP addresses or domains, list them below. Place each entry on a line by itself.' => 'Para prevenir la comprobación de algunas direcciones IP o dominios, lístelos abajo. Por favor, introduzca cada entrada en una línea diferente.', # Translate - No russian chars

## plugins/spamlookup/tmpl/word_config.tmpl
	'Incomming feedback can be monitored for specific keywords, domain names, and patterns. Matches can be held for moderation or scored as junk. Additionally, junk scores for these matches can be customized.' => 'Se puede monitorizar las respuestas entrantes por palabras claves, dominios y patrones concretos. Las coincidencias serán retenidas para su moderación o se puntuarán como basura. Además, se puede personalizar las puntuaciones de basura de estas coincidencias.', # Translate - No russian chars
	'Keywords to Moderate' => 'Palabras claves para moderar', # Translate - No russian chars
	'Keywords to Junk' => 'Palabras claves para marcar como basura', # Translate - No russian chars

## plugins/WidgetManager/lib/WidgetManager/Plugin.pm
	'Can\'t find included template widget \'[_1]\'' => 'No se encontró la plantilla de widget \'[_1]\' incluída', # Translate - No russian chars
	'Cloning Widgets for blog...' => 'Clonar los Widgets para un blog...', # Translate - No russian chars

## plugins/WidgetManager/lib/WidgetManager/CMS.pm
	'Can\'t duplicate the existing \'[_1]\' Widget Manager. Please go back and enter a unique name.' => 'No se pudo duplicar el administrador de widgets existente \'[_1]\'. Por favor, regrese e introduzca un nombre único.', # Translate - No russian chars
	'Main Menu' => 'Главное меню',
	'Widget Manager' => 'Administrador de widgets', # Translate - No russian chars
	'New Widget Set' => 'Nuevo conjunto de widgets', # Translate - No russian chars

## plugins/WidgetManager/default_widgets/search.mtml

## plugins/WidgetManager/default_widgets/monthly_archive_dropdown.mtml
	'Select a Month...' => 'Выбор месяца ...',

## plugins/WidgetManager/default_widgets/tag_cloud.mtml

## plugins/WidgetManager/default_widgets/about_this_page.mtml

## plugins/WidgetManager/default_widgets/date_based_category_archives.mtml
	'Category Yearly Archives' => 'Архивы по годам и темам',
	'Category Weekly Archives' => 'Архивы по неделям и темам',
	'Category Daily Archives' => 'Архивы по дням и темам',

## plugins/WidgetManager/default_widgets/powered_by.mtml

## plugins/WidgetManager/default_widgets/syndication.mtml
	'Search results matching &ldquo;<$mt:SearchString$>&rdquo;' => 'Результаты поиска &ldquo;<$mt:SearchString$>&rdquo;',

## plugins/WidgetManager/default_widgets/signin.mtml
	'You are signed in as ' => 'Вы авторизовались как ',
	'You do not have permission to sign in to this blog.' => 'У Вас нет прав для регистрации на данном блоге.',

## plugins/WidgetManager/default_widgets/creative_commons.mtml
	'This weblog is licensed under a' => 'Этот веблог лицензируется по',
	'Creative Commons License' => 'Лицензия Creative Commons',

## plugins/WidgetManager/default_widgets/monthly_archive_list.mtml

## plugins/WidgetManager/default_widgets/calendar.mtml
	'Monthly calendar with links to daily posts' => 'Календарь с ссылками на записи',
	'Sun' => 'Вс',
	'Mon' => 'Пн',
	'Tue' => 'Вт',
	'Wed' => 'Ср',
	'Thu' => 'Чт',
	'Fri' => 'Пт',
	'Sat' => 'Сб',

## plugins/WidgetManager/default_widgets/archive_meta_widget.mtml
	'This is a custom set of widgets that are conditioned to serve different content based upon what type of archive it is included. More info: [_1]' => 'Этот набор виджетов будет показывать разное содержимое в зависимости от типа архива в котором он включен. Более подробная информация: [_1]',
	'Current Category Monthly Archives' => 'Текущие месячные архивы по темам',
	'Category Archives' => 'Архивы по темам',

## plugins/WidgetManager/default_widgets/category_archive_list.mtml

## plugins/WidgetManager/default_widgets/pages_list.mtml

## plugins/WidgetManager/default_widgets/technorati_search.mtml
	'Technorati' => 'Technorati', # Translate - Not translated
	'<a href=\'http://www.technorati.com/\'>Technorati</a> search' => 'Поиск <a href=\'http://www.technorati.com/\'>Technorati</a>',
	'this blog' => 'этот блог',
	'all blogs' => 'все блоги',
	'Blogs that link here' => 'Блоги ссылающиеся сюда',

## plugins/WidgetManager/default_widgets/widgets.cfg
	'About This Page' => 'О данной странице',
	'Current Author Monthly Archives' => 'Текущий месячный архив по авторам',
	'Calendar' => 'Календарь',
	'Creative Commons' => 'Creative Commons', # Translate - Not translated
	'Home Page Widgets' => 'Виджеты домашней страницы',
	'Monthly Archives Dropdown' => 'Выпадающее меню месячного архива',
	'Page Listing' => 'Список страниц',
	'Recent Assets' => 'Последние медиа-ресурсы',
	'Powered By' => 'Powered By', # Translate - Not translated
	'Recent Comments' => 'Последние комментарии',
	'Syndication' => 'Синдикация',
	'Technorati Search' => 'Поиск Technorati',
	'Date-Based Author Archives' => 'Архивы авторов по датам',
	'Date-Based Category Archives' => 'Архивы категорий по датам',

## plugins/WidgetManager/default_widgets/current_category_monthly_archive_list.mtml

## plugins/WidgetManager/default_widgets/recent_assets.mtml

## plugins/WidgetManager/default_widgets/current_author_monthly_archive_list.mtml

## plugins/WidgetManager/default_widgets/recent_entries.mtml

## plugins/WidgetManager/default_widgets/author_archive_list.mtml

## plugins/WidgetManager/default_widgets/recent_comments.mtml
	'<a href="[_1]">[_2] commented on [_3]</a>: [_4]' => '<a href="[_1]">[_2] прокомментировал [_3]</a>: [_4]',

## plugins/WidgetManager/default_widgets/date_based_author_archives.mtml
	'Author Yearly Archives' => 'Архивы по годам и по авторам',
	'Author Weekly Archives' => 'Архивы по неделям и по авторам',
	'Author Daily Archives' => 'Архивы по дням и по авторам',

## plugins/WidgetManager/default_widgets/main_index_meta_widget.mtml
	'This is a custom set of widgets that are conditioned to only appear on the homepage (or "main_index"). More info: [_1]' => 'Этот набор виджетов будет показываться только на домашней странице (или "main_index"). Подробнее: [_1]',

## plugins/WidgetManager/WidgetManager.pl
	'Maintain your blog\'s widget content using a handy drag and drop interface.' => 'Управляйте содержимым виджетов Вашего блога используя удобный Drag и Drop интерфейс.',
	'Widget Sets' => 'Наборы виджетов',
	'Widget Set' => 'Набор виджетов',
	'Widgets' => 'Виджеты',

## plugins/WidgetManager/tmpl/edit.tmpl
	'Edit Widget Set' => 'Изменить набор виджетов',
	'Please use a unique name for this widget set.' => 'Пожалуйста, используйте уникальное имя для данного набора виджетов.',
	'You already have a widget set named \'[_1].\' Please use a unique name for this widget set.' => 'У Вас уже есть виджет с именем \'[_1].\'Пожалуйста, используйте уникальные имена для наборов виджетов',
	'Your changes to the Widget Set have been saved.' => 'Ваши изменения набора виджетов были сохранены.',
	'Set Name' => 'Имя набора',
	'Drag and drop the widgets you want into the Installed column.' => 'Перетащите нужные Вам виджеты в колонку Установленные виджеты',
	'Installed Widgets' => 'Установленные виджеты',
	'Available Widgets' => 'Доступные виджеты',
	'Save changes to this widget set (s)' => 'Сохранить изменения этого набора виджетов (s)',

## plugins/WidgetManager/tmpl/list.tmpl
	'Delete selected Widget Sets (x)' => 'Удалить выбранные наборы виджетов (x)',
	'Helpful Tips' => 'Подсказки',
	'To add a widget set to your templates, use the following syntax:' => 'Чтобы добавить набор виджетов к Вашим шаблонам используйте следующий синтаксис:',
	'<strong>&lt;$MTWidgetSet name=&quot;Name of the Widget Set&quot;$&gt;</strong>' => '<strong>&lt;$MTWidgetSet name=&quot;Имя Набора Виджетов&quot;$&gt;</strong>',
	'Edit Widget Templates' => 'Редактировать шаблоны виджетов',
	'Your changes to the widget set have been saved.' => 'Ваши изменения наборов виджетов были сохранены.',
	'You have successfully deleted the selected widget set(s) from your blog.' => 'Вы успешно удалили выделенные наборы виджетов из Вашего блога.',
	'Create Widget Set' => 'Создать набор виджетов',
	'No Widget Sets could be found.' => 'Не найдено наборов виджетов.',


);

## New words: 775

1;
