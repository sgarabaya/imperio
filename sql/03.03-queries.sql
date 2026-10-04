-- 03.03: Asignacion de Edificios a Planetas

-- Nova Prime(1) -> Centro de Investigacion(1)
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (1, 1);
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 500
WHERE Id_Planeta = 1 AND Id_Recurso = 1;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 1 AND Id_Recurso = 2;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 1 AND Id_Recurso = 3;

-- Nova Prime(1) -> Puerto Espacial(6)
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (1, 6);
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 1 AND Id_Recurso = 1;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 500
WHERE Id_Planeta = 1 AND Id_Recurso = 2;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 1 AND Id_Recurso = 3;

-- Stellar Haven(2) -> Hangar de Naves(2)
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (2, 2);
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 2 AND Id_Recurso = 1;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 400
WHERE Id_Planeta = 2 AND Id_Recurso = 2;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 2 AND Id_Recurso = 3;

-- Stellar Haven(2) -> Defensa Planetaria(5)
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (2, 5);
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 400
WHERE Id_Planeta = 2 AND Id_Recurso = 1;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 2 AND Id_Recurso = 2;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 2 AND Id_Recurso = 3;

-- Stellar Haven(2) -> Sintetizador de Deuterio(7)
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (2, 7);
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 250
WHERE Id_Planeta = 2 AND Id_Recurso = 1;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 400
WHERE Id_Planeta = 2 AND Id_Recurso = 2;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 150
WHERE Id_Planeta = 2 AND Id_Recurso = 3;

-- Astral Oasis(3) -> Hangar de Naves(2)
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (3, 2);
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 3 AND Id_Recurso = 1;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 400
WHERE Id_Planeta = 3 AND Id_Recurso = 2;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 3 AND Id_Recurso = 3;

-- Astral Oasis(3) -> Planta de Energia Solar(3)
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (3, 3);
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 3 AND Id_Recurso = 1;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 3 AND Id_Recurso = 2;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 500
WHERE Id_Planeta = 3 AND Id_Recurso = 3;

-- Celestial Outpost(4) -> Planta de Energia Solar(3)
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (4, 3);
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 4 AND Id_Recurso = 1;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 4 AND Id_Recurso = 2;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 500
WHERE Id_Planeta = 4 AND Id_Recurso = 3;

-- Celestial Outpost(4) -> Defensa Planetaria(4)
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (4, 4);
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 400
WHERE Id_Planeta = 4 AND Id_Recurso = 1;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 4 AND Id_Recurso = 2;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 4 AND Id_Recurso = 3;

-- Galactic Citadel(5) -> Centro de Investigacion(1)
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (5, 1);
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 500
WHERE Id_Planeta = 5 AND Id_Recurso = 1;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 5 AND Id_Recurso = 2;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 5 AND Id_Recurso = 3;

-- Galactic Citadel(5) -> Hangar de Naves(2)
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (5, 2);
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 5 AND Id_Recurso = 1;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 400
WHERE Id_Planeta = 5 AND Id_Recurso = 2;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 5 AND Id_Recurso = 3;

-- Starlight Sanctuary(6) -> Centro de Investigacion(1)
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (6, 1);
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 500
WHERE Id_Planeta = 6 AND Id_Recurso = 1;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 6 AND Id_Recurso = 2;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 6 AND Id_Recurso = 3;

-- Starlight Sanctuary(6) -> Puerto Espacial(6)
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (6, 6);
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 6 AND Id_Recurso = 1;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 500
WHERE Id_Planeta = 6 AND Id_Recurso = 2;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 6 AND Id_Recurso = 3;

-- Celestial Outpost II(7) -> Hangar de Naves(2)
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (7, 2);
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 7 AND Id_Recurso = 1;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 400
WHERE Id_Planeta = 7 AND Id_Recurso = 2;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 7 AND Id_Recurso = 3;

-- Celestial Outpost II(7) -> Planta de Energia Solar(3)
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (7, 3);
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 7 AND Id_Recurso = 1;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 7 AND Id_Recurso = 2;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 500
WHERE Id_Planeta = 7 AND Id_Recurso = 3;

-- Nebula Nexus(8) -> Centro de Investigacion(1)
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (8, 1);
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 500
WHERE Id_Planeta = 8 AND Id_Recurso = 1;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 8 AND Id_Recurso = 2;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 8 AND Id_Recurso = 3;

-- Nebula Nexus(8) -> Sintetizador de Deuterio(7)
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (8, 7);
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 250
WHERE Id_Planeta = 8 AND Id_Recurso = 1;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 400
WHERE Id_Planeta = 8 AND Id_Recurso = 2;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 150
WHERE Id_Planeta = 8 AND Id_Recurso = 3;

-- Solar Haven(9) -> Hangar de Naves(2)
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (9, 2);
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 9 AND Id_Recurso = 1;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 400
WHERE Id_Planeta = 9 AND Id_Recurso = 2;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 9 AND Id_Recurso = 3;

-- Solar Haven(9) -> Defensa Planetaria(5)
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (9, 5);
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 400
WHERE Id_Planeta = 9 AND Id_Recurso = 1;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 9 AND Id_Recurso = 2;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 9 AND Id_Recurso = 3;

-- Solar Haven(9) -> Puerto Espacial(6)
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (9, 6);
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 9 AND Id_Recurso = 1;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 500
WHERE Id_Planeta = 9 AND Id_Recurso = 2;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 9 AND Id_Recurso = 3;

-- Asteroid Haven(10) -> Centro de Investigacion(1)
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (10, 1);
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 500
WHERE Id_Planeta = 10 AND Id_Recurso = 1;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 10 AND Id_Recurso = 2;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 10 AND Id_Recurso = 3;

-- Asteroid Haven(10) -> Planta de Energia Solar(3)
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (10, 3);
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 10 AND Id_Recurso = 1;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 10 AND Id_Recurso = 2;
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 500
WHERE Id_Planeta = 10 AND Id_Recurso = 3;
