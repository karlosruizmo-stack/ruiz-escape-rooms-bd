DROP DATABASE IF EXISTS escape_room;
CREATE DATABASE escape_room;
USE escape_room;

CREATE TABLE SEUS (
    id_seu INT AUTO_INCREMENT PRIMARY KEY,
    nom_seu VARCHAR(100),
    ciutat_seu VARCHAR(100),
    adressa_seu VARCHAR(200),
    telef_contacte_seu VARCHAR(20)
);

CREATE TABLE PARTICIPANTS (
    id_parti INT AUTO_INCREMENT PRIMARY KEY,
    nom_parti VARCHAR(100),
    cognom_parti VARCHAR(100),
    email_parti VARCHAR(150),
    data_naixement DATE
);

CREATE TABLE EQUIPS (
    id_equip INT AUTO_INCREMENT PRIMARY KEY,
    nom_equip VARCHAR(100),
    data_creacio DATE,
    qtat_parti INT
);

CREATE TABLE SALES (
    id_sala INT AUTO_INCREMENT PRIMARY KEY,
    nom_sala VARCHAR(100),
    tematica VARCHAR(50),
    dificultat ENUM('Fàcil', 'Mitjà', 'Difícil') NOT NULL,
    durada_max INT,
    max_parti INT,
    id_seu INT NOT NULL, 
    FOREIGN KEY (id_seu) REFERENCES SEUS(id_seu)
);

CREATE TABLE EQUIPS_PARTICIPANTS (
    id_equip INT,
    id_parti INT,
    data_incorp DATE,
    PRIMARY KEY (id_equip, id_parti),
    FOREIGN KEY (id_equip) REFERENCES EQUIPS(id_equip),
    FOREIGN KEY (id_parti) REFERENCES PARTICIPANTS(id_parti)
);

CREATE TABLE RESERVES (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    data_hora_reserva DATETIME,
    estat_reserva ENUM('Realitzada', 'Cancel·lada', 'Pendent') NOT NULL,
    qtat_participants INT,
    id_sala INT NOT NULL, 
    id_equip INT NOT NULL, 
    FOREIGN KEY (id_sala) REFERENCES SALES(id_sala),
    FOREIGN KEY (id_equip) REFERENCES EQUIPS(id_equip)
);

CREATE TABLE RESULTATS (
    id_resultat INT AUTO_INCREMENT PRIMARY KEY,
    temps_utilitzat INT,
    exit_fracas BOOLEAN,
    puntuacio INT,
    qtat_pistes INT,
    id_reserva INT NOT NULL, 
    FOREIGN KEY (id_reserva) REFERENCES RESERVES(id_reserva)
);

INSERT INTO SEUS (nom_seu, ciutat_seu, adressa_seu, telef_contacte_seu) VALUES 
('Enigma BCN', 'Barcelona', 'Carrer Balmes 12', '931112233'),
('Misteri GI', 'Girona', 'Plaça del Vi 5', '972334455'),
('Escape TGN', 'Tarragona', 'Rambla Nova 20', '977556677');

INSERT INTO SALES (nom_sala, tematica, dificultat, durada_max, max_parti, id_seu) VALUES 
('La Presó', 'Policial', 'Mitjà', 60, 6, 1), ('Búnker', 'Història', 'Difícil', 75, 4, 1),
('Laboratori', 'Ciència', 'Mitjà', 60, 5, 2), ('Zombis', 'Terror', 'Fàcil', 60, 8, 2),
('Pirates', 'Aventura', 'Fàcil', 60, 6, 3), ('Egipte', 'Arqueologia', 'Difícil', 90, 4, 3);


INSERT INTO EQUIPS (nom_equip, data_creacio, qtat_parti) VALUES 
('Sherlocks', '2024-01-01', 3), ('Escape Kings', '2024-01-15', 2), 
('The Winners', '2024-02-01', 2), ('Team Rocket', '2024-02-10', 2),
('Alpha Solo', '2024-02-20', 1);

INSERT INTO PARTICIPANTS (nom_parti, cognom_parti, email_parti, data_naixement) VALUES 
('Joan', 'Pou', 'joan@mail.com', '1990-01-01'), ('Marta', 'Vila', 'marta@mail.com', '1992-05-12'),
('Pere', 'Sole', 'pere@mail.com', '1988-10-20'), ('Anna', 'Rius', 'anna@mail.com', '1995-03-15'),
('Lluís', 'Mas', 'lluis@mail.com', '2000-12-01'), ('Carla', 'Font', 'carla@mail.com', '1997-07-07'),
('Marc', 'Sanz', 'marc@mail.com', '1993-02-28'), ('Sònia', 'Gómez', 'sonia@mail.com', '1991-11-11'),
('Jordi', 'Roca', 'jordi@mail.com', '1985-08-22'), ('Laia', 'Serna', 'laia@mail.com', '1999-06-30');


INSERT INTO EQUIPS_PARTICIPANTS (id_equip, id_parti, data_incorp) VALUES 
(1, 1, '2024-01-01'), (1, 2, '2024-01-01'), (1, 3, '2024-01-01'), 
(2, 4, '2024-01-15'), (2, 5, '2024-01-15'), 
(3, 6, '2024-02-01'), (3, 7, '2024-02-01'), 
(4, 8, '2024-02-10'), (4, 9, '2024-02-10'),
(5, 10, '2024-02-20'); 

INSERT INTO RESERVES (data_hora_reserva, estat_reserva, qtat_participants, id_sala, id_equip) VALUES 
('2024-03-01 10:00:00', 'Realitzada', 3, 1, 1),
('2024-03-01 12:00:00', 'Realitzada', 2, 2, 2),
('2024-03-02 17:00:00', 'Cancel·lada', 2, 3, 3), 
('2024-03-02 19:00:00', 'Realitzada', 2, 4, 4),
('2024-03-03 11:30:00', 'Pendent', 1, 5, 5),    
('2024-03-04 18:00:00', 'Realitzada', 3, 6, 1);

INSERT INTO RESULTATS (temps_utilitzat, exit_fracas, puntuacio, qtat_pistes, id_reserva) VALUES 
(55, 1, 900, 1, 1),
(74, 1, 750, 4, 2),
(45, 1, 950, 0, 4),
(95, 0, 200, 5, 6);
SELECT 'OK: Base de dades poblada correctament' AS Status;