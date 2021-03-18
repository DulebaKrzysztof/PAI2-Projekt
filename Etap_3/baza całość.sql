create database kino;
CREATE TABLE IF NOT EXISTS Seans ( 
id_seansu INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 nazwa_filmu VARCHAR(30) NOT NULL,
 godzina DATETIME, 
 id_sala INT,
 FOREIGN KEY(id_sala) REFERENCES sala(id_sali)
);
CREATE TABLE IF NOT EXISTS Sala (
    id_sali INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nazwa VARCHAR(30) NOT NULL
    );
    
CREATE TABLE IF NOT EXISTS Bilet (
    id_biletu INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    typ VARCHAR(30) NOT NULL,
    id_sala int not null,
	id_miejsce int NOT NULL UNIQUE,
    id_seansu int not null,
    FOREIGN KEY(id_seansu) REFERENCES Seans(id_seansu),
    FOREIGN KEY(id_sala) REFERENCES sala(id_sali),
    cena INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Przekaski (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nazwa VARCHAR(30) NOT NULL,
    cena INT NOT NULL
    )

CREATE TABLE IF NOT EXISTS Napoje (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nazwa VARCHAR(30) NOT NULL,
    cena INT NOT NULL
    )

CREATE TABLE IF NOT EXISTS Sala (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    stan INT NOT NULL
    )

CREATE TABLE IF NOT EXISTS Bilet (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    typ VARCHAR(30) NOT NULL,
    cena INT
    )
CREATE TABLE IF NOT EXISTS Seans ( 
id INT NOT NULL AUTO_INCREMENT,
 nazwa_filmu VARCHAR(30) NOT NULL,
 godzina DATETIME, id_sala INT,
 id_bilet INT, PRIMARY KEY(id),
 FOREIGN KEY(id_sala) REFERENCES sala(id),
 FOREIGN KEY(id_bilet) REFERENCES bilet(id)
)
