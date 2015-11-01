# jsdanco

В jQuery существует официальное деление всех ajax методов на две группы:
- низкоуровневый ajax интерфейс
- высокоуровневый ajax интерфейс (упрощенные ajax методы)

К первой группе относятся два jQuery ajax метода:
- jQuery.ajax(options)
- jQuery.ajaxSetup(options)

Ко второй группе относятся остальные jQuery методы:
- load(url, data, callback)
- jQuery.get(url, data, callback, type)
- jQuery.getJSON(url, data, callback)
- jQuery.getScript(url, callback)
- jQuery.post(url, data, callback, type)

Низкоуровневый ajax интерфейс предоставляет больше возможностей для работы с объектом XMLHttpRequest(в IE ActiveXObject), например в методе jQuery.ajax(options) вы можете установить обработку глобальных jQuery ajax событий (ajaxStart,ajaxStop,ajaxSucess,ajaxComplate,ajaxError), например, если Вам необходимо перед отправкой данных на сервер отобразить прогрессбар, а после того как данные успешно будут возвращены его скрыть, то метод jQuery.ajax(options) как раз то, что нужно. Либо иногда возникает необходимость в том, чтобы отправить данные на сервер не как строку, а как необработанный объект, по умолчанию упрощенные методы трансформируют все данные отсылаемые на сервер в строковой тип, чтобы исправить это Вы должны применить метод jQuery.ajax(options), изменив опцию processData на false. 

1. Как отправить запрос на сервер и получить данные?

Если Вам необходим отрезок HTMl кода, который встраивается в структуру страницы, то подойдет метод $.load():
```

"jQuery"
 $("#loadhtml").click(function(){
 $("#feeds").load("ajax/base.php", function(data){
$(this).text(data);
        }).show("slow");
    });  

```

При условии, что код php будет следующим:
```
<?php
header('Content-Type: text/html; charset=UTF-8');
echo '<html>';
echo '<body>';
echo '<div><b>Привет я сервер!</b></div>';
echo '</body>';
echo '</html>';
?>
```
# Node Js
```

            <script type=text/javascript>
                $(document).ready(function(){ 
                    $("#loadtxt").click(function(){
                        $("#feeds").load("test.txt", function(data){
                            $(this).text(data);
                        }).show("slow");
                    });  
                    $("#loadhtml").click(function(){
                        $("#feeds").load("html.txt", function(data){
                            $(this).html(data);
                        }).show("slow");
                    });  
                });
            </script>
            <button id="loadtxt"> Получить txt данные с сервера</button>
            <button id="loadhtml"> Получить html данные с сервера</button>
            <div id="feeds" style="margin:20px;display:none;height:50px;"></div>
            </p>
```


## Делаем запрос GET с помощью $.get()

Метод jQuery $.get() предоставляет легкий и удобный способ сделать простой запрос AJAX. Он выполняет запрос с помощью метода HTTP GET (используется для получения URL, например страниц и изображений), вместо метода POST (который традиционно используется для отправки данных формы).

В простейшей форме можно вызвать метод так:
```

$.get( url );
```
...где url является адресом URL ресурса, от которого ожидается ответ. Обычно это скрипт на стороне сервера, который выполняет какие-нибудь действия и может возвращать некие данные:

```
$.get( "http://example.com/get.php" );
```
...хотя можно также запросить статический документ:

```
$.get( "http://example.com/mypage.html" );
```

При запросе URL, вы можете отправить данные с запросом. Вы можете передать данные в строке запроса, так же как и при обычном запросе GET:

```
$.get( "http://example.com/get.php?city=rome&date=20160318" );
```
Корректно будет сделать то же самое передав объект данных в качестве второго параметра методу $.get(). Объект данных должен содержать информацию в виде пар имя свойства/значение свойства. Например:

```
var data = { city: "rome", date: "20160318" };

$.get( "http://example.com/get.html", data );
```
В качестве альтернативы вы можете передать данные методу $.get() как строку:

```
var data = "city=rome&date=20120318";

$.get( "http://example.com/get.html", data );
 
```
### Получаем данные с сервера

AJAX запрос - асинхронный, что означет его выполнение в фоновом режиме, когда остальной код JavaScript продолжает действовать. 

Вам нужно написать возвратную функцию,  которая будет автоматически выполняться по завершению запроса AJAX и отправке ответа сервером. Как минимум, ваша функция должна принимать данные, возвращаемые сервером, как свой первый аргумент:

```

function myCallback( returnedData ) {

  // Делаем обработку данных returnedData

}
 
```
Как только возвратная функция создана, вы можете передать ее в качестве третьего аргумента в метод $.get():

```
var data = { city: "rome", date: "20160318" };

$.get( "http://example.com/get.html", data, myCallback );
``` 

### Определяем тип данных ответа

серверная сторона передает данные в одном из нескольких типовых форматов, включая XML, JSON, JavaScript, или HTML. По умолчанию jQuery пытается определить наиболее подходящий формат и разобрать данные соответствующим образом. Но лучше явно определить формат.

Для указания формата надо передать четвертый аргумент методу $.get(). Данный аргумент может быть строкой из следующего списка:
```
"xml"
"json"
"script"
"html"
```
Например, если вы знаете, что скрипт сервера возвращает данные в формате JSON, то вызываете метод $.get() следующим образом:

```
$.get( "http://example.com/get.html", data, myCallback, "json" );
 
```
## Пример использования метода $.get()

Здесь приводится пример создания запроса AJAX с помощью метода $.get() и простая обработка ответа. Для работы примера нужно на сервере создать простой текстовый файл с именем  getForecast.txt, содержащий следующий текст:
```
{
  "city": "Васюки",
  "date": "18 марта 2016",
  "forecast": "Зубодробительный холод и слякоть",
  "maxTemp": 1
}
```
Данный файл будет имитировать ответ в формате JSON, который мог быть сформирован скриптом прогноза погоды на сервере.

Затем создаем страницу get.html в той же папке что и getForecast.txt:

```

    $( function() {
 
    $('#getForecast').click( function() {
      var data; 
      $.get( "getForecast.txt", data, success, "json" );
    } );
 
    function success( forecastData ) {
      var forecast = forecastData.city + " прогноз на " + forecastData.date;
      forecast += ": " + forecastData.forecast + ". Максимальная температура: " + forecastData.maxTemp + "C";

      $("#feeds").html(forecast).show("slow");
      
    }
 
  } );

  <button id="getForecast">Получить прогноз погоды</button> 
        
  <div id="feeds" style="margin:20px;display:none;height:50px;"></div>

```

Вот как работает данный код:

- get.html содержит элемент button "Получить прогноз погоды" с ID getForecast.

- JavaScript вверху страницы выполняется как только страница будет загружена и DOM окажется в состоянии готовности.

- Код JavaScript сначала привязывает обработчик события click к кнопке #getForecast. Данный обработчик выполняет AJAX запрос GET к getForecast.txt, передавая название города и дату для прогноза. 

- Также определяется возвратная функция success(), которая будет выполняться по завершению запроса. Формат возвращаемых сервером данных определяется как JSON.

- Файл getForecast.txt возвращает браузеру данные прогноза в формате JSON.

- Вызывается функция success(). jQuery разбирает данные JSON, полученные от getForecast.txt, конвертирует их в объект JavaScript, и передает их в функцию.

- Функция возвращает объект данных forecastData и выводит сообщение, которое содержит несколько свойств объекта, включая название города, прогноз и температуру.

## Ajax запрос JSON-данных

### jQuery.getJSON()
Производит запрос json-данных у сервера, методом GET, без перезагрузки страницы. Функция имеет несколько необязательных параметров.
```
jQuery.getJSON(url,[data],[callback]):jqXHRv:1.0
```
- url — url-адрес, по которому будет отправлен запрос.
- data — данные, которые будут отправлены на сервер. Они должны быть представлены в объектом, в формате: {fName1:value1, fName2:value2, ...}.
- callback(data, textStatus, jqXHR) — пользовательская функция, которая будет вызвана после ответа сервера.
- data — данные, присланные с сервера.
- textStatus — статус того, как был выполнен запрос.
- jqXHR — объект jqXHR (в версиях до jquery-1.5, вместо него использовался XMLHttpRequest)
- $.getJSON() является сокращенным вариантом функции $.ajax(), вызванной со следующими параметрами:
```
$.ajax({
  url: url,
  dataType: 'json',
  data: data,
  success: callback
});
```
Полученные в результате запроса данные, можно получить в обработчике удачного выполнения запроса. Они будут предварительно преобразованы в javascript-объект или массив с помощью $.parseJSON(). 

запрошенный json-файл содержит данные в следующем формате:
```

 {
        "age": 0,
        "id": "motorola-xoom-with-wi-fi",
        "imageUrl": "img/phones/motorola-xoom-with-wi-fi.0.jpg",
        "name": "Motorola XOOM\u2122 with Wi-Fi",
        "snippet": "The Next, Next Generation\r\n\r\nExperience the future with Motorola XOOM with Wi-Fi, the world's first tablet powered by Android 3.0 (Honeycomb)."
    },

```

Сформируем из полученных данных html-список и вставим на страницу:
```
$(window).load(function(){

$.getJSON('phones.json', function(data){
 var items = [];
 console.log(data[0]['name']);
  $.each(data[0], function(key, val){
    items.push('<li id="' + key + '">' + val + '</li>');
  });
 
  $('<ul/>', {
    'class': 'my-new-list',
    html: items.join('')
  }).appendTo('body');
});


});
```

Начиная с jQuery-1.5, метод $.getJSON() возвращает объект jqXHR, который помимо прочего реализует интерфейс deferred, что позволяет задавать дополнительные обработчики выполнения. Помимо стандартных для объекта deferred методов .done(), .fail() и .then(), с помощью которых можно устанавливать обработчики, в jqXHR реализованы их копии: .success(), .error() и .complete(). Это сделано для соответствия привычным названиям методов, с помощью которых устанавливаются обработчики выполнения ajax-запросов.
```
  // Запустим ajax-запрос, установим обработчики его выполнения и
  // сохраним объект jqxhr данного запроса для дальнейшего использования.
  var jqxhr = $.getJSON("phones.json")
  .success(function() { alert("Успешное выполнение"); })
  .error(function() { alert("Ошибка выполнения"); })
  .complete(function() { alert("Завершение выполнения"); });
 
  // какой-либо код...
 
  // установим еще один обработчик удачного выполнения запроса
  jqxhr.complete(function(){ alert("Успешное выполнения 2"); });

```
загрузить 4 последних изображений с помощью Flickr JSONP API
```
    <div id="images">
    </div>


(function() {
 var flickerAPI = "http://api.flickr.com/services/feeds/photos_public.gne?jsoncallback=?";
 $.getJSON( flickerAPI, {
   tags: "mount rainier",
   tagmode: "any",
   format: "json"
 })
 .done(function( data ) {
   $.each( data.items, function( i, item ) {
     $( "<img/>" ).attr( "src", item.media.m ).appendTo( "#images" );
     if ( i === 3 ) {
       return false;
     }
   });
 });
})();

```
## jQuery.getScript

данная функция загружает и выполняет локальный JavaScript. Может принимать следующие параметры:
- url запрашиваемого скрипта
- callback функция, которой будет скормлен результат (необязательный параметр)

```
$(document).ready(function(){                          // по завершению загрузки страницы
    $('#example-5').click(function(){                  // вешаем на клик по элементу с id = example-5
        $.getScript('ajax/example.js', function(){     // загрузку JavaScript'а из файла example.js 
            testAjax();                                // выполняем загруженный JavaScript
        });                
    })
});
```
Файл example.js:
```
function testAjax() {
    $('#example-5').html('Test completed');  // изменяем элемент с id = example-5
}
```

## jQuery.post

### jQuery.post()
Осуществляет запрос к серверу методом POST, без перезагрузки страницы. Функция имеет несколько необязательных параметров.
```
jQuery.post(url,[data],[callback],[dataType]):jqXHRv:1.0
```
- url — url-адрес, по которому будет отправлен запрос.
- data — данные, которые будут отправлены на сервер. Они должны быть представлены в форме объекта, в формате: {fName1:value1, fName2:value2, ...}.
- callback(data, textStatus, jqXHR) — пользовательская функция, которая будет вызвана после ответа сервера.

- data — данные, присланные с сервера.
- textStatus — статус того, как был выполнен запрос.
- jqXHR — объект jqXHR (в версиях до jquery-1.5, вместо него использовался XMLHttpRequest)
- dataType — ожидаемый тип данных, которые пришлет сервер в ответ на запрос.

Простейший ajax-запрос: отправим пустой запрос к серверу и не будем обрабатывать ответ. Это может быть использовано, например для подсчета количества наведений курсора на баннер (при каждом наведении серверу будет отправляться сигнал).
```
$.post("/plusOne.php");
```
Отправим данные на сервер и обработаем их. Javascript будет выглядеть следующим образом:
```
// На сервер будет отправлен запрос страницы http://hostname/ajaxtest.php и указаны два параметра. 
// После получения ответа от сервера будет вызвана функция onAjaxSuccess, которая выведет 
// на экран сообщение с данными, присланными сервером.
$.post(
  "/ajaxtest.php",
  {
    param1: "param1",
    param2: 2
  },
  onAjaxSuccess
);
 
function onAjaxSuccess(data)
{
  // Здесь мы получаем данные, отправленные сервером и выводим их на экран.
  alert(data);
}
```
На сервере, обработка Ajax запроса ничем не отличается от обработки обычного запроса:
```
<?php
  // файл http://hostname/ajaxtest.php
  echo "I get param1 = ".$_POST['param1']." and param2 = ".$_POST['param2'];
?>
```
В результате этого запроса, на странице появится табличка с текстом "I get param1 = param1 and param2 = 2"

$.post() является сокращенным вариантом функции $.ajax(), вызванной со следующими параметрами:
```
$.ajax({
  url: url,
  type: "POST",
  data: data,
  success: success,
  dataType: dataType
});
```
большинство браузеров не позволяют проводить ajax-запросы на ресурсы с доменами, поддоменами и протоколами, отличными от текущего. Однако, это ограничение не распространяется на запросы типа jsonp и script.

## Обработка выполнения запроса
Стандартным средством обработки успешного выполнения запроса, является указание собственной функции в параметре success. При вызове она получает данные переданные сервером, текстовый статус выполнения запроса, а так же Объект jqXHR.

Получить от сервера ответ в JSON формате и вывести его на страницу 

test.php
```
<?php echo json_encode(array("name"=>"John","time"=>"2pm")); ?>
```
index1.html

```
$.post("test.php",

   function(data) {

     $('body').append( "Name: " + data.name ) // John

              .append( "Time: " + data.time ); //  2pm

   }, "json");
```

### загрузка XML из файла example.xml
index2.html

```
$(document).ready(function(){     // по завершению загрузки страницы
    $('#example').click(function(){  // вешаем на клик по элементу с id = example
        $.post('/example.xml', {}, function(xml){  // загрузку XML из файла example.xml   
            $('#example').html('');
            $(xml).find('note').each(function(){  // заполняем DOM элемент данными из XML
                $('#example').append('To: '   + $(this).find('to').text() + '<br/>')
                               .append('From: ' + $(this).find('from').text() + '<br/>')
                               .append('<b>'    + $(this).find('heading').text() + '</b><br/>')
                               .append(           $(this).find('body').text() + '<br/>');
            });
        }, 'xml');   // указываем явно тип данных
    })
});
```
Файл example.xml:
```
<?xml version="1.0" encoding="UTF-8"?>
<note>
<to>Tove</to>
<from>Jani</from>
<heading>Reminder</heading>
<body>Don't forget me this weekend!</body>
</note>

```
## Отправка Формы

index3.html

Отправка формы POST запросом и отображение результата в div

```
  <form action="/" id="searchForm">
   <input type="text" name="s" placeholder="Search..." />
   <input type="submit" value="Search" />
  </form>
  <!-- результат будет отображён в этом div -->
  <div id="result"></div>
 
<script>
/* прикрепить событие submit к форме */
$("#searchForm").submit(function(event) {
 
  /* отключение стандартной отправки формы */
  event.preventDefault();
 
  /* собираем данные с элементов страницы: */
  var $form = $( this ),
      term = $form.find( 'input[name="s"]' ).val(),
      url = $form.attr( 'action' );
 
  /* отправляем данные методом POST */
  var posting = $.post( url, { s: term } );
 
  /* результат помещаем в div */
  posting.done(function( data ) {
    var content = $( data ).find( '#content' );
    $( "#result" ).empty().append( content );
  });
});
</script>

```

## События

Для удобства разработки, на AJAX запросах висит несколько event'ов, их можно задавать для каждого AJAX запроса в отдельности, либо глобально. На все event'ы можно повесить свою функцию.

Пример для отображения элемента с id=«loading» во время выполнения любого AJAX запроса:
```
$("#loading").bind("ajaxSend", function(){
    $(this).show(); // показываем элемент
}).bind("ajaxComplete", function(){
    $(this).hide(); // скрываем элемент
});
```
Для локальных событий — вносим изменения в опции метода ajax():
```
$.ajax({
    beforeSend: function(){
        // Handle the beforeSend event
    },
    complete: function(){
        // Handle the complete event
    }
    // ...
});
```

## jQuery AJAX Events

- ajaxStart — Данный метод вызывается в случае когда побежал AJAX запрос, и при этом других запросов нету
- beforeSend — Срабатывает до отправки запроса, позволяет редактировать XMLHttpRequest. Локальное событие
- ajaxSend — Срабатывает до отправки запроса, аналогично beforeSend
- success — Срабатывает по возвращению ответа, когда нет ошибок ни сервера, ни вернувшихся данных. Локальное событие
- ajaxSuccess — Срабатывает по возвращению ответа, аналогично success
- error — Срабатывает в случае ошибки. Локальное событие
- ajaxError — Срабатывает в случае ошибки
- complete — Срабатывает по завершению текущего AJAX запроса (с ошибкои или без — срабатывает всегда).Локальное событие
- ajaxComplete — Глобальное событие, аналогичное complete
- ajaxStop — Данный метод вызывается в случае когда больше нету активных запросов


## app04 Отправка формы POST

app04/index.html

```
<!doctype html>
<html>
<head>
    <title>Look I'm AJAXing!</title>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"> <!-- load bootstrap via CDN -->

    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script> <!-- load jquery via CDN -->
    <script src="magic.js"></script> <!-- load our javascript file -->
</head>
<body>
<div class="col-sm-6 col-sm-offset-3">

    <h1>Processing an AJAX Form</h1>

    <!-- OUR FORM -->
    <form action="process.php" method="POST">
        
        <!-- NAME -->
        <div id="name-group" class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" name="name" placeholder="Henry Pym">
            <!-- errors will go here -->
        </div>

        <!-- EMAIL -->
        <div id="email-group" class="form-group">
            <label for="email">Email</label>
            <input type="text" class="form-control" name="email" placeholder="rudd@avengers.com">
            <!-- errors will go here -->
        </div>

        <!-- SUPERHERO ALIAS -->
        <div id="superhero-group" class="form-group">
            <label for="superheroAlias">Superhero Alias</label>
            <input type="text" class="form-control" name="superheroAlias" placeholder="Ant Man">
            <!-- errors will go here -->
        </div>

        <button type="submit" class="btn btn-success">Submit <span class="fa fa-arrow-right"></span></button>

    </form>

</div>
</body>
</html>
```

## Submitting Form AJAX magic.js

```
// magic.js
$(document).ready(function() {

    // process the form
    $('form').submit(function(event) {

        // get the form data
        // there are many ways to get this data using jQuery (you can use the class or id also)
        var formData = {
            'name'              : $('input[name=name]').val(),
            'email'             : $('input[name=email]').val(),
            'superheroAlias'    : $('input[name=superheroAlias]').val()
        };

        // process the form
        $.ajax({
            type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
            url         : 'process.php', // the url where we want to POST
            data        : formData, // our data object
            dataType    : 'json', // what type of data do we expect back from the server
                        encode          : true
        })
            // using the done promise callback
            .done(function(data) {

                // log data to the console so we can see
                console.log(data); 

                // here we will handle errors and validation messages
            });

        // stop the form from submitting the normal way and refreshing the page
        event.preventDefault();
    });

});
```

Handling Errors

```
// magic.js

...

// process the form
$.ajax({
    type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
    url         : 'process.php', // the url where we want to POST
    data        : formData, // our data object
    dataType    : 'json' // what type of data do we expect back from the server
})
    // using the done promise callback
    .done(function(data) {

        // log data to the console so we can see
        console.log(data);

        // here we will handle errors and validation messages
        if ( ! data.success) {
            
            // handle errors for name ---------------
            if (data.errors.name) {
                $('#name-group').addClass('has-error'); // add the error class to show red input
                $('#name-group').append('<div class="help-block">' + data.errors.name + '</div>'); // add the actual error message under our input
            }

            // handle errors for email ---------------
            if (data.errors.email) {
                $('#email-group').addClass('has-error'); // add the error class to show red input
                $('#email-group').append('<div class="help-block">' + data.errors.email + '</div>'); // add the actual error message under our input
            }

            // handle errors for superhero alias ---------------
            if (data.errors.superheroAlias) {
                $('#superhero-group').addClass('has-error'); // add the error class to show red input
                $('#superhero-group').append('<div class="help-block">' + data.errors.superheroAlias + '</div>'); // add the actual error message under our input
            }

        } else {

            // ALL GOOD! just show the success message!
            $('form').append('<div class="alert alert-success">' + data.message + '</div>');

            // usually after form submission, you'll want to redirect
            // window.location = '/thank-you'; // redirect a user to another page
            alert('success'); // for now we'll just alert the user

        }

    });

...

```


Clearing Errors

```
// magic.js

...

// process the form
$('form').submit(function(event) {

    $('.form-group').removeClass('has-error'); // remove the error class
    $('.help-block').remove(); // remove the error text

...

```
 
Showing Server Errors

```
// magic.js

...

// process the form
$.ajax({
    type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
    url         : 'process.php', // the url where we want to POST
    data        : formData, // our data object
    dataType    : 'json' // what type of data do we expect back from the server
})
    // using the done promise callback
    .done(function(data) {
        ...
    })

    // using the fail promise callback
    .fail(function(data) {

        // show any errors
        // best to remove for production
        console.log(data);
    });

...

``` 
 

AJAX Calls

```

    $.post('process.php', function(formData) {
        
        // place success code here

    })
        .fail(function(data) {
            // place error code here
        });


// magic.js
$(document).ready(function() {

    // process the form
    $('form').submit(function(event) {

        $('.form-group').removeClass('has-error'); // remove the error class
        $('.help-block').remove(); // remove the error text

        // get the form data
        // there are many ways to get this data using jQuery (you can use the class or id also)
        var formData = {
            'name'              : $('input[name=name]').val(),
            'email'             : $('input[name=email]').val(),
            'superheroAlias'    : $('input[name=superheroAlias]').val()
        };

        // process the form
        $.ajax({
            type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
            url         : 'process.php', // the url where we want to POST
            data        : formData, // our data object
            dataType    : 'json', // what type of data do we expect back from the server
            encode      : true
        })
            // using the done promise callback
            .done(function(data) {

                // log data to the console so we can see
                console.log(data); 

                // here we will handle errors and validation messages
                if ( ! data.success) {
                    
                    // handle errors for name ---------------
                    if (data.errors.name) {
                        $('#name-group').addClass('has-error'); // add the error class to show red input
                        $('#name-group').append('<div class="help-block">' + data.errors.name + '</div>'); // add the actual error message under our input
                    }

                    // handle errors for email ---------------
                    if (data.errors.email) {
                        $('#email-group').addClass('has-error'); // add the error class to show red input
                        $('#email-group').append('<div class="help-block">' + data.errors.email + '</div>'); // add the actual error message under our input
                    }

                    // handle errors for superhero alias ---------------
                    if (data.errors.superheroAlias) {
                        $('#superhero-group').addClass('has-error'); // add the error class to show red input
                        $('#superhero-group').append('<div class="help-block">' + data.errors.superheroAlias + '</div>'); // add the actual error message under our input
                    }

                } else {

                    // ALL GOOD! just show the success message!
                    $('form').append('<div class="alert alert-success">' + data.message + '</div>');

                    // usually after form submission, you'll want to redirect
                    // window.location = '/thank-you'; // redirect a user to another page

                }
            })

            // using the fail promise callback
            .fail(function(data) {

                // show any errors
                // best to remove for production
                console.log(data);
            });

        // stop the form from submitting the normal way and refreshing the page
        event.preventDefault();
    });

});

```

process.php

```

$errors         = array();      // array to hold validation errors
$data           = array();      // array to pass back data

// validate the variables ======================================================
    // if any of these variables don't exist, add an error to our $errors array

    if (empty($_POST['name']))
        $errors['name'] = 'Name is required.';

    if (empty($_POST['email']))
        $errors['email'] = 'Email is required.';

    if (empty($_POST['superheroAlias']))
        $errors['superheroAlias'] = 'Superhero alias is required.';

// return a response ===========================================================

    // if there are any errors in our errors array, return a success boolean of false
    if ( ! empty($errors)) {

        // if there are items in our errors array, return those errors
        $data['success'] = false;
        $data['errors']  = $errors;
    } else {

        // if there are no errors process our form, then return a message

        // DO ALL YOUR FORM PROCESSING HERE
        // THIS CAN BE WHATEVER YOU WANT TO DO (LOGIN, SAVE, UPDATE, WHATEVER)

        // show a message of success and provide a true success variable
        $data['success'] = true;
        $data['message'] = 'Success!';
    }

    // return all our data to an AJAX call
    echo json_encode($data);

```

## app05 Ajax, call jQuery POST expressjs

app05/index
```
<html>
    <head>
        <title>jsonp test</title>
        <script src="JS/jquery.min.js"></script>      
        <script type="text/javascript">
            $(function(){               
                $('#select_link').click(function(e){
                    e.preventDefault();
                    console.log('select_link clicked');
  
                    var data = {};
                    data.title = "title";
                    data.message = "message";
                    
                    $.ajax({
                        type: 'POST',
                        data: JSON.stringify(data),
                        contentType: 'application/json',
                        url: 'http://localhost:3000/endpoint',                      
                        success: function(data) {
                            console.log('success');
                            console.log(JSON.stringify(data));
                        }
                    });
                });             
            });
        </script>
    </head>
    <body>
        <div id="select_div"><a href="#" id="select_link">Test</a></div>    
    </body>
</html>
```

server.js

```
var express = require('express')
var app = express()

app.use(function (req, res, next) {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET, OPTIONS');
    res.header('Access-Control-Allow-Headers', 'Origin, Content-type, Accept, Authorization');
    res.header('Access-Control-Allow-Credentials', 'true');
    next();
});

var path = require('path');


app.get('/', function(req, res) {
    res.sendFile(path.join(__dirname + '/index.html'));
});


app.post('/endpoint', function(req, res){
    
    var obj = {};
    console.log('body: ' + JSON.stringify(req.body));
    
    res.send(req.body);
});

var server = app.listen(3000, function () {

  var host = server.address().address
  var port = server.address().port

  console.log('Example app listening at http://%s:%s', host, port)

})
```

## app06 Отправка Файлов

### Node.js + JQuery Ajax. Загрузка файлов на сервер 

Отправка файла с помощью Ajax

Все элементы на странице создаются вручную. За загрузку отвечает класс JSUploader вот один из его методов uploadFile:
```
this.uploadFile =  function(index) {
        //baseClass это this
        var file = baseClass.allFiles[index];

        //Создаем объек FormData
        var data = new FormData();
        //Добавлем туда файл
        data.append('uploadFile', file.file);

        //отсылаем с попощью Ajax
        $.ajax({
            url: '/',
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            type: 'POST',
            success: function(response) {
                var message = file.element.find('td.message');
                if(response.status == 'ok') {
                    message.html(response.text);
                    file.element.find('button.uploadButton').remove();
                }
                else {
                    message.html(response.errors);
                }
            },
            xhr: function() {
                var xhr = $.ajaxSettings.xhr();

                if ( xhr.upload ) {
                    console.log('xhr upload');

                    xhr.upload.onprogress = function(e) {
                        file.progressDone = e.position || e.loaded;
                        file.progressTotal = e.totalSize || e.total;
                        //обновляем прогресс для файла
                        baseClass.updateFileProgress(index, file.progressDone, file.progressTotal, file.element);
                        //обновляем общий прогресс
                        baseClass.totalProgressUpdated();
                    };
                }

                return xhr;
            }
        });
    };
```

Обработка загрузки файлов

Для загрузки файлов на сервер нам понадобиться модуль multiparty, который можно установить с помощью команды в консоле:
```
npm install multiparty
```
Далее код который обрабатывает post и get запросы начальной страницы. Здесь мы отображаем форму загрузки и обрабатываем post запрос на загрузку файла.
При окончание загрузки мы сообщаем клиенту что все хорошо или если есть ошибки, то отправить их. 
```
var express = require('express'),
    router = express.Router(),
    fs = require("fs"),
    multiparty = require('multiparty');

//здесь выводим форму для загрузки
router.get('/', function(req, res) {
  res.render('index', { title: 'Node.js File Uploads' });
});

//здесь происходит сама загрузка
router.post('/', function(req, res, next) {
    // создаем форму
    var form = new multiparty.Form();
    //здесь будет храниться путь с загружаемому файлу, его тип и размер
    var uploadFile = {uploadPath: '', type: '', size: 0};
    //максимальный размер файла
    var maxSize = 2 * 1024 * 1024; //2MB
    //поддерживаемые типы(в данном случае это картинки формата jpeg,jpg и png)
    var supportMimeTypes = ['image/jpg', 'image/jpeg', 'image/png'];
    //массив с ошибками произошедшими в ходе загрузки файла
    var errors = [];

     //если произошла ошибка
    form.on('error', function(err){
        if(fs.existsSync(uploadFile.path)) {
            //если загружаемый файл существует удаляем его
            fs.unlinkSync(uploadFile.path);
            console.log('error');
        }
    });

    form.on('close', function() {
        //если нет ошибок и все хорошо
        if(errors.length == 0) {
            //сообщаем что все хорошо
            res.send({status: 'ok', text: 'Success'});
        }
        else {
            if(fs.existsSync(uploadFile.path)) {
                //если загружаемый файл существует удаляем его
                fs.unlinkSync(uploadFile.path);
            }
            //сообщаем что все плохо и какие произошли ошибки
            res.send({status: 'bad', errors: errors});
        }
    });

    // при поступление файла
    form.on('part', function(part) {
        //читаем его размер в байтах
        uploadFile.size = part.byteCount;
        //читаем его тип
        uploadFile.type = part.headers['content-type'];
        //путь для сохранения файла
        uploadFile.path = './files/' + part.filename;

        //проверяем размер файла, он не должен быть больше максимального размера
        if(uploadFile.size > maxSize) {
            errors.push('File size is ' + uploadFile.size + '. Limit is' + (maxSize / 1024 / 1024) + 'MB.');
        }

        //проверяем является ли тип поддерживаемым
        if(supportMimeTypes.indexOf(uploadFile.type) == -1) {
            errors.push('Unsupported mimetype ' + uploadFile.type);
        }

        //если нет ошибок то создаем поток для записи файла
        if(errors.length == 0) {
            var out = fs.createWriteStream(uploadFile.path);
            part.pipe(out);
        }
        else {
            //пропускаем
            //вообще здесь нужно как-то остановить загрузку и перейти к onclose
            part.resume();
        }
    });

    // парсим форму
    form.parse(req);
});

```


