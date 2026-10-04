---
lang: es-ES
mainfont: "JetBrainsMono-Regular"
geometry: a4paper
header-includes:
  - \usepackage[table]{xcolor}
  - \rowcolors{2}{gray!10}{white}
---

\newpage

# Parcial 1 - Bases de Datos II

Santiago Garabaya, [26-2][ACT3AV] Base de Datos II

## Parte 1: DER y Modelo Lógico

### Diagrama Entidad/Relación (DER)

A partir de la consigna podemos determinar que el DER es:

![DER Imperio](../DER.png)

\newpage

### Modelo Lógico

A partir del DER, podemos refinar el modelo, creando tablas pivote donde sea necesario.

![Modelo Logico Imperio](../ModeloLogico.png)

\newpage

## Parte 2

### Parte 2.1: Creación de la Base de Datos

Vamos a implementar el trabajo usando Postgres.

Podemos ejecutar:

```sql
CREATE DATABASE Imperio;
```

O crearla directamente en la UI (pgAdmin).

## Parte 2.2: Creación de las Tablas

### Jugadores

```sql
CREATE TABLE Jugadores (
	Id SERIAL PRIMARY KEY,
	Username VARCHAR(64) NOT NULL UNIQUE,
	Email VARCHAR(320) NOT NULL UNIQUE,
	Password VARCHAR(256) NOT NULL,
	Fecha_Registro DATE NOT NULL
);
```

![](images/01-tablas-001.png)

\newpage

### Galaxias

```sql
CREATE TABLE Galaxias (
	Id SERIAL PRIMARY KEY,
	Nombre VARCHAR(64) NOT NULL UNIQUE,
	Sector VARCHAR(64) NOT NULL
);
```

![](images/01-tablas-002.png)

\newpage

### Planetas

```sql
CREATE TABLE Planetas (
	Id SERIAL PRIMARY KEY,
	Nombre VARCHAR(64) NOT NULL UNIQUE,
	CoordenadaX INT NOT NULL,
	CoordenadaY INT NOT NULL,
	Superficie INT NOT NULL,
	Id_Galaxia INT NOT NULL REFERENCES Galaxias(Id),
	Id_Jugador INT REFERENCES Jugadores(Id),
    UNIQUE (CoordenadaX, CoordenadaY)
);
```

![](images/01-tablas-003.png)

\newpage

### Lunas

```sql
CREATE TABLE Lunas (
	Id SERIAL PRIMARY KEY,
	Nombre VARCHAR(64) NOT NULL UNIQUE,
	Superficie INT NOT NULL,
	Id_Planeta INT NOT NULL REFERENCES Planetas(Id)
);
```

![](images/01-tablas-004.png)

\newpage

### Naves

```sql
CREATE TABLE Naves (
	Id SERIAL PRIMARY KEY,
	Nombre VARCHAR(64) NOT NULL UNIQUE,
	Costo_R1 INT NOT NULL,
	Costo_R2 INT NOT NULL,
	Costo_R3 INT NOT NULL
);
```

![](images/01-tablas-005.png)

\newpage

### NavesPlanetas (tabla pivote)

```sql
CREATE TABLE NavesPlanetas (
	Id_Planeta INT NOT NULL REFERENCES Planetas(Id),
	Id_Nave INT NOT NULL REFERENCES Naves(Id),
	Cantidad INT DEFAULT 0,
	PRIMARY KEY(Id_Planeta, Id_Nave)
);
```

![](images/01-tablas-006.png)

\newpage

### Recursos

```sql
CREATE TABLE Recursos (
	Id SERIAL PRIMARY KEY,
	Nombre VARCHAR(64) NOT NULL UNIQUE
);
```

![](images/01-tablas-007.png)

\newpage

### RecursosPlanetas (tabla pivote)

```sql
CREATE TABLE RecursosPlanetas (
    Id_Planeta INT NOT NULL REFERENCES Planetas(Id),
    Id_Recurso INT NOT NULL REFERENCES Recursos(Id),
    Cantidad INT DEFAULT 0,
    PRIMARY KEY (Id_Planeta, Id_Recurso)
);
```

![](images/01-tablas-008.png)

\newpage

### Armamentos

```sql
CREATE TABLE Armamentos (
	Id SERIAL PRIMARY KEY,
	Nombre VARCHAR(64) NOT NULL UNIQUE,
	Costo_R1 INT NOT NULL,
	Costo_R2 INT NOT NULL,
	Costo_R3 INT NOT NULL
);
```

![](images/01-tablas-009.png)

\newpage

### ArmamentosPlanetas (tabla pivote)

```sql
CREATE TABLE ArmamentosPlanetas (
    Id_Planeta INT NOT NULL REFERENCES Planetas(Id),
    Id_Armamento INT NOT NULL REFERENCES Armamentos(Id),
    Cantidad INT DEFAULT 0,
    PRIMARY KEY(Id_Planeta, Id_Armamento)
);
```

![](images/01-tablas-010.png)

\newpage

### Edificios

```sql
CREATE TABLE Edificios (
	Id SERIAL PRIMARY KEY,
	Nombre VARCHAR(64) NOT NULL UNIQUE,
	Costo_R1 INT NOT NULL,
	Costo_R2 INT NOT NULL,
	Costo_R3 INT NOT NULL
);
```

![](images/01-tablas-011.png)

\newpage

### EdificiosPlanetas (tabla pivote)

```sql
CREATE TABLE EdificiosPlanetas (
    Id_Planeta INT NOT NULL REFERENCES Planetas(Id),
    Id_Edificio INT NOT NULL REFERENCES Edificios(Id),
    PRIMARY KEY(Id_Planeta, Id_Edificio)
);
```

![](images/01-tablas-012.png)

\newpage

## Parte 2.2: Insercion de datos

### Jugadores

Las queries de insercion seran con este formato:

```sql
INSERT INTO Jugadores
    (Username, Email, Password, Fecha_Registro)
VALUES
    (?, ?, ?, ?);
```

### Datos Jugadores:

| Username        | Email                 | Password   | Fecha_Registro |
| --------------- | --------------------- | ---------- | -------------- |
| astro_gamer     | astro_gamer@email.com | estelar123 | 2024-02-18     |
| galactic_ruler  | ruler@galaxy.com      | ruler567   | 2024-02-18     |
| cosmic_explorer | explorer@universe.com | explore321 | 2024-02-18     |
| space_commander | commander@space.com   | command789 | 2024-02-18     |
| stargazer       | stargazer@gmail.com   | star1234   | 2024-02-18     |
| space_pioneer   | pioneer@email.com     | pioneer123 | 2024-02-18     |

\newpage

```sql
INSERT INTO Jugadores (Username, Email, Password, Fecha_Registro)
VALUES ('astro_gamer', 'astro_gamer@email.com', 'estelar123', '2024-02-18');
```

![](images/02-datos-001.png)

\newpage

```sql
INSERT INTO Jugadores (Username, Email, Password, Fecha_Registro)
VALUES ('galactic_ruler', 'ruler@galaxy.com', 'ruler567', '2024-02-18');
```

![](images/02-datos-002.png)

\newpage

```sql
INSERT INTO Jugadores (Username, Email, Password, Fecha_Registro)
VALUES ('cosmic_explorer', 'explorer@universe.com', 'explore321', '2024-02-18');
```

![](images/02-datos-003.png)

\newpage

```sql
INSERT INTO Jugadores (Username, Email, Password, Fecha_Registro)
VALUES ('space_commander', 'commander@space.com', 'command789', '2024-02-18');
```

![](images/02-datos-004.png)

\newpage

```sql
INSERT INTO Jugadores (Username, Email, Password, Fecha_Registro)
VALUES ('stargazer', 'stargazer@gmail.com', 'star1234', '2024-02-18');
```

![](images/02-datos-005.png)

\newpage

```sql
INSERT INTO Jugadores (Username, Email, Password, Fecha_Registro)
VALUES ('space_pioneer', 'pioneer@email.com', 'pioneer123', '2024-02-18');
```

![](images/02-datos-006.png)

\newpage

### Galaxias

Las queries de insercion seran con este formato:

```sql
INSERT INTO Galaxias (Nombre, Sector)
VALUES (?, ?);
```

### Datos Galaxias:

| Nombre    | Sector  |
| --------- | ------- |
| Milky Way | Alpha   |
| Andromeda | Beta    |
| Pegasus   | Gamma   |
| Orion     | Delta   |
| Centaurus | Epsilon |

\newpage

```sql
INSERT INTO Galaxias (Nombre, Sector)
VALUES ('Milky Way', 'Alpha');
```

![](images/02-datos-007.png)

\newpage

```sql
INSERT INTO Galaxias (Nombre, Sector)
VALUES ('Andromeda', 'Beta');
```

![](images/02-datos-008.png)

\newpage

```sql
INSERT INTO Galaxias (Nombre, Sector)
VALUES ('Pegasus', 'Gamma');
```

![](images/02-datos-009.png)

\newpage

```sql
INSERT INTO Galaxias (Nombre, Sector)
VALUES ('Orion', 'Delta');
```

![](images/02-datos-010.png)

\newpage

```sql
INSERT INTO Galaxias (Nombre, Sector)
VALUES ('Centaurus', 'Epsilon');
```

![](images/02-datos-011.png)

\newpage

### Planetas

Las queries de insercion seran con este formato:

```sql
INSERT INTO Planetas
    (Nombre, CoordenadaX, CoordenadaY, Superficie, Id_Galaxia)
VALUES (?, ?, ?, ?, ?);
```

### Datos Galaxias:

| Nombre               | CoordenadaX | CoordenadaY | Superficie | ID_Galaxia |
| -------------------- | ----------- | ----------- | ---------- | ---------- |
| Nova Prime           | 10          | 20          | 108728     | 1          |
| Stellar Haven        | 15          | 25          | 4884       | 2          |
| Astral Oasis         | 8           | 30          | 142984     | 1          |
| Celestial Outpost    | 12          | 18          | 9452       | 3          |
| Galactic Citadel     | 25          | 15          | 51118      | 4          |
| Starlight Sanctuary  | 5           | 12          | 7534       | 1          |
| Celestial Outpost II | 18          | 22          | 49532      | 2          |
| Nebula Nexus         | 30          | 8           | 6794       | 3          |
| Solar Haven          | 10          | 30          | 12756      | 1          |
| Asteroid Haven       | 22          | 17          | 12104      | 4          |

\newpage

```sql
INSERT INTO Planetas (Nombre, CoordenadaX, CoordenadaY, Superficie, Id_Galaxia)
VALUES ('Nova Prime', 10, 20, 108728, 1);
```

![](images/02-datos-012.png)

\newpage

```sql
INSERT INTO Planetas (Nombre, CoordenadaX, CoordenadaY, Superficie, Id_Galaxia)
VALUES ('Stellar Haven', 15, 25, 4884, 2);
```

![](images/02-datos-013.png)

\newpage

```sql
INSERT INTO Planetas (Nombre, CoordenadaX, CoordenadaY, Superficie, Id_Galaxia)
VALUES ('Astral Oasis', 8, 30, 142984, 1);
```

![](images/02-datos-014.png)

\newpage

```sql
INSERT INTO Planetas (Nombre, CoordenadaX, CoordenadaY, Superficie, Id_Galaxia)
VALUES ('Celestial Outpost', 12, 18, 9452, 3);
```

![](images/02-datos-015.png)

\newpage

```sql
INSERT INTO Planetas (Nombre, CoordenadaX, CoordenadaY, Superficie, Id_Galaxia)
VALUES ('Galactic Citadel', 25, 15, 51118, 4);
```

![](images/02-datos-016.png)

\newpage

```sql
INSERT INTO Planetas (Nombre, CoordenadaX, CoordenadaY, Superficie, Id_Galaxia)
VALUES ('Starlight Sanctuary', 5, 12, 7534, 1);
```

![](images/02-datos-017.png)

\newpage

```sql
INSERT INTO Planetas (Nombre, CoordenadaX, CoordenadaY, Superficie, Id_Galaxia)
VALUES ('Celestial Outpost II', 18, 22, 49532, 2);
```

![](images/02-datos-018.png)

\newpage

```sql
INSERT INTO Planetas (Nombre, CoordenadaX, CoordenadaY, Superficie, Id_Galaxia)
VALUES ('Nebula Nexus', 30, 8, 6794, 3);
```

![](images/02-datos-019.png)

\newpage

```sql
INSERT INTO Planetas (Nombre, CoordenadaX, CoordenadaY, Superficie, Id_Galaxia)
VALUES ('Solar Haven', 10, 30, 12756, 1);
```

![](images/02-datos-020.png)

\newpage

```sql
INSERT INTO Planetas (Nombre, CoordenadaX, CoordenadaY, Superficie, Id_Galaxia)
VALUES ('Asteroid Haven', 22, 17, 12104, 4);
```

![](images/02-datos-021.png)

\newpage

### Lunas

Las queries de insercion seran con este formato:

```sql
INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES (?, ?, ?);
```

### Datos Lunas:

| Nombre            | Superficie | ID_Planeta |
| ----------------- | ---------- | ---------- |
| Luminara          | 1524       | 1          |
| Nightshade        | 1289       | 2          |
| Galaxysong        | 1811       | 3          |
| StellarDust       | 2037       | 4          |
| MoonlightGrove    | 1699       | 5          |
| GlimmeringOrbit   | 1387       | 1          |
| EclipseHarbor     | 1114       | 2          |
| MoonstoneMeadow   | 1532       | 3          |
| StellarRefuge     | 1844       | 4          |
| CosmicSerenity    | 1656       | 5          |
| Luminara II       | 1457       | 6          |
| Nightshade II     | 1228       | 7          |
| Galaxysong II     | 1791       | 8          |
| StellarDust II    | 2033       | 9          |
| MoonlightGrove II | 1578       | 10         |

\newpage

```sql
INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('Luminara', 1524, 1);
```

![](images/02-datos-022.png)

\newpage

```sql
INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('Nightshade', 1289, 2);
```

![](images/02-datos-023.png)

\newpage

```sql
INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('Galaxysong', 1811, 3);
```

![](images/02-datos-024.png)

\newpage

```sql
INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('StellarDust', 2037, 4);
```

![](images/02-datos-025.png)

\newpage

```sql
INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('MoonlightGrove', 1699, 5);
```

![](images/02-datos-026.png)

\newpage

```sql
INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('GlimmeringOrbit', 1387, 1);
```

![](images/02-datos-027.png)

\newpage

```sql
INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('EclipseHarbor', 1114, 2);
```

![](images/02-datos-028.png)

\newpage

```sql
INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('MoonstoneMeadow', 1532, 3);
```

![](images/02-datos-029.png)

\newpage

```sql
INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('StellarRefuge', 1844, 4);
```

![](images/02-datos-030.png)

\newpage

```sql
INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('CosmicSerenity', 1656, 5);
```

![](images/02-datos-031.png)

\newpage

```sql
INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('Luminara II', 1457, 6);
```

![](images/02-datos-032.png)

\newpage

```sql
INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('Nightshade II', 1228, 7);
```

![](images/02-datos-033.png)

\newpage

```sql
INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('Galaxysong II', 1791, 8);
```

![](images/02-datos-034.png)

\newpage

```sql
INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('StellarDust II', 2033, 9);
```

![](images/02-datos-035.png)

\newpage

```sql
INSERT INTO Lunas (Nombre, Superficie, Id_Planeta)
VALUES ('MoonlightGrove II', 1578, 10);
```

![](images/02-datos-036.png)

\newpage

### Naves

Las queries de insercion seran con este formato:

```sql
INSERT INTO Naves
    (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES
    (?, ?, ?, ?);
```

### Datos:

| Nombre                     | Costo_R1 | Costo_R2 | Costo_R3 |
| -------------------------- | -------- | -------- | -------- |
| Caza Estelar               | 100      | 50       | 30       |
| Destructor Interplanetario | 200      | 100      | 150      |
| Nave de Colonización       | 150      | 80       | 100      |
| Transportador de Recursos  | 80       | 120      | 50       |
| Nave de Exploración        | 120      | 70       | 90       |

\newpage

```sql
INSERT INTO Naves (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Caza Estelar', 100, 50, 30);
```

![](images/02-datos-037.png)

\newpage

```sql
INSERT INTO Naves (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Destructor Interplanetario', 200, 100, 150);
```

![](images/02-datos-038.png)

\newpage

```sql
INSERT INTO Naves (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Nave de Colonización', 150, 80, 100);
```

![](images/02-datos-039.png)

\newpage

```sql
INSERT INTO Naves (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Transportador de Recursos', 80, 120, 50);
```

![](images/02-datos-040.png)

\newpage

```sql
INSERT INTO Naves (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Nave de Exploración', 120, 70, 90);
```

![](images/02-datos-041.png)

\newpage

### Recursos

Las queries de insercion seran con este formato:

```sql
INSERT INTO Recursos (Nombre) VALUES (?);
```

### Datos:

| Nombre   |
| -------- |
| Metal    |
| Deuterio |
| Energia  |

\newpage

```sql
INSERT INTO Recursos (Nombre) VALUES ('Metal');
```

![](images/02-datos-042.png)

\newpage

```sql
INSERT INTO Recursos (Nombre) VALUES ('Deuterio');
```

![](images/02-datos-043.png)

\newpage

```sql
INSERT INTO Recursos (Nombre) VALUES ('Energía');
```

![](images/02-datos-044.png)

\newpage

### Armamentos

Las queries de insercion seran con este formato:

```sql
INSERT INTO Armamentos (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES (?, ?, ?, ?);
```

### Datos:

| Nombre             | Costo_R1 | Costo_R2 | Costo_R3 |
| ------------------ | -------- | -------- | -------- |
| Cañón de Plasma    | 150      | 100      | 80       |
| Torreta de Defensa | 100      | 80       | 120      |
| Láser de Precisión | 120      | 150      | 100      |
| Bomba de Neutrinos | 80       | 120      | 150      |
| Escudo de Energía  | 100      | 150      | 80       |

\newpage

```sql
INSERT INTO Armamentos (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Cañón de Plasma', 150, 100, 80);
```

![](images/02-datos-045.png)

\newpage

```sql
INSERT INTO Armamentos (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Torreta de Defensa', 100, 80, 120);
```

![](images/02-datos-046.png)

\newpage

```sql
INSERT INTO Armamentos (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Láser de Precisión', 120, 150, 100);
```

![](images/02-datos-047.png)

\newpage

```sql
INSERT INTO Armamentos (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Bomba de Neutrinos', 80, 120, 150);
```

![](images/02-datos-048.png)

\newpage

```sql
INSERT INTO Armamentos (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Escudo de Energía', 100, 150, 80);
```

![](images/02-datos-049.png)

\newpage

### Edificios

Las queries de insercion seran con este formato:

```sql
INSERT INTO Edificios (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES (?, ?, ?, ?);
```

### Datos:

| Nombre                   | Costo_R1 | Costo_R2 | Costo_R3 |
| ------------------------ | -------- | -------- | -------- |
| Centro de Investigación  | 500      | 200      | 300      |
| Hangar de Naves          | 300      | 400      | 200      |
| Planta de Energía Solar  | 200      | 300      | 500      |
| Defensa Planetaria       | 400      | 200      | 300      |
| Puerto Espacial          | 300      | 500      | 200      |
| Sintetizador de Deuterio | 250      | 400      | 150      |
| Almacén de Metales       | 150      | 250      | 100      |

\newpage

```sql
INSERT INTO Edificios (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Centro de Investigación', 500, 200, 300);
```

![](images/02-datos-050.png)

\newpage

```sql
INSERT INTO Edificios (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Hangar de Naves', 300, 400, 200);
```

![](images/02-datos-051.png)

\newpage

```sql
INSERT INTO Edificios (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Planta de Energía Solar', 200, 300, 500);
```

![](images/02-datos-052.png)

\newpage

```sql
INSERT INTO Edificios (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Defensa Planetaria', 400, 200, 300);
```

![](images/02-datos-053.png)

\newpage

```sql
INSERT INTO Edificios (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Puerto Espacial', 300, 500, 200);
```

![](images/02-datos-054.png)

\newpage

```sql
INSERT INTO Edificios (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Sintetizador de Deuterio', 250, 400, 150);
```

![](images/02-datos-055.png)

\newpage

```sql
INSERT INTO Edificios (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Almacén de Metales', 150, 250, 100);
```

![](images/02-datos-056.png)

\newpage

## Parte 3: Insercion de Datos

### Parte 3.1 Asignacion de Planetas a Jugadores

'Nova Prime' -> 'astro_gamer'

```sql
UPDATE Planetas SET Id_Jugador = 1 WHERE Id = 1;
```

![](images/03.01-queries-001.png)

\newpage

'Astral Oasis' -> 'astro_gamer'

```sql
UPDATE Planetas SET Id_Jugador = 1 WHERE Id = 3;
```

![](images/03.01-queries-002.png)

\newpage

'Starlight Sanctuary' -> 'astro_gamer'

```sql
UPDATE Planetas SET Id_Jugador = 1 WHERE Id = 6;
```

![](images/03.01-queries-003.png)

\newpage

'Stellar Haven' -> 'galactic_ruler'

```sql
UPDATE Planetas SET Id_Jugador = 2 WHERE Id = 2;
```

![](images/03.01-queries-004.png)

\newpage

'Celestial Outpost II' -> 'galactic_ruler'

```sql
UPDATE Planetas SET Id_Jugador = 2 WHERE Id = 7;
```

![](images/03.01-queries-005.png)

\newpage

'Nebula Nexus' -> 'cosmic_explorer'

```sql
UPDATE Planetas SET Id_Jugador = 3 WHERE Id = 8;
```

![](images/03.01-queries-006.png)

\newpage

'Celestial Outpost' -> 'space_commander'

```sql
UPDATE Planetas SET Id_Jugador = 4 WHERE Id = 4;
```

![](images/03.01-queries-007.png)

\newpage

'Asteroid Haven' -> 'space_commander'

```sql
UPDATE Planetas SET Id_Jugador = 4 WHERE Id = 10;
```

![](images/03.01-queries-008.png)

\newpage

'Galactic Citadel' -> 'stargazer'

```sql
UPDATE Planetas SET Id_Jugador = 5 WHERE Id = 5;
```

![](images/03.01-queries-009.png)

\newpage

'Solar Haven' -> 'space_pioneer'

```sql
UPDATE Planetas SET Id_Jugador = 6 WHERE Id = 9;
```

![](images/03.01-queries-010.png)

\newpage

### Parte 3.2 Recursos Iniciales

Todos los planetas tienen:

| Recurso  | Cantidad |
| -------- | -------- |
| Metal    | 500000   |
| Deuterio | 23000    |
| Energía  | 25000    |

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (1, 1, 500000);
```

![](images/03.02-queries-001.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (1, 2, 23000);
```

![](images/03.02-queries-002.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (1, 3, 25000);
```

![](images/03.02-queries-003.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (2, 1, 500000);
```

![](images/03.02-queries-004.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (2, 2, 23000);
```

![](images/03.02-queries-005.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (2, 3, 25000);
```

![](images/03.02-queries-006.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (3, 1, 500000);
```

![](images/03.02-queries-007.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (3, 2, 23000);
```

![](images/03.02-queries-008.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (3, 3, 25000);
```

![](images/03.02-queries-009.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (4, 1, 500000);
```

![](images/03.02-queries-010.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (4, 2, 23000);
```

![](images/03.02-queries-011.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (4, 3, 25000);
```

![](images/03.02-queries-012.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (5, 1, 500000);
```

![](images/03.02-queries-013.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (5, 2, 23000);
```

![](images/03.02-queries-014.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (5, 3, 25000);
```

![](images/03.02-queries-015.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (6, 1, 500000);
```

![](images/03.02-queries-016.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (6, 2, 23000);
```

![](images/03.02-queries-017.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (6, 3, 25000);
```

![](images/03.02-queries-018.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (7, 1, 500000);
```

![](images/03.02-queries-019.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (7, 2, 23000);
```

![](images/03.02-queries-020.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (7, 3, 25000);
```

![](images/03.02-queries-021.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (8, 1, 500000);
```

![](images/03.02-queries-022.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (8, 2, 23000);
```

![](images/03.02-queries-023.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (8, 3, 25000);
```

![](images/03.02-queries-024.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (9, 1, 500000);
```

![](images/03.02-queries-025.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (9, 2, 23000);
```

![](images/03.02-queries-026.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (9, 3, 25000);
```

![](images/03.02-queries-027.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (10, 1, 500000);
```

![](images/03.02-queries-028.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (10, 2, 23000);
```

![](images/03.02-queries-029.png)

\newpage

```sql
INSERT INTO RecursosPlanetas (Id_Planeta, Id_Recurso, Cantidad) VALUES (10, 3, 25000);
```

![](images/03.02-queries-030.png)

\newpage

### Parte 3.3 Asignacion de Edificios a Planetas

#### Formato:

```sql
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (?, ?);

UPDATE RecursosPlanetas SET Cantidad = Cantidad - ?
WHERE Id_Planeta = ? AND Id_Recurso = 1;

UPDATE RecursosPlanetas SET Cantidad = Cantidad - ?
WHERE Id_Planeta = ? AND Id_Recurso = 2;

UPDATE RecursosPlanetas SET Cantidad = Cantidad - ?
WHERE Id_Planeta = ? AND Id_Recurso = 3;
```

Son 4 queries por Edificio, ya que al construir el edificio tenemos que pagar el costo en recursos.

#### Datos:

| Planeta              | Edificio                 | Costo R1 | Costo R2 | Costo R3 |
| -------------------- | ------------------------ | -------- | -------- | -------- |
| Nova Prime           | Centro de Investigacion  | 500      | 200      | 300      |
| Nova Prime           | Puerto Espacial          | 300      | 500      | 200      |
| Stellar Haven        | Hangar de Naves          | 300      | 400      | 200      |
| Stellar Haven        | Defensa Planetaria       | 400      | 200      | 300      |
| Stellar Haven        | Sintetizador de Deuterio | 250      | 400      | 150      |
| Astral Oasis         | Hangar de Naves          | 300      | 400      | 200      |
| Astral Oasis         | Planta de Energia Solar  | 200      | 300      | 500      |
| Celestial Outpost    | Planta de Energia Solar  | 200      | 300      | 500      |
| Celestial Outpost    | Defensa Planetaria       | 400      | 200      | 300      |
| Galactic Citadel     | Centro de Investigacion  | 500      | 200      | 300      |
| Galactic Citadel     | Hangar de Naves          | 300      | 400      | 200      |
| Starlight Sanctuary  | Centro de Investigacion  | 500      | 200      | 300      |
| Starlight Sanctuary  | Puerto Espacial          | 300      | 500      | 200      |
| Celestial Outpost II | Hangar de Naves          | 300      | 400      | 200      |
| Celestial Outpost II | Planta de Energia Solar  | 200      | 300      | 500      |
| Nebula Nexus         | Centro de Investigacion  | 500      | 200      | 300      |
| Nebula Nexus         | Sintetizador de Deuterio | 250      | 400      | 150      |
| Solar Haven          | Hangar de Naves          | 300      | 400      | 200      |
| Solar Haven          | Defensa Planetaria       | 400      | 200      | 300      |
| Solar Haven          | Puerto Espacial          | 300      | 500      | 200      |
| Asteroid Haven       | Centro de Investigacion  | 500      | 200      | 300      |
| Asteroid Haven       | Planta de Energia Solar  | 200      | 300      | 500      |

\newpage

```sql
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (1, 1);
```

![](images/03.03-queries-001.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 500
WHERE Id_Planeta = 1 AND Id_Recurso = 1;
```

![](images/03.03-queries-002.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 1 AND Id_Recurso = 2;
```

![](images/03.03-queries-003.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 1 AND Id_Recurso = 3;
```

![](images/03.03-queries-004.png)

\newpage

```sql
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (1, 6);
```

![](images/03.03-queries-005.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 1 AND Id_Recurso = 1;
```

![](images/03.03-queries-006.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 500
WHERE Id_Planeta = 1 AND Id_Recurso = 2;
```

![](images/03.03-queries-007.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 1 AND Id_Recurso = 3;
```

![](images/03.03-queries-008.png)

\newpage

```sql
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (2, 2);
```

![](images/03.03-queries-009.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 2 AND Id_Recurso = 1;
```

![](images/03.03-queries-010.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 400
WHERE Id_Planeta = 2 AND Id_Recurso = 2;
```

![](images/03.03-queries-011.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 2 AND Id_Recurso = 3;
```

![](images/03.03-queries-012.png)

\newpage

```sql
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (2, 5);
```

![](images/03.03-queries-013.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 400
WHERE Id_Planeta = 2 AND Id_Recurso = 1;
```

![](images/03.03-queries-014.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 2 AND Id_Recurso = 2;
```

![](images/03.03-queries-015.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 2 AND Id_Recurso = 3;
```

![](images/03.03-queries-016.png)

\newpage

```sql
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (2, 7);
```

![](images/03.03-queries-017.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 250
WHERE Id_Planeta = 2 AND Id_Recurso = 1;
```

![](images/03.03-queries-018.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 400
WHERE Id_Planeta = 2 AND Id_Recurso = 2;
```

![](images/03.03-queries-019.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 150
WHERE Id_Planeta = 2 AND Id_Recurso = 3;
```

![](images/03.03-queries-020.png)

\newpage

```sql
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (3, 2);
```

![](images/03.03-queries-021.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 3 AND Id_Recurso = 1;
```

![](images/03.03-queries-022.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 400
WHERE Id_Planeta = 3 AND Id_Recurso = 2;
```

![](images/03.03-queries-023.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 3 AND Id_Recurso = 3;
```

![](images/03.03-queries-024.png)

\newpage

```sql
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (3, 3);
```

![](images/03.03-queries-025.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 3 AND Id_Recurso = 1;
```

![](images/03.03-queries-026.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 3 AND Id_Recurso = 2;
```

![](images/03.03-queries-027.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 500
WHERE Id_Planeta = 3 AND Id_Recurso = 3;
```

![](images/03.03-queries-028.png)

\newpage

```sql
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (4, 3);
```

![](images/03.03-queries-029.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 4 AND Id_Recurso = 1;
```

![](images/03.03-queries-030.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 4 AND Id_Recurso = 2;
```

![](images/03.03-queries-031.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 500
WHERE Id_Planeta = 4 AND Id_Recurso = 3;
```

![](images/03.03-queries-032.png)

\newpage

```sql
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (4, 4);
```

![](images/03.03-queries-033.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 400
WHERE Id_Planeta = 4 AND Id_Recurso = 1;
```

![](images/03.03-queries-034.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 4 AND Id_Recurso = 2;
```

![](images/03.03-queries-035.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 4 AND Id_Recurso = 3;
```

![](images/03.03-queries-036.png)

\newpage

```sql
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (5, 1);
```

![](images/03.03-queries-037.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 500
WHERE Id_Planeta = 5 AND Id_Recurso = 1;
```

![](images/03.03-queries-038.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 5 AND Id_Recurso = 2;
```

![](images/03.03-queries-039.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 5 AND Id_Recurso = 3;
```

![](images/03.03-queries-040.png)

\newpage

```sql
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (5, 2);
```

![](images/03.03-queries-041.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 5 AND Id_Recurso = 1;
```

![](images/03.03-queries-042.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 400
WHERE Id_Planeta = 5 AND Id_Recurso = 2;
```

![](images/03.03-queries-043.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 5 AND Id_Recurso = 3;
```

![](images/03.03-queries-044.png)

\newpage

```sql
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (6, 1);
```

![](images/03.03-queries-045.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 500
WHERE Id_Planeta = 6 AND Id_Recurso = 1;
```

![](images/03.03-queries-046.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 6 AND Id_Recurso = 2;
```

![](images/03.03-queries-047.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 6 AND Id_Recurso = 3;
```

![](images/03.03-queries-048.png)

\newpage

```sql
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (6, 6);
```

![](images/03.03-queries-049.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 6 AND Id_Recurso = 1;
```

![](images/03.03-queries-050.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 500
WHERE Id_Planeta = 6 AND Id_Recurso = 2;
```

![](images/03.03-queries-051.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 6 AND Id_Recurso = 3;
```

![](images/03.03-queries-052.png)

\newpage

```sql
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (7, 2);
```

![](images/03.03-queries-053.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 7 AND Id_Recurso = 1;
```

![](images/03.03-queries-054.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 400
WHERE Id_Planeta = 7 AND Id_Recurso = 2;
```

![](images/03.03-queries-055.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 7 AND Id_Recurso = 3;
```

![](images/03.03-queries-056.png)

\newpage

```sql
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (7, 3);
```

![](images/03.03-queries-057.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 7 AND Id_Recurso = 1;
```

![](images/03.03-queries-058.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 7 AND Id_Recurso = 2;
```

![](images/03.03-queries-059.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 500
WHERE Id_Planeta = 7 AND Id_Recurso = 3;
```

![](images/03.03-queries-060.png)

\newpage

```sql
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (8, 1);
```

![](images/03.03-queries-061.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 500
WHERE Id_Planeta = 8 AND Id_Recurso = 1;
```

![](images/03.03-queries-062.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 8 AND Id_Recurso = 2;
```

![](images/03.03-queries-063.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 8 AND Id_Recurso = 3;
```

![](images/03.03-queries-064.png)

\newpage

```sql
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (8, 7);
```

![](images/03.03-queries-065.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 250
WHERE Id_Planeta = 8 AND Id_Recurso = 1;
```

![](images/03.03-queries-066.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 400
WHERE Id_Planeta = 8 AND Id_Recurso = 2;
```

![](images/03.03-queries-067.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 150
WHERE Id_Planeta = 8 AND Id_Recurso = 3;
```

![](images/03.03-queries-068.png)

\newpage

```sql
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (9, 2);
```

![](images/03.03-queries-069.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 9 AND Id_Recurso = 1;
```

![](images/03.03-queries-070.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 400
WHERE Id_Planeta = 9 AND Id_Recurso = 2;
```

![](images/03.03-queries-071.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 9 AND Id_Recurso = 3;
```

![](images/03.03-queries-072.png)

\newpage

```sql
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (9, 5);
```

![](images/03.03-queries-073.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 400
WHERE Id_Planeta = 9 AND Id_Recurso = 1;
```

![](images/03.03-queries-074.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 9 AND Id_Recurso = 2;
```

![](images/03.03-queries-075.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 9 AND Id_Recurso = 3;
```

![](images/03.03-queries-076.png)

\newpage

```sql
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (9, 6);
```

![](images/03.03-queries-077.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 9 AND Id_Recurso = 1;
```

![](images/03.03-queries-078.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 500
WHERE Id_Planeta = 9 AND Id_Recurso = 2;
```

![](images/03.03-queries-079.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 9 AND Id_Recurso = 3;
```

![](images/03.03-queries-080.png)

\newpage

```sql
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (10, 1);
```

![](images/03.03-queries-081.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 500
WHERE Id_Planeta = 10 AND Id_Recurso = 1;
```

![](images/03.03-queries-082.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 10 AND Id_Recurso = 2;
```

![](images/03.03-queries-083.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 10 AND Id_Recurso = 3;
```

![](images/03.03-queries-084.png)

\newpage

```sql
INSERT INTO EdificiosPlanetas (Id_Planeta, Id_Edificio) VALUES (10, 3);
```

![](images/03.03-queries-085.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200
WHERE Id_Planeta = 10 AND Id_Recurso = 1;
```

![](images/03.03-queries-086.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 300
WHERE Id_Planeta = 10 AND Id_Recurso = 2;
```

![](images/03.03-queries-087.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 500
WHERE Id_Planeta = 10 AND Id_Recurso = 3;
```

![](images/03.03-queries-088.png)

\newpage

### Parte 3.4 Asignacion de Naves a Planetas

#### Formato:

```sql
INSERT INTO NavesPlanetas (Id_Planeta, Id_Nave, Cantidad) VALUES (?, ?, ?);

UPDATE RecursosPlanetas SET Cantidad = Cantidad - ?
WHERE Id_Planeta = ? AND Id_Recurso = 1;

UPDATE RecursosPlanetas SET Cantidad = Cantidad - ?
WHERE Id_Planeta = ? AND Id_Recurso = 2;

UPDATE RecursosPlanetas SET Cantidad = Cantidad - ?
WHERE Id_Planeta = ? AND Id_Recurso = 3;
```

Son 4 queries por entrada, ya que al construir la nave tenemos que pagar el costo en recursos.

#### Datos:

| Planeta              | Nave                       | Cantidad | Costo R1 | Costo R2 | Costo R3 |
| -------------------- | -------------------------- | -------- | -------- | -------- | -------- |
| Stellar Haven        | Caza Estelar               | 50       | 100x50   | 50x50    | 30x50    |
| Stellar Haven        | Nave de Colonizacion       | 20       | 150x20   | 80x20    | 100x20   |
| Stellar Haven        | Transportador de Recursos  | 30       | 80x30    | 120x30   | 50x30    |
| Celestial Outpost II | Caza Estelar               | 25       | 100x25   | 50x25    | 30x25    |
| Celestial Outpost II | Destructor Interplanetario | 30       | 200x30   | 100x30   | 150x30   |
| Celestial Outpost II | Nave de Exploracion        | 15       | 120x15   | 70x15    | 90x15    |
| Solar Haven          | Destructor Interplanetario | 20       | 200x20   | 100x20   | 150x20   |
| Solar Haven          | Transportador de Recursos  | 30       | 80x30    | 120x30   | 50x30    |
| Solar Haven          | Nave de Exploracion        | 10       | 120x10   | 70x10    | 90x10    |

\newpage

```sql
INSERT INTO NavesPlanetas (Id_Planeta, Id_Nave, Cantidad) VALUES (2, 1, 50);
```

![](images/03.04-queries-001.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 100 * 50
WHERE Id_Planeta = 2 AND Id_Recurso = 1;
```

![](images/03.04-queries-002.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 50 * 50
WHERE Id_Planeta = 2 AND Id_Recurso = 2;
```

![](images/03.04-queries-003.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 30 * 50
WHERE Id_Planeta = 2 AND Id_Recurso = 3;
```

![](images/03.04-queries-004.png)

\newpage

```sql
INSERT INTO NavesPlanetas (Id_Planeta, Id_Nave, Cantidad) VALUES (2, 3, 20);
```

![](images/03.04-queries-005.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 150 * 20
WHERE Id_Planeta = 2 AND Id_Recurso = 1;
```

![](images/03.04-queries-006.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 80 * 20
WHERE Id_Planeta = 2 AND Id_Recurso = 2;
```

![](images/03.04-queries-007.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 100 * 20
WHERE Id_Planeta = 2 AND Id_Recurso = 3;
```

![](images/03.04-queries-008.png)

\newpage

```sql
INSERT INTO NavesPlanetas (Id_Planeta, Id_Nave, Cantidad) VALUES (2, 4, 30);
```

![](images/03.04-queries-009.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 80 * 30
WHERE Id_Planeta = 2 AND Id_Recurso = 1;
```

![](images/03.04-queries-010.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 120 * 30
WHERE Id_Planeta = 2 AND Id_Recurso = 2;
```

![](images/03.04-queries-011.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 50 * 30
WHERE Id_Planeta = 2 AND Id_Recurso = 3;
```

![](images/03.04-queries-012.png)

\newpage

```sql
INSERT INTO NavesPlanetas (Id_Planeta, Id_Nave, Cantidad) VALUES (7, 1, 25);
```

![](images/03.04-queries-013.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 100 * 25
WHERE Id_Planeta = 7 AND Id_Recurso = 1;
```

![](images/03.04-queries-014.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 50 * 25
WHERE Id_Planeta = 7 AND Id_Recurso = 2;
```

![](images/03.04-queries-015.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 30 * 25
WHERE Id_Planeta = 7 AND Id_Recurso = 3;
```

![](images/03.04-queries-016.png)

\newpage

```sql
INSERT INTO NavesPlanetas (Id_Planeta, Id_Nave, Cantidad) VALUES (7, 2, 30);
```

![](images/03.04-queries-017.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200 * 30
WHERE Id_Planeta = 7 AND Id_Recurso = 1;
```

![](images/03.04-queries-018.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 100 * 30
WHERE Id_Planeta = 7 AND Id_Recurso = 2;
```

![](images/03.04-queries-019.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 150 * 30
WHERE Id_Planeta = 7 AND Id_Recurso = 3;
```

![](images/03.04-queries-020.png)

\newpage

```sql
INSERT INTO NavesPlanetas (Id_Planeta, Id_Nave, Cantidad) VALUES (7, 5, 15);
```

![](images/03.04-queries-021.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 120 * 15
WHERE Id_Planeta = 7 AND Id_Recurso = 1;
```

![](images/03.04-queries-022.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 70 * 15
WHERE Id_Planeta = 7 AND Id_Recurso = 2;
```

![](images/03.04-queries-023.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 90 * 15
WHERE Id_Planeta = 7 AND Id_Recurso = 3;
```

![](images/03.04-queries-024.png)

\newpage

```sql
INSERT INTO NavesPlanetas (Id_Planeta, Id_Nave, Cantidad) VALUES (9, 2, 20);
```

![](images/03.04-queries-025.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 200 * 20
WHERE Id_Planeta = 9 AND Id_Recurso = 1;
```

![](images/03.04-queries-026.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 100 * 20
WHERE Id_Planeta = 9 AND Id_Recurso = 2;
```

![](images/03.04-queries-027.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 150 * 20
WHERE Id_Planeta = 9 AND Id_Recurso = 3;
```

![](images/03.04-queries-028.png)

\newpage

```sql
INSERT INTO NavesPlanetas (Id_Planeta, Id_Nave, Cantidad) VALUES (9, 4, 30);
```

![](images/03.04-queries-029.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 80 * 30
WHERE Id_Planeta = 9 AND Id_Recurso = 1;
```

![](images/03.04-queries-030.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 120 * 30
WHERE Id_Planeta = 9 AND Id_Recurso = 2;
```

![](images/03.04-queries-031.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 50 * 30
WHERE Id_Planeta = 9 AND Id_Recurso = 3;
```

![](images/03.04-queries-032.png)

\newpage

```sql
INSERT INTO NavesPlanetas (Id_Planeta, Id_Nave, Cantidad) VALUES (9, 5, 10);
```

![](images/03.04-queries-033.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 120 * 10
WHERE Id_Planeta = 9 AND Id_Recurso = 1;
```

![](images/03.04-queries-034.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 70 * 10
WHERE Id_Planeta = 9 AND Id_Recurso = 2;
```

![](images/03.04-queries-035.png)

\newpage

```sql
UPDATE RecursosPlanetas SET Cantidad = Cantidad - 90 * 10
WHERE Id_Planeta = 9 AND Id_Recurso = 3;
```

![](images/03.04-queries-036.png)

\newpage

### Parte 3.5 Asignacion de Armamento a Planetas

Insertar defensas si 'galactic_ruler' tiene el edificio de Defensa Planetaria

```sql
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
2 AS Id_Armamento, --insertamos 100 torretas de defensa
100 AS Cantidad
FROM EdificiosPlanetas E
WHERE
E.Id_Planeta IN (2, 7) -- Stellar Haven y Celestial Outpost II
AND Id_Edificio = 4 -- Defensa Planetaria
```

\newpage

```sql
SELECT * FROM Jugadores WHERE Username = 'galactic_ruler';
```

![Obtenemos Id_Jugador = 2](images/03.05-queries-001.png)

\newpage

```sql
SELECT * FROM Planetas WHERE Id_Jugador = 2;
```

![Obtenemos Id_Planeta(s) 2 y 7](images/03.05-queries-002.png)

\newpage

```sql
SELECT * FROM Edificios WHERE Nombre = 'Defensa Planetaria';
```

![Obtenemos Id_Edificio = 4](images/03.05-queries-003.png)

\newpage

```sql
INSERT INTO ArmamentosPlanetas (Id_Planeta, Id_Armamento, Cantidad)
SELECT
	E.Id_Planeta AS Id_Planeta,
	2			 AS Id_Armamento, --insertamos 100 torretas de defensa
  100          AS Cantidad
FROM EdificiosPlanetas E
WHERE
	E.Id_Planeta IN (2, 7) -- Stellar Haven y Celestial Outpost II
AND Id_Edificio = 4 -- Defensa Planetaria;
```

![Insertamos por Planeta si tienen el edificio](images/03.05-queries-004.png)

\newpage

## Anexo

Para realizar este documento cree una herramienta de automatización para separar las queries de forma individual, ejecutarlas en pgAdmin4, tomar captura de pantalla, guardarlas de forma indexada y generar los fragmentos de este documento.

Luego, de forma manual se revisó cada fragmento, se agregó una descripción, tablas de datos y aclaraciones donde fuera necesario; se reviso todo y renderizo a PDF.

Las tecnologías usadas para la automatización fueron:

- Docker Compose para levantar la instancia de Postgres
- Mermaid para armar los diagramas (DER y Modelo Lógico)
- Deno para ejecutar los scripts en Javascript, que son responsables de:
  - Leer los archivos .sql
  - Separar las queries de forma individual
  - Copiar la query (usando `wl-copy`)
  - Pegarla en pgAdmin (usando `wtype -M ctrl -k V`)
  - Ejecutar (usando `wtype -k F5`)
  - Tomar captura de pantalla (usando `niri msg action screenshot-window -d false -p false`)
  - Guardar la captura y unas líneas de Markdown mostrando la query y la imagen (`wl-paste` y escribiendo en el archivo correspondiente)
- Pandoc para convertir el archivo final Markdown a PDF

Toda la implementación (y automatización de capturas y producción del documento) está en el repositorio: [https\://github.com/sgarabaya/imperio](https://github.com/sgarabaya/imperio).

**No se usó AI en ningún momento.**
