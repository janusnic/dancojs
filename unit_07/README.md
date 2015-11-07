# jQuery UI

jQuery UI - это библиотека на основе jQuery, реализующая более 20 плагинов, среди которых плагины организующие различное поведение, восемь видов виджетов и анимационные эффекты. Кроме этого, UI обладает несколькими темами оформления, с помощью которых оформляются виджеты и которые содержат набор полезных иконок. Любая из тем оформления может быть подкорректирована прямо на [сайте jQuery UI](http://jqueryui.com/themeroller/), непосредственно перед загрузкой. 


### Выбор компонентов и загрузка
Зайдите на [страницу загрузки jQuery UI](http://jqueryui.com/download/) и вы увидите, что перед скачиванием можно выбрать необходимые компоненты, тему оформления и версию библиотеки

### Выбрать оформление

Выберите одну из стандартных тем оформления плагинов jQuery UI в поле Theme или создайте свою тему с [помощью themeroller'а](http://jqueryui.com/themeroller/).

Если вы хотите использовать тему оформления, которую вы настроите самостоятельно, то в начале сделайте все необходимые настройки темы на этой странице, затем нажмите кнопку "Download theme" и вы окажетесь на странице загрузки библиотеки, где в поле Theme будет указана отредактированная вами тема.

- css — содержит файлы оформления (CSS-файл и изображения).
- js — содержит файлы с jQuery и jQuery UI.
- Development-bundle — Здесь много различных файлов с демонстрацией работы плагина и другими вспомогательными файлами.
Кроме этих трех папок, в корне архива лежит файл index.html, с демонстрацией скачанных плагинов.

## Подключение UI к вашему сайту
```
<link type="text/css" href="css/themename/jquery-ui-1.11.4.custom.css" rel="Stylesheet"/>      
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.11.4.custom.min.js"></script>
```

Все плагины поведения и виджетов обладают схожим принципом работы. Каждый плагин jQuery UI представлен одним основным методом, который вызывается на выбранных элементах. Его имя всегда совпадает с именем плагина. С помощью этого метода можно инстанцировать (устанавливать) плагин на элементы, узнавать и изменять свойства плагина, устанавливать обработчики событий, а так же, запускать функции плагина, которые называют методами.

## Инстанцирование
Для установки любого плагина на элементы страницы, достаточно выбрать нужные элементы средствами jQuery и затем вызвать на них метод работы с плагином (имя которого всегда совпадает с названием плагина):
```
$("#someId").dialog()
```
применит плагин Dialog к элементу с идентификатором someId, превратив его в диалоговое окно.
```
$("div:lt(3)").draggable()
```
применит плагин Draggable к первым трем div'ам на странице, сделав их перетаскиваемыми.
## Методы
Обычно, под методом какого-то объекта в javascript, подразумевается функция, вызываемая на этом объекте следующим образом:
```
obj.A();

// вызов метода A на объекте obj

obj.B();

// вызов метода B на объекте obj
```
Однако в пределах работы с конкретными плагинами jQuery UI, методами называют такую форму записи:
```
$("#someId").plaginName("имя метода", параметры метода);

$("#someId").dialog("close")
```
Метод close закроет диалоговое окно, установленное на элемент с id = someId
```
$("div").draggable("destroy")
```
Destroy удалит функциональность draggable со всех div-элементов на странице

## Свойства

Каждое свойство можно задать в момент инстанцирования плагина. Для этого, при установке плагина на элемент нужно передать объект со свойствами в формате {имя_свойства_1:значение_1, имя_свойства_2:значение_2, ...}:

```
// сделаем из элемента с id=someId диалоговое окно с помощью 
// плагина dialog и укажем при этом заголовок для окна

$("#someId").dialog({title:"Сообщение"});


//сделаем из первого div'а на странице календарь с помощью 
// плагина datepicker, и укажем минимальную и максимальную дату

$("div:first").datepicker({
  minDate:new Date(2007,1-1,1),  maxDate:newDate(2016,1-1,1)
    });

```
Кроме того, значение любого свойства можно узнать или изменить уже после инстанцирования плагина. Для этого необходимо использовать метод "option":
```
// узнаем заголовок у диалогового окна 
var dialogTitle = $("#someId").dialog("option","title");

// изменим заголовок, добавив к нему префикс "#1 
"$("#someId").dialog("option","title","#1 " + dialogTitle)

// изменим минимальную дату в календаре,
// который установлен на первый div на странице

$("div:first").datepicker("option", "minDate", new Date(2008,1 - 1,1));
```
## События

Обработчики событий можно устанавливать средствами основного метода плагина:

```
// обработка события close диалогового окна

$("selector").dialog({
   close: function(event,ui)
{
... }
});
```
или с помощью bind стандартного метода библиотеки jQuery:
```
// обработка события close диалогового окна

$("selector").bind("dialogclose",function(event,ui){ ... });
```

## Оформление
Все плагины jQuery UI обладают общей системой оформления. Ее можно настраивать с помощью визуального редактора ThemeRoller, а так же манипулируя css напрямую.

# Плагин Tabs 

## Tabs1.html
```
<link rel="stylesheet" href="css/smoothness/jquery-ui-1.8.9.custom.css">
Для того, чтобы сделать из элемента систему вкладок, нужно, чтобы он имел подобную структуру:
<div id="myTabs">
<ul>
<li><a href="#a">Tab 1</a></li>
<li><a href="#b">Tab 2</a></li>
</ul>
<div id="a">This is the content panel linked to the first tab, it is shown by default.</div>
<div id="b">This content is linked to the second tab and will be shown when its tab is clicked.</div>
</div>
<script src="development-bundle/jquery-1.4.4.js"></script>
<script src="development-bundle/ui/jquery.ui.core.js"></script>
<script src="development-bundle/ui/jquery.ui.widget.js"></script>
<script src="development-bundle/ui/jquery.ui.tabs.js"></script>
<script>
(function($){
$("#myTabs").tabs();
})(jQuery);
</script>
В одном блоке, часть вкладок может быть готовой, а часть подгружаемой:
  <div id="tabs">
    <ul>
      <li><a href="#tabs-1">Готовая вкладка</a></li>
      <li><a href="/ui/ex1.html">Подгружаемая вкладка 1</a></li>
      <li><a href="/ui/ex3.php">Подгружаемая вкладка 2</a></li>
    </ul>
    <div id="tabs-1">
      <p>Содержимое вкладки 1</p>
    </div>

```
Плагин Tabs использует стандартные стили jQueryUI-css для оформления вкладок. Для редактирования оформления рекомендуется использовать специальную ручную настройку на сайте jQuery UI. 

## tabs2.html
```
<link rel="stylesheet" href="css/tabsTheme.css">

#myTabs { width:400px; padding:5px; border:1px solid #636363; background:#c2c2c2 none; }

.ui-widget-header { border:0; background:#c2c2c2 none; font-family:Georgia; }

#myTabs .ui-widget-content { border:1px solid #aaa; background:#fff none; font-size:80%; }

.ui-state-default, .ui-widget-content .ui-state-default { border:1px solid #636363; background:#a2a2a2 none; }

.ui-state-active, .ui-widget-content .ui-state-active { border:1px solid #aaa; background:#fff none; }
```
#### Свойства

- selected
Определяет номер открытой вкладки (нумерация начиная с 0). Чтобы все вкладки оказались закрыты, необходимо указать значение -1.
```
// ------- Работа со свойством selected ---------
// в момент установки tabs на элемент

(function($){ var tabOpts = { selected: 1}
$("#myTabs").tabs(tabOpts);
})(jQuery);

//получение значения selected

var selected = $("selector").tabs("option","selected" );

//изменение значения selected
$("selector").tabs("option","selected",3 );
```
- Disabling

В этом свойстве можно задавать массив с номерами вкладок, которые должны оказаться недоступны для выбора.
```
// ------- Работа со свойством disabled ---------
// в момент установки tabs на элемент
$("selector").tabs({disabled: [1,2]});


//получение значения disabled 
    var disabled = $("selector").tabs(
    "option",
    "disabled" );

// изменение значения disabled
    $("selector").tabs(
    "option",
    "disabled",
    [1,2]
    );

(function($){ var tabOpts = { disabled: [1] }
$("#myTabs").tabs(tabOpts);
})(jQuery);
```
## Transition effects 6

Это свойство определяет тип анимации, используемой при скрытии и появлении вкладок, а так же продолжительность этой анимации. В поле duration можно задать продолжительность анимации (строковым значением "slow", "normal" или "fast" или целым числом — количеством миллисекунд). По умолчанию, duration равен "normal". Тип анимации задается указанием изменяемого css-свойства и режимом его изменения (насколько я понимаю, подходит только значение toggle):
```
// ------- Работа со свойством fx ---------
// в момент установки tabs на элемент
    $("selector").tabs({
    fx: {opacity:'toggle',
    duration:'fast'
    } });


//получение значения fx
    var fx = $("selector").tabs(
    "option",
    "fx" );

//изменение значения fx
    $("selector").tabs(
    "option",
    "fx",
    {opacity:'toggle',
    duration:'fast'
    } );

    (function($){ var tabOpts = {
    fx: {
    opacity: "toggle",
    duration: "slow" }
    }
    $("#myTabs").tabs(tabOpts);
    })(jQuery);

```
## Collapsible tabs 7

Если установить это свойство в true, то появится возможность сворачивать все вкладки. Для этого достаточно нажать на заголовок открытой в данный момент вкладки.
```
//------- Работа со свойством collapsible ---------
// в момент установки tabs на элемент
$("selector").tabs({
collapsible: false
});


//получение значения closeOnEscape
var collapsible = $("selector").tabs(
"option",
"collapsible" );
//изменение значения collapsible
$("selector").tabs(
"option",
"collapsible",
false );

(function($){
var tabOpts = {
collapsible: true
}
$("#myTabs").tabs(tabOpts);
})(jQuery);
```
### spinner 8
В этом свойстве можно задать текст HTML, который будет использован в качестве заголовка вкладки, пока загружается ее содержимое. Если задать в этом свойстве пустую строку, то на время загрузки содержимого, заголовок вкладки меняться не будет.
```
// ------- Работа со свойством spinner ---------
// в момент установки tabs на элемент
$("selector").tabs({
spinner: 'Загрузка...'
});
 
//получение значения spinner
var spinner = $("selector").tabs(
"option",
"spinner" );
//изменение значения spinner
$("selector").tabs(
"option",
"spinner",
'Загрузка...' );
```
### Tab events 9

В event можно указать, событие какого типа должно произойти на элементе заголовка вкладки, чтобы она открылась.
```
//------- Работа со свойством event ---------
//в момент установкиtabs на элемент
$("selector").tabs({
event: 'mouseover'
});
//получение значения event
var event = $("selector").tabs(
"option",
"event" );
//изменение значения event
$("selector").tabs(
"option",
"event",
'mouseover' );

(function($){
var handleSelect = function(e, tab) {
$("<p></p>", {
text: "Tab at index " + tab.index + " selected",
"class": "status-message ui-corner-all"
}).appendTo(".ui-tabs-nav", "#myTabs").fadeOut(5000, function() {
$(this).remove();
});
},
tabOpts = {
select: handleSelect
}
$("#myTabs").tabs(tabOpts);
})(jQuery);

```
### Tabs9.html
Это событие происходит, когда вкладка становится видимой.
```
// обработка события show
$("selector").tabs({
   show:
function(event,
ui)
{
... }
});
 
// еще один способ (используя метод bind)
$("selector").bind("tabsshow",
function(event,ui){ ... });

(function($){
$("#myTabs").tabs();
$("#myTabs").bind("tabsselect", function(e, tab) {
alert("The tab at index " + tab.index + " was selected");
});
})(jQuery);

```

### create
Событие create происходит в момент инициализации tabs на элементе.
```
// обработка события create
$("selector").tabs({
   create:
function(event,ui)
{
... }
});
 
// еще один способ (используя метод bind)
$("selector").bind(
"tabscreate",
function(event,
ui){ ... });
```
### add 11
Это событие происходит при добавлении новой вкладки.
```
// обработка события add
$("selector").tabs({
   add:
function(event,ui)
{
... }
});
 
// еще один способ (используя метод bind)
$("selector").bind(
"tabsadd",
function(event,ui){ ... });
```

### disable 10
Это событие происходит, когда одна из вкладок становиться активной (доступной для выбора).
```
// обработка события disable
$("selector").tabs({
   tabsdisable:
function(event,ui)
{
... }
});
 
// еще один способ (используя метод bind)
$("selector").bind(
"disable",
function(event,ui){ ... });

```
### enable 10

Это событие происходит, когда одна из вкладок становиться неактивной (недоступной для выбора).
```
// обработка события enable
$("selector").tabs({
   enable:
function(event,ui)
{
... }
});
 
// еще один способ (используя метод bind)
$("selector").bind(
"tabsenable",
function(event,
ui){ ... });

```


### load

Это событие происходит в момент окончания ajax-загрузки удаленной вкладки.
```
// обработка события load
$("selector").tabs({
   load:function(event,ui)
{
... }
});
 
// еще один способ (используя метод bind)
$("selector").bind(
"tabsload",function(event,ui){ ... });
```
### remove

Это событие происходит при удалении вкладки.
```
// обработка события remove
$("selector").tabs({
   remove:function(event,ui)
{
... }
});
 
// еще один способ (используя метод bind)
$("selector").bind(
"tabsremove",function(event,ui){ ... });

```
### select

Это событие происходит, при клике по заголовку вкладки. Если обработчик этого события вернет значение false, то переключения между вкладками не произойдет.
```
// обработка события select
$("selector").tabs({
   select:function(event,ui)
{
... }
});
 
// еще один способ (используя метод bind)
$("selector").bind(
"tabsselect",function(event,ui){ ... });

```

## Tabs10.html

```

(function($){
$("#myTabs").tabs({
disabled: [1]
});

$("#enable").click(function() {
$("#myTabs").tabs("enable", 1);
});

$("#disable").click(function() {
$("#myTabs").tabs("disable", 1);
});
})(jQuery);

```

### Adding and removing tabs tabs11.html

```

(function($){
$("#myTabs").tabs();
$("#remove").click(function() {
$("#myTabs").tabs("remove", parseInt($("#indexNum").val(), 10));
});

$("#add").click(function() {
$("#myTabs").tabs("add", "remoteTab.txt", "A New Tab!");
});
})(jQuery);

```

## Simulating clicks tabs12.html

```

(function($){
$("#myTabs").tabs();
$("#remove").click(function() {
$("#myTabs").tabs("remove", parseInt($("#indexNum").val(), 10));
});

$("#add").click(function() {
$("#myTabs").tabs("add", "remoteTab.txt", "A New Tab!").tabs("select", $("#myTabs").tabs("length") - 1);
});
})(jQuery);

```
## tab carousel yabs13.html

```

(function($){
$("#myTabs").tabs().tabs("rotate", 1000, true);
})(jQuery);

```
## tabs14.html

```

(function($){
$("#myTabs").tabs();
$("#destroy").click(function() {
$("#myTabs").tabs("destroy");
});
})(jQuery);

```

## Получение и учтановка options tabs15

```
<button type="button" id="show">Show Selected</button>


(function($){
$("#myTabs").tabs();
$("#show").click(function() {
$("<p></p>", {
text: "Tab at index " + $("#myTabs").tabs("option", "selected") + " is active"
}).appendTo(".ui-tabs-nav").fadeOut(5000);
});
})(jQuery);
```
## tabs16.html

```
<label for="newIndex">Enter a tab index to select</label>
<input id="newIndex" type="text">
<button type="button" id="set">Change Selected</button>

(function($){
$("#myTabs").tabs();
$("#set").click(function() {
$("#myTabs").tabs("option", "selected", parseInt($("#newIndex").val()));
});
})(jQuery);

```

## AJAX tabs tabs17

```
<div id="myTabs">
<ul>
<li><a href="#a">Tab 1</a></li>
<li><a href="#b">Tab 2</a></li>
<li><a href="remoteTab.txt">AJAX Tab</a></li>
</ul>


(function($){
$("#myTabs").tabs();
})(jQuery);

```
## Changing the URL of a remote tab's content tabs18

```
<div id="myTabs">
<ul>
<li><a href="#a">Tab 1</a></li>
<li><a href="#b">Tab 2</a></li>
<li><a href="remoteTab.txt">AJAX Tab</a></li>
</ul>
<select id="fileChooser">
<option value="remoteTab1">remoteTab.txt</option>
<option value="remoteTab2">remoteTab2.txt</option>
</select>

(function($){
$("#myTabs").tabs();
$("#fileChooser").change(function() {
$("#myTabs").tabs("url", 2, $(this).val());
});
})(jQuery);

```
## Reloading a remote tab tabs19

```

(function($){
$("#myTabs").tabs();
$("#fileChooser").change(function() {

$("#myTabs").tabs("url", 2, $(this).val()).tabs("load", 2);
});
})(jQuery);

```

## Displaying data obtained via JSONP 20
```
<div id="myTabs">
<ul>
<li><a href="#a"><span>Nebula Information</span></a>
</li>
<li><a href="#flickr"><span>Images</span></a></li>
</ul>
<div id="flickr"></div>
</div>

(function($){
var img = $("<img/>", {
height: 100,
width: 100
}),
tabOpts = {
select: function(event, ui) {
if (ui.tab.toString().indexOf("flickr") != -1 ) {
$("#flickr").empty();

$.getJSON("http://api.flickr.com/services/feeds/photos_public.gne?tags=nebula&format=json&jsoncallback=?", function(data) {
$.each(data.items, function(i,item){
img.clone().attr("src", item.media.m).appendTo("#flickr");
if (i == 5) { return false; }
        });
    });
 }}
};

$("#myTabs").tabs(tabOpts);
})(jQuery);

```

## Как узнать номер открытой вкладки?

```
// Если вкладки установлены на элемент с
id = example:
var $tabs = $('#example').tabs();
// то получить номер открытой вкладки можно так:
var selected = $tabs.tabs('option', 'selected');

```

## Как открыть ссылку прямо во вкладке, не покидая страницу?

Если необходимо, чтобы при нажатии по ссылке, которая находится внутри вкладки, содержимое страницы по ссылке загрузилось в эту вкладку, вместо того, чтобы пользователь перешел на эту страницу

```
// "перехватим" нажатие по ссылке и загрузим средствами jQuery
// содержимое находящееся по ссылке прямо во вкладку:
$('#example').tabs({
  load:
function(event,
ui)
{
    $('a',
ui.panel).click(function()
{
      $(ui.panel).load(this.href);
      return false;
    });
  }
});
```
Как открыть вкладку по нажатию на ссылку, а не заголовок вкладки?

Если необходимо, чтобы при нажатии по ссылке, которая находится внутри вкладки, содержимое страницы по ссылке загрузилось в эту вкладку, вместо того, чтобы пользователь перешел на эту страницу

```
// инициализация вкладок
// (будет открыта первая вкладка)
var $tabs = $('#example').tabs();

// при нажатии на ссылку, сымитируем нажатие по нужной вкладке
$('#my-text-link').click(function()
{
    $tabs.tabs('select',
2);
    return
false;
});
```
Как предотвратить выбор другой вкладки, пока не будет пройдена валидация формы в текущей вкладке?

Воспользуемся тем, что когда обработчик события tabsselect возвращает false, переключение вкладки не происходит:

```
$('#example').tabs({
    select:
function(event,ui)
{
        var isValid =
... // выполним валидацию, присвоив переменной true или false
        return isValid;
    }
});
```
Как незамедлительно открыть добавленную вкладку?

Воспользуемся тем, что при добавлении новой вкладки происходит событие tabsadd
```
var $tabs = $('#example').tabs({
    add:function(event,ui)
{
        $tabs.tabs('select','#'+ui.panel.id);
    }
});
```
Как избавиться от эффекта FOUC (Flash of Unstyled Content) пока идет инициализация вкладок?

Эффектом FOUC называют тот случай, когда браузер собирает (инициализирует) тяжелую страницу не мгновенно, а за несколько секунд, во время которых в окне браузера постоянно мельтешат элементы страницы.

Наиболее простым способом является скрыть вкладки, которые должны оказаться закрытыми, добавив их элементам специальный класс.
```
<div id="example" class="ui-tabs">
  ...
  <div id="a-tab-panel" class="ui-tabs-hide">
</div>
  ...
</div>
```
Почему мой слайдер (или Google Map, или sIFR и т.д.) не работает, если он был в первоначально закрытой вкладке?

Многие виджеты в момент инициализации пытаются узнать свой размер, но если они находятся в закрытой вкладке, то они не смогут это сделать: элемент вкладки скрыт с помощью css-правила display:none, а значит размеры всех содержащихся в нем элементов равны 0.

Эту проблему можно исправить, изменив способ скрытия вкладок на "смещение влево". Для этого нужно переписать следующие правила:
```
.ui-tabs
.ui-tabs-hide
{
    position:absolute;
    left:-10000px;
}
```
Для Google Map подойдет и другой способ. Можно вызвать метод пересчета размеров карты, когда вкладка с ней будет открыта:
```
$('#example').bind('tabsshow',
function(event,ui) {
    if(ui.panel.id=="map-tab")
{
        resizeMap();
    }
});

```
## Accordion Widget
### Accordion's structure 1
```
<title>Accordion</title>
<link rel="stylesheet" href="css/smoothness/jquery-ui.css">
<div id="myAccordion">
</div>
<script src="development-bundle/jquery-1.4.4.js"></script>
<script src="development-bundle/ui/jquery.ui.core.js"></script>
<script src="development-bundle/ui/jquery.ui.widget.js"></script>
<script src="development-bundle/ui/jquery.ui.accordion.js">
</script>

(function($){
$("#myAccordion").accordion();
})(jQuery);
```
### Styling accordion 2
```
<link rel="stylesheet" href="css/accordionTheme.css">
```
## Конфигурация accordion 3
```


(function($){

var accOpts = {

event: "mouseover"

};

$("#myAccordion").accordion(accOpts);

})(jQuery);


```
### Изменить default active header 4

Это свойство отвечает за то, какая вкладка окажется открыта. Если указать в нем false, то все вкладки будут закрыты.
```
//------- Работа со свойством active ---------
// в момент установки accordion на элемент
$("selector").accordion({
active:false
});


//получение значения active
var active = $(".selector").accordion("option","active" );
//изменение значения addClasses
$("selector").accordion( "option", "active", false );


(function($){

var accOpts = {

active: 2

};

$("#myAccordion").accordion(accOpts);

})(jQuery);


```
Изменить конфигурацию object 5
```
(function($){

var accOpts = {

active: false

};

$("#myAccordion").accordion(accOpts);

})(jQuery);
```
collapsible option 6

По умолчанию, пользователь не может закрывать вкладки, а только переключать. Однако если свойство collapsible установлено в true, то нажатие на заголовок открытой вкладки приведет к ее закрытию (если вкладки переключаются при наведении курсора на заголовок, то и закрытие будет происходить при наведении, а не при нажатии).
```
// ------- Работа со свойством collapsible ---------
// в момент установки accordion на элемент
$("selector").accordion({
collapsible:true
});
 
//получение значения collapsible
var collapsible = $("selector").accordion(
"option",
"collapsible" );
//изменение значения collapsible
$("selector").accordion(
"option",
"collapsible",
true );


(function($){

var accOpts = {

active: false,

collapsible: true

};

$("#myAccordion").accordion(accOpts);

})(jQuery);


```

Filling 7

Аккордеон занимает все возможное горизонтальное пространство внутри своего родителя. Если необходимо, чтобы он занимал также и все свободное пространство по вертикали, необходимо установить свойство fillSpace в true. Однако, это не означает, что если родитель изменит свою высоту, то аккордеон изменит свою вслед за ним. Такое поведение необходимо организовывать самостоятельно.
```
// ------- Работа со свойством fillSpace ---------
// в момент установки accordion на элемент
$("selector").accordion({
fillSpace:true
});
 
//получение значения fillSpace
var fillSpace = $("selector").accordion(
"option",
"fillSpace" );
//изменение значения fillSpace
$("selector").accordion(
"option",
"fillSpace",
true );


#container { height:600px; width:400px; }

</style>

<div id="container">

<div id="myAccordion">


(function($){
var accOpts = {
fillSpace: true
};
$("#myAccordion").accordion(accOpts);
})(jQuery);

```
Accordion animation 8

Этот параметр определяет тип анимации. Задав false, вы отключите анимационную смену вкладок аккордеона.
```
// ------- Работа со свойством animated ---------
// в момент установки accordion на элемент
$("selector").accordion({
animated:"bounceslide"
});
 
//получение значения animated
var animated = $("selector").accordion(
"option",
"animated" );
//изменение значения animated
$("selector").accordion(
"option",
"animated",
"bounceslide" );
Тип "bounceslide" доступен только при подключенном UI Effects Core.

(function($){

var accOpts = {

animated: false

};

$("#myAccordion").accordion(accOpts);

})(jQuery);
```
## jquery.effects.core.js 9
```
<script src="development-bundle/ui/jquery.effects.core.js">

</script>


(function($){

var accOpts = {

animated: "bounceslide"

};

$("#myAccordion").accordion(accOpts);

})(jQuery);


```
jquery.effects.core.js 10 - 11
```
(function($){

var accOpts = {

animated: "easeOutBounce"

};

$("#myAccordion").accordion(accOpts);

})(jQuery);



(function($){

var accOpts = {

clearStyle: true,

animated: "easeOutBounce"

};
```

Accordion изменить события 12
```


(function($){

var accOpts = {

change: function(e, ui) {

$(".notify").remove();

$("<div />", {

"class": "notify",

text: ([

ui.newHeader.find("a").text(),

"was activated,",

ui.oldHeader.find("a").text(),

"was closed"].join(" "))

}).insertAfter("#myAccordion").fadeOut(2000, function(){

$(this).remove();

});

}};

$("#myAccordion").accordion(accOpts);

})(jQuery);


```
События при старте 13
```


(function($){

var accOpts = {

changestart: function(e, ui) {

$(".notify").remove();

$("<div />", {

"class": "notify",

text: ([ui.newHeader.find("a").text(), "was activated,", ui.oldHeader.find("a").text(), "was closed"].join(" "))

}).insertAfter("#myAccordion").fadeOut(2000, function(){

$(this).remove();

});

}};

$("#myAccordion").accordion(accOpts);

})(jQuery);


```
#### Навигация 14

Если этот параметр включен, то вкладки аккордеона можно будет открывать по принципу якорей. Если вы хотите самостоятельно обрабатывать ситуацию и принимать решение, о том, какая вкладка должна быть открыта, используйте параметр navigationFilter.
```
// ------- Работа со свойством navigation ---------
// в момент установки accordion на элемент
$(".selector").accordion({
navigation:15
});
 
//получение значения navigation
var navigation = $(".selector").accordion(
"option",
"navigation" );
//изменение значения navigation
$(".selector").accordion(
"option",
"navigation",
15 );


<link rel="stylesheet" href="css/accordionTheme2.css">



(function($){

var accOpts = {

navigation: true

};

$("#myAccordion").accordion(accOpts);

})(jQuery);


```
## Accordion методы

Header activation 15

С помощью этого свойства можно задать элементы, которые будут использоваться в качестве заголовков.
```
// ------- Работа со свойством header ---------
// в момент установки accordion на элемент
$("selector").accordion({
header:'h3'
});


//получение значения header
var header = $("selector").accordion(
"option",
"header" );
//изменение значения cursorAt
$("selector").accordion(
"option",
"header",
'h3' );


<label for="activateChoice">Enter a header index to activate</label>

<input id="activateChoice">

<button type="button" id="activate">Activate</button>


(function($){

$("#myAccordion").accordion();

$("#activate").click(function() {

$("#myAccordion").accordion("activate", parseInt($("#activateChoice").val(), 10));

});

})(jQuery);


```
Перерисовка размера accordion panel 16

Событие change происходит при переключении вкладок аккордеона. Если переключение анимировано, то это событие будет происходить в течении выполнения анимации (неоднократно). Если вам нужно среагировать на переключение лишь один раз, используйте событие changestart.
```
// второй параметр передаваемый в обработчик будет обладать специфическими полями:
$('.ui-accordion').bind('accordionchange',
function(event,
ui) {
  ui.newHeader
// объект jQuery с элементом, являющимся заголовком ОТКРЫВАЮЩЕЙСЯ вкладки
  ui.oldHeader
// -||-||- ЗАКРЫВАЮЩЕЙСЯ вкладки  
 ui.newContent
// объект jQuery с элементом, являющимся содержимым ОТКРЫВАЮЩЕЙСЯ вкладки
  ui.oldContent
//-||-||- ЗАКРЫВАЮЩЕЙСЯ вкладки
});
 
//обработка события change
$("selector").accordion({
   change:function(event,ui)
{
... }
});
 
//еще один способ (используя метод bind)
$("selector").bind(
"accordionchange",
function(event,
ui){ ... });

```
Событие changestart происходит в момент начала переключения вкладок аккордеона.
```
// второй параметр передаваемый в обработчикбудет обладать специфическими полями:
$('.ui-accordion').bind('accordionchange',
function(event,ui) {
  ui.newHeader
//объект jQuery с элементом, являющимся заголовком ОТКРЫВАЮЩЕЙСЯ вкладки
  ui.oldHeader
//-||-||- ЗАКРЫВАЮЩЕЙСЯ вкладки
  ui.newContent
//объект jQuery с элементом, являющимся содержимым ОТКРЫВАЮЩЕЙСЯ вкладки
  ui.oldContent
//-||-||- ЗАКРЫВАЮЩЕЙСЯ вкладки
});
 
//обработка события changestart
$("selector").accordion({
   changestart:
function(event,ui)
{
... }
});
 
//еще один способ (используя метод bind)
$("selector").bind(
"accordionchangestart",
function(event,
ui){ ... });
<h2 id="remote"><a href="remoteAccordion.txt">Remote</a></h2>

<div></div>


(function($){

var accOpts = {

changestart: function(e, ui) {

if (ui.newHeader.attr("id") === "remote") {

$.get(ui.newHeader.find("a").attr("href"), function(data) {

ui.newHeader.next().text(data);

});

}

},

change: function(e, ui) {

ui.newHeader.closest("#myAccordion").accordion("resize");

}

};

$("#myAccordion").accordion(accOpts);

})(jQuery);



```

Accordion interoperability 17
```
<div id="myAccordion">

<h2><a href="#">Header 1</a></h2>

<h2><a href="#">Header 2</a></h2>

<h2><a href="#">Header 3</a></h2>

<div>

<div id="myTabs">

<ul>

<li><a href="#0"><span>Tab 1</span></a></li>

<li><a href="#1"><span>Tab 2</span></a></li>

</ul>

<div id="0">This is the content panel linked to the first tab, it is shown by default.</div>

<div id="1">This content is linked to the second tab and will be shown when its tab is clicked.</div>

</div>

</div>

</div>


(function($){

$("#myAccordion").accordion();

$("#myTabs").tabs();

})(jQuery);


```
19 fillSpace
```
<div id="container" class="ui-helper-clearfix">

<div id="myAccordion">

<h2><a href="#me" title="About Me">About Me</a></h2>

<div>

<a href="accordionMe.html#me" title="Bio">My Bio</a>

<a href="accordionMe.html#me" title="Contact Me">Contact Me</a>

<a href="accordionMe.html#me" title="Resume">My Resume</a>

</div>

<h2><a href="#js" title="JavaScript">JavaScript</a></h2>

<div>

<a href="accordionJS.html#js" title="Tutorials">Tutorials</a>

<a href="accordionJS.html#js" title="AJAX">AJAX</a>

<a href="accordionJS.html#js" title="Apps">Apps</a>

</div>

</div>

<div id="contentCol">

<h1>JavaScript</h1>

</div>

</div>


(function($){

var accOpts = {

fillSpace: true,

navigation: true

};

$("#myAccordion").accordion(accOpts);

})(jQuery);


```
20 Навигация
```
<link rel="stylesheet" href="css/accordionTheme2.css">

<div id="container" class="ui-helper-clearfix">

<div id="myAccordion">

<h2><a href="#me" title="About Me">About Me</a></h2>

<div>

<a href="accordionMe.html#me" title="Bio">My Bio</a>

<a href="accordionMe.html#me" title="Contact Me">Contact Me</a>

<a href="accordionMe.html#me" title="Resume">My Resume</a>

</div>

<h2><a href="#js" title="JavaScript">JavaScript</a></h2>

<div>

<a href="accordionJS.html#js" title="Tutorials">Tutorials</a>

<a href="accordionJS.html#js" title="AJAX">AJAX</a>

<a href="accordionJS.html#js" title="Apps">Apps</a>

</div>

</div>

<div id="contentCol">

<h1>About Me</h1>

</div>

</div>


(function($){

var accOpts = {

fillSpace: true,

navigation: true

};

$("#myAccordion").accordion(accOpts);

})(jQuery);


```

# Dialog  dialog1

Требуются: 

- jquery-ui-x.x.x.custom.css 
- jquery-x.x.x.js 
- jquery.ui.core.js 
- jquery.ui.widget.js 
- jquery.ui.position.js 
- jquery.ui.dialog.js
```
<!DOCTYPE html> 
<html> 
    <head> 
        <meta charset="utf-8"> 
        <title>Dialog</title> 
        <link rel="stylesheet" href="css/smoothness/jquery-ui-1.8.9.custom.css"> 
    </head> 
    <body> 
        <div id="myDialog" title="This is the title!">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean sollicitudin. Sed interdum pulvinar justo. Nam iaculis volutpat ligula. Integer vitae felis quis diam laoreet ullamcorper. Etiam tincidunt est vitae est.</div> 
        <script src="development-bundle/jquery-1.4.4.js"></script> 
        <script src="development-bundle/ui/jquery.ui.core.js"></script> 
        <script src="development-bundle/ui/jquery.ui.widget.js"></script> 
        <script src="development-bundle/ui/jquery.ui.position.js"></script> 
        <script src="development-bundle/ui/jquery.ui.dialog.js"></script> 
        <script> 
            (function($){ 
                $("#myDialog").dialog(); 
            })(jQuery); 
        </script> 
    </body> 
</html>
```
## dialog2 resizable.js

- jquery.ui.mouse.js 
- jquery.ui.draggable.js 
- jquery.ui.resizable.js
```
<div id="myDialog" title="This is the title!">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean sollicitudin. Sed interdum pulvinar justo. Nam iaculis volutpat ligula. Integer vitae felis quis diam laoreet ullamcorper. Etiam tincidunt est vitae est.</div> 
<script src="development-bundle/ui/jquery.ui.mouse.js"></script> 
<script src="devpment-bundle/ui/jquery.ui.draggable.js"></script> 
<script src="devment-bundle/ui/jquery.ui.resizable.js"></script> 
            (function($){ 
                $("#myDialog").dialog(); 
            })(jQuery); 
```
## Dialog опции dialog3
```
        <div id="myDialog" title="This is the title!"></div> 
        (function($){ 
            var dialogOpts = { 
                autoOpen: false  
            }; 
        $("#myDialog").dialog(dialogOpts); 
        })(jQuery); 
```

## Заголовок dialog 4
```
            (function($){ 
                var dialogOpts = { 
                    title: "<a href='#'>A link title!</a>" 
                }; 
                $("#myDialog").dialog(dialogOpts); 
            })(jQuery); 
```
## Модальный диалог 5

```
            (function($){ 
                var dialogOpts = { 
                    modal: true 
                }; 
                $("#myDialog").dialog(dialogOpts); 
            })(jQuery); 
```
## Добавить кнопки 6
```
            (function($){ 
                var execute = function() {}, 
                    cancel = function() {}, 
                    dialogOpts = { 
                        buttons: { 
                            "Ok": execute, 
                            "Cancel": cancel 
                        } 
                    }; 
                $("#myDialog").dialog(dialogOpts); 
            })(jQuery); 
```
#### Анимация 7

```
<script src="development-bundle/external/jquery.bgiframe-2.1.2.js"></script> 
            (function($){ 
                var dialogOpts = { 
                    show: true, 
                    hide: true                       
                }; 
                $("#myDialog").dialog(dialogOpts); 
            })(jQuery); 
Configuring the dialog's dimensions 8
            (function($){ 
                var dialogOpts = { 
                    width: 500, 
                    height: 300, 
                    minWidth: 150, 
                    minHeight: 150, 
                    maxWidth: 600, 
                    maxHeight: 450 
                }; 
                $("#myDialog").dialog(dialogOpts); 
            })(jQuery); 
```
#### Stacking 9
```
            (function($){                
                $("#dialog1, #dialog2").dialog(); 
            })(jQuery); 
```

## События 10
```
        <div id="status" class="ui-widget ui-dialog ui-corner-all ui-widget-content"> 
            <div class="ui-widget-header ui-dialog-titlebar ui-corner-all">Dialog Status</div> 
            <div class="ui-widget-content ui-dialog-content"></div>     </div> 
    <div id="dialog1" title="Dialog 1">Lorem ipsum dolor sit amet, </div> 
        (function($){ 
            var dialogOpts = { 
                open: function() { 
        $("#status").children(":last").text("The dialog is open"); 
                }, 
                close: function() { 
        $("#status").children(":last").text("The dialog is closed"); 
                }, 
                beforeclose: function() {            
                    if ($("#dialog1").width() > 300) { 
                        return false; 
                    } 
                } 
            }; 
            $("#dialog1").dialog(dialogOpts); 
        })(jQuery); 
```

## Toggling dialog 11
```
<button type="button" id="toggle">Toggle dialog!</button> 
        <div id="myDialog" title="This is the title!">Lorem ipsum 
            (function($){ 
                var dialogOpts = { 
                    autoOpen: false  
                }; 
                $("#myDialog").dialog(dialogOpts); 
                $("#toggle").click(function() { 
                    if (!$("#myDialog").dialog("isOpen")) { 
                        $("#myDialog").dialog("open"); 
                    } else { 
                        $("#myDialog").dialog("close"); 
                    }; 
                }); 
            })(jQuery); 
```
## Получить данные 12
```
<p>Please answer the opinion poll:</p> 
        <div id="myDialog" title="Best Widget Library"> 
    <p>Is jQuery UI the greatest JavaScript widget library?</p> 
            <label for="yes">Yes!</label> 
    <input type="radio" id="yes" value="yes" name="question" checked="checked"><br> 
            <label for="no">No!</label> 
<input type="radio" id="no" value="no" name="question"> 
        </div>
(function($){ 
    var execute = function() { 
    var answer = $("#myDialog").find("input:checked").val(); 

$("<p>").text("Thanks for selecting " + answer).appendTo($("body")); 
                        $("#myDialog").dialog("close"); 
                    }, 
                    cancel = function() { 
                        $("#myDialog").dialog("close"); 
                    }, 
                    dialogOpts = { 
                        buttons: { 
                            "Ok": execute, 
                            "Cancel": cancel 
                        } 
                    }; 
                $("#myDialog").dialog(dialogOpts); 
            })(jQuery); 
```

## Dialog interoperability 13
```
<div id="myDialog" title="An Accordion Dialog"> 
    <div id="myAccordion"> 
    <h2><a href="#">Header 1</a></h2> 
<div>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean sollicitudin.</div> 
    <h2><a href="#">Header 2</a></h2> 
<div>Etiam tincidunt est vitae est. Ut posuere, mauris at sodales rutrum, turpis.</div> 
    <h2><a href="#">Header 3</a></h2> 
<div>Donec at dolor ac metus pharetra aliquam. Suspendisse purus.</div> 
    </div> 
</div>
<script src="devement-bundle/ui/jquery.ui.accordion.js"></script>
            (function($){ 
            $("#myDialog").dialog(); 
            $("#myAccordion").accordion(); 
            })(jQuery); 
```

## Создание image-based dialog 14
```
<div id="thumbs" class="ui-corner-all"> 
<div class="ui-widget-header ui-corner-top"> 
    <h2>Some Common Flowers</h2> 
</div> 
<p>(click a thumbnail to view a full-size image)</p> 
    <div class="thumb ui-helper-clearfix ui-widget-content"> 
    <a href="img/haFull.jpg" title="Helianthus annuus"><img src="img/haThumb.jpg" alt="Helianthus annuus"></a> 
    <h3>Helianthus annuus</h3> 
    <p>Sunflowers (Helianthus annuus) are annual plants native to the Americas, that possess a large flowering head</p> 
</div> 
<div class="thumb ui-helper-clearfix ui-widget-content"> 
    <a href="img/lcFull.jpg" title="Lilium columbianum"><img src="img/lcThumb.jpg" alt="Lilium columbianum"></a> 
    <h3>Lilium columbianum</h3> 
    <p>The Lilium columbianum is a lily native to western North America. It is also known as the Columbia Lily or Tiger Lily</p> 
</div> 
<div class="thumb ui-helper-clearfix ui-widget-content"> 
    <a href="img/msFull.jpg" title="Myosotis scorpioides"><img src="img/msThumb.jpg" alt="Myosotis scorpioides"></a> 
    <h3>Myosotis scorpioides</h3> 
    <p>The Myosotis scorpioides, or Forget-me-not, is a herbaceous perennial plant of the genus Myosotis.</p> 
</div> 
<div class="thumb ui-helper-clearfix ui-widget-content ui-corner-bottom last"> 
    <a href="img/nnFull.jpg" title="Nelumbo nucifera"><img src="img/nnThumb.jpg" alt="Nelumbo nucifera"></a> 
    <h3>Nelumbo nucifera</h3> 
    <p>Nelumbo nucifera is known by a number of names including Indian lotus, sacred lotus, bean of India, or simply Lotus.</p> 
</div> 
</div> 
    <div id="dialog"></div>
<script src="devment-bundle/ui/jquery.ui.draggable.js"></script> 

            (function($){ 
                var fileName, 
                    titleText, 
                    dialogOpts = { 
                        modal: true, 
                        width: 388, 
                        height: 470, 
                        autoOpen: false, 
                        open: function() { 

                            $("#dialog").empty(); 
                            $("<img />", { 
                                src: fileName 
                            }).appendTo("#dialog"); 
                $("#dialog").dialog("option", "title", titleText); 
                        } 
                    }; 
                $("#dialog").dialog(dialogOpts); 
                $("#thumbs").find("a").click(function(e) { 
                    e.preventDefault(); 
                    fileName = $(this).attr("href"); 
                    titleText = $(this).attr("title"); 
                    $("#dialog").dialog("open"); 
                }); 
            })(jQuery); 

```
## Slider Widget
### Имплементация slider1
```
<div id="mySlider"></div> 
 <script src="development-bundle/jquery-1.4.4.js"></script> 
 <script src="devpment-bundle/ui/jquery.ui.core.js"></script> 
 <script src="devopment-bundle/ui/jquery.ui.widget.js"></script> 
 <script src="development-bundle/ui/jquery.ui.mouse.js"></script> 
 <script src="development-bundle/ui/jquery.ui.slider.js"></script> 
        <script> 
            (function($){ 
                $("#mySlider").slider(); 
            })(jQuery); 
```
## Custom styling 2
```
<link rel="stylesheet" href="css/sliderTheme.css">
<div class="background-div"> 
<div id="mySlider"></div> 
</div>
            (function($){ 
                $("#mySlider").slider(); 
            })(jQuery); 
```

## vertical slider 3
```
            (function($){ 
                var sliderOpts = { 
                    orientation: "vertical"  
                }; 
                $("#mySlider").slider(sliderOpts); 
            })(jQuery); 
```
## Minimum и maximum 4
```
            (function($){ 
                var sliderOpts = { 
                    min: -50, 
                    max: 50 
                }; 
                $("#mySlider").slider(sliderOpts); 
            })(jQuery); 
```
## Slider шаг 5 
```
            (function($){ 
                var sliderOpts = { 
                    step: 25 
                }; 
                $("#mySlider").slider(sliderOpts); 
            })(jQuery); 
```
## Slider animation 6
```
            (function($){ 
                var sliderOpts = { 
                    animate: true 
                }; 
                $("#mySlider").slider(sliderOpts); 
            })(jQuery); 
```
## Установка value 7
```
            (function($){ 
                var sliderOpts = { 
                    value: 50 
                }; 
                $("#mySlider").slider(sliderOpts); 
            })(jQuery); 
```
## Несколько handles 8
```
            (function($){ 
                var sliderOpts = { 
                    values: [25, 75] 
                }; 
                $("#mySlider").slider(sliderOpts); 
            })(jQuery); 
```
## Диапазон элемента 9
```
            (function($){ 
                var sliderOpts = { 
                    values: [25, 75], 
                    range: true 
                }; 
                $("#mySlider").slider(sliderOpts); 
            })(jQuery); 
```
## Максимум двух handles 10
```
            (function($){ 
                var sliderOpts = { 
                    range: "min" 
                }; 
                $("#mySlider").slider(sliderOpts); 
            })(jQuery); 
```
## События API 11
```
 <link rel="stylesheet" href="css/sliderTheme2.css">
            (function($){ 
                var sliderOpts = { 
                    start: function() { 
                        $("#tip").fadeOut(function() { 
                            $(this).remove(); 
                        });  
                    }, 
                    change: function(e, ui) { 
                    $("<div />", { 
                    "class": "ui-widget-header ui-corner-all", 
                            id: "tip", 
                            text: ui.value + "%", 
                            css: { 
                                left: e.pageX - 35                                  } 
                        }).appendTo("#mySlider"); 
                    } 
                }; 
                $("#mySlider").slider(sliderOpts); 
            })(jQuery); 
```
## Методы 12
```
value Set a single slider handle to a new value. This will move the handle to the new position on the track automatically. This method accepts a single argument which is an integer representing the new value .
<div id="mySlider"></div> 
   <button type="button" id="setMax">Set to max value</button> 
    (function($){ 
        $("#mySlider").slider(); 
        $("#setMax").click(function() { 
        var maxVal = $("#mySlider").slider("option", "max"); 
        $("#mySlider").slider("value", maxVal); 
        }); 
    })(jQuery); 
```
## Методы 13
```
values Set the specified handle to move to a new value when multiple handles are in use. This method is exactly the same as the valu e method, except that it takes two arguments—the index number of the handle followed by the new value.
<div id="mySlider"></div> 
        <button class="preset" id="low">Preset 1 (low)</button> 
    <button class="preset" id="high">Preset 2 (high)</button> 
            (function($){ 
                var sliderOpts = { 
                    values: [25, 75] 
                }; 
                $("#mySlider").slider(sliderOpts); 
                $(".preset").click(function() { 
                    if (this.id === "low") { 
                    $("#mySlider").slider("values", 0, 0); 
                    $("#mySlider").slider("values", 1, 25); 
                    } else { 
                    $("#mySlider").slider("values", 0, 75); 
                    $("#mySlider").slider("values", 1, 100); 
                    } 
                }); 
            })(jQuery); 
```
## audio id="audio" 14
```
<audio id="audio" src="http://upload.wikimedia.org/wikipedia/en/7/77/Jamiroquai_-_Snooze_You_Lose.ogg"> 
    Your browser does not support the audio element. 
</audio>  
<div id="volume"></div>
            (function($){ 
                var audio = $("audio")[0], 
                    sliderOpts = { 
                        value: 5, 
                        min: 0, 
                        max: 10, 
                        orientation: "vertical", 
                        change: function() { 
                        var vol = $(this).slider("value") / 10; 
                            audio.volume = vol; 
                        } 
                    }; 
                audio.volume = 0.5; 
                audio.play(); 
                $("#volume").slider(sliderOpts); 
            })(jQuery); 
```
## color slider 15
```
<div id="container" class="ui-widget ui-corner-all ui-widget-content ui-helper-clearfix"> 
            <label>R:</label><div id="rSlider"></div><br> 
            <label>G:</label><div id="gSlider"></div><br> 
            <label>B:</label><div id="bSlider"></div> 
<div id="colorBox" class="ui-corner-all ui-widget-content"></div> 
<input id="output" type="text" value="rgb(255,255,255)"> 
<label for="output" id="outputLabel">Color value:</label> 
</div>
(function($){ 
        var sliderOpts = { 
            min:0, 
            max: 255, 
            value: 255, 
    slide: function() { 
        var r = $("#rSlider").slider("value"), 
        g = $("#gSlider").slider("value"), 
        b = $("#bSlider").slider("value"); 
    var rgbString = ["rgb(", r, ",", g, ",", b, ")"].join(""); 
    $("#colorBox").css({ backgroundColor: rgbString }); 
                $("#output").val(rgbString); 
            } 
        }; 
$("#rSlider, #gSlider, #bSlider").slider(sliderOpts); 
})(jQuery); 
```

## Datepicker Widget 1
```
<label>Enter a date: </label><input id="date"> 
        <script src="development-bundle/jquery-1.4.4.js"></script> 
        <script src="devment-bundle/ui/jquery.ui.core.js"></script> 
<script src="devent-bundle/ui/jquery.ui.datepicker.js"></script> 
            (function($){ 
                $("#date").datepicker(); 
            })(jQuery); 
```
## Кофигурация datepicker 2
```
            (function($){ 
                var pickerOpts = { 
                    appendText: "(mm/dd/yy)", 
                    defaultDate: "+5", 
                    showOtherMonths: true 
                }; 
                $("#date").datepicker(pickerOpts); 
            })(jQuery); 
```
## 3 maxDate
```
            (function($){ 
                var pickerOpts = { 
                    minDate: new Date(), 
                    maxDate: "+10" 
                }; 
                $("#date").datepicker(pickerOpts); 

            })(jQuery); 
```
## 4 changeMonth
```
            (function($){ 
                var pickerOpts = { 
                    changeMonth: true, 
                    changeYear: true 
                }; 
                $("#date").datepicker(pickerOpts); 
            })(jQuery); 
```
## 5 yearRange
```
            (function($){ 
                var pickerOpts = { 
                    changeMonth: true, 
                    changeYear: true, 
                    yearRange: "-25:+25" 
                }; 
                $("#date").datepicker(pickerOpts); 
            })(jQuery); 
```
## 6 showButtonPanel
```            (function($){ 
                var pickerOpts = { 
                    showButtonPanel: true 
                }; 
                $("#date").datepicker(pickerOpts); 
            })(jQuery); 
```
## 7  showOn
```
            (function($){ 
                var pickerOpts = { 
                    showOn: "button" 
                }; 
                $("#date").datepicker(pickerOpts); 
            })(jQuery); 
```
## 8  buttonText
```
            (function($){ 
                var pickerOpts = { 
                    showOn: "button", 
                    buttonText: "Open Picker" 
                }; 
                $("#date").datepicker(pickerOpts); 
            })(jQuery); 
```
## 9  buttonImage
```
            (function($){ 
                var pickerOpts = { 
                    showOn: "button", 
                    buttonText: "Open Picker", 
                    buttonImage: "img/cal.png" 
                }; 
                $("#date").datepicker(pickerOpts); 
            })(jQuery); 
```
## 10  buttonImageOnly
```
            (function($){ 
                var pickerOpts = { 
                    showOn: "button", 
                    buttonText: "Open Picker", 
                    buttonImage: "img/cal.png", 
                    buttonImageOnly: true 
                }; 
                $("#date").datepicker(pickerOpts); 
            })(jQuery); 
```
## 11  duration
```
   
            (function($){ 
                var pickerOpts = { 
                    duration: "fast" 
                }; 
                $("#date").datepicker(pickerOpts); 
            })(jQuery); 
```   
## 12 showOptions
```
<script src="devpment-bundle/ui/jquery.effects.core.js"></script> 
        <script src="devt-bundle/ui/jquery.effects.drop.js"></script> 
            (function($){ 
                var pickerOpts = { 
                    showAnim: "drop", 
                    showOptions: { direction: "up" } 
                }; 
                 
                $("#date").datepicker(pickerOpts); 
            })(jQuery); 
```
## 13 numberOfMonths
```
            (function($){ 
                var pickerOpts = { 
                    numberOfMonths: 3 
                }; 
                $("#date").datepicker(pickerOpts); 
            })(jQuery); 
```
## 14 Изменить date format
```
            (function($){ 
                var pickerOpts = { 
                    dateFormat: "d MM yy" 
                }; 
                $("#date").datepicker(pickerOpts); 
            })(jQuery); 
```

## 15 dateFormat: "Selecte'd': d MM yy" 
```
 <script src="devment-bundle/ui/jquery.effects.core.js"></script> 
<script src="devment-bundle/ui/jquery.effects.drop.js"></script> 
            (function($){ 
                var pickerOpts = { 
                    dateFormat: "Selecte'd': d MM yy" 
                }; 
                $("#date").datepicker(pickerOpts); 
            })(jQuery); 
```
## 16 dateFormat: $.datepicker.ATOM    
```
<script src="devment-bundle/ui/jquery.effects.core.js"></script> 
        <script src="devt-bundle/ui/jquery.effects.drop.js"></script> 
            (function($){ 
                var pickerOpts = { 
                    dateFormat: $.datepicker.ATOM                   }; 
                $("#date").datepicker(pickerOpts); 
            })(jQuery); 
```
## 17  TIMESTAMP
```
<script src="devment-bundle/ui/jquery.effects.core.js"></script> 
<script src="devment-bundle/ui/jquery.effects.drop.js"></script> 
        <script> 
            (function($){ 
                var pickerOpts = { 
                    altField: "#alt", 
                    altFormat: $.datepicker.TIMESTAMP                           }; 
            $("#date").datepicker(pickerOpts); 
            })(jQuery); 
        </script>
```
## 18 Localization
```
<script src="development-bundle/ui/i18n/jquery.ui.datepicker-fr.js"></script> 
        <script> 
            (function($){ 
                $("#date").datepicker(); 
            })(jQuery); 
        </script>
```
## 19  implement a Lolcat datepicker:
``` 
 <script> 
    (function($){ 
            var pickerOpts = { 
        closeText: "Kthxbai", 
            currentText: "Todai", 
            nextText: "Fwd", 
            prevText: "Bak", 
monthNames: ["January", "February", "March", "April", "Mai", "Jun", "July", "August", "Septembr", "Octobr", "Novembr", "Decembr"], 
monthNamesShort: ["Jan", "Feb", "Mar", "Apr", "Mai", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"], 
dayNames: ["Sundai", "Mondai", "Tuesdai", "Wednesdai", "Thursdai", "Fridai", "Katurdai"], 
dayNamesShort: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Kat"], 
    dayNamesMin: ["Su", "Mo", "Tu", "We", "Th", "Fr", "Ka"], 
                    dateFormat: 'dd/mm/yy', 
                    firstDay: 1, 
                    isRTL: false, 
                    showButtonPanel: true    
            }; 
        $("#date").datepicker(pickerOpts); 
    })(jQuery); 
</script>
```
## 20 Callback properties
```
<label>Enter a date: </label><input id="date"> 
        <select id="language"> 
            <option id="en-GB">English</option> 
            <option id="ar">Arabic</option> 
            <option id="uk">Ukrainian</option> 
            <option id="zh-TW">Taiwanese</option> 
        </select> 
Next link to the i18n.js roll-up file as follows:
        <script src="development-bundle/ui/i18n/jquery-ui-i18n.js"></script> 
Now change the final <script> element so that it appears as follows:
            (function($){ 
                var pickerOpts = { 
                    beforeShow: function() { 
    var lang = $(":selected", $("#language")).attr("id"); 
                        $.datepicker.setDefaults($.datepicker.regional[lang]); 
                    } 
                }; 
                $("#date").datepicker(pickerOpts); 
                $.datepicker.setDefaults($.datepicker.regional['']); 
            })(jQuery); 
```
## 21 Selecting date programmatically
```
            (function($){ 
                $("#date").datepicker(); 
                $("#select").click(function() { 
                    $("#date").datepicker("setDate", "+7"); 
                }); 
            })(jQuery); 
```
## 22  methods  updateDate
```
            (function($){ 
                function updateDate(date) { 
                    $("#date").val(date); 
                } 
        $("#date").focus(function() { 
            $(this).datepicker("dialog", null, updateDate); 
        }); 
    })(jQuery); 
```
## 23  Поуазать datepicker в dialog box
```
<div id="bookingForm" class="ui-widget ui-corner-all"> 
            <div class="ui-widget-header ui-corner-top"> 
                <h2>Booking Form</h2> 
            </div> 
            <div class="ui-widget-content ui-corner-bottom"> 
        <label>Appointment date:</label><input id="date"> 
            </div> 
</div> 
<script src="development-bundle/jquery-1.4.4.js"></script> 
<script src="development-bundle/ui/jquery.ui.core.js"></script> 
<script src="devent-bundle/ui/jquery.ui.datepicker.js"></script> 

    (function($){ 
        var months = [], 
        days = []; 
$.getJSON("http://www.danwellman.co.uk/bookedDates.php?jsoncallback=?", function(data) { 
        for (var x = 0; x < data.dates.length; x++) { 
            months.push(data.dates[x].month); 
            days.push(data.dates[x].day); 
            } 
        }); 
function addDates(date) { 
        if (date.getDay() == 0 || date.getDay() == 6) { 
            return [false, ""]; 
        } 
for (var x = 0; x < days.length; x++) { 
if (date.getMonth() == months[x] - 1 && date.getDate() == days[x]) {                        
return [false, "preBooked_class"];                      } 
        } 
        return [true, ""]; 
    } 
    var pickerOpts = { 
        beforeShowDay: addDates, 
        minDate: "+1" 
        }; 
    $("#date").datepicker(pickerOpts); 
})(jQuery); 
```
## Progressbar
### 1 По умолчанию
```
<div id="myProgressbar"></div> 
<script src="development-bundle/jquery-1.4.4.js"></script> 
 <script src="development-bundle/ui/jquery.ui.core.js"></script> 
<script src="development-bundle/ui/jquery.ui.widget.js"></script> 
<script src="devnt-bundle/ui/jquery.ui.progressbar.js"></script> 
            (function($){ 
                $("#myProgressbar").progressbar(); 
            })(jQuery); 
```
## 2  Значения
```
            (function($){ 
                var progressOpts = { 
                    value: 50    
                }; 
            $("#myProgressbar").progressbar(progressOpts); 
            })(jQuery); 
```
## 3  Progressbar события API
```
(function($){ 
var progress = $("#myProgressbar"), 
    progressOpts = { 
    change: function() { 
            var val = $(this).progressbar("option", "value"); 
                            if (!$("#value").length) { 
                                $("<span />", { 
                                    text: val + "%", 
                                    id: "value", 
                                    css: { 
                                        float: "right", 
                                        marginTop: -28, 
                                        marginRight: 10 
                                    } 
                                }).appendTo(progress); 
                            } else { 
                            $("#value").text(val + "%");     
                            } 
                        } 
                    }; 
progress.progressbar(progressOpts); 
    $("#increase").click(function() { 
        var currentVal = progress.progressbar("option", "value"), 
        newVal = currentVal + 10; 
        progress.progressbar("option", "value", newVal); 
                }); 
            })(jQuery); 
```
## 4 Progressbar методы
```
(function($){ 
var progress = $("#myProgressbar"); 
progress.progressbar(); 
$("#increase").click(function() { 
    var currentVal = progress.progressbar("option", "value"), 
            newVal = currentVal + 10; 
            progress.progressbar("value", newVal); 
                if (!$("#value").length) { 
                    $("<span />", { 
                        text: newVal + "%", 
                            id: "value", 
                            css: { 
                                float: "right", 
                                marginTop: -28, 
                                marginRight: 10 
                            } 
                        }).appendTo(progress); 
                    } else { 
                        $("#value").text(val + "%");     
                    } 
                }); 
            })(jQuery); 
```
## 5 User initiated progress
```
        <link rel="stylesheet" href="css/progressTheme.css"> 
    <div class="form-container ui-helper-clearfix ui-corner-all"> 
            <h1>Registration Form</h1> 
            <p>Progress:</p> 
            <div id="myProgressbar"></div> 
            <label id="amount">0%</label> 
            <form action="serverScript.php"> 
                <div class="form-panel"> 
                    <h2>Personal Details</h2> 
<fieldset class="ui-corner-all"> 
                        <label>Name:</label><input type="text"> 
                        <label>D.O.B:</label><input type="text"> 
<label>Choose password:</label><input type="password"> 
<label>Confirm password:</label><input type="password"> 
                    </fieldset> 
                </div> 
                <div class="form-panel ui-helper-hidden"> 
<h2>Contact Details</h2> 
<fieldset class="ui-corner-all"> 
<label>Email:</label><input type="text"> 
<label>Telephone:</label><input type="text"> 
<label>Address:</label><textarea rows="3" cols="25"> </textarea> 
</fieldset> 
</div> 
                <div class="form-panel ui-helper-hidden"> 
                    <h2>Registration Complete</h2> 
                    <fieldset class="ui-corner-all"> 
                        <p>Thanks for registering!</p> 
                    </fieldset> 
                </div> 
            </form> 
<button id="next">Next</button><button id="back" disabled="disabled">Back</button> 
</div> 
(function($){ 
var prog = $("#myProgressbar"), 
progressOpts = { 
    change: function() { 
        prog.next().text(prog.progressbar("value") + "%"); 
        } 
    }; 
        prog.progressbar(progressOpts); 
        $("#next, #back").click(function() { 
        $("button").attr("disabled", true); 
    if (this.id === "next") { 
prog.progressbar("option", "value", prog.progressbar("option", "value") + 50); 
    $("form").find("div:visible").fadeOut().next().fadeIn(function(){ 
        $("#back").attr("disabled", false); 
        if (!$("form").find("div:last").is(":visible")) { 
        $("#next").attr("disabled", false); 
    } 
    }); 
    } else { 
prog.progressbar("option", "value", prog.progressbar("option", "value") - 50); 
$('form').find("div:visible").not(".buttons").fadeOut().prev().fadeIn(    
function()  { 
$("#next").attr("disabled", false); 
            if (!$("form").find("div:first").is(":visible")) { 
                $("#back").attr("disabled", false);  
                } 
            }); 
        } 
    }); 
})(jQuery); 
```
## 6  Rich uploads with progressbar
```
        <link rel="stylesheet" href="css/progressTheme2.css"> 
        <h2>AJAX File Upload</h2> 
        <input type="file" id="file" /> 
        <div id="myProgressbar"></div> 
            (function($){ 
                var prog = $("#myProgressbar"), 
                inputFile = $("#file"), 
                progressOpts = { 
                complete: function() { 
                $("#filename").text("Complete!"); 
            } 
        } 
            inputFile.change(function() { 
            prog.progressbar(progressOpts); 
var files = inputFile.attr("files"), 
        file = files[0], 
        xhr = new XMLHttpRequest(); 
xhr.upload.onprogress = function updateProgress(e) { 
    var loaded = (e.loaded / e.total); 
prog.progressbar("value", Math.round(loaded * 100)); 
                    } 
                    xhr.upload.onload = function() { 
                        prog.progressbar("value", 100); 
                    } 
                    $("<apan />", { 
                        id: "filename", 
                        text: file.fileName 
                    }).insertAfter(prog); 
                xhr.open("POST", "progressUpload.php"); 
            xhr.sendAsBinary(file.getAsBinary()); 
        }); 
    })(jQuery); 
```
## Autocomplete Widgets
```        
<link rel="stylesheet" href="css/smoothness/jquery-ui-1.8.9.custom.css"> 
<label>Enter your city:</label><input id="city"> 
<script src="development-bundle/jquery-1.4.4.js"></script> 
<script src="development-bundle/ui/jquery.ui.core.js"></script> 
<script src="development-bundle/ui/jquery.ui.widget.js"></script> 
<script src="development-bundle/ui/jquery.ui.position.js"></script> 
<script src="development-bundle/ui/jquery.ui.autocomplete.js"></script> 
        <script> 
            (function($){ 
                var autoOpts = { 
                    source: [ 
                        "Aberdeen", 
                        "Armagh", 
                        "Bangor", 
                        "York" 
                    ] 
                }; 
                $("#city").autocomplete(autoOpts); 
            })(jQuery); 
```
## 2  Использование массива объектов в качестве источника
```
            (function($){ 
                var autoOpts = { 
                    source: [ 
                        { value: "AB", label: "Aberdeen" }, 
                        { value: "AR", label: "Armagh" }, 
                        { value: "BA", label: "Bangor" }, 
                    ] 
                }; 
                $("#city").autocomplete(autoOpts); 
            })(jQuery); 
```
## 3 Конфигурация minimum length
```
            (function($){ 
                var autoOpts = { 
                    minLength: 2, 
                    source: [ 
                        "Aberdeen", 
                        "Armagh", 
                        "Bangor", 
                    ] 
                }; 
        $("#city").autocomplete(autoOpts); 
    })(jQuery); 
```
## 4 Appending the suggestion list to an alternative element

```
        <div id="container"> 
            <label>Enter your city:</label><input id="city"> 
        </div>

            (function($){ 
                var autoOpts = { 
                    appendTo: "#container", 
                    source: [ 
                        "Aberdeen", 
                        "Armagh", 
                        ] 
            }; 
        $("#city").autocomplete(autoOpts); 
})(jQuery); 
```
## 5  Autocomplete events select A suggestion from the list is selected 
```
(function($){ 
var autoOpts = { 
    source: [ 
    { value: "AR", label: "Armagh", population: 54263 }, 
    { value: "BA", label: "Bangor", population: 21735 }, 
    { value: "BA", label: "Bath", population: 83992 }, 
            ], 
select: function(e, ui) { 
if ($("#pop").length) { 
$("#pop").text(ui.item.label + "'s population is: " + ui.item.population);   
        } else { 
        $("<p></p>", { 
        id: "pop", 
text: ui.item.label + "'s population is: " + ui.item.population 
            }).insertAfter("#city"); 
        } 
    } 
}; 
    $("#city").autocomplete(autoOpts); 
})(jQuery); 
```
## 6 Работа с удаленными data sources
```
(function($){ 
var autoOpts = { 
    source: "http://danwellman.co.uk/countries.php?callback=?" 
        }; 
        $("#country").autocomplete(autoOpts); 
})(jQuery); 
```
## 7 Использование функции в качестве source option
```
<link rel="stylesheet" href="css/autocompleteTheme.css"> 
<div id="formWrap"> 
<form id="messageForm" action="#"> 
<fieldset> 
    <legend>New message form</legend> 
    <span>New Message</span> 
           <div class="inner-form ui-helper-clearfix"> 
    <label>To:</label> 
    <div id="toList" class="ui-helper-clearfix"> 
    <input id="to"> 
                  <input id="emails" type="hidden"> 
    </div> 
<label>Message:</label> 
<textarea id="message" name="message" rows="2" cols="50"></textarea> 
            </div> 
           <div class="buttons ui-helper-clearfix"> 
                        <button type="submit">Send</button> 
            <a href="#" title="Cancel">Cancel</a> 
          </div> 
</fieldset> 
</form> </div> 
            (function($){ 
    var autoOpts = { 
    source: function(req, resp){ 
                         
    //request data 
   $.getJSON("http://danwellman.co.uk/contacts.php?callback=?", req, function(data) { 
                                 
//create array for response objects 
    var suggestions = []; 
                                 
    //process response 
    $.each(data, function(i, val){ 
    var obj = {}; 
    obj.value = val.name; 
    obj.email = val.email;                               
    suggestions.push(obj); 
    }); 
                         
    //pass array to callback 
    resp(suggestions); 
    }); 
}, 
    select: function(e, ui) { 
    //create formatted email 
            var emailList = $("#emails"), 
            emails = emailList.val().split(","), 
            span = $("<span></span>", { 
            text: ui.item.value, 
            data: {"email": ui.item.email} 
            }), 
            a = $("<a></a>", { 
            "class": "remove", 
            href: "#", 
            title: "Remove", 
            text: "x" 
            }).appendTo(span); 
                             
        //add contact to friend div 
            span.insertBefore("#to"); 
         //update emails list                                
            emails.push(ui.item.email); 
            emailList.val(emails.join(",")); 
        //tidy input 
            $("#to").remove(); 
            $("<input/>", { 
            id: "to"     
            }).insertBefore("#emails").autocomplete(autoOpts); 
            } 
        }; 
        //attach autocomplete 
            $("#to").autocomplete(autoOpts); 
            //add click handler to friends div 
            $("#toList").click(function(){ 
            $("#to").focus(); 
        }); 
    //add delegate handler for clicks on remove links 
        $("#toList").delegate("a", "click", function(){ 
    //get email address of contact 
        var email = $(this).parent().data("email"), 
        emails = $("#emails").val().split(","); 
    //remove contact 
        $(this).parent().remove(); 
    //remove email 
        $.each(emails, function(i, val) { 
        if (val === email) { 
        emails.splice(i, 1); 
        } 
    }); 
        $("#emails").val(emails); 
    });              
})(jQuery); 
```
## 8 Показать HTML как список - подсказку
```
        <script src="js/jquery.ui.autocomplete.html.js"></script> 

            (function($){ 
                var data = [ 
                    { value: "Aberdeen", label: "Aberdeen" }, 
                    { value: "Armagh", label: "Armagh" }, 
                    { value: "Bangor", label: "Bangor" }, 
                ], 
                autoOpts = { 
                    html: true, 
                    source: function(req, resp) { 
                        var suggestions = [], 
                    regEx = new RegExp("^" + req.term, "i"); 
                        //match suggestions to input 
                        $.each(data, function(i, val){   
                            if (val.label.match(regEx)) { 
                                var obj = {}; 
                                obj.value = val.value; 
obj.label = val.label.replace(regEx, "<span>" + req.term + "</span>"); 
                                suggestions.push(obj);       
                            } 
                        }); 
                        resp(suggestions); 
                    } 
                }; 
                $("#city").autocomplete(autoOpts); 
            })(jQuery); 
```
## button widget 
## 1 Standard implementations
```
<link rel="stylesheet" href="css/smoothness/jquery-ui-1.8.9.custom.css"> 
<a href="#" id="myButton">A link button</a> 
<script src="development-bundle/jquery-1.4.4.js"></script> 
<script src="development-bundle/ui/jquery.ui.core.js"></script> 
<script src="development-bundle/ui/jquery.ui.widget.js"></script> 
<script src="development-bundle/ui/jquery.ui.button.js"></script> 
            (function($){ 
                $("#myButton").button(); 
            })(jQuery); 
```
## 2 Theming
```
<link rel="stylesheet" href="css/smoothness/jquery-ui-1.8.9.custom.css"> 
<a href="#" id="myButton">A link button</a> 
            (function($){ 
                var buttonOpts = { 
                    label: "A configured label"  
                }; 
                $("#myButton").button(buttonOpts); 
            })(jQuery); 
```
## 3 Button icons
```
<a href="#" id="myButton">A link button</a> 
            (function($){ 
                var buttonOpts = { 
                    icons: { 
                        primary: "ui-icon-disk", 
                        secondary: "ui-icon-triangle-1-s" 
                    } 
                }; 
                $("#myButton").button(buttonOpts); 
            })(jQuery); 
```
## 4  Button icons
```
        <link rel="stylesheet" href="css/smoothness/jquery-ui-1.8.9.custom.css"> 
<a href="#" id="myButton">A link button</a> 
<script src="development-bundle/ui/jquery.ui.button.js"></script> 

            (function($){ 
                var buttonOpts = { 
                    icons: { 
                        primary: "ui-icon-disk", 
                        secondary: "ui-icon-triangle-1-s" 
                    }, 
                    text: false 
                }; 
                $("#myButton").button(buttonOpts); 
            })(jQuery); 
```
## 5  Button events
```
<link rel="stylesheet" href="css/smoothness/jquery-ui-1.8.9.custom.css"> 
<link rel="stylesheet" href="css/buttonTheme.css"> 
<div class="iconic-input ui-button-text-icons ui-state-default ui-corner-all"> 
<span class="ui-button-icon-primary ui-icon ui-icon-disk"></span> 
<input id="myButton" type="button" value="Input icons" class="ui-button-text"> 
<span class="ui-button-icon-secondary ui-icon ui-icon-triangle-1-s"></span> 
        </div> 
<script src="development-bundle/ui/jquery.ui.button.js"></script> 
            (function($){ 
                $("#myButton").button().hover(function() { 
                $(this).parent().addClass("ui-state-hover"); 
                }, function() { 
                $(this).parent().removeClass("ui-state-hover"); 
                }); 
            })(jQuery); 
```
## 6  create
```
        <link rel="stylesheet" href="css/smoothness/jquery-ui-1.8.9.custom.css"> 
        <button id="myButton">A button</button> 
        <script src="development-bundle/jquery-1.4.4.js"></script> 
<script src="development-bundle/ui/jquery.ui.core.js"></script> 
<script src="development-bundle/ui/jquery.ui.widget.js"></script> 
<script src="development-bundle/ui/jquery.ui.button.js"></script> 
            (function($){ 
                var buttonOpts = { 
                    create: function() { 
                        $(this).css("display", "none")   
                    } 
                }; 
                $("#myButton").button(buttonOpts) 
            })(jQuery); 
```
## 7  Register  form
```
<title>Button</title> 
        <link rel="stylesheet" href="css/smoothness/jquery-ui-1.8.9.custom.css"> 
        <form> 
<label for="name">Name: <input id="name" name="name"></label> 
<label for="email">Email: <input id="email" name="email"></label> 
            <button id="myButton">Register</button> 
        </form> 
<script src="development-bundle/jquery-1.4.4.js"></script> 
<script src="development-bundle/ui/jquery.ui.core.js"></script> 
<script src="development-bundle/ui/jquery.ui.widget.js"></script> 
<script src="development-bundle/ui/jquery.ui.button.js"></script> 
            (function($){                
                $("#myButton").button().click(function(e) { 
                    e.preventDefault(); 
                    var form = $("form"), 
                        formData = { 
                        name: form.find("#name").val(), 
                            email: form.find("#email").val() 
                        }; 
            $.post("register.php", formData, function() { 
            $("#myButton").button("option", "disabled", true); 
                        form.find("label").remove(); 
                        $("<label></label>", { 
                            text: "Thanks for registering!" 
                        }).prependTo(form); 
                    }); 
                }); 
            })(jQuery); 
```
## 8  buttonset
```
        <link rel="stylesheet" href="css/smoothness/jquery-ui-1.8.9.custom.css"> 
        <div id="buttons"> 
            <h2>Programming Languages</h2> 
            <p>Select all languages you know:</p> 
<label for="js">JavaScript</label><input id="js" type="checkbox"> 
<label for="py">Python</label><input id="py" type="checkbox"> 
<label for="cSharp">C#</label><input id="cSharp" type="checkbox"> 
<label for="jv">Java</label><input id="jv" type="checkbox"> 
        </div> 
        <script src="development-bundle/jquery-1.4.4.js"></script> 
<script src="development-bundle/ui/jquery.ui.core.js"></script> 
<script src="development-bundle/ui/jquery.ui.widget.js"></script> 
<script src="development-bundle/ui/jquery.ui.button.js"></script> 
            (function($){                
                $("#buttons").buttonset();   
            })(jQuery); 
```
## 9   buttonset       
```
        <link rel="stylesheet" href="css/smoothness/jquery-ui-1.8.9.custom.css"> 
        <div id="buttons"> 
            <h2>Programming Languages</h2> 
            <p>Select your most proficient languages:</p> 
<label for="js">JavaScript</label><input id="js" type="radio" name="lang"> 
        <label for="py">Python</label><input id="py" type="radio" name="lang"> 
    <label for="cSharp">C#</label><input id="cSharp" type="radio" name="lang"> 
<label for="jv">Java</label><input id="jv" type="radio" name="lang"> 
        </div> 
        <script src="development-bundle/jquery-1.4.4.js"></script> 
        <script src="development-bundle/ui/jquery.ui.core.js"></script> 
<script src="development-bundle/ui/jquery.ui.widget.js"></script> 
<script src="development-bundle/ui/jquery.ui.button.js"></script> 
            (function($){                
                $("#buttons").buttonset();   
            })(jQuery); 
```
## 10 Checkbox buttonsets
```
<title>Button</title> 
<link rel="stylesheet" href="css/smoothness/jquery-ui-1.8.9.custom.css"> 
<div id="buttons"> 
<h2>Programming Languages</h2> 
<p>Select all languages you know:</p> 
<label for="js1">JavaScript</label><input id="js1" type="checkbox"> 
<label for="py1">Python</label><input id="py1" type="checkbox"> 
<label for="cSharp1">C#</label><input id="cSharp1" type="checkbox"> 
<label for="jv1">Java</label><input id="jv1" type="checkbox"> 
        </div> 
        <button id="select">Select All</button> 
        <button id="deselect">Deselect All</button>        
        <script src="development-bundle/jquery-1.4.4.js"></script> 
<script src="development-bundle/ui/jquery.ui.core.js"></script> 
<script src="development-bundle/ui/jquery.ui.widget.js"></script> 
<script src="development-bundle/ui/jquery.ui.button.js"></script> 
            (function($){                
                $("#buttons").buttonset(); 
            $("#select").button().click(function() { 
$("#buttons").find("input").attr("checked", true).button("refresh"); 
    }); 
         
            $("#deselect").button().click(function() { 
$("#buttons").find("input").attr("checked", false).button("refresh"); 
    });              
            })(jQuery); 

```

## Droppable 7
```

    <div id="drag"></div>
    <div class="target" id="outer">
      <div class="target" id="inner"></div>
    </div>
    <div id="status"></div>
        <script src="development-bundle/jquery-1.4.4.js"></script>
        <script src="development-bundle/ui/jquery.ui.core.js"></script>
        <script src="development-bundle/ui/jquery.ui.widget.js"></script>
        <script src="development-bundle/ui/jquery.ui.mouse.js"></script>
        <script src="development-bundle/ui/jquery.ui.draggable.js"></script>
        <script src="development-bundle/ui/jquery.ui.droppable.js"></script>
        <script>
      (function($){
        $(".target").css({ opacity:"0.5" });
         
        var dragOpts = {
            zIndex: 3
          },
          dropOpts = {
            drop: dropCallback,
            greedy: true
          };
        
        function dropCallback(e) {
          var message = $("<p />", {
            id: "message",
            text: "The firing droppable was " + e.target.id
          });
          
          $("#status").append(message);
        }
        
        $("#drag").draggable(dragOpts);
        $(".target").droppable(dropOpts);
      })(jQuery);
    </script>
  
```

## jQuery UI Sortable
```
    <link rel="stylesheet" href="http://necolas.github.com/normalize.css/2.0.1/normalize.css">
    <link rel="stylesheet" href="style.css" />
    <script src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>

    <script>
    $(function() {
        $( "#sortable" ).sortable({ 
            placeholder: "ui-sortable-placeholder" 
        });
    });
    </script>

<ul id="sortable">
    <li class="ui-state-default">Item 1</li>
    <li class="ui-state-default">Item 2</li>
    <li class="ui-state-default">Item 3</li>
    <li class="ui-state-default">Item 4</li>
    <li class="ui-state-default">Item 5</li>
    <li class="ui-state-default">Item 6</li>
    <li class="ui-state-default">Item 7</li>
</ul>
```
### Sortable 14
```
    <ul id="drag">
      <li>Click here to add a new task...</li>
    </ul>
    <a id="add" href="#"></a>
    <div id="taskList">
      <ul id="tasks">
                <li>Design new site</li>
                <li>Call client</li>
                <li>Order pizza</li>
      </ul>
    </div>
        <script src="development-bundle/jquery-1.4.4.js"></script>
        <script src="development-bundle/ui/jquery.ui.core.js"></script>
        <script src="development-bundle/ui/jquery.ui.widget.js"></script>
        <script src="development-bundle/ui/jquery.ui.mouse.js"></script>
        <script src="development-bundle/ui/jquery.ui.sortable.js"></script>
        <script src="development-bundle/ui/jquery.ui.draggable.js"></script>
        <script>
      (function($){
        var dragItem = $("#drag li"),
          addButton = $("#add"),
          sortOpts = {
            axis: "y",
            stop: function() {
              addButton.css("display", "none");
              dragItem.text("Click to add a new task...").draggable("option", "disabled", true).removeClass("ui-state-disabled");
            }
          },
          dragOpts = {
            connectToSortable: "#tasks",
            helper: "clone",
            disabled: true
          };
        
        $("#tasks").sortable(sortOpts);
        
        dragItem.draggable(dragOpts).live("click", function() { 
          if ($("#tasks").children().length > 7) {
            alert("too many tasks already!");
          } else {
            var input = $("<input />", {
              id: "newTask"
            });
            
            $(this).text("").append(input);
            input.focus();

            addButton.removeClass("down").css("display", "block");
          }
        });
        
        addButton.live("click", function(e) {
          e.preventDefault();
          
          if ($("#drag input").val() !== "") {
            dragItem.text($("#newTask").val()).draggable("option", "disabled", false);
            $("#drag input").remove();
            addButton.addClass("down").attr("title", "drag new task into the list");
          }
        });
      })(jQuery);
    </script>
  
```

## jQuery Sortable With AJAX &amp; MYSQL
```
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<link rel='stylesheet' href='styles.css' type='text/css' media='all' />
<script type="text/javascript">
// When the document is ready set up our sortable with it's inherant function(s)
  $(document).ready(function() {
    $("#test-list").sortable({
      handle : '.handle',
      update : function () {
          var order = $('#test-list').sortable('serialize');
        $("#info").load("process-sortable.php?"+order);
      }
    });
});
</script>


<pre>
<div id="info">Waiting for update</div>
</pre>
<ul id="test-list">
  <li id="listItem_1"><img src="arrow.png" alt="move" width="16" height="16" class="handle" /><strong>Item 1 </strong>with a link to <a href="http://www.google.co.uk/" rel="nofollow">Google</a></li>
  <li id="listItem_2"><img src="arrow.png" alt="move" width="16" height="16" class="handle" /><strong>Item 2</strong></li>
  <li id="listItem_3"><img src="arrow.png" alt="move" width="16" height="16" class="handle" /><strong>Item 3</strong></li>
  <li id="listItem_4"><img src="arrow.png" alt="move" width="16" height="16" class="handle" /><strong>Item 4</strong></li>
</ul>
```

## process-sortable.php

```
<?php
/* This is where you would inject your sql into the database 
   but we're just going to format it and send it back
*/

foreach ($_GET['listItem'] as $position => $item) :
    $sql[] = "UPDATE `table` SET `position` = $position WHERE `id` = $item";
endforeach;

print_r ($sql);
?>
```
## Drag & Drop Reorder
- Создать database "codexworld".
- Изменить db.php 
- Импортировать "images.sql" в database.

db.php
```
<?php
class DB{
  function __construct(){
    $con = mysql_connect('localhost','root','') or die('Database connection error.');
    mysql_select_db('codexworld',$con) or die('Database selection error.');
  }
  
  function get_rows(){
    $query = mysql_query("SELECT * FROM `images` ORDER BY `order` ASC") or die(mysql_error());
    while($row = mysql_fetch_assoc($query))
    {
      $rows[] = $row;
    }
    return $rows;
  }
  
  function update_order($id_array){
    $count = 1;
    foreach ($id_array as $id){
      $update = mysql_query("UPDATE `images` SET `order` = $count WHERE id = $id");
      $count ++;  
    }
    return true;
  }
}
?>
```
index.php
```
<?php
include_once("db.php");
$db = new DB();
?>
<!DOCTYPE html>

<head>
<meta charset=utf-8 >
<title>Drag&amp;Drop Reorder</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $('.reorder_link').on('click',function(){
    $("ul.reorder-photos-list").sortable({ tolerance: 'pointer' });
    $('.reorder_link').html('save reordering');
    $('.reorder_link').attr("id","save_reorder");
    $('#reorder-helper').slideDown('slow');
    $('.image_link').attr("href","javascript:void(0);");
    $('.image_link').css("cursor","move");
    $("#save_reorder").click(function( e ){
      if( !$("#save_reorder i").length )
      {
        $(this).html('').prepend('<img src="images/refresh-animated.gif"/>');
        $("ul.reorder-photos-list").sortable('destroy');
        $("#reorder-helper").html( "Reordering Photos - This could take a moment. Please don't navigate away from this page." ).removeClass('light_box').addClass('notice notice_error');
  
        var h = [];
        $("ul.reorder-photos-list li").each(function() {  h.push($(this).attr('id').substr(9));  });
        $.ajax({
          type: "POST",
          url: "order_update.php",
          data: {ids: " " + h + ""},
          success: function(html) 
          {
            window.location.reload();
          }
          
        }); 
        return false;
      } 
      e.preventDefault();   
    });
  });
  
});
</script>
</head>

<body>
<div style="margin-top:50px;">
  <a href="javascript:void(0);" class="btn outlined mleft_no reorder_link" id="save_reorder">reorder photos</a>
    <div id="reorder-helper" class="light_box" style="display:none;">1. Drag photos to reorder.<br>2. Click 'Save Reordering' when finished.</div>
    <div class="gallery">
        <ul class="reorder_ul reorder-photos-list">
        <?php 
      //Fetch all images from database
      $rows = $db->get_rows();
      foreach($rows as $row): ?>
            <li id="image_li_<?php echo $row['id']; ?>" class="ui-sortable-handle"><a href="javascript:void(0);" style="float:none;" class="image_link"><img src="images/<?php echo $row['image']; ?>" alt=""></a></li>
        <?php endforeach; ?>
        </ul>
    </div>
</div>
</body>
</html>

```
order_update.php

```
<?php
include_once('db.php');
$db = new DB();
$array  = explode(",",$_POST['ids']);
$db->update_order($array);
?>
```

