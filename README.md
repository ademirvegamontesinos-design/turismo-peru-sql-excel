# Análisis de Visitantes a Sitios Turísticos del Perú 2019-2025

Proyecto de análisis de datos usando información abierta de MINCETUR sobre visitantes a sitios turísticos del Perú entre 2019 y 2025.

![Dashboard](dashboard_turismo_peru.png)

# Introducción

El turismo es una de las actividades económicas más importantes del Perú, debido a su impacto en la generación de empleo, el desarrollo regional y la promoción del patrimonio cultural y natural del país. El análisis de los flujos turísticos permite comprender el comportamiento de los visitantes, identificar tendencias y evaluar el desempeño de los principales destinos turísticos.

El presente proyecto tiene como objetivo analizar la evolución de los visitantes a sitios turísticos del Perú durante el periodo 2019-2025 utilizando PostgreSQL y consultas SQL. Para ello, se emplearon datos abiertos proporcionados por el Ministerio de Comercio Exterior y Turismo (MINCETUR), los cuales contienen información sobre el número de visitantes, tipo de visitante, ubicación geográfica y periodo de registro.

A través de diferentes consultas SQL se realizaron análisis de visitantes por año, departamento, sitio turístico y tipo de visitante, además de evaluar la recuperación del sector turístico después del impacto generado por la pandemia de COVID-19. Finalmente, los resultados fueron presentados mediante indicadores clave (KPIs) y visualizaciones desarrolladas en Microsoft Excel, facilitando la interpretación de los hallazgos obtenidos.

## Objetivo

Analizar la evolución de visitantes a sitios turísticos del Perú, identificando tendencias anuales, principales destinos, distribución por tipo de visitante y recuperación post-pandemia.

## Herramientas utilizadas

- PostgreSQL
- pgAdmin
- Microsoft Excel
- SQL
## Modelo de Datos

Para el desarrollo del proyecto se utilizó PostgreSQL como sistema de gestión de bases de datos. La información fue almacenada en una tabla denominada visitantes_sitios_turisticos, la cual contiene los registros de visitantes a los principales sitios turísticos del Perú durante el periodo 2019-2025.
CREATE TABLE visitantes_sitios_turisticos (
    fecha_corte INTEGER,
    anio INTEGER,
    id_mes INTEGER,
    mes VARCHAR(20),
    departamento VARCHAR(100),
    sitio_turistico VARCHAR(255),
    tipo_visitante VARCHAR(20),
    numero_visitantes INTEGER
);
## Principales análisis realizados

- Visitantes totales por año.
- Comparación de visitantes nacionales vs extranjeros.
- Top 10 sitios turísticos más visitados.
- Visitantes por departamento.
- Recuperación del turismo entre 2019 y 2025.
- KPIs generales del periodo.

## Insights principales

- El turismo tuvo una caída significativa en 2020.
- Cusco y Lima concentran la mayor cantidad de visitantes registrados.
- El Circuito Mágico del Agua fue el sitio turístico con mayor número de visitantes.
- En 2025, el total de visitantes se encuentra 1.38% por debajo del nivel prepandemia de 2019.
- Los visitantes nacionales representan la mayor proporción del total analizado.

## Archivos del proyecto

- [`analisis_turismo_peru.sql`](analisis_turismo_peru.sql): consultas SQL utilizadas para el análisis.
- [`dashboard_turismo_peru.xlsx`](dashboard_turismo_peru.xlsx): dashboard desarrollado en Excel.
- [`dashboard_turismo_peru.png`](dashboard_turismo_peru.png): imagen final del dashboard.
- [`Visitantes_sitios_turisticos_2019_2025.csv`](Visitantes_sitios_turisticos_2019_2025.csv): dataset utilizado.

## Fuente de datos

Los datos fueron obtenidos de la Plataforma Nacional de Datos Abiertos del Perú:

[Visitantes a sitios turísticos del Perú - Ministerio de Comercio Exterior y Turismo (MINCETUR)](https://www.datosabiertos.gob.pe/dataset/visitantes-sitios-tur%C3%ADsticos-del-per%C3%BA-ministerio-de-comercio-exterior-y-turismo-mincetur)

Periodo analizado: 2019-2025.
