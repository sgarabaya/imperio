-- Detenemos la exploracion de galactic_ruler, cambiamos las coordenadas finales
UPDATE Exploraciones
    SET Estado = 'Detenido',
        CoordenadaXFinal = 10,
        CoordenadaYFinal = 21
WHERE Id = 2
;
