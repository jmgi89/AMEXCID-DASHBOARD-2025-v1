# AMEXCID-DASHBOARD-2025-v1 (en desarrollo)
   ## Descripción del portal digital o Dashboard AMEXCID: 
La plataforma digital para la Agencia Mexicana para la Cooperación internacional (AMEXCID).

## Lista de Contenido y Estructura
### Última actualización: 14-07-2025

1. Menu Principal: Portal AMEXCID
   
   1.1. Proyectos Activos de CID.

      1.1.1. Fondo
   
      1.1.2. Títulos de Proyectos
   
      1.1.3. Descripción
   
      1.1.4. Duración
   
      1.1.5. Fechas tentativas de implementación
   
   1.2. Mapas
   
5. Instrumentos de Cooperación
   
6. Directorios

6.1. Directorios Externos
   
  6.1.1 Directorio de Dependencias

6.2.1. Directorios Internos 
  
   6.2.2. Directorio de SRE
  
   6.2.3. Directorio de AMEXCID
   
 8. Sistemas de Gestión
   8.1 Tickets IT
   8.2 Folios
   8.2.1 EPIs
   
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
##### Documentación de Paquetes
1 [shinydashboard](https://rstudio.github.io/shinydashboard/).

2. Rnaturalearth.
   
2.1. [Documentación Oficial](https://www.naturalearthdata.com/). Exporta información geoespacial como Vectores o Raster. 

2.2. [Documentación Externo](https://www.rdocumentation.org/packages/rnaturalearth/versions/0.0.0.9000).

3. [Cartography](https://cran.r-project.org/web/packages/cartography/vignettes/cartography.html).

##### Publicación 

-[Posit Connect.](https://docs.posit.co/connect-cloud/how-to/r/shiny-r.html)
