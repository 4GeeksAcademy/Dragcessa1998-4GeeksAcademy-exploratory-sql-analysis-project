SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;


-- MISSION 1
-- Your query here;
--- Nivel 1 – Exploración básica (SELECT, LIMIT, DISTINCT, WHERE)
--¿Cuáles son las primeras 10 observaciones registradas?
--Utiliza LIMIT para mostrar solo una parte de la tabla.

--¿Qué identificadores de región (region_id) aparecen en los datos?
--Usa SELECT DISTINCT para evitar repeticiones.

--¿Cuántas especies distintas (species_id) se han observado?
--Combina COUNT con DISTINCT para no contar duplicados.

--¿Cuántas observaciones hay para la región con region_id = 2?
--Aplica una condición con WHERE.

--¿Cuántas observaciones se registraron el día 1998-08-08?
--Filtra por fecha exacta usando igualdad;




SELECT *
FROM observations
LIMIT 10;

SELECT DISTINCT region_id
FROM observations;

SELECT COUNT(DISTINCT species_id)
FROM observations;

SELECT COUNT(*)
FROM observations
WHERE region_id = 2;

SELECT COUNT(*)
FROM observations
WHERE observation_date = '1998-08-08';




-- MISSION 2
-- Your query here;
--Nivel 2 – Agregación y ordenamiento (GROUP BY, COUNT, ORDER BY, HAVING sin JOIN)
--¿Cuál es el region_id con más observaciones?
--Agrupa por región y cuenta cuántas veces aparece cada una.

--¿Cuáles son los 5 species_id más frecuentes?
--Agrupa, ordena por cantidad descendente y limita el resultado.

--¿Qué especies (species_id) tienen menos de 5 registros?
--Agrupa por especie y usa HAVING para aplicar una condición.

--¿Qué observadores (observer) registraron más observaciones?
--Agrupa por el nombre del observador y cuenta los registros;



SELECT region_id, COUNT(*) AS total_observaciones
FROM observations
GROUP BY region_id
ORDER BY total_observaciones DESC
LIMIT 1;
 
SELECT species_id, COUNT(*) AS total
FROM observations
GROUP BY species_id
ORDER BY total DESC
LIMIT 5;

SELECT species_id, COUNT(*) AS total
FROM observations
GROUP BY species_id
HAVING COUNT(*) < 5;

SELECT observer, COUNT(*) AS total_observaciones
FROM observations
GROUP BY observer
ORDER BY total_observaciones DESC;


-- MISSION 3
-- Your query here;
--Nivel 3 – Relaciones entre tablas (JOIN)
--Muestra el nombre de la región (regions.name) para cada observación.
--Relaciona observations con regions usando region_id.

--Muestra el nombre científico de cada especie registrada (species.scientific_name).
--Relaciona observations con species usando species_id.

--¿Cuál es la especie más observada por cada región?
--Agrupa por región y especie, y ordena por cantidad;

SELECT o.*, r.name
FROM observations o
JOIN regions r
ON o.region_id = r.id;

SELECT o.*, s.scientific_name
FROM observations o
JOIN species s
ON o.species_id = s.id;

SELECT r.name, s.scientific_name, COUNT(*) AS total
FROM observations o
JOIN regions r ON o.region_id = r.id
JOIN species s ON o.species_id = s.id
GROUP BY r.name, s.scientific_name
ORDER BY r.name, total DESC;









