USE escape_room;

-- Inserció en SEUS
INSERT INTO SEUS (nom_seu, ciutat_seu, adressa_seu, telef_contacte_seu) VALUES
('Enigma Central', 'Barcelona', 'Carrer de Mallorca, 123', '932112233'),
('Mystery Lab', 'Girona', 'Carrer dels Ciutadans, 45', '972334455'),
('The Bunker', 'Barcelona', 'Avinguda Diagonal, 500', '934556677');

-- Inserció en PARTICIPANTS
INSERT INTO PARTICIPANTS (nom_parti, cognom_parti, email_parti, data_naixement) VALUES
('Marc', 'Garcia', 'mgarcia@email.com', '1995-05-15'),
('Laia', 'Sanz', 'lsanz@email.com', '1998-02-20'),
('Joan', 'Roura', 'jroura@email.com', '1990-11-02'),
('Marta', 'Vila', 'mvila@email.com', '2001-07-30'),
('Oriol', 'Pujol', 'opujol@email.com', '1988-12-12');

-- Inserció en EQUIPS
INSERT INTO EQUIPS (nom_equip, data_creacio, qtat_parti) VALUES
('The Masterminds', '2023-01-10', 3),
('Escapistes Pro', '2023-05-22', 2),
('Cerebres Atòmics', '2024-01-05', 0);



-- Inserció en SALES (Referencia a SEUS)
INSERT INTO SALES (nom_sala, tematica, dificultat, durada_max, max_parti, id_seu) VALUES
('La Presó de Vidre', 'Policial', 'Difícil', 60, 6, 1),
('El Tresor Pirata', 'Aventura', 'Fàcil', 45, 8, 1),
('Laboratori Z', 'Terror', 'Mitjà', 75, 4, 2),
('Operació Bunker', 'Bèl·lica', 'Difícil', 90, 5, 3);


-- Relació N-N: EQUIPS_PARTICIPANTS 
INSERT INTO EQUIPS_PARTICIPANTS (id_equip, id_parti, data_incorp)
SELECT e.id_equip, p.id_parti, '2023-06-01'
FROM EQUIPS e, PARTICIPANTS p
WHERE e.nom_equip = 'The Masterminds' AND p.nom_parti IN ('Marc', 'Laia', 'Joan');

INSERT INTO EQUIPS_PARTICIPANTS (id_equip, id_parti, data_incorp)
SELECT e.id_equip, p.id_parti, '2023-06-15'
FROM EQUIPS e, PARTICIPANTS p
WHERE e.nom_equip = 'Escapistes Pro' AND p.nom_parti IN ('Marta', 'Oriol');

-- Inserció en RESERVES
INSERT INTO RESERVES (data_hora, estat_reserva, qtat_participants, id_sala, id_equip) VALUES
('2024-02-10 18:00:00', 'Realitzada', 3, 1, 1),
('2024-02-11 10:30:00', 'Realitzada', 2, 3, 2),
('2024-02-12 20:00:00', 'Cancel·lada', 4, 2, 1),
('2024-02-15 17:00:00', 'Pendent', 3, 4, 1);

-- Inserció en RESULTATS 

INSERT INTO RESULTATS (temps_utilitzat, exit_fracas, puntuacio, qtat_pistes, id_reserva)
SELECT 52, 1, 850, 2, id_reserva 
FROM RESERVES 
WHERE data_hora = '2024-02-10 18:00:00' AND estat_reserva = 'Realitzada';

INSERT INTO RESULTATS (temps_utilitzat, exit_fracas, puntuacio, qtat_pistes, id_reserva)
SELECT 74, 1, 600, 5, id_reserva 
FROM RESERVES 
WHERE data_hora = '2024-02-11 10:30:00' AND estat_reserva = 'Realitzada';