-- La sonda pasa por un campo de meteoritos -> la Exploracion se detiene
UPDATE Exploraciones
SET Estado = 'Detenido'
WHERE Id = 1 -- Id_Exploracion = 1
;
