/* обычный синтаксис */
var array = [ 'elem0', 'elem1', 'elem2', '...' ];
var empty = [];

/* Синтаксис с new Array() */
var array = new Array( 'elem0', 'elem1', 'elem2', '...');
var empty = new Array();

/* Редкий синтаксис: аргумент new Array - одно число.
При этом создается массив заданной длины, 
все значения в котором undefined */
var array = new Array(10);

console.log(array); // []
// добавить элемент в конец
var arr = [];
arr[arr.length] = 5;  /* или arr.push(5) */
console.log(arr.length); // 
console.log(arr[0]);
arr.push(5);
console.log(arr.length); // 
console.log(arr[1]);

// Пример: Создать массив из разных элементов

var arr = [ 4, "test", , false, [0,1] ];

console.log(arr[1]); // => "test"
console.log(arr[2]); // => undefined
console.log(arr[3]); // => false
console.log(arr[4][1]); // => 1

// Пример: разреженный массив
var arr = [];
arr[1] = 5;
arr[999] = 6;

console.log(arr[0]); // => undefined, такого значения нет
console.log(arr.length) ;// => 1000 : последний индекс+1


// 3 в ширину 3 в высоту
// каждый подмассив - колонка
var matrix = [ [1,2,3], [4,5,6], [7,8,9] ];

console.log(matrix[1][1]);  // 5

