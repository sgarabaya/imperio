-- 03.05: Asignacion de Armamento a Planetas

-- Insertar defensas si 'galactic_ruler' tiene el edificio de Defensa Planetaria

--Obtenemos el Id del Jugador (2)
SELECT * FROM Jugadores WHERE Username = 'galactic_ruler';

--Planetas de este jugador: (2 y 7)
SELECT * FROM Planetas WHERE Id_Jugador = 2;

--El edificio 'Defensa Planetaria' tiene Id = 4
SELECT * FROM Edificios WHERE Nombre = 'Defensa Planetaria';

--Entonces:
INSERT INTO ArmamentosPlanetas (Id_Planeta, Id_Armamento, Cantidad)
SELECT
	E.Id_Planeta AS Id_Planeta,
	2			 AS Id_Armamento, --insertamos 100 torretas de defensa
    100          AS Cantidad
FROM EdificiosPlanetas E
WHERE
	E.Id_Planeta IN (2, 7) -- Stellar Haven y Celestial Outpost II
AND Id_Edificio = 4 -- Defensa Planetaria
