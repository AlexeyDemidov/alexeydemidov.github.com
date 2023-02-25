# $Id:$
#
# Translation by Alex L. Demidov (http://alexd.vinf.ru/)
#

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

## php/lib/function.mtvar.php
	'You used a [_1] tag without a valid name attribute.' => 'Вы использовали метку [_1] без аттрибута имя.',
	'\'[_1]\' is not a valid function for a hash.' => '\'[_1]\' не является верной функцией для хэша.',
	'\'[_1]\' is not a valid function for an array.' => '\'[_1]\' не является верной функцией для массива.',
	'[_1] [_2] [_3] is illegal.' => '[_1] [_2] [_3] неверно.',

## php/lib/archive_lib.php
	'Page' => 'Страница',
	'Individual' => 'Inidivual',
	'Yearly' => 'Anuales',
	'Monthly' => 'Mensuales',
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

## php/lib/block.mtsethashvar.php

## php/lib/block.mtif.php

## php/lib/function.mtremotesigninlink.php
	'TypeKey authentication is not enabled in this blog.  MTRemoteSignInLink can\'t be used.' => 'Авторизация через TypeKey отключена в этом блоге. MTRemoteSignInLink не может быть использован.',

## php/lib/block.mtauthorhaspage.php
	'No author available' => 'Не автора',

## php/lib/block.mtauthorhasentry.php

## php/lib/function.mtproductname.php
	'[_1] [_2]' => '[_1] [_2]',

## php/lib/captcha_lib.php
	'Captcha' => 'Captcha',
	'Type the characters you see in the picture above.' => 'Введите символы которые Вы видите на изображении выше.',

## php/lib/function.mtsetvar.php
	'\'[_1]\' is not a hash.' => '\'[_1]\' не является хэшем.',
	'Invalid index.' => 'Неверный индекс.',
	'\'[_1]\' is not an array.' => '\'[_1]\' не является массивом.',
	'\'[_1]\' is not a valid function.' => '\'[_1]\' не является функцией.',

## php/lib/block.mtassets.php
	'sort_by="score" must be used in combination with namespace.' => 'sort_by="score" должен использоваться в сочетании с namespace.',

## php/lib/block.mtsetvarblock.php

## php/lib/block.mtentries.php

## php/lib/MTUtil.php
	'userpic-[_1]-%wx%h%x' => 'avatar-[_1]-%wx%h%x',

## php/lib/function.mtauthordisplayname.php

## php/lib/function.mtentryclasslabel.php
	'page' => 'страница',
	'entry' => 'запись',
	'Entry' => 'Запись',

## default_templates/notify-entry.mtml
	'A new [lc,_3] entitled \'[_1]\' has been published to [_2].' => 'Новая запись [lc,_3] озаглавленная \'[_1]\' была опубликована в [_2].',
	'View entry:' => 'Просмотр записи:',
	'View page:' => 'Просмотр страницы:',
	'[_1] Title: [_2]' => '[_1] Заголовок: [_2]',
	'Publish Date: [_1]' => 'Дата публикации: [_1]',
	'Message from Sender:' => 'Сообщение от:',
	'You are receiving this email either because you have elected to receive notifications about new content on [_1], or the author of the post thought you would be interested. If you no longer wish to receive these emails, please contact the following person:' => 'Вы получили данное сообщение либо потому, что Вы подписались на уведомления о новых публикация на [_1], или потому что автор данной заметки посчитал что Вы будете заинтересованы. Если Вы более не желаете получать подобные сообщения, пожалуйста свяжитесь со следующим человеком:',

## default_templates/main_index.mtml
	'Header' => 'Шапка',
	'Entry Summary' => 'Аннотация Записи',
	'Archives' => 'Архивы',

## default_templates/page.mtml
	'Page Detail' => 'Детали Страницы',
	'TrackBacks' => 'Трэкбэки',
	'Comments' => 'Комментарии',

## default_templates/entry_summary.mtml
	'Entry Metadata' => 'Мета-данные Записи',
	'Tags' => 'Метки',
	'Continue reading <a rel="bookmark" href="[_1]">[_2]</a>.' => 'Читать далее: <a rel="bookmark" href="[_1]">[_2]</a>.',

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

## default_templates/commenter_notify.mtml
	'This email is to notify you that a new user has successfully registered on the blog \'[_1]\'. Listed below you will find some useful information about this new user.' => 'Это сообщение уведомляет Вас о том, что новый пользователь благополучно зарегистрировался на блоге \'[_1]\'. Ниже перечислена полезная информация о данном пользователе.',
	'New User Information:' => 'Информация о новом пользователе:',
	'Username: [_1]' => 'Имя пользователя: [_1]',
	'Full Name: [_1]' => 'Полное имя: [_1]',
	'Email: [_1]' => 'Email: [_1]',
	'To view or edit this user, please click on or cut and paste the following URL into a web browser:' => 'Для того, чтобы просмотреть или изменить информацию о данном пользователе перейдите по следующей ссылке:',

## default_templates/footer-email.mtml
	'Powered by Movable Type [_1]' => 'Powered by Movable Type [_1]',

## default_templates/entry_detail.mtml
	'Categories' => 'Темы',

## default_templates/verify-subscribe.mtml
	'Thanks for subscribing to notifications about updates to [_1]. Follow the link below to confirm your subscription:' => 'Спасибо что подписались на уведомления об обновления на [_1]. Перейдите по следующей ссылке чтобы подтвердить Вашу подписку::',
	'If the link is not clickable, just copy and paste it into your browser.' => 'Если ссылка не нажимается, просто скопируйте её в Ваш броузер.',

## default_templates/new-ping.mtml
	'An unapproved TrackBack has been posted on your blog [_1], for entry #[_2] ([_3]). You need to approve this TrackBack before it will appear on your site.' => 'На Ваш блог [_1] для записи #[_2] ([_3]) был отправлен Трэкбэк. Вам необходимо его подтвердить чтобы он появился на Вашем сайте.',
	'An unapproved TrackBack has been posted on your blog [_1], for category #[_2], ([_3]). You need to approve this TrackBack before it will appear on your site.' => 'На Ваш блог [_1] на тему #[_2], ([_3]) был отправлен Трэкбэк. Вам необходимо подтвердить этот Трэкбэк чтобы он появился на Вашем сайте.',
	'A new TrackBack has been posted on your blog [_1], on entry #[_2] ([_3]).' => 'На Ваш блог [_1] на запись #[_2] ([_3]) был отправлен новый Трэкбэк.',
	'A new TrackBack has been posted on your blog [_1], on category #[_2] ([_3]).' => 'На Ваш блог [_1] на тему #[_2] ([_3]) был отправлен новый Трэкбэк.',
	'Excerpt' => 'Выжимка',
	'URL' => 'URL',
	'Title' => 'Заголовок',
	'Blog' => 'Блог',
	'IP address' => 'IP адрес',
	'Approve TrackBack' => 'Подтвердить Трэкбэк',
	'View TrackBack' => 'Посмотреть Трэкбэк',
	'Report TrackBack as spam' => 'Пожаловаться на спам',
	'Edit TrackBack' => 'Изменить Трэкбэк',

## default_templates/comment_detail.mtml
	'By [_1] on [_2]' => '[_1] [_2]',

## default_templates/comment_form.mtml
	'Leave a comment' => 'Оставьте комментарий',
	'Name' => 'Имя',
	'Email Address' => 'Email',
	'Remember personal info?' => 'Запомнить введенную информацию?',
	'(You may use HTML tags for style)' => '(Для оформления можно использовать HTML)',
	'Preview' => 'Просмотр',
	'Submit' => 'Отправить',
	'Cancel' => 'Отмена',

## default_templates/comment_throttle.mtml
	'If this was a mistake, you can unblock the IP address and allow the visitor to add it again by logging in to your Movable Type installation, going to Blog Config - IP Banning, and deleting the IP address [_1] from the list of banned addresses.' => 'Если это ошибка, то Вы можете разблокировать IP адрес и позволить посетителю добавить его заново. Для этого необходимо войти в Ваш Movable Type, зайти в Настройки Блога - IP блокирование и удалить адрес [_1] из списка заблокированных адресов.',
	'A visitor to your blog [_1] has automatically been banned by adding more than the allowed number of comments in the last [_2] seconds.' => 'Посетитель Вашего блога [_1] был автоматически заблокирован поскольку он превысил лимит количества новых комментариев за последние [quant,_2,секунду,секунды,секунд].',
	'This has been done to prevent a malicious script from overwhelming your weblog with comments. The banned IP address is' => 'Заблокированный IP адрес:',

## default_templates/new-comment.mtml
	'An unapproved comment has been posted on your blog [_1], for entry #[_2] ([_3]). You need to approve this comment before it will appear on your site.' => 'На Вашем блоге [_1] кто-то прокомментировал запись [_2] ([_3]). Вам необходимо подтвердить этот комментарий чтобы он появился на Вашем сайте.',
	'A new comment has been posted on your blog [_1], on entry #[_2] ([_3]).' => 'На Вашем блоге [_1] был размещен новый комментарий к записи [_2] ([_3]).',
	'Commenter name: [_1]' => 'Имя комментатора: [_1]',
	'Commenter email address: [_1]' => 'Email: [_1]',
	'Commenter URL: [_1]' => 'URL: [_1]',
	'Commenter IP address: [_1]' => 'IP адрес: [_1]',
	'Approve comment:' => 'Разрешить комментарий:',
	'View comment:' => 'Просмотр комментария:',
	'Edit comment:' => 'Изменить комментарий:',
	'Report comment as spam:' => 'Пометить комментарий как спам:',

## default_templates/entry_listing.mtml
	'[_1] Archives' => 'Архив [_1]',
	'Recently in <em>[_1]</em> Category' => 'Записи по теме <em>[_1]</em>',
	'Recently by <em>[_1]</em>' => 'Записи от <em>[_1]</em>',
	'Main Index' => 'Оглавление',

## default_templates/footer.mtml
	'Sidebar' => 'Боковое меню',
	'_POWERED_BY' => 'Powered by<br /><a href="http://www.movabletype.org/"><$MTProductName$></a>',
	'This blog is licensed under a <a href="[_1]">Creative Commons License</a>.' => 'Этот блог лицензирован по <a href="[_1]">Лицензии Creative Commons</a>.',

## default_templates/tags.mtml

## default_templates/entry_metadata.mtml
	'Permalink' => 'Прямая ссылка',
	'Comments ([_1])' => 'Комментарии ([_1])',
	'TrackBacks ([_1])' => 'Трэкбэки ([_1])',

## default_templates/entry.mtml
	'Entry Detail' => 'Запись полностью',

## default_templates/recover-password.mtml
	'_USAGE_FORGOT_PASSWORD_1' => 'Вы запросили восстановление Вашего пароля к Movable Type. Ваш пароль был изменен в системе. Ваш новый пароль:',
	'_USAGE_FORGOT_PASSWORD_2' => 'Вы можете зайти в Movable Type по ссылке указанной ниже. После авторизации Вы можете изменить пароль на более запоминающийся.',
	'Mail Footer' => 'Подвал письма',

## default_templates/javascript.mtml
	'Thanks for signing in,' => 'Спасибо, что авторизовались,',
	'. Now you can comment.' => '. Теперь можете оставить комментарий.',
	'sign out' => 'выйти',
	'You do not have permission to comment on this blog.' => 'У вас нет прав оставлять комментарии в этом блоге.',
	'Sign in' => 'Авторизуйтесь',
	' to comment on this entry.' => ' чтобы прокомментировать данную запись.',
	' to comment on this entry,' => ' чтобы прокомментировать данную запись,',
	'or ' => 'или ',
	'comment anonymously.' => 'оставьте комментарий анонимно',

## default_templates/rss.mtml
	'Copyright [_1]' => 'Copyright [_1]',

## default_templates/archive_index.mtml
	'Monthly Archives' => 'Архивы по месяцам',
	'Author Archives' => 'Архивы по авторам',
	'Category Monthly Archives' => 'Архивы по темам и по месяцам',
	'Author Monthly Archives' => 'Архивы по авторам и по месяцам',

## default_templates/trackbacks.mtml
	'[_1] TrackBacks' => '[_1] Трэкбэки',
	'Listed below are links to blogs that reference this entry: <a href="[_1]">[_2]</a>.' => 'Ниже указаны ссылки на блоги ссылающиеся на данную запись <a href="[_1]">[_2]</a>.',
	'TrackBack URL for this entry: <span id="trackbacks-link">[_1]</span>' => 'Трэкбэк URL для данной записи: <span id="trackbacks-link">[_1]</span>',
	'<a href="[_1]">[_2]</a> from [_3] on <a href="[_4]">[_5]</a>' => '<a href="[_1]">[_2]</a> от [_3] : <a href="[_4]">[_5]</a>',
	'[_1] <a href="[_2]">Read More</a>' => '[_1] <a href="[_2]">Читать далее</a>',

## default_templates/sidebar.mtml
	'2-column layout - Sidebar' => '2 колонки - Боковое меню',
	'3-column layout - Primary Sidebar' => '3 колонки - Основное боковое меню',
	'3-column layout - Secondary Sidebar' => '3 колонки - Вспомогательное боковое меню',

## default_templates/categories.mtml

## default_templates/comments.mtml
	'Comment Form' => 'Форма комментария',
	'[_1] Comments' => 'Комментариев: [_1]',
	'Comment Detail' => 'Развернутый комментарий',

## default_templates/search_results.mtml
	'Search Results' => 'Результат поиска',
	'Results matching &ldquo;[_1]&rdquo; from [_2]' => 'Результаты соотвествующие &ldquo;[_1]&rdquo; [_2]',
	'Results tagged &ldquo;[_1]&rdquo; from [_2]' => 'Результаты с меткой &ldquo;[_1]&rdquo; [_2]',
	'Results matching &ldquo;[_1]&rdquo;' => 'Результаты соответствующие &ldquo;[_1]&rdquo;',
	'Results tagged &ldquo;[_1]&rdquo;' => 'Результаты с меткой &ldquo;[_1]&rdquo;',
	'No results found for &ldquo;[_1]&rdquo;.' => 'Не найдено ничего соответсвтующего &ldquo;[_1]&rdquo;.',
	'Instructions' => 'Инструкции',
	'By default, this search engine looks for all words in any order. To search for an exact phrase, enclose the phrase in quotes:' => 'По умолчанию поиск будет производиться по всем словам в любом порядке. Чтобы искать точное соответствие заключите фразу в кавычки:',
	'movable type' => 'movable type',
	'The search engine also supports AND, OR, and NOT keywords to specify boolean expressions:' => 'Поисковый движок также понимает ключевые слова AND, OR и NOT для указания булевых выражений',
	'personal OR publishing' => 'личный OR опубликованный',
	'publishing NOT personal' => 'опубликованный NOT личный',

## default_templates/sidebar_2col.mtml
	'Search' => 'Поиск',
	'Case sensitive' => 'Чуствительность к регистру',
	'Regex search' => 'Регулярные выражения',
	'[_1] ([_2])' => '[_1] ([_2])',
	'About this Entry' => 'Об этой записи',
	'About this Archive' => 'Об этом архиве',
	'About Archives' => 'Об архивах',
	'This page contains links to all the archived content.' => 'Эта страница содержит архив ссылок на все записи в блоге.',
	'This page contains a single entry by [_1] published on <em>[_2]</em>.' => 'Эта страница содержит одну запись опубликованную <em>[_2]</em> автор которой [_1].',
	'<a href="[_1]">[_2]</a> was the previous entry in this blog.' => 'предыдущая запись - <a href="[_1]">[_2]</a>.',
	'<a href="[_1]">[_2]</a> is the next entry in this blog.' => 'следующая запись - <a href="[_1]">[_2]</a>.',
	'This page is a archive of entries in the <strong>[_1]</strong> category from <strong>[_2]</strong>.' => 'Эта старинца содержит архив записей по теме <strong>[_1]</strong> за <strong>[_2]</strong>.',
	'<a href="[_1]">[_2]</a> is the previous archive.' => 'предыдущий архив - <a href="[_1]">[_2]</a>.',
	'<a href="[_1]">[_2]</a> is the next archive.' => 'следующий архив - <a href="[_1]">[_2]</a> это следующий архив.',
	'This page is a archive of recent entries in the <strong>[_1]</strong> category.' => 'Эта страница содержит последние записи по теме <strong>[_1]</strong>.',
	'<a href="[_1]">[_2]</a> is the previous category.' => 'предыдущая тема - <a href="[_1]">[_2]</a>.',
	'<a href="[_1]">[_2]</a> is the next category.' => 'следующая тема - <a href="[_1]">[_2]</a>.',
	'This page is a archive of recent entries written by <strong>[_1]</strong> in <strong>[_2]</strong>.' => 'Эта страница содержит архив последних записей за <strong>[_2]</strong> автор которых <strong>[_1]</strong>.',
	'This page is a archive of recent entries written by <strong>[_1]</strong>.' => 'Эта страница содержит архив последних записей автор которых <strong>[_1]</strong>.',
	'This page is an archive of entries from <strong>[_2]</strong> listed from newest to oldest.' => 'Эта страница содержит архив записей за <strong>[_2]</strong>, в порядке от новых к старым.',
	'Find recent content on the <a href="[_1]">main index</a>.' => 'Смотрите последние записи на <a href="[_1]">главной странице</a>.',
	'Find recent content on the <a href="[_1]">main index</a> or look in the <a href="[_2]">archives</a> to find all content.' => 'Смотрите послдение записи на <a href="[_2]">главной странице</a> или загляните в <a href="[_2]">архив</a>, где есть ссылки на все записи.',
	'Recent Entries' => 'Последние записи',
	'Photos' => 'Фотографии',
	'Tag Cloud' => 'Облако Меток',
	'[_1] <a href="[_2]">Archives</a>' => '<a href="[_2]">Архив</a> [_1]',
	'[_1]: Monthly Archives' => '[_1]: Архив по месяцам',
	'Subscribe to feed' => 'Подписка на RSS',
	'Subscribe to this blog\'s feed' => 'Подписаться на RSS',
	'Search results matching &ldquo;<$MTSearchString$>&rdquo;' => 'Результаты поиска соответствующие &ldquo;<$MTSearchString$>&rdquo;',
	'_MTCOM_URL' => 'http://www.movabletype.com/',

## default_templates/sidebar_3col.mtml

## default_templates/dynamic_error.mtml
	'Page Not Found' => 'Страница не найдена',

## default_templates/comment_preview.mtml
	'Comment on [_1]' => 'Комментарий по теме [_1]',
	'Previewing your Comment' => 'Предварительный просмотр комментария',

## default_templates/commenter_confirm.mtml
	'Thank you registering for an account to comment on [_1].' => 'Спасибо что зарегистрировались на [_1] для комментирования.',
	'For your own security and to prevent fraud, we ask that you please confirm your account and email address before continuing. Once confirmed you will immediately be allowed to comment on [_1].' => 'Для Вашей собственной безопасности и для предотвращения обмана пожалуйста подтвердите Вашу учетную запись и адрес email перед тем как продолжите. После подтверждения Вы сможете оставлять комментарии в [_1].',
	'To confirm your account, please click on or cut and paste the following URL into a web browser:' => 'Для подтверждения Вашего аккаунта, пожалуйста перейдите по ссылке или скопируйте ее в Ваш броузер:',
	'If you did not make this request, or you don\'t want to register for an account to comment on [_1], then no further action is required.' => 'Если Вы не запрашивали регистрации или не желаете регистрироваться на [_1], то ни в каких действиях более нет необходимости.',
	'Thank you very much for your understanding.' => 'Спасибо за понимание.',
	'Sincerely,' => 'Искренне Ваш,',

## mt-static/js/dialog.js
	'(None)' => '(Ничего)',

## mt-static/js/assetdetail.js
	'No Preview Available' => 'Просмотр не доступен',
	'View uploaded file' => 'Просмотреть загруженный файл',

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
	'[_1] &ndash; [_2]' => '[_1] &ndash; [_2]',


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

## tmpl/feeds/feed_page.tmpl


## addons/Commercial.pack/tmpl/date-picker.tmpl
	'Select date' => 'Выберите дату',

## addons/Commercial.pack/templates/notify-entry.mtml

## addons/Commercial.pack/templates/blog_index.mtml

## addons/Commercial.pack/templates/main_index.mtml

## addons/Commercial.pack/templates/page.mtml

## addons/Commercial.pack/templates/entry_summary.mtml

## addons/Commercial.pack/templates/comment_response.mtml

## addons/Commercial.pack/templates/commenter_notify.mtml

## addons/Commercial.pack/templates/recent_entries_expanded.mtml
	'By [_1] | Comments ([_2])' => 'Автор [_1] | Комментарии ([_2]) ', # Translate - New

## addons/Commercial.pack/templates/footer-email.mtml

## addons/Commercial.pack/templates/entry_detail.mtml

## addons/Commercial.pack/templates/verify-subscribe.mtml

## addons/Commercial.pack/templates/new-ping.mtml

## addons/Commercial.pack/templates/comment_detail.mtml
	'[_1] [_2] on' => '[_1] [_2] от',
	'<a href="[_1]" title="Permalink to this comment">[_2]</a>' => '<a href="[_1]" title="Постоянная ссылка на данный комментарий">[_2]</a>',

## addons/Commercial.pack/templates/comment_form.mtml

## addons/Commercial.pack/templates/comment_throttle.mtml

## addons/Commercial.pack/templates/new-comment.mtml

## addons/Commercial.pack/templates/entry_listing.mtml

## addons/Commercial.pack/templates/contact.mtml

## addons/Commercial.pack/templates/footer.mtml
	'Powered By (Footer)' => 'Powered By (Подвал)',
	'Footer Links' => 'Ссылки подвала',

## addons/Commercial.pack/templates/tags.mtml

## addons/Commercial.pack/templates/navigation.mtml
	'Home' => 'Домашняя страница',

## addons/Commercial.pack/templates/entry_metadata.mtml

## addons/Commercial.pack/templates/entry.mtml

## addons/Commercial.pack/templates/recover-password.mtml

## addons/Commercial.pack/templates/javascript.mtml

## addons/Commercial.pack/templates/rss.mtml

## addons/Commercial.pack/templates/archive_index.mtml

## addons/Commercial.pack/templates/sign_in_top.mtml
	'You are signed in as' => 'Вы вошли как',
	'.  <a href="[_1]">Sign Out</a>' => '.  <a href="[_1]">Выйти</a>', # Translate - New
	'Sign Out' => 'Выйти',

## addons/Commercial.pack/templates/trackbacks.mtml
	'&raquo; <a href="[_1]">[_2]</a> from [_3]' => '&raquo; <a href="[_1]">[_2]</a> от [_3]',
	'Tracked on <a href="[_1]">[_2]</a>' => 'Ссылка с <a href="[_1]">[_2]</a>',

## addons/Commercial.pack/templates/sidebar.mtml
	'Recent Entries Expanded' => 'Последние Записи раскрыты',
	'Recent Assets' => 'Последние медиа-ресурсы',
	'Recent Comments' => 'Последние комментарии',
	'Category Archives' => 'Архивы по темам',

## addons/Commercial.pack/templates/powered_by_footer.mtml

## addons/Commercial.pack/templates/categories.mtml

## addons/Commercial.pack/templates/comments.mtml

## addons/Commercial.pack/templates/search_results.mtml

## addons/Commercial.pack/templates/search_top.mtml

## addons/Commercial.pack/templates/header.mtml
	'Sign In (In Header)' => 'Вход (В Заголовке)',
	'Navigation' => 'Навигация',
	'Search (In Navigation)' => 'Поиск (В Навигации)',
	'Homepage Image' => 'Изображение домашней страницы',

## addons/Commercial.pack/templates/sidebar_2col.mtml

## addons/Commercial.pack/templates/sidebar_3col.mtml

## addons/Commercial.pack/templates/dynamic_error.mtml

## addons/Commercial.pack/templates/footer_links.mtml
	'Links' => 'Ссылки',

## addons/Commercial.pack/templates/comment_preview.mtml

## addons/Commercial.pack/templates/commenter_confirm.mtml

## addons/Commercial.pack/config.yaml
	'Universal Website' => 'Универсальный сайт',
	'Themes that are compatible with the Universal Website template set.' => 'Шаблоны совместимы с набором шаблонов Универсальный сайт', # Translate - New
	'Blog Index' => 'Оглавление Блога',
	'Blog Entry Listing' => 'Список записей Блога',

## plugins/WidgetManager/default_widgets/monthly_archive_dropdown.mtml
	'Select a Month...' => 'Выбор месяца ...',

## plugins/WidgetManager/default_widgets/category_archive_list.mtml

## plugins/WidgetManager/default_widgets/calendar.mtml
	'Monthly calendar with links to daily posts' => 'Календарь с ссылками на записи',
	'Sun' => 'Вс',
	'Mon' => 'Пн',
	'Tue' => 'Вт',
	'Wed' => 'Ср',
	'Thu' => 'Чт',
	'Fri' => 'Пт',
	'Sat' => 'Сб',

## plugins/WidgetManager/default_widgets/recent_entries.mtml

## plugins/WidgetManager/default_widgets/current_author_monthly_archive_list.mtml

## plugins/WidgetManager/default_widgets/date_based_author_archives.mtml
	'Author Yearly Archives' => 'Архивы по годам и по авторам',
	'Author Weekly Archives' => 'Архивы по неделям и по авторам',
	'Author Daily Archives' => 'Архивы по дням и по авторам',

## plugins/WidgetManager/default_widgets/main_index_meta_widget.mtml
	'This is a custom set of widgets that are conditioned to only appear on the homepage (or "main_index"). More info: [_1]' => 'Этот набор виджетов будет показываться только на домашней странице (или "main_index"). Подробнее: [_1]',
	'Recent Comments' => 'Последние комментарии',
	'Recent Assets' => 'Последние медиа-ресурсы',

## plugins/WidgetManager/default_widgets/syndication.mtml
	'Search results matching &ldquo;<$mt:SearchString$>&rdquo;' => 'Результаты поиска &ldquo;<$mt:SearchString$>&rdquo;',

## plugins/WidgetManager/default_widgets/current_category_monthly_archive_list.mtml

## plugins/WidgetManager/default_widgets/recent_comments.mtml
	'<a href="[_1]">[_2] commented on [_3]</a>: [_4]' => '<a href="[_1]">[_2] прокомментировал [_3]</a>: [_4]',

## plugins/WidgetManager/default_widgets/technorati_search.mtml
	'Technorati' => 'Technorati',
	'<a href=\'http://www.technorati.com/\'>Technorati</a> search' => 'Поиск <a href=\'http://www.technorati.com/\'>Technorati</a>',
	'this blog' => 'этот блог',
	'all blogs' => 'все блоги',
	'Blogs that link here' => 'Блоги ссылающиеся сюда',

## plugins/WidgetManager/default_widgets/monthly_archive_list.mtml

## plugins/WidgetManager/default_widgets/signin.mtml
	'You are signed in as ' => 'Вы авторизовались как ',
	'You do not have permission to sign in to this blog.' => 'У Вас нет прав для регистрации на данном блоге.',

## plugins/WidgetManager/default_widgets/pages_list.mtml

## plugins/WidgetManager/default_widgets/archive_meta_widget.mtml
	'This is a custom set of widgets that are conditioned to serve different content based upon what type of archive it is included. More info: [_1]' => 'Этот набор виджетов будет показывать разное содержимое в зависимости от типа архива в котором он включен. Более подробная информация: [_1]',
	'Current Category Monthly Archives' => 'Текущие месячные архивы по темам',
	'Category Archives' => 'Архивы по темам',

## plugins/WidgetManager/default_widgets/date_based_category_archives.mtml
	'Category Yearly Archives' => 'Архивы по годам и темам',
	'Category Weekly Archives' => 'Архивы по неделям и темам',
	'Category Daily Archives' => 'Архивы по дням и темам',

## plugins/WidgetManager/default_widgets/widgets.cfg
	'About This Page' => 'О данной странице',
	'Current Author Monthly Archives' => 'Текущий месячный архив по авторам',
	'Calendar' => 'Календарь',
	'Creative Commons' => 'Creative Commons',
	'Home Page Widgets' => 'Виджеты домашней страницы',
	'Monthly Archives Dropdown' => 'Выпадающее меню месячного архива',
	'Page Listing' => 'Список страниц',
	'Powered By' => 'Powered By',
	'Syndication' => 'Синдикация',
	'Technorati Search' => 'Поиск Technorati',
	'Date-Based Author Archives' => 'Архивы авторов по датам',
	'Date-Based Category Archives' => 'Архивы категорий по датам',

## plugins/WidgetManager/default_widgets/creative_commons.mtml
	'This weblog is licensed under a' => 'Этот веблог лицензируется по',
	'Creative Commons License' => 'Лицензия Creative Commons',


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
	'Widget Sets' => 'Наборы виджетов',
	'Widget Set' => 'Набор виджетов',
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

## New words: 28

1;
