CREATE TABLE IF NOT EXISTS books (
  book_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  author_id INTEGER UNSIGNED,
  title VARCHAR (100) NOT NULL,
  year INTEGER UNSIGNED NOT NULL DEFAULT 1900,
  language VARCHAR (2) NOT NULL DEFAULT 'es' COMMENT 'ISO 639-1 Language',
  cover_url VARCHAR (500),
  price DOUBLE(6,2) NOT NULL DEFAULT 10.0,
  sellable TINYINT(1) DEFAULT 1,
  copies INTEGER NOT NULL DEFAULT 1,
  description TEXT
);

CREATE TABLE IF NOT EXISTS authors(
    author_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    nationality VARCHAR(3)
);

CREATE TABLE clients (
    client_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR (50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    birthdate DATETIME,
    gender ENUM('M', 'F', 'ND') NOT NULL,
    active TINYINT(1) NOT NULL DEFAULT 1,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS operations(
    operation_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    book_id INTEGER UNSIGNED,
    client_id INTEGER UNSIGNED,
    type ENUM('borrowed', 'returned', 'sold') NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    finished TINYINT(1) NOT NULL
);

INSERT INTO authors(author_id, name, nationality)
VALUES (NULL, 'Juan Rulfo', 'MEX');

INSERT INTO authors(name, nationality) 
VALUES ('Gabriel García Márquez', 'COL');

INSERT INTO authors 
VALUES (NULL, 'Juan Gabriel Vasquez', 'COL');

INSERT INTO authors(name, nationality)
VALUES('Julio Cortázar', 'ARG'),
    ('Isabel Allende','CHI'),
    ('Octavio Paz','MEX'),
    ('Juan Carlos Onetti', 'URU')

INSERT INTO `clients`(name, email, birthdate, gender, active) 
VALUES('Pedro Sanchez','Pedro.78522059J@random.names','1992-01-31','M',0)
    ON DUPLICATE KEY UPDATE active = VALUES(active);

El laberinto de la Soledad, Octavio Paz, 1952
Vuelta al laberinto de la Soledad, Ocatvio Paz, 1960

insert into books(title, author_id) 
VALUES('El laberinto de la Soledad', 6);

INSERT INTO books(title, author_id, `year`)
VALUES('Vuelta al laberinto de la Soledad',
    (SELECT author_id FROM authors 
    WHERE name = 'Octavio Paz'
    LIMIT 1
    ), 1960
);
