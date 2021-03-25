CREATE DATABASE theater;
USE theater;

DROP TABLE ticket;
DROP TABLE ticket_type;
DROP TABLE screening;
DROP TABLE seat;
DROP TABLE auditorium;
DROP TABLE movie;
DROP TABLE user;
DROP TABLE snacks;

CREATE TABLE user(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    login VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE INDEX id_unique (id ASC),
    UNIQUE INDEX login_unique (login ASC),
    UNIQUE INDEX email_unique (email ASC)
);

CREATE TABLE movie(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    director VARCHAR(50) NOT NULL,
    description VARCHAR(255),
    duration VARCHAR(50),
    PRIMARY KEY (id),
    UNIQUE INDEX id_unique (id ASC)
);

CREATE TABLE auditorium(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    seats_number INT NOT NULL,
    PRIMARY KEY (id),
    UNIQUE INDEX id_unique (id ASC)
);

CREATE TABLE seat(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    seat_row INT NOT NULL,
    seat_num INT NOT NULL,
    auditorium_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_auditorium_seat FOREIGN KEY (id) REFERENCES auditorium(id),
    UNIQUE INDEX id_unique (id ASC)
);

CREATE TABLE screening(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    screening_date DATE NOT NULL,
    movie_id INT NOT NULL,
    auditorium_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_auditorium_screening FOREIGN KEY (id) REFERENCES auditorium(id),
    CONSTRAINT fk_movie_screening FOREIGN KEY (id) REFERENCES movie(id),
    UNIQUE INDEX id_unique (id ASC)
);

CREATE TABLE ticket_type(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    ticket_type VARCHAR(50),
    price VARCHAR(50),
    PRIMARY KEY (id),
    UNIQUE INDEX id_unique (id ASC)
);

CREATE TABLE ticket(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    screening_id INT NOT NULL,
    auditorium_id INT NOT NULL,
    seat_id INT NOT NULL,
    ticket_id INT NOT NULL,
    user_id INT,
    is_paid boolean NOT NULL DEFAULT 0,
    canceled boolean NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    UNIQUE INDEX id_unique (id ASC),
    CONSTRAINT fk_screening_reservation FOREIGN KEY (id) REFERENCES screening(id),
    CONSTRAINT fk_auditorium_reservation FOREIGN KEY (id) REFERENCES auditorium(id),
    CONSTRAINT fk_seat_reservation FOREIGN KEY (id) REFERENCES seat(id),
    CONSTRAINT fk_ticket_reservation FOREIGN KEY (id) REFERENCES ticket(id),
    CONSTRAINT fk_user_reservation FOREIGN KEY (id) REFERENCES user(id)
);

CREATE TABLE snacks(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    price INT NOT NULL,
    PRIMARY KEY (id),
    UNIQUE INDEX id_unique (id ASC)
);
