ALTER TABLE Planetas
ADD COLUMN Poblacion BIGINT NOT NULL DEFAULT 0;

UPDATE Planetas
    SET Poblacion = 4050000000
WHERE Nombre = 'Nova Prime'
;

UPDATE Planetas
    SET Poblacion = 3000000
WHERE Nombre = 'Stellar Haven'
;

UPDATE Planetas
    SET Poblacion = 9000000000
WHERE Nombre = 'Astral Oasis'
;

UPDATE Planetas
    SET Poblacion = 20000000
WHERE Nombre = 'Celestial Outpost'
;

UPDATE Planetas
    SET Poblacion = 1500000000
WHERE Nombre = 'Galactic Citadel'
;

UPDATE Planetas
    SET Poblacion = 15000000
WHERE Nombre = 'Starlight Sanctuary'
;

UPDATE Planetas
    SET Poblacion = 100000000
WHERE Nombre = 'Celestial Outpost II'
;

UPDATE Planetas
    SET Poblacion = 5000000
WHERE Nombre = 'Nebula Nexus'
;

UPDATE Planetas
    SET Poblacion = 50000000
WHERE Nombre = 'Solar Haven'
;

UPDATE Planetas
    SET Poblacion = 2000000000
WHERE Nombre = 'Asteroid Haven'
;
