CREATE TABLE customers (
  customer_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  password TEXT NOT NULL,
  address TEXT NOT NULL,
  phone TEXT NOT NULL
);

CREATE TABLE products (
  product_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  price NUMERIC(10,2) NOT NULL,
  image BYTEA
);

CREATE TABLE orders (
  order_id SERIAL PRIMARY KEY,
  customer_id INTEGER REFERENCES customers(customer_id),
  total_price NUMERIC(10,2) NOT NULL,
  status TEXT NOT NULL
);

CREATE TABLE order_items (
  order_item_id SERIAL PRIMARY KEY,
  order_id INTEGER REFERENCES orders(order_id),
  product_id INTEGER REFERENCES products(product_id),
  quantity INTEGER NOT NULL,
  price NUMERIC(10,2) NOT NULL
);

CREATE TABLE categories (
  category_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE product_categories (
  product_id INTEGER REFERENCES products(product_id),
  category_id INTEGER REFERENCES categories(category_id),
  PRIMARY KEY (product_id, category_id)
);

CREATE TABLE reviews (
  review_id SERIAL PRIMARY KEY,
  product_id INTEGER REFERENCES products(product_id),
  customer_id INTEGER REFERENCES customers(customer_id),
  rating INTEGER NOT NULL,
  review_text TEXT NOT NULL
);

CREATE TABLE wishlists (
  wishlist_id SERIAL PRIMARY KEY,
  customer_id INTEGER REFERENCES customers(customer_id)
);

CREATE TABLE wishlist_items (
  wishlist_item_id SERIAL PRIMARY KEY,
  wishlist_id INTEGER REFERENCES wishlists(wishlist_id),
  product_id INTEGER REFERENCES products(product_id),
  PRIMARY KEY (wishlist_id, product_id)
);

CREATE TABLE promotions (
  promotion_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  discount NUMERIC(10,2) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
);

CREATE TABLE promotion_applications (
  promotion_id INTEGER REFERENCES promotions(promotion_id),
  product_id INTEGER REFERENCES products(product_id),
  PRIMARY KEY (promotion_id, product_id)
);
