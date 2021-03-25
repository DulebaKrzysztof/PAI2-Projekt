DROP DATABASE theater;

CREATE DATABASE theater;
USE theater;

DROP TABLE ticket;
DROP TABLE ticket_type;
DROP TABLE screening;
DROP TABLE seat;
DROP TABLE auditorium;
DROP TABLE movie;
DROP TABLE snacks;
DROP TABLE snacks_type;
DROP TABLE invoice;
DROP TABLE online_reservation;
DROP TABLE user;
DROP TABLE user_type;

CREATE TABLE user_type(
	id INT NOT NULL,
    user_type VARCHAR(50) NOT NULL,
	PRIMARY KEY (id),
    UNIQUE INDEX id_unique (id ASC)
);

CREATE TABLE user(
	id INT NOT NULL,
    login VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    user_type_id INT NOT NULL,
    PRIMARY KEY (id),
    UNIQUE INDEX id_unique (id ASC),
    UNIQUE INDEX login_unique (login ASC),
    UNIQUE INDEX email_unique (email ASC),
    CONSTRAINT fk_user_type_user FOREIGN KEY (user_type_id) REFERENCES user_type(id)
);

CREATE TABLE movie(
    id INT NOT NULL,
    title VARCHAR(50) NOT NULL,
    director VARCHAR(50) NOT NULL,
    description VARCHAR(255),
    duration VARCHAR(50),
    PRIMARY KEY (id),
    UNIQUE INDEX id_unique (id ASC)
);

CREATE TABLE auditorium(
    id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    seats_number INT NOT NULL,
    PRIMARY KEY (id),
    UNIQUE INDEX id_unique (id ASC)
);

CREATE TABLE seat(
    id INT NOT NULL,
    seat_row INT NOT NULL,
    seat_num INT NOT NULL,
    auditorium_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_auditorium_seat FOREIGN KEY (auditorium_id) REFERENCES auditorium(id),
    UNIQUE INDEX id_unique (id ASC)
);

CREATE TABLE screening(
    id INT NOT NULL,
    screening_date DATE NOT NULL,
    movie_id INT NOT NULL,
    auditorium_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_auditorium_screening FOREIGN KEY (auditorium_id) REFERENCES auditorium(id),
    CONSTRAINT fk_movie_screening FOREIGN KEY (movie_id) REFERENCES movie(id),
    UNIQUE INDEX id_unique (id ASC)
);

CREATE TABLE ticket_type(
    id INT NOT NULL,
    ticket_type VARCHAR(50),
    price VARCHAR(50),
    PRIMARY KEY (id),
    UNIQUE INDEX id_unique (id ASC)
);

CREATE TABLE invoice(
    id INT NOT NULL,
    invoice_date DATE NOT NULL,
    PRIMARY KEY (id),
    UNIQUE INDEX id_unique (id ASC)
);

CREATE TABLE online_reservation(
    id INT NOT NULL,
    user_id INT NOT NULL,
	is_paid BOOLEAN NOT NULL DEFAULT 0,
    is_canceled BOOLEAN NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    UNIQUE INDEX id_unique (id ASC),
    CONSTRAINT fk_user_reservation FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE ticket(
    id INT NOT NULL,
    screening_id INT NOT NULL,
    seat_id INT NOT NULL,
    ticket_type_id INT NOT NULL,
    invoice_id INT NOT NULL,
    online_reservation_id INT,
    PRIMARY KEY (id),
    UNIQUE INDEX id_unique (id ASC),
    CONSTRAINT fk_screening_ticket FOREIGN KEY (screening_id) REFERENCES screening(id),
    CONSTRAINT fk_seat_ticket FOREIGN KEY (seat_id) REFERENCES seat(id),
    CONSTRAINT fk_ticket_type_ticket FOREIGN KEY (ticket_type_id) REFERENCES ticket_type(id),
    CONSTRAINT fk_invoice_ticket FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    CONSTRAINT fk_online_reservation_ticket FOREIGN KEY (online_reservation_id) REFERENCES online_reservation(id)
);

CREATE TABLE snacks_type(
    id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    price INT NOT NULL,
    PRIMARY KEY (id),
    UNIQUE INDEX id_unique (id ASC)
);

CREATE TABLE snacks(
    id INT NOT NULL,
	snacks_type_id INT NOT NULL,
    invoice_id INT NOT NULL,
    PRIMARY KEY (id),
    UNIQUE INDEX id_unique (id ASC),
    CONSTRAINT fk_snacks_type_snacks FOREIGN KEY (snacks_type_id) REFERENCES snacks_type(id),
    CONSTRAINT fk_invoice_snacks FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);
