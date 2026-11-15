---
lang: es-ES
mainfont: "JetBrainsMono-Regular"
geometry: a4paper
header-includes:
    - \usepackage[table]{xcolor}
    - \rowcolors{2}{gray!10}{white}
---

\newpage

# Parte 1: Ampliar Base de Datos

## 1. Planetas

```sql
ALTER TABLE Planetas
ADD COLUMN Poblacion BIGINT NOT NULL DEFAULT 0;
```

![](images/p2-01-planetas-001.png)

\newpage

```sql
UPDATE Planetas
    SET Poblacion = 4050000000
WHERE Nombre = 'Nova Prime'
;
```

![](images/p2-01-planetas-002.png)

\newpage

```sql
UPDATE Planetas
    SET Poblacion = 3000000
WHERE Nombre = 'Stellar Haven'
;
```

![](images/p2-01-planetas-003.png)

\newpage

```sql
UPDATE Planetas
    SET Poblacion = 9000000000
WHERE Nombre = 'Astral Oasis'
;
```

![](images/p2-01-planetas-004.png)

\newpage

```sql
UPDATE Planetas
    SET Poblacion = 20000000
WHERE Nombre = 'Celestial Outpost'
;
```

![](images/p2-01-planetas-005.png)

\newpage

```sql
UPDATE Planetas
    SET Poblacion = 1500000000
WHERE Nombre = 'Galactic Citadel'
;
```

![](images/p2-01-planetas-006.png)

\newpage

```sql
UPDATE Planetas
    SET Poblacion = 15000000
WHERE Nombre = 'Starlight Sanctuary'
;
```

![](images/p2-01-planetas-007.png)

\newpage

```sql
UPDATE Planetas
    SET Poblacion = 100000000
WHERE Nombre = 'Celestial Outpost II'
;
```

![](images/p2-01-planetas-008.png)

\newpage

```sql
UPDATE Planetas
    SET Poblacion = 5000000
WHERE Nombre = 'Nebula Nexus'
;
```

![](images/p2-01-planetas-009.png)

\newpage

```sql
UPDATE Planetas
    SET Poblacion = 50000000
WHERE Nombre = 'Solar Haven'
;
```

![](images/p2-01-planetas-010.png)

\newpage

```sql
UPDATE Planetas
    SET Poblacion = 2000000000
WHERE Nombre = 'Asteroid Haven'
;
```

![](images/p2-01-planetas-011.png)

\newpage

## 2. Naves

```sql
INSERT INTO Naves (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Acorazado', 2000, 500, 800)
;
```

![](images/p2-02-naves-001.png)

\newpage

```sql
INSERT INTO Naves (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Colonizador', 1000, 800, 450)
;
```

![](images/p2-02-naves-002.png)

\newpage

```sql
INSERT INTO Naves (Nombre, Costo_R1, Costo_R2, Costo_R3)
VALUES ('Sonda Espacial', 100, 50, 30)
;
```

![](images/p2-02-naves-003.png)

\newpage

## 3. Creacion de Tablas

```sql
CREATE TYPE EstadoFlota AS ENUM ('Disponible', 'No Disponible');
```

![](images/p2-03-tablas-001.png)

\newpage

```sql
CREATE TABLE Flotas (
    Id SERIAL PRIMARY KEY,
    Id_Planeta INT NOT NULL REFERENCES Planetas(Id),
    CazaEstelar INT DEFAULT 0,
    DestructorInterplanetario INT DEFAULT 0,
    NaveColonizacion INT DEFAULT 0,
    TransportadorRecursos INT DEFAULT 0,
    NaveExploracion INT DEFAULT 0,
    Acorazado INT DEFAULT 0,
    Colonizador INT DEFAULT 0,
    SondaEspacial INT DEFAULT 0,
    Estado EstadoFlota NOT NULL
);
```

![](images/p2-03-tablas-002.png)

\newpage

```sql
CREATE TYPE EstadoExploracion AS ENUM ('En Tránsito', 'Arribo', 'Detenido');
```

![](images/p2-03-tablas-003.png)

\newpage

```sql
CREATE TABLE Exploraciones (
    Id SERIAL PRIMARY KEY,
    Id_Jugador INT NOT NULL REFERENCES Jugadores(Id),
    Id_Flota INT NOT NULL REFERENCES Flotas(Id),
    CoordenadaXInicial INT NOT NULL,
    CoordenadaYInicial INT NOT NULL,
    CoordenadaXFinal INT NOT NULL,
    CoordenadaYFinal INT NOT NULL,
    FechaExploracionInicio TIMESTAMP NOT NULL,
    FechaExploracionFin TIMESTAMP NOT NULL,
    Estado EstadoExploracion NOT NULL
);
```

![](images/p2-03-tablas-004.png)

\newpage

## 4. DER y Modelo Lógico

### Diagrama Entidad/Relación (DER)

A partir de la consigna podemos determinar que el DER es:

![DER Imperio](../DER-2.png)

\newpage

### Modelo Lógico

A partir del DER, podemos refinar el modelo, creando tablas pivote donde sea
necesario.

![Modelo Logico Imperio](../ModeloLogico-2.png)

\newpage

# Parte 2: Queries

## 1. `cosmic_explorer` envia una Sonda Espacial

```sql
-- Primero, cosmic_explorer tiene que crear una Sonda Espacial
-- Solo tiene 1 planeta (Nexus Nebula)

-- Nebula Nexus -> 1x Sonda Espacial
INSERT INTO NavesPlanetas (Id_Planeta, Id_Nave, Cantidad)
VALUES (
    (
        SELECT P.Id
        FROM Planetas P
        INNER JOIN Jugadores J ON J.Id = P.Id_Jugador
        WHERE J.Username = 'cosmic_explorer'
          AND P.Nombre = 'Nebula Nexus'
    ),
    (SELECT Id FROM Naves WHERE Nombre = 'Sonda Espacial'),
    1
);
```

![](images/p2-05.1-queries-001.png)

\newpage

```sql
-- Actualizamos los recursos del planeta:
UPDATE RecursosPlanetas
SET Cantidad = Cantidad - (
    (SELECT Costo_R1 FROM Naves WHERE Nombre = 'Sonda Espacial')
)
WHERE Id_Planeta = (
    SELECT P.Id
    FROM Planetas P
    INNER JOIN Jugadores J ON J.Id = P.Id_Jugador
    WHERE J.Username = 'cosmic_explorer'
      AND P.Nombre = 'Nebula Nexus'
)
AND Id_Recurso = 1;
```

![](images/p2-05.1-queries-002.png)

\newpage

```sql
UPDATE RecursosPlanetas
SET Cantidad = Cantidad - (
    (SELECT Costo_R2 FROM Naves WHERE Nombre = 'Sonda Espacial')
)
WHERE Id_Planeta = (
    SELECT P.Id
    FROM Planetas P
    INNER JOIN Jugadores J ON J.Id = P.Id_Jugador
    WHERE J.Username = 'cosmic_explorer'
      AND P.Nombre = 'Nebula Nexus'
)
AND Id_Recurso = 2;
```

![](images/p2-05.1-queries-003.png)

\newpage

```sql
UPDATE RecursosPlanetas
SET Cantidad = Cantidad - (
    (SELECT Costo_R3 FROM Naves WHERE Nombre = 'Sonda Espacial')
)
WHERE Id_Planeta = (
    SELECT P.Id
    FROM Planetas P
    INNER JOIN Jugadores J ON J.Id = P.Id_Jugador
    WHERE J.Username = 'cosmic_explorer'
      AND P.Nombre = 'Nebula Nexus'
)
AND Id_Recurso = 3;
```

![](images/p2-05.1-queries-004.png)

\newpage

```sql
-- Creamos la Flota
INSERT INTO Flotas (Id_Planeta, SondaEspacial, Estado)
VALUES (
    (SELECT P.Id
    FROM Planetas P
    INNER JOIN Jugadores J ON J.Id = P.Id_Jugador
    WHERE J.Username = 'cosmic_explorer'
      AND P.Nombre = 'Nebula Nexus'),
    1,
    'Disponible'
) -- esto resulta en Flota con ID = 1
;
```

![](images/p2-05.1-queries-005.png)

\newpage

```sql
-- Reducimos la cantidad de Sondas Espaciales de Nebula Nexus por 1
UPDATE NavesPlanetas
SET Cantidad = Cantidad - 1
WHERE Id_Planeta = (
    SELECT P.Id FROM Planetas P
    INNER JOIN Jugadores J ON J.Id = P.Id_Jugador
    WHERE P.Nombre = 'Nebula Nexus' AND J.Username = 'cosmic_explorer'
)
AND Id_Nave = (SELECT Id FROM Naves WHERE Nombre = 'Sonda Espacial')
;
```

![](images/p2-05.1-queries-006.png)

\newpage

```sql
-- Creamos la Exploracion
INSERT INTO Exploraciones (
    Id_Jugador, Id_Flota,
    CoordenadaXInicial, CoordenadaYInicial,
    CoordenadaXFinal, CoordenadaYFinal,
    FechaExploracionInicio, FechaExploracionFin,
    Estado
) VALUES (
    (SELECT Id FROM Jugadores WHERE Username = 'cosmic_explorer'),
    1, -- Id_Flota => 1
    (SELECT CoordenadaX FROM Planetas P
        INNER JOIN Jugadores J ON J.Id = P.Id_Jugador
        WHERE J.Username = 'cosmic_explorer' AND P.Nombre = 'Nebula Nexus'
    ),
    (SELECT CoordenadaY FROM Planetas P
        INNER JOIN Jugadores J ON J.Id = P.Id_Jugador
        WHERE J.Username = 'cosmic_explorer' AND P.Nombre = 'Nebula Nexus'
    ),
    45, 78, -- Coordenadas finales X,Y
    NOW(), NOW() + INTERVAL '20 hours', -- fecha inicio, fecha fin
    'En Tránsito'   
) -- Resulta en Id_Exploracion = 1
;
```

![](images/p2-05.1-queries-007.png)

\newpage

```sql
-- Marcamos la Flota como `no disponible`
UPDATE Flotas
SET Estado = 'No Disponible'
WHERE Id = 1 -- Id_Flota => 1
;
```

![](images/p2-05.1-queries-008.png)

\newpage

## 2. La expedicion de `cosmic_explorer` se detiene

```sql
-- La sonda pasa por un campo de meteoritos -> la Exploracion se detiene
UPDATE Exploraciones
SET Estado = 'Detenido'
WHERE Id = 1 -- Id_Exploracion = 1
;
```

![](images/p2-05.2-queries-001.png)

\newpage

## 3. `galacic_ruler` crea 2 flotas

```sql
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
```

![](images/p2-05.3-queries-001.png)

\newpage

```sql
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
```

![](images/p2-05.3-queries-002.png)

\newpage

```sql
UPDATE RecursosPlanetas
SET Cantidad = Cantidad - (
    5 * (SELECT Costo_R2 FROM Naves WHERE Nombre = 'Sonda Espacial')
)
WHERE Id_Planeta = (
    SELECT Id FROM Planetas
    WHERE Nombre = 'Stellar Haven'
)
AND Id_Recurso = 2;
```

![](images/p2-05.3-queries-003.png)

\newpage

```sql
UPDATE RecursosPlanetas
SET Cantidad = Cantidad - (
    5 * (SELECT Costo_R3 FROM Naves WHERE Nombre = 'Sonda Espacial')
)
WHERE Id_Planeta = (
    SELECT Id FROM Planetas
    WHERE Nombre = 'Stellar Haven'
)
AND Id_Recurso = 3;
```

![](images/p2-05.3-queries-004.png)

\newpage

```sql
-- Reducimos la cantidad de Sondas Espaciales de Stellar Haven por 5
UPDATE NavesPlanetas
SET Cantidad = Cantidad - 5
WHERE Id_Planeta = (
    SELECT Id FROM Planetas
    WHERE Nombre = 'Stellar Haven'
)
AND Id_Nave = (SELECT Id FROM Naves WHERE Nombre = 'Sonda Espacial')
;
```

![](images/p2-05.3-queries-005.png)

\newpage

```sql
-- Creamos la Flota
INSERT INTO Flotas (Id_Planeta, SondaEspacial, Estado)
VALUES (
    (SELECT Id FROM Planetas
    WHERE Nombre = 'Stellar Haven'),
    5,
    'Disponible'
) -- esto resulta en Flota con ID = 2
;
```

![](images/p2-05.3-queries-006.png)

\newpage

```sql
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
```

![](images/p2-05.3-queries-007.png)

\newpage

```sql
-- Marcamos la Flota como `no disponible`
UPDATE Flotas
SET Estado = 'No Disponible'
WHERE Id = 2 -- Id_Flota => 2
;
```

![](images/p2-05.3-queries-008.png)

\newpage

```sql
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
```

![](images/p2-05.3-queries-009.png)

\newpage

```sql
-- Actualizamos las naves en Stellar Haven
UPDATE NavesPlanetas
    SET Cantidad = Cantidad - 20
WHERE Id_Planeta = (SELECT Id FROM Planetas WHERE Nombre = 'Stellar Haven')
AND Id_Nave = (SELECT Id FROM Naves WHERE Nombre = 'Caza Estelar')
;
```

![](images/p2-05.3-queries-010.png)

\newpage

```sql
UPDATE NavesPlanetas
    SET Cantidad = Cantidad - 5
WHERE Id_Planeta = (SELECT Id FROM Planetas WHERE Nombre = 'Stellar Haven')
AND Id_Nave = (SELECT Id FROM Naves WHERE Nombre = 'Nave de Colonización')
;
```

![](images/p2-05.3-queries-011.png)

\newpage

```sql
UPDATE NavesPlanetas
    SET Cantidad = Cantidad - 10
WHERE Id_Planeta = (SELECT Id FROM Planetas WHERE Nombre = 'Stellar Haven')
AND Id_Nave = (SELECT Id FROM Naves WHERE Nombre = 'Transportador de Recursos')
;
```

![](images/p2-05.3-queries-012.png)

\newpage

## 4. `Fundacion` intercepta a `galacic_ruler`

-> Muy buena referencia a Asimov +5 puntos de respeto

```sql
-- Detenemos la exploracion de galactic_ruler, cambiamos las coordenadas finales
UPDATE Exploraciones
    SET Estado = 'Detenido',
        CoordenadaXFinal = 10,
        CoordenadaYFinal = 21
WHERE Id = 2
;
```

![](images/p2-05.4-queries-001.png)

\newpage

## 5. `galactic_ruler` contraataca

```sql
-- Deshacemos la Flota: 3
UPDATE Flotas
    SET CazaEstelar = 0,
        NaveColonizacion = 0,
        TransportadorRecursos = 0,
        Estado = 'No Disponible'
WHERE Id = 3
;
```

![](images/p2-05.5-queries-001.png)

\newpage

```sql
-- Devolvemos las naves al planeta:
UPDATE NavesPlanetas
    SET Cantidad = Cantidad + 20
WHERE Id_Planeta = (SELECT Id FROM Planetas WHERE Nombre = 'Stellar Haven')
AND Id_Nave = (SELECT Id FROM Naves WHERE Nombre = 'Caza Estelar')
;
```

![](images/p2-05.5-queries-002.png)

\newpage

```sql
UPDATE NavesPlanetas
    SET Cantidad = Cantidad + 5
WHERE Id_Planeta = (SELECT Id FROM Planetas WHERE Nombre = 'Stellar Haven')
AND Id_Nave = (SELECT Id FROM Naves WHERE Nombre = 'Nave de Colonización')
;
```

![](images/p2-05.5-queries-003.png)

\newpage

```sql
UPDATE NavesPlanetas
    SET Cantidad = Cantidad + 10
WHERE Id_Planeta = (SELECT Id FROM Planetas WHERE Nombre = 'Stellar Haven')
AND Id_Nave = (SELECT Id FROM Naves WHERE Nombre = 'Transportador de Recursos')
;
```

![](images/p2-05.5-queries-004.png)

\newpage

```sql
-- Creamos la nueva Flota con:
-- - 50x Cazas Estelares
INSERT INTO Flotas (Id_Planeta, CazaEstelar, Estado)
VALUES (
    (SELECT Id FROM Planetas
    WHERE Nombre = 'Stellar Haven'),
    (SELECT Cantidad FROM NavesPlanetas NP
        INNER JOIN Naves N ON N.Id = NP.Id_Nave
        INNER JOIN Planetas P ON P.Id = NP.Id_Planeta
        WHERE P.Nombre = 'Stellar Haven' AND N.Nombre = 'Caza Estelar'
    ),
    'Disponible'
) -- esto resulta en Flota con ID = 4
;
```

![](images/p2-05.5-queries-005.png)

\newpage

```sql
-- Actualizamos las naves en Stellar Haven
UPDATE NavesPlanetas
    SET Cantidad = 0
WHERE Id_Planeta = (SELECT Id FROM Planetas WHERE Nombre = 'Stellar Haven')
AND Id_Nave = (SELECT Id FROM Naves WHERE Nombre = 'Caza Estelar')
;
```

![](images/p2-05.5-queries-006.png)

\newpage

```sql
-- Creamos la Exploracion
INSERT INTO Exploraciones (
    Id_Jugador, Id_Flota,
    CoordenadaXInicial, CoordenadaYInicial,
    CoordenadaXFinal, CoordenadaYFinal,
    FechaExploracionInicio, FechaExploracionFin,
    Estado
) VALUES (
    (SELECT Id FROM Jugadores WHERE Username = 'galactic_ruler'),
    4, -- Id_Flota => 4
    (SELECT CoordenadaX FROM Planetas WHERE Nombre = 'Stellar Haven'),
    (SELECT CoordenadaY FROM Planetas WHERE Nombre = 'Stellar Haven'),
    32, 1, -- Coordenadas finales X,Y
    NOW(), NOW() + INTERVAL '10 hours', -- fecha inicio, fecha fin
    'En Tránsito'   
);
```

![](images/p2-05.5-queries-007.png)

\newpage

```sql
UPDATE Flotas
    SET Estado = 'No Disponible'
WHERE Id = 4
;
```

![](images/p2-05.5-queries-008.png)

\newpage
