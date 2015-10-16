// String, Number, Boolean, Array, Object

var length = 16;                               // Number
var lastName = "Johnson";                      // String
var cars = ["Saab", "Volvo", "BMW"];           // Array
var x = {firstName:"John", lastName:"Doe"};    // Object

console.log(cars);

console.log(x);

// string
a = 'my string';
//b = new String(object) // синтаксис устарел и не используется
var c = String();

console.log(c);

// кавычки любые - без разницы
var str = "string literal"

console.log(str);

var str = "\u1234"
console.log(str);

console.log("12345".length);
// Доступ к символам
console.log('cat'.charAt(1)); // возвратит "a"

var str = 'cat';
console.log(str[1]); // "a"

str = "строка";
str = str.charAt(4) + str.charAt(5) + str.charAt(6);
console.log(str); // "ока"

// Для сравнения строк используются обычные операторы < >.
var str1 = 'cat';
var str2 = 'dog';

console.log(str1>str2); // false

