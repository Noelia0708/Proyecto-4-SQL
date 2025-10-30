# 🎬 Proyecto de Análisis y Visualización de Contenido Multimedia Global

## 📋 1. Resumen del Proyecto

Este proyecto se enfoca en el **Análisis de un Conjunto de Datos Masivo de Títulos en las Principales Platafomas** (películas y series) para extraer *insights* clave sobre tendencias de producción, clasificación de contenido, actores más prolíficos y distribución geográfica, utilizando un pipeline completo de **SQL (MySQL)** y **Visualización de Datos con Python**.

El objetivo principal es transformar datos brutos en conocimiento estructurado, respondiendo preguntas clave sobre el catálogo global de contenido.

## 💾 2. Estructura de la Base de Datos (MySQL)

Se diseñó y construyó un esquema relacional normalizado en MySQL Workbench para manejar eficientemente la complejidad de las relaciones muchos-a-muchos (ej., un Título tiene muchos Actores y un Actor está en muchos Títulos).

### Tablas Principales:

* `titles`: Almacena la información principal de cada título (nombre, tipo, rating, etc.).
* `actors` / `directors`: Tablas de referencia para la información biográfica del reparto.
* `genres` / `countries` / `platforms` / `release_years` / `types`: Tablas de referencia para las dimensiones categóricas.
* `title_cast` / `title_director` / `title_country` / `title_genre`: **Tablas Puente** que gestionan las relaciones muchos-a-muchos.

### Metodología de Carga:

La carga de datos se realizó mediante la sentencia **`LOAD DATA INFILE`** de MySQL. Se requirió una fase de *debugging* intensiva para corregir errores críticos de:

* **Permisos:** `Error Code 1290` (Configuración de `secure_file_priv`).
* **Estructura:** `Error Code 1406` (Datos demasiado largos, solucionado con `ALTER TABLE ... TEXT`).
* **Integridad Referencial:** `Error Code 1452` (Fallo en la carga de la tabla `release_years`, bloqueando la tabla `titles`).

## 📊 3. Descubrimientos Clave (Insights)

El análisis de la base de datos se centró en las tendencias más importantes del catálogo, utilizando consultas SQL complejas (`JOIN`, `GROUP BY`, `WHERE`) y visualizando los resultados con Python.

### A. Geografía y Producción 🌍

* **Estados Unidos** es el país dominante en la producción de contenido, seguido de **India** (reflejando la potencia de Bollywood).

### B. Contenido y Rating 🍿

* El contenido con la clasificación **TV-MA** (Maduro) es el más frecuente en el catálogo, seguido por **TV-14** y **13+**, lo que indica un predominio de programas y series dirigidas a audiencias adultas y adolescentes.

### C. Talento Prolífico (Top 10) 🌟

El análisis del reparto en producciones de Estados Unidos reveló un fuerte crecimiento hacia el contenido animado, pero demostrando que el 'drama' sigue siendo el número 1 en preferencias.

* **Actores:** **Jim Cummings** lidera con 38 apariciones, una tendencia común en *datasets* que incluyen vastos catálogos de animación (donde los actores de voz son muy prolíficos). **Samuel L. Jackson** y **Nicolas Cage** se mantienen en el top como figuras clave del cine.

* **Directores:** El top está dominado por directores históricos de **animación Disney** como **Jack Hannah** y **Wilfred Jackson**, junto a figuras modernas de la industria de animación como **John Lasseter**. **Steven Spielberg** también aparece en el ranking.

### D. Distribución y Duración 📺

* **Distribución por Plataforma:** La plataforma **Prime** tiene el mayor volumen total de títulos, pero **Netflix** domina en series.
* **Duración:** El formato **"1 Season"** es el más frecuente, lo que indica una alta proporción de miniseries o series que no fueron renovadas. Las películas se concentran alrededor del estándar de **90 minutos**.

## 📁 Estructura del Proyecto

El repositorio se organiza de la siguiente manera:

* 📁 Data - Archivos con los datos base del estudio
* 📁 Notebooks - Archivos **SQL (MySQL)** y Archivo **Visualización de Datos con Python**.
* 📁 Presentación - Diagrama EER, Presentación y Gráficos

## 🛠️ 4. Tecnologías Utilizadas

* **Base de Datos:** MySQL
* **Lenguaje de Consulta:** SQL
* **Análisis y Visualización:** Python (Pandas, Matplotlib, Seaborn)

## 🧑‍💻 Créditos

 * **Autores:** David Barrero V. y Noelia Martín
 * **Bootcamp:** IRONHACK - Análisis de Datos

## 📜 Licencia

Este proyecto está bajo la Licencia MIT.