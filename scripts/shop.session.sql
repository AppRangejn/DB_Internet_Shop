
CREATE TABLE customers (
    id SERIAL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    PRIMARY KEY (id)
);


CREATE TABLE stores (
    id SERIAL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    PRIMARY KEY (id)
);


CREATE TABLE brands (
    id SERIAL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    PRIMARY KEY (id)
);


CREATE TABLE item_types (
    id SERIAL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    PRIMARY KEY (id)
);


CREATE TABLE item_categories (
    id SERIAL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    PRIMARY KEY (id)
);

