-- 03.01: Asignacion de Planetas a Jugadores

-- 'Nova Prime' -> 'astro_gamer'
UPDATE Planetas SET Id_Jugador = 1 WHERE Id = 1;

-- 'Astral Oasis' -> 'astro_gamer'
UPDATE Planetas SET Id_Jugador = 1 WHERE Id = 3;

-- 'Starlight Sanctuary' -> 'astro_gamer'
UPDATE Planetas SET Id_Jugador = 1 WHERE Id = 6;

-- 'Stellar Haven' -> 'galactic_ruler'
UPDATE Planetas SET Id_Jugador = 2 WHERE Id = 2;

-- 'Celestial Outpost II' -> 'galactic_ruler'
UPDATE Planetas SET Id_Jugador = 2 WHERE Id = 7;

-- 'Nebula Nexus' -> 'cosmic_explorer'
UPDATE Planetas SET Id_Jugador = 3 WHERE Id = 8;

-- 'Celestial Outpost' -> 'space_commander'
UPDATE Planetas SET Id_Jugador = 4 WHERE Id = 4;

-- 'Asteroid Haven' -> 'space_commander'
UPDATE Planetas SET Id_Jugador = 4 WHERE Id = 10;

-- 'Galactic Citadel' -> 'stargazer'
UPDATE Planetas SET Id_Jugador = 5 WHERE Id = 5;

-- 'Solar Haven' -> 'space_pioneer'
UPDATE Planetas SET Id_Jugador = 6 WHERE Id = 9;
