DROP DATABASE theater;

CREATE DATABASE theater;
USE theater;

DROP TABLE ticket;
DROP TABLE ticket_type;
DROP TABLE screening;
DROP TABLE seat;
DROP TABLE auditorium;
DROP TABLE movie_actor;
DROP TABLE movie;
DROP TABLE genre;
DROP TABLE director;
DROP TABLE actor;
DROP TABLE snacks;
DROP TABLE snacks_type;
DROP TABLE invoice;
DROP TABLE online_reservation;
DROP TABLE customer;
DROP TABLE employee;
DROP TABLE user;

CREATE TABLE user(
	id INT NOT NULL PRIMARY KEY,
    login VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE customer(
	id INT NOT NULL PRIMARY KEY,
	user_id INT NOT NULL UNIQUE,
    CONSTRAINT fk_user_customer FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE employee(
	id INT NOT NULL PRIMARY KEY,
    user_id INT NOT NULL UNIQUE,
    CONSTRAINT fk_user_employee FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE genre(
	id INT NOT NULL PRIMARY KEY,
	genre VARCHAR(50) NOT NULL
);

CREATE TABLE director(
	id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE actor(
	id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE movie(
    id INT NOT NULL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    genre_id INT NOT NULL,
    director_id INT NOT NULL,
    description VARCHAR(255),
    duration VARCHAR(50),
	CONSTRAINT fk_genre_movie FOREIGN KEY (genre_id) REFERENCES genre(id),
    CONSTRAINT fk_director_movie FOREIGN KEY (director_id) REFERENCES director(id)
);

CREATE TABLE movie_actor(
	movie_id INT NOT NULL,
    actor_id INT NOT NULL,
    PRIMARY KEY (movie_id, actor_id),
    CONSTRAINT fk_movie_actor_movie FOREIGN KEY (movie_id) REFERENCES movie(id),
    CONSTRAINT fk_movie_actor_actor FOREIGN KEY (actor_id) REFERENCES actor(id)
);

CREATE TABLE auditorium(
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    seats_number INT NOT NULL
);

CREATE TABLE seat(
    id INT NOT NULL PRIMARY KEY,
    seat_row INT NOT NULL,
    seat_num INT NOT NULL,
    auditorium_id INT NOT NULL,
    CONSTRAINT fk_auditorium_seat FOREIGN KEY (auditorium_id) REFERENCES auditorium(id)
);

CREATE TABLE screening(
    id INT NOT NULL PRIMARY KEY,
    screening_date DATETIME NOT NULL,
    movie_id INT NOT NULL,
    auditorium_id INT NOT NULL,
    CONSTRAINT fk_auditorium_screening FOREIGN KEY (auditorium_id) REFERENCES auditorium(id),
    CONSTRAINT fk_movie_screening FOREIGN KEY (movie_id) REFERENCES movie(id)
);

CREATE TABLE ticket_type(
    id INT NOT NULL PRIMARY KEY,
    ticket_type VARCHAR(50),
    price VARCHAR(50)
);

CREATE TABLE invoice(
    id INT NOT NULL PRIMARY KEY,
    invoice_date DATE NOT NULL,
    employee_id INT NOT NULL,
    CONSTRAINT fk_employee_invoice FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE online_reservation(
    id INT NOT NULL PRIMARY KEY,
    customer_id INT NOT NULL,
	is_paid BOOLEAN NOT NULL DEFAULT 0,
    is_canceled BOOLEAN NOT NULL DEFAULT 0,
    CONSTRAINT fk_customer_online_reservation FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE ticket(
    id INT NOT NULL PRIMARY KEY,
    screening_id INT NOT NULL,
    seat_id INT NOT NULL,
    ticket_type_id INT NOT NULL,
    invoice_id INT NOT NULL,
    online_reservation_id INT,
    CONSTRAINT fk_screening_ticket FOREIGN KEY (screening_id) REFERENCES screening(id),
    CONSTRAINT fk_seat_ticket FOREIGN KEY (seat_id) REFERENCES seat(id),
    CONSTRAINT fk_ticket_type_ticket FOREIGN KEY (ticket_type_id) REFERENCES ticket_type(id),
    CONSTRAINT fk_invoice_ticket FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    CONSTRAINT fk_online_reservation_ticket FOREIGN KEY (online_reservation_id) REFERENCES online_reservation(id)
);

CREATE TABLE snacks_type(
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price INT NOT NULL
);

CREATE TABLE snacks(
    id INT NOT NULL PRIMARY KEY,
    number INT NOT NULL,
	snacks_type_id INT NOT NULL,
    invoice_id INT NOT NULL,
    CONSTRAINT fk_snacks_type_snacks FOREIGN KEY (snacks_type_id) REFERENCES snacks_type(id),
    CONSTRAINT fk_invoice_snacks FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);
