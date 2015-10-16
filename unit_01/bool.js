pb = false;

b = new Boolean(true);

console.log(b); // Boolean {[[PrimitiveValue]]: true}

if (pb) {
  // . . . этот код будет выполнен
  console.log('pb = false этот код не будет выполнен');
}

x = new Boolean(false);
if (x) {
  // . . . этот код будет выполнен
  console.log('new Boolean(false) - этот код будет выполнен');
}
var expression = 19;
x = Boolean(expression);     // предпочтительно
//x = new Boolean(expression); // не используйте
console.log(x); //true