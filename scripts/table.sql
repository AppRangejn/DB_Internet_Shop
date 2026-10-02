CREATE TABLE models (
    id SERIAL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    brand_id INT REFERENCES brands(id),
    PRIMARY KEY (id)
);

CREATE TABLE orders (
    id SERIAL,
    code VARCHAR(20) NOT NULL UNIQUE,
    date TIMESTAMP,
    customer INT NOT NULL REFERENCES customers(id),
    amount NUMERIC (10,2) NOT NULL,
    paid BOOLEAN NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE items (
    id SERIAL,
    category_id INT REFERENCES item_categories(id),
    "type_id" INT REFERENCES item_types(id),
    brand_id INT REFERENCES brands(id),
    model_id INT REFERENCES models(id),
    price NUMERIC (10,2) NOT NULL,
    store_id INT REFERENCES stores(id),
    quantity INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE item_order (
    item_id INT REFERENCES items(id) ON DELETE CASCADE,
    order_id INT REFERENCES orders(id) ON DELETE CASCADE,
    PRIMARY KEY(item_id, order_id)
);
