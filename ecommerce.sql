-- CREATE DATABASE 
CREATE DATABASE ecommerceDB;

-- switch to use ecommerce database
USE ecommerceDB;

-- CREATE TABLE  for storing brand details
CREATE TABLE brand(
brand_id INT PRIMARY KEY AUTO_INCREMENT,    -- UNIQUE ID for each brand
brand_name VARCHAR(100) NOT NULL   -- name of the brand
);

-- CREATE TABLE for storing product categories like clothing, electronics
CREATE TABLE product_category(
category_id INT PRIMARY KEY AUTO_INCREMENT,  -- UNIQUE ID for category
category_name VARCHAR(100) NOT NULL    -- name of the category
);

-- CREATE TABLE for storing general product info
CREATE TABLE product(
product_id INT PRIMARY KEY AUTO_INCREMENT,  -- UNIQUE ID for each proct
product_name VARCHAR(100) NOT NULL,    -- product name
product_description TEXT,     -- description of the product
base_price DECIMAL(10,2),      -- base price before variations
brand_id INT,                  -- links to the brand
category_id INT         -- links to the product category 
);

-- CREATE TABLE for specific product items that are purchasable
CREATE TABLE product_item(
product_item_id INT PRIMARY KEY AUTO_INCREMENT,         -- unique id per item
product_id INT,                  -- links back to products
sku VARCHAR(100) NOT NULL,          -- stock keeping unite code
stock_quantity INT DEFAULT 0        -- qantity available in stock
);

-- CREATE TABLE for storing image URLs of products
CREATE TABLE product_image(
image_id INT PRIMARY KEY AUTO_INCREMENT,       -- unique ID per image
product_id INT,                                    -- related product
image_url VARCHAR(255)                          -- link or reference to the image
);

-- CREATE TABLE for storing available colors
CREATE TABLE color(
color_id INT PRIMARY KEY AUTO_INCREMENT,     -- unique id for each color
color_name VARCHAR(50) NOT NULL        -- name of the color, e.g red
);

-- CREATE TABLE for linking product items to size and color variations
CREATE TABLE product_variation(
variation_id INT PRIMARY KEY AUTO_INCREMENT,     -- unique id per variation
product_item_id INT,                             -- refers to product item
color_id INT,                                    -- refers to color
size_option_id INT                               -- refers to size options
);

-- CREATE TABLE for grouping size options by category like 'shirts','shoes'
CREATE TABLE size_category(
size_category_id INT PRIMARY KEY AUTO_INCREMENT,    -- unique id for size
category_name VARCHAR(50)                          -- name of size category
);

-- CREATE TABLE listing specific sizes like S, M, L, or shoe sizes like 42
CREATE TABLE size_option(
size_option_id INT PRIMARY KEY AUTO_INCREMENT,          -- unique id for size
size_name VARCHAR(10),                                   -- size label 
size_category_id INT                                     -- belongs to size category
);

-- CREATE TABLE grouping attributes like 'physical' or 'technical'
CREATE TABLE attribute_category(
attribute_category_id INT PRIMARY KEY AUTO_INCREMENT,          -- unique id
category_name VARCHAR(100)                                     -- category name
);

-- CREATE TABLE defining the type of attribute: text, number, boolean
CREATE TABLE attribute_type(
attribute_type_id INT PRIMARY KEY AUTO_INCREMENT,               -- unique id
type_name VARCHAR(50)                                           -- type name: text
);

-- CREATE TABLE to store attributes like material, weight, etc
CREATE TABLE product_attribute(
attribute_id INT PRIMARY KEY AUTO_INCREMENT,                     -- unique id
product_id INT,                                                  -- product linked to the attributes
attribute_name VARCHAR(100),                                      -- name of the attribute
attribute_value VARCHAR(255),                                     -- value of the attribute
attribute_type_id INT,                                            -- type: text, number, etc
attribute_category_id INT                                         -- category: physical, etc
);