USE ecommerceDB;

-- link each product to its brand
ALTER TABLE product
ADD CONSTRAINT fk_product_brand
FOREIGN KEY (brand_id) REFERENCES brand(brand_id);

-- link each product to its category 
ALTER TABLE product
ADD CONSTRAINT fk_product_category
FOREIGN KEY (category_id) REFERENCES product_category(category_id);

-- connect product items (specific skills) to their product
ALTER TABLE product_item
ADD CONSTRAINT fk_productitem_product
FOREIGN KEY (product_id) REFERENCES product(product_id);

-- connect product images to the correct product
ALTER TABLE product_image
ADD CONSTRAINT fk_productimage_product
FOREIGN KEY (product_id) REFERENCES product(product_id);

-- link each product variation (color/size) to a specific product item
ALTER TABLE product_variation
ADD CONSTRAINT fk_variation_productitem
FOREIGN KEY (product_item_id) REFERENCES product_item(product_item_id);

-- Assign a color to each variation e.g, red, blue
ALTER TABLE product_variation
ADD CONSTRAINT fk_variation_color
FOREIGN KEY (color_id) REFERENCES color(color_id);

-- Assign a size option to each variation e.g S, M, L
ALTER TABLE product_variation
ADD CONSTRAINT fk_variation_sizeoption
FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id);

-- link each size option to a size category (e.g, shoe sizes, shirt sizes)
ALTER TABLE size_option
ADD CONSTRAINT fk_sizeoption_category
FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id);

-- connect product attributes (e.g, material, weight) to the product
ALTER TABLE product_attribute
ADD CONSTRAINT fk_attribute_product
FOREIGN KEY (product_id) REFERENCES product(product_id);

-- Define what type of data the attributes hold (text, number)
ALTER TABLE product_attribute
ADD CONSTRAINT fk_attribute_type
FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id);

-- Categorize attributes by type (e.g, physical, technical)
ALTER TABLE product_attribute
ADD CONSTRAINT fk_attribute_category
FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id);
