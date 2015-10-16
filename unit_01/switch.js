switch (prompt("Как погодка?")) {
  case "дождь":
    console.log("Не забудь зонт.");
    break;
  case "снег":
    console.log("Блин, мы в России!");
    break;
  case "солнечно":
    console.log("Оденься полегче.");
  case "облачно":
    console.log("Иди гуляй.");
    break;
  default:
    console.log("Непонятная погода!");
    break;
}