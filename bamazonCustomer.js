var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
  host: "localhost",
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: "",
  database: "bamazon_db"
});

// connect to the mysql server and sql database
connection.connect(function (err) {
  if (err) throw err;
  // run the start function after the connection is made to prompt the user
  getProducts();
});

function getProducts() {
  connection.query("SELECT * FROM products", function (err, res) {
    if (err) { console.error(err); }
    displayProducts(res);
  });
}

function displayProducts(products) {
  console.log(products);
  for (var i = 0; i < products.length; i++) {
    console.log(
      "Product ID: " + products[i].item_id +
      " | Product: " + products[i].product_name +
      " | Department: " + products[i].department_name +
      " | Price: " + products[i].price +
      " | Quantity on hand:  " + products[i].stock_quantity
    );
  }
  orderId();
}
function orderId() {
  inquirer
    .prompt([
      {
        name: "item",
        type: "input",
        message: "\nWhat is the ID of the item you would like to purchase?",
        validate: function (userInput) {
          //regEx to validate whether number is entered
          if (/^[1-9]?[0-9]{1}$|^100$/.test(userInput)) {
            console.log('\nthis is a number')
            return true;
          } else {
            console.log("\nyou need to type a number");
            return false;
          }
        }
      },
      {
        name: "checkQuan",
        type: "input",
        message: "How many of that item would you like?",
        validate: function (requestedQuantity, res) {
          connection.query(`SELECT * FROM products WHERE item_id in (${res.item})`, function (err, result) {
            if (err) { console.error(err); }
            var ourResult = result
            var stock_quantity = ourResult[0].stock_quantity;
            stock_quantity = Number(stock_quantity)
            res.item = Number(res.item)
            var purchase = (stock_quantity - requestedQuantity);
            if (requestedQuantity <= stock_quantity) {
              console.log("\nGreat! We can fill your order and ship it to you.");
              connection.query(`UPDATE products SET stock_quantity = ${purchase} WHERE item_id = ${res.item}`, function (err, res) {
                if (err) { console.error(err); }
                console.log('\nUpdated inventory');
              });
              return true;
            } else {
              console.log("\nI'm sorry. We don't have enough to fill your order.");
              return false;
            }
          });
        },
      }
    ])
};