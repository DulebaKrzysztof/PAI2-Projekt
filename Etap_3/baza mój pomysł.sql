CREATE TABLE user(
    id INT NOT NULL PRIMARY KEY,
    login VARCHAR(50),
    password VARCHAR(50),
    email VARCHAR(50),
    firstName VARCHAR(50),
    lastName VARCHAR(50)
);

CREATE TABLE movie(
    id INT NOT NULL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    director VARCHAR(50) NOT NULL,
    description VARCHAR(500),
    duration VARCHAR(50)
);

CREATE TABLE auditorium(
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    seats_number INT NOT NULL
);

CREATE TABLE seat(
    id INT NOT NULL PRIMARY KEY,
    row INT NOT NULL,
    num INT NOT NULL,
    auditorium_id INT NOT NULL,
    CONSTRAINT fk_auditorium_seat_id FOREIGN KEY (auditorium_id) REFERENCES auditorium(id)
);

CREATE TABLE screening(
    id INT NOT NULL PRIMARY KEY,
    screening_date DATE NOT NULL,
    movie_id INT NOT NULL,
    auditorium_id INT NOT NULL,
    CONSTRAINT fk_auditorium_screening_id FOREIGN KEY (auditorium_id) REFERENCES auditorium(id),
    CONSTRAINT fk_movie_screening_id FOREIGN KEY (movie_id) REFERENCES movie(id)
);

CREATE TABLE ticket(
    id INT NOT NULL PRIMARY KEY,
    ticket_type VARCHAR(50),
    price VARCHAR(50)
);

CREATE TABLE reservation(
    id INT(10) NOT NULL PRIMARY KEY,
    screening_id INT NOT NULL,
    auditorium_id INT NOT NULL,
    seat_id INT NOT NULL,
    ticket_id INT NOT NULL,
    is_paid boolean NOT NULL,
    user_id INT,
    CONSTRAINT fk_screening_reservation_id FOREIGN KEY (screening_id) REFERENCES screening(id),
    CONSTRAINT fk_auditorium_reservation_id FOREIGN KEY (auditorium_id) REFERENCES auditorium(id),
    CONSTRAINT fk_seat_reservation_id FOREIGN KEY (seat_id) REFERENCES seat(id),
    CONSTRAINT fk_ticket_reservation_id FOREIGN KEY (ticket_id) REFERENCES ticket(id),
    CONSTRAINT fk_user_reservation_id FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE snacks(
    id INT NOT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price INT NOT NULL
 );
