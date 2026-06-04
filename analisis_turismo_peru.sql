-- 1. Vista rápida de la tabla
SELECT *
FROM visitantes_sitios_turisticos
LIMIT 10;


-- 2. Contar total de filas importadas
SELECT COUNT(*) AS total_filas
FROM visitantes_sitios_turisticos;


-- 3. Visitantes totales por año
SELECT
    anio,
    SUM(numero_visitantes) AS total_visitantes
FROM visitantes_sitios_turisticos
WHERE tipo_visitante = 'TOTAL'
GROUP BY anio
ORDER BY anio;


-- 4. Visitantes por tipo: nacional vs extranjero
SELECT
    tipo_visitante,
    SUM(numero_visitantes) AS total_visitantes
FROM visitantes_sitios_turisticos
WHERE tipo_visitante IN ('NACIONAL', 'EXTRANJERO')
GROUP BY tipo_visitante
ORDER BY total_visitantes DESC;


-- 5. Top 10 sitios turísticos más visitados
SELECT
    sitio_turistico,
    SUM(numero_visitantes) AS total_visitantes
FROM visitantes_sitios_turisticos
WHERE tipo_visitante = 'TOTAL'
GROUP BY sitio_turistico
ORDER BY total_visitantes DESC
LIMIT 10;

--6.  Top departamentos por visitantes
SELECT
     departamento,
	 SUM(numero_visitantes) AS total_visitantes
FROM visitantes_sitios_turisticos
WHERE tipo_visitante = 'TOTAL'
GROUP BY departamento
ORDER BY total_visitantes DESC
LIMIT 10;

--7. Visitantes por mes
Select 
      id_mes,
      mes,
	  SUM(numero_visitantes) AS total_visitantes
FROM visitantes_sitios_turisticos
WHERE tipo_visitante= 'TOTAL'
GROUP BY id_mes, mes
ORDER BY id_mes;

--8. tendencia mensual por año.
select
      anio,
	  id_mes,
	  mes,
	  SUM(numero_visitantes) AS total_visitantes
FROM visitantes_sitios_turisticos
where tipo_visitante= 'TOTAL'
group by anio, id_mes, mes
order by anio, id_mes;

-- 9. KPIs generales del periodo

SELECT
    SUM(CASE WHEN tipo_visitante = 'TOTAL' THEN numero_visitantes ELSE 0 END) AS total_visitantes,
    SUM(CASE WHEN tipo_visitante = 'NACIONAL' THEN numero_visitantes ELSE 0 END) AS visitantes_nacionales,
    SUM(CASE WHEN tipo_visitante = 'EXTRANJERO' THEN numero_visitantes ELSE 0 END) AS visitantes_extranjeros,
    COUNT(DISTINCT sitio_turistico) AS total_sitios_turisticos,
    COUNT(DISTINCT departamento) AS total_departamentos
FROM visitantes_sitios_turisticos;

--10. Comparación de visitantes 2019 vs 2025
SELECT
       anio,
SUM(numero_visitantes) AS total_visitantes
FROM visitantes_sitios_turisticos
where tipo_visitante= 'TOTAL'
and anio in (2019,2025)
group by anio
order by anio;

-- 11. Variación porcentual 2019 vs 2025
WITH visitantes_anuales AS (
    SELECT
        anio,
        SUM(numero_visitantes) AS total_visitantes
    FROM visitantes_sitios_turisticos
    WHERE tipo_visitante = 'TOTAL'
      AND anio IN (2019, 2025)
    GROUP BY anio
)
SELECT
    MAX(CASE WHEN anio = 2019 THEN total_visitantes END) AS visitantes_2019,
    MAX(CASE WHEN anio = 2025 THEN total_visitantes END) AS visitantes_2025,
    MAX(CASE WHEN anio = 2025 THEN total_visitantes END)
      - MAX(CASE WHEN anio = 2019 THEN total_visitantes END) AS diferencia_visitantes,
    ROUND(
        (
            MAX(CASE WHEN anio = 2025 THEN total_visitantes END)
            - MAX(CASE WHEN anio = 2019 THEN total_visitantes END)
        ) * 100.0
        / MAX(CASE WHEN anio = 2019 THEN total_visitantes END),
        2
    ) AS variacion_porcentual
FROM visitantes_anuales;

-- 12. Sitios turísticos con mayor crecimiento 2019 vs 2025
WITH visitantes_sitio AS (
    SELECT
        sitio_turistico,
        anio,
        SUM(numero_visitantes) AS total_visitantes
    FROM visitantes_sitios_turisticos
    WHERE tipo_visitante = 'TOTAL'
      AND anio IN (2019, 2025)
    GROUP BY sitio_turistico, anio
)
SELECT
    sitio_turistico,
    MAX(CASE WHEN anio = 2019 THEN total_visitantes END) AS visitantes_2019,
    MAX(CASE WHEN anio = 2025 THEN total_visitantes END) AS visitantes_2025,
    MAX(CASE WHEN anio = 2025 THEN total_visitantes END)
      - MAX(CASE WHEN anio = 2019 THEN total_visitantes END) AS crecimiento_visitantes
FROM visitantes_sitio
GROUP BY sitio_turistico
HAVING MAX(CASE WHEN anio = 2019 THEN total_visitantes END) IS NOT NULL
   AND MAX(CASE WHEN anio = 2025 THEN total_visitantes END) IS NOT NULL
ORDER BY crecimiento_visitantes DESC
LIMIT 10;
