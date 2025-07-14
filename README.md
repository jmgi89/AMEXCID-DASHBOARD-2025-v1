# AMEXCID-DASHBOARD-2025-v1
## Última actualización: 14-07-2025

### Descripción: 
Desarrollo de plataforma digital para la Agencia Mexicana para la Cooperación internacional (AMEXCID).

#### Paquetes (Diseño GUI):
 ```{R, Paquetes}
# GUI-1
install.packages(c("shiny","shinydashboard"))
library(shiny)
library(shinydashboard)
# Manejo de Datos-2
install.packages(c("ggplot2","tidyverse"))
library(ggplot2)
library(tidyverse)
# Mapas-3
install.packages(c("tmap","rnaturalearth", "cartography"))
library(tmap)
library(rnaturalearth)
library(cartography)
# Manipulación de datos espaciales
install.packages(c("sf"))
library(sf)
 ```

### Lista de Contenido y Estructura

1. Página principal: Proyectos Activos de CID.

2. Mapas
   
3. Información Estadística
   
4. Instrumentos de Cooperación
   
5. Proyectos Activos
   
6. Directorios
   
  6.1. Directorio de Dependencias

   6.2.1. Directorios Internos 
  
   6.2.2. Directorio de SRE
  
   6.2.3. Directorio de AMEXCID
  
##### Documentación de Paquetes
1 [shinydashboard](https://rstudio.github.io/shinydashboard/).

2. Rnaturalearth.
   
2.1. [Documentación Oficial](https://www.naturalearthdata.com/). Exporta información geoespacial como Vectores o Raster. 

2.2. [Documentación Externo](https://www.rdocumentation.org/packages/rnaturalearth/versions/0.0.0.9000).

3. [Cartography](https://cran.r-project.org/web/packages/cartography/vignettes/cartography.html).
