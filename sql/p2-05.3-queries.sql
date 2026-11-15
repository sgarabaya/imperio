-- galactic_ruler crea 5 Sondas Espaciales
-- En el planeta Stellar Haven

-- Stellar Haven -> 5x Sonda Espacial
INSERT INTO NavesPlanetas (Id_Planeta, Id_Nave, Cantidad)
VALUES (
    (
        SELECT Id FROM Planetas
        WHERE Nombre = 'Stellar Haven'
    ),
    (SELECT Id FROM Naves WHERE Nombre = 'Sonda Espacial'),
    5
);

-- Actualizamos los recursos del planeta:
UPDATE RecursosPlanetas
SET Cantidad = Cantidad - (
    5 * (SELECT Costo_R1 FROM Naves WHERE Nombre = 'Sonda Espacial')
)
WHERE Id_Planeta = (
    SELECT Id FROM Planetas
    WHERE Nombre = 'Stellar Haven'
)
AND Id_Recurso = 1;

UPDATE RecursosPlanetas
SET Cantidad = Cantidad - (
    5 * (SELECT Costo_R2 FROM Naves WHERE Nombre = 'Sonda Espacial')
)
WHERE Id_Planeta = (
    SELECT Id FROM Planetas
    WHERE Nombre = 'Stellar Haven'
)
AND Id_Recurso = 2;

UPDATE RecursosPlanetas
SET Cantidad = Cantidad - (
    5 * (SELECT Costo_R3 FROM Naves WHERE Nombre = 'Sonda Espacial')
)
WHERE Id_Planeta = (
    SELECT Id FROM Planetas
    WHERE Nombre = 'Stellar Haven'
)
AND Id_Recurso = 3;

-- Reducimos la cantidad de Sondas Espaciales de Stellar Haven por 5
UPDATE NavesPlanetas
SET Cantidad = Cantidad - 5
WHERE Id_Planeta = (
    SELECT Id FROM Planetas
    WHERE Nombre = 'Stellar Haven'
)
AND Id_Nave = (SELECT Id FROM Naves WHERE Nombre = 'Sonda Espacial')
;

-- Creamos la Flota
INSERT INTO Flotas (Id_Planeta, SondaEspacial, Estado)
VALUES (
    (SELECT Id FROM Planetas
    WHERE Nombre = 'Stellar Haven'),
    5,
    'Disponible'
) -- esto resulta en Flota con ID = 2
;

-- Creamos la Exploracion
INSERT INTO Exploraciones (
    Id_Jugador, Id_Flota,
    CoordenadaXInicial, CoordenadaYInicial,
    CoordenadaXFinal, CoordenadaYFinal,
    FechaExploracionInicio, FechaExploracionFin,
    Estado
) VALUES (
    (SELECT Id FROM Jugadores WHERE Username = 'galactic_ruler'),
    2, -- Id_Flota => 2
    (SELECT CoordenadaX FROM Planetas WHERE Nombre = 'Stellar Haven'),
    (SELECT CoordenadaY FROM Planetas WHERE Nombre = 'Stellar Haven'),
    14, 24, -- Coordenadas finales X,Y
    NOW(), NOW() + INTERVAL '15 hours', -- fecha inicio, fecha fin
    'En Tránsito'   
)
;

-- Marcamos la Flota como `no disponible`
UPDATE Flotas
SET Estado = 'No Disponible'
WHERE Id = 2 -- Id_Flota => 2
;

-- Crea una nueva Flota con:
-- - 20x Cazas Estelares
-- - 5x Nave de Colonizacion
-- - 10x Transportador de Recursos
INSERT INTO Flotas (Id_Planeta, CazaEstelar, NaveColonizacion, TransportadorRecursos, Estado)
VALUES (
    (SELECT Id FROM Planetas
    WHERE Nombre = 'Stellar Haven'),
    20,
    5,
    10,
    'Disponible'
) -- esto resulta en Flota con ID = 3
;

-- Actualizamos las naves en Stellar Haven
UPDATE NavesPlanetas
    SET Cantidad = Cantidad - 20
WHERE Id_Planeta = (SELECT Id FROM Planetas WHERE Nombre = 'Stellar Haven')
AND Id_Nave = (SELECT Id FROM Naves WHERE Nombre = 'Caza Estelar')
;

UPDATE NavesPlanetas
    SET Cantidad = Cantidad - 5
WHERE Id_Planeta = (SELECT Id FROM Planetas WHERE Nombre = 'Stellar Haven')
AND Id_Nave = (SELECT Id FROM Naves WHERE Nombre = 'Nave de Colonización')
;

UPDATE NavesPlanetas
    SET Cantidad = Cantidad - 10
WHERE Id_Planeta = (SELECT Id FROM Planetas WHERE Nombre = 'Stellar Haven')
AND Id_Nave = (SELECT Id FROM Naves WHERE Nombre = 'Transportador de Recursos')
;
