-- insercion de datos

--jugadores
INSERT INTO Jugadores (Username, Email, Password, Fecha_Registro)
VALUES ('astro_gamer', 'astro_gamer@email.com', 'estelar123', '2024-02-18');

INSERT INTO Jugadores (Username, Email, Password, Fecha_Registro)
VALUES ('galactic_ruler', 'ruler@galaxy.com', 'ruler567', '2024-02-18');

INSERT INTO Jugadores (Username, Email, Password, Fecha_Registro)
VALUES ('cosmic_explorer', 'explorer@universe.com', 'explore321', '2024-02-18');

INSERT INTO Jugadores (Username, Email, Password, Fecha_Registro)
VALUES ('space_commander', 'commander@space.com', 'command789', '2024-02-18');

INSERT INTO Jugadores (Username, Email, Password, Fecha_Registro)
VALUES ('stargazer', 'stargazer@gmail.com', 'star1234', '2024-02-18');

INSERT INTO Jugadores (Username, Email, Password, Fecha_Registro)
VALUES ('space_pioneer', 'pioneer@email.com', 'pioneer123', '2024-02-18');

--galaxias
INSERT INTO Galaxias (Nombre, Sector)
VALUES ('Milky Way', 'Alpha');

INSERT INTO Galaxias (Nombre, Sector)
VALUES ('Andromeda', 'Beta');

INSERT INTO Galaxias (Nombre, Sector)
VALUES ('Pegasus', 'Gamma');

INSERT INTO Galaxias (Nombre, Sector)
VALUES ('Orion', 'Delta');

INSERT INTO Galaxias (Nombre, Sector)
VALUES ('Centaurus', 'Epsilon');

--planetas
INSERT INTO Planetas (Nombre, CoordenadaX, CoordenadaY, Superficie, Id_Galaxia)
VALUES ('Nova Prime', 10, 20, 108728, 1);

INSERT INTO Planetas (Nombre, CoordenadaX, CoordenadaY, Superficie, Id_Galaxia)
VALUES ('Stellar Haven', 15, 25, 4884, 2);

INSERT INTO Planetas (Nombre, CoordenadaX, CoordenadaY, Superficie, Id_Galaxia)
VALUES ('Astral Oasis', 8, 30, 142984, 1);

INSERT INTO Planetas (Nombre, CoordenadaX, CoordenadaY, Superficie, Id_Galaxia)
VALUES ('Celestial Outpost', 12, 18, 9452, 3);

INSERT INTO Planetas (Nombre, CoordenadaX, CoordenadaY, Superficie, Id_Galaxia)
VALUES ('Galactic Citadel', 25, 15, 51118, 4);

INSERT INTO Planetas (Nombre, CoordenadaX, CoordenadaY, Superficie, Id_Galaxia)
VALUES ('Starlight Sanctuary', 5, 12, 7534, 1);

INSERT INTO Planetas (Nombre, CoordenadaX, CoordenadaY, Superficie, Id_Galaxia)
VALUES ('Celestial Outpost II', 18, 22, 49532, 2);

INSERT INTO Planetas (Nombre, CoordenadaX, CoordenadaY, Superficie, Id_Galaxia)
VALUES ('Nebula Nexus', 30, 8, 6794, 3);

INSERT INTO Planetas (Nombre, CoordenadaX, CoordenadaY, Superficie, Id_Galaxia)
VALUES ('Solar Haven', 10, 30, 12756, 1);

INSERT INTO Planetas (Nombre, CoordenadaX, CoordenadaY, Superficie, Id_Galaxia)
VALUES ('Asteroid Haven', 22, 17, 12104, 4);

--lunas
INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('Luminara', 1524, 1);

INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('Nightshade', 1289, 2);

INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('Galaxysong', 1811, 3);

INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('StellarDust', 2037, 4);

INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('MoonlightGrove', 1699, 5);

INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('GlimmeringOrbit', 1387, 1);

INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('EclipseHarbor', 1114, 2);

INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('MoonstoneMeadow', 1532, 3);

INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('StellarRefuge', 1844, 4);

INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('CosmicSerenity', 1656, 5);

INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('Luminara II', 1457, 6);

INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('Nightshade II', 1228, 7);

INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('Galaxysong II', 1791, 8);

INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('StellarDust II', 2033, 9);

INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('MoonlightGrove II', 1578, 10);

--naves
INSERT INTO Naves (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Caza Estelar', 100, 50, 30);

INSERT INTO Naves (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Destructor Interplanetario', 200, 100, 150);

INSERT INTO Naves (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Nave de Colonización', 150, 80, 100);

INSERT INTO Naves (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Transportador de Recursos', 80, 120, 50);

INSERT INTO Naves (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Nave de Exploración', 120, 70, 90);

--recursos
INSERT INTO Recursos (Nombre) VALUES ('Metal');
INSERT INTO Recursos (Nombre) VALUES ('Deuterio');
INSERT INTO Recursos (Nombre) VALUES ('Energía');

--armamento
INSERT INTO Armamentos (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Cañón de Plasma', 150, 100, 80);

INSERT INTO Armamentos (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Torreta de Defensa', 100, 80, 120);

INSERT INTO Armamentos (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Láser de Precisión', 120, 150, 100);

INSERT INTO Armamentos (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Bomba de Neutrinos', 80, 120, 150);

INSERT INTO Armamentos (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Escudo de Energía', 100, 150, 80);

--edificios
INSERT INTO Edificios (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Centro de Investigación', 500, 200, 300);

INSERT INTO Edificios (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Hangar de Naves', 300, 400, 200);

INSERT INTO Edificios (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Planta de Energía Solar', 200, 300, 500);

INSERT INTO Edificios (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Defensa Planetaria', 400, 200, 300);

INSERT INTO Edificios (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Puerto Espacial', 300, 500, 200);

INSERT INTO Edificios (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Sintetizador de Deuterio', 250, 400, 150);

INSERT INTO Edificios (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Almacén de Metales', 150, 250, 100);
