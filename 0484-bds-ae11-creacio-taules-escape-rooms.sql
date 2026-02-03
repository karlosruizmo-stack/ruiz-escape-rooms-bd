USE escape_room;

-- =====================
-- SEUS (3)
-- =====================
INSERT INTO SEUS (nom_seu, ciutat_seu, adressa_seu, telef_contacte_seu) VALUES
('Escape BCN Centre', 'Barcelona', 'Carrer Gran Via 120', '931234567'),
('Escape Girona Nord', 'Girona', 'Avinguda Catalunya 45', '972345678'),
('Escape Tarragona Port', 'Tarragona', 'Passeig Marítim 10', '977456789');

-- =====================
-- SALES (2 per seu = 6)
-- =====================
INSERT INTO SALES (nom_sala, tematica, dificultat, durada_max, max_parti, id_seu) VALUES
('El Laboratori Secret', 'Ciència', 'Mitjà', 60, 6, 1),
('Fugida Nuclear', 'Apocalipsi', 'Difícil', 75, 5, 1),

('El Tresor Perdut', 'Aventura', 'Fàcil', 60, 6, 2),
('Presó Medieval', 'Històrica', 'Mitjà', 70, 5, 2),

('Vaixell Fantasma', 'Terror', 'Difícil', 75, 5, 3),
('Missió Submarí', 'Acció', 'Mitjà', 60, 6, 3);

-- =====================
-- PARTICIPANTS (10)
-- =====================
INSERT INTO PARTICIPANTS (nom_parti, cognom_parti, email_parti, data_naixement) VALUES
('Carlos', 'Ruiz', 'carlos.martruiz@mail.com', '1995-03-12'),
('Lem', 'Quilca', 'jordi.ribas@mail.com', '1992-07-21'),
('Joan', 'Manuel', 'laia.serra@mail.com', '1998-11-05'),
('Marc', 'Puig', 'marc.puig@mail.com', '1990-01-30'),
('Clara', 'Roca', 'clara.vidal@mail.com', '1996-06-18'),
('Pol', 'Casals', 'pol.casas@mail.com', '1994-09-09'),
('Mireia', 'Ferrer', 'mireia.ferrer@mail.com', '1999-02-14'),
('David', 'López', 'david.lopez@mail.com', '1989-12-01'),
('Núria', 'Solé', 'nuria.sole@mail.com', '1997-04-25'),
('Oriol', 'Blanch', 'oriol.blanch@mail.com', '1993-08-17');

-- =====================
-- EQUIPS (5)
-- =====================
INSERT INTO EQUIPS (nom_equip, data_creacio, qtat_parti) VALUES
('Els Exploradors', '2023-01-10', 3),
('Team Alpha', '2023-02-05', 2),
('Escape Masters', '2023-03-20', 1),
('Clau Final', '2023-04-15', 2),
('Sense Sortida', '2023-05-01', 2);

-- =====================
-- EQUIPS_PARTICIPANTS (N–N real)
-- =====================
INSERT INTO EQUIPS_PARTICIPANTS (id_equip, id_parti, data_incorp) VALUES
(1, 1, '2023-01-10'),
(1, 2, '2023-01-10'),
(1, 3, '2023-01-12'),

(2, 4, '2023-02-05'),
(2, 5, '2023-02-06'),

(3, 6, '2023-03-20'),

(4, 7, '2023-04-15'),
(4, 8, '2023-04-16'),

(5, 9, '2023-05-01'),
(5, 10,'2023-05-02');

-- =====================
-- RESERVES (6)
-- =====================
INSERT INTO RESERVES (data_hora_reserva, estat_reserva, qtat_participants, id_sala, id_equip) VALUES
('2024-01-10 17:00:00', 'Realitzada', 3, 1, 1),
('2024-01-15 18:30:00', 'Realitzada', 2, 3, 2),
('2024-02-01 16:00:00', 'Cancel·lada', 1, 2, 3),
('2024-02-10 19:00:00', 'Pendent', 2, 4, 4),
('2024-02-20 17:30:00', 'Realitzada', 2, 5, 5),
('2024-03-05 18:00:00', 'Pendent', 3, 6, 1);

-- =====================
-- RESULTATS (només per reserves realitzades)
-- =====================
INSERT INTO RESULTATS (temps_utilitzat, exit_fracas, puntuacio, qtat_pistes, id_reserva) VALUES
(55, TRUE, 850, 1, 1),
(60, FALSE, 400, 3, 2),
(70, TRUE, 780, 2, 5);
