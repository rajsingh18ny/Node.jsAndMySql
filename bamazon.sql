DROP DATABASE IF EXISTS bamazon_db;

CREATE DATABASE bamazon_db;

USE bamazon_db;

CREATE TABLE products(
  -- Create a numeric column called "id" which will automatically increment its default value as we create new rows. --(
`item_id` int(30) NOT NULL AUTO_INCREMENT,
`product_name` VARCHAR(50) NOT NULL,
`department_name` VARCHAR(30) NOT NULL, 
`price` DECIMAL(10,2) NOT NULL,
`stock_quantity` int(100) NOT NULL,
PRIMARY KEY(`item_id`)
);

  
  
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUE (item_id, "cat_brush", "grooming", 5.99, 150);
  
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUE (item_id, "kitty_tickler", "toys", 6.99, 50);
  
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUE (item_id, "treats", "food", 2.99, 250);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUE (item_id, "plush_puss", "bedding", 12.99, 70);
  
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUE (item_id, "cat_toothbrush", "grooming", 7.99, 20);
  
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUE (item_id, "megatreats", "food", 8.99, 500);
  
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUE (item_id, "scratching_post", "toys", 11.99, 150);
  
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUE (item_id, "bulk_salmon", "food", 25.99, 800);
  
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUE (item_id, "kitten_brush", "grooming", 6.99, 150);
  
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUE (item_id, "wiggle_worm", "toys", 2.99, 50);
  
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUE (item_id, "hide_a_paw", "toys", 10.99, 120);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUE (item_id, "swanky_puss", "bedding", 30.99, 70);

-- item_id auto pops --
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUE(item_id, "scratch_mat", "toys", 5.99, 75);

-- SELECT * FROM products;
-- SELECT * FROM products	WHERE item_id LIKE '%5%'
-- SELECT * FROM products	WHERE item_id LIKE '%5%'


-- SELECT * FROM products WHERE item_id in (10)


UPDATE products SET stock_quantity = 2250 WHERE item_id = 10;



