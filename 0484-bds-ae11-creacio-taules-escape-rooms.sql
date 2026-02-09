USE escape_room;
 
-- 1. SEUS
INSERT IGNORE INTO SEUS (nom_seu, ciutat_seu, adressa_seu, telef_contacte_seu) VALUES
('Infinity Games', 'Tarragona', 'Rambla Nova, 45', '977112233'),
('Cyber Escape', 'Lleida', 'Carrer Major, 12', '973445566'),
('Deep Sea Rooms', 'Mataró', 'Passeig Marítim, 88', '937778899');
 
-- 2. SALES (2 per seu on ha estat possible)
INSERT IGNORE INTO SALES (nom_sala, tematica, dificultat, durada_max, max_parti, id_seu) VALUES
('L’Enigma de Tesla', 'Ciència', 'Mitjà', 60, 5, (SELECT id_seu FROM SEUS WHERE nom_seu = 'Infinity Games')),
('Maldició Egípcia', 'Història', 'Difícil', 75, 6, (SELECT id_seu FROM SEUS WHERE nom_seu = 'Infinity Games')),
('Estació Espacial', 'Futurista', 'Difícil', 90, 4, (SELECT id_seu FROM SEUS WHERE nom_seu = 'Cyber Escape')),
('El Vaixell Enfonsat', 'Aventura', 'Fàcil', 45, 8, (SELECT id_seu FROM SEUS WHERE nom_seu = 'Deep Sea Rooms'));
 
-- 3. EQUIPS
INSERT IGNORE INTO EQUIPS (nom_equip, data_creacio, qtat_parti) VALUES
('Codificadors Bojos', '2024-05-12', 3),
('Llamps i Trons', '2024-08-19', 2),
('Els Infiltrats', '2025-01-10', 0);
 
-- 4. PARTICIPANTS
INSERT IGNORE INTO PARTICIPANTS (nom_parti, cognom_parti, email_parti, data_naixement) VALUES
('Pau', 'Serrano', 'pserrano@email.com', '1992-03-10'),
('Anna', 'López', 'alopez@email.com', '1999-11-25'),
('Carles', 'Vidal', 'cvidal@email.com', '1985-06-14'),
('Sònia', 'Marín', 'smarin@email.com', '2003-01-05'),
('Hugo', 'Torres', 'htorres@email.com', '1994-09-22');
 
-- 5. EQUIPS_PARTICIPANTS (Relacions basades en els nous noms)
INSERT IGNORE INTO EQUIPS_PARTICIPANTS (id_equip, id_parti, data_incorp) VALUES
((SELECT id_equip FROM EQUIPS WHERE nom_equip='Codificadors Bojos'), (SELECT id_parti FROM PARTICIPANTS WHERE email_parti='pserrano@email.com'), '2024-05-15'),
((SELECT id_equip FROM EQUIPS WHERE nom_equip='Codificadors Bojos'), (SELECT id_parti FROM PARTICIPANTS WHERE email_parti='alopez@email.com'), '2024-05-15'),
((SELECT id_equip FROM EQUIPS WHERE nom_equip='Codificadors Bojos'), (SELECT id_parti FROM PARTICIPANTS WHERE email_parti='cvidal@email.com'), '2024-05-15'),
((SELECT id_equip FROM EQUIPS WHERE nom_equip='Llamps i Trons'), (SELECT id_parti FROM PARTICIPANTS WHERE email_parti='smarin@email.com'), '2024-08-20'),
((SELECT id_equip FROM EQUIPS WHERE nom_equip='Llamps i Trons'), (SELECT id_parti FROM PARTICIPANTS WHERE email_parti='htorres@email.com'), '2024-08-20');
 
-- 6. RESERVES
INSERT IGNORE INTO RESERVES (data_hora, estat_reserva, qtat_participants, id_sala, id_equip) VALUES
('2025-02-10 19:30:00', 'Realitzada', 3, (SELECT id_sala FROM SALES WHERE nom_sala='L’Enigma de Tesla'), (SELECT id_equip FROM EQUIPS WHERE nom_equip='Codificadors Bojos')),
('2025-02-11 11:00:00', 'Realitzada', 2, (SELECT id_sala FROM SALES WHERE nom_sala='Estació Espacial'), (SELECT id_equip FROM EQUIPS WHERE nom_equip='Llamps i Trons')),
('2025-02-12 18:00:00', 'Cancel·lada', 4, (SELECT id_sala FROM SALES WHERE nom_sala='Maldició Egípcia'), (SELECT id_equip FROM EQUIPS WHERE nom_equip='Codificadors Bojos')),
('2025-02-15 21:00:00', 'Pendent', 3, (SELECT id_sala FROM SALES WHERE nom_sala='El Vaixell Enfonsat'), (SELECT id_equip FROM EQUIPS WHERE nom_equip='Codificadors Bojos'));
 
-- 7. RESULTATS
INSERT IGNORE INTO RESULTATS (temps_utilitzat, exit_fracas, puntuacio, qtat_pistes, id_reserva) VALUES
(48, 1, 920, 1, (SELECT id_reserva FROM RESERVES WHERE data_hora='2025-02-10 19:30:00' AND id_equip=(SELECT id_equip FROM EQUIPS WHERE nom_equip='Codificadors Bojos'))),
(88, 1, 550, 6, (SELECT id_reserva FROM RESERVES WHERE data_hora='2025-02-11 11:00:00' AND id_equip=(SELECT id_equip FROM EQUIPS WHERE nom_equip='Llamps i Trons')));