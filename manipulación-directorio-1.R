getOption("defaultPackages")
########## Manipulación de Datos Locales ################
install.packages(c("tidyverse", "readxl"))
library(tidyverse)
library(readxl)
getwd()
setwd("/Users/jmgi/Documents/AMEXCID-LAPTOP_06-04-2025/amexcid-dashboard-2025(v1)/AMEXCID-DASHBOARD-2025-v1")
########## En-línea: Cargar a través de APIs ################
# regiones Portal UN Population Division: population.un.org/dataportal/about/dataapi
################ Lista de Indicadores APIs ##################
library(jsonlite)
library(httr)
# Declares the base url for calling the API
base_url <- "https://api-cepalstat.cepal.org/apispec_1.json"

# Creates the target URL, indicators, in this instance
target <- paste0(base_url, "/indicators/")

# Get the response, which includes data as well as information on pagination and number of records
response <- fromJSON(target)

# Get the first page of data
cepalstat_prueba <- response$data
view()

# Loop until there are new pages with data
while (!is.null(response$nextPage)){
  
  #call the API for the next page
  response <- fromJSON(response$nextPage)
  
  #add the data of the new page to the data.frame with the data of the precious pages
  un_population <- rbind(df, response$data)
  
}

# DATA INSPECTION

########## DATA WRANGLING: PAQUETES R ###############
# Paquete Experimental Comisión Económica para América Latina y el Caribe (CEPAL) (simplificación de API-CEPAL)
  # Metodología FAIL Error 404
install.packages("CepalStatR")
library(CepalStatR)
??CepalStatR
indicadores_cepal <- call.indicators(language.en = F)
indicadores_cepal
summary(indicadores)
# Error unexpected tokens '>' y '%': 
  # indicadores %>& group_by(Área, Dimensión) %>% count() 
########## DATA WRANGLING: UN Population Portal Authorization Access Token for APIs #################
install.packages("httr2")
library(httr2)
# Token Stored in an environment variable named "MY_API_TOKEN"
access_token <- Sys.getenv("MY_API_TOKEN")
# Solicitud del portador del Token
request <- request("")
########################### DATA WRANGLING: API ################################
library(jsonlite)
library(httr)
################################ State of the World UN Population Division - LOCAL ################################
# FUENTE: https://www.unfpa.org/swp2024
  # UNFPA o United Nations Population Fund ofrece población anual de todos los países y regiones afiliadas al sistema de las Naciones Unidas
    # Datos relevantes hacia el desarrollo de un  país:
      # Población Mundial Anual-2025, para este caso.
        # Tasa de fertilidad (combate envejecimiento poblacional y afecta indirectamente la Población Activa de un país). 
library(tidyverse)
library(readxl)
# iso3166 IDs
iso3166 <- read_csv("/Users/jmgi/Documents/datos-prueba/clean-data/iso3166-Ids.csv")
iso3166
# Países 
paises <- read_csv("/Users/jmgi/Documents/datos-prueba/clean-data/20250730_swop_paises.csv")
# Regiones
regiones <- read_csv("/Users/jmgi/Documents/datos-prueba/clean-data/20250730_swop_regiones.csv")
############################################# DATA WRANGLING PAISES E ISO3166-1ALPHA3 ####################################################
# Inspeccionar Datos con los códigos correspondientes
view(iso3166)
# Eliminar Columna 
iso3166$`iso3166-Numeric` <- NULL
view(iso3166)

a <- iso3166
b <- paises
iso_paises <- left_join(a, b, by = "pais")
################################ FAOSTAT - LOCAL - TROUBLESHOOTING ###############################
library(ggplot2)
pais_gráfica <- ggplot(paises, aes(x = pais, y = Población_Total_millones)) +
    geom_point() +
    theme_minimal() +
    labs(title = "Población Total 2025", x = "Regiones", y = "Población Total (millones)")
pais_gráfica
# Load required packages
install.packages(c("tmap", "leaflet", "ggplot2", "sf", "rnaturalearth", "readr", "dplyr"))
library(tmap)
library(leaflet)
library(ggplot2)
library(sf)
library(rnaturalearth)
library(readr)
library(dplyr)

# Países
data <- read_csv("/Users/jmgi/Documents/datos-prueba/clean-data/20250730_swop_paises.csv")

# Load world map with ISO alpha-3 codes
world <- ne_countries(scale = "medium", returnclass = "sf")

# Join user data to world spatial data
world_data <- left_join(world, data, by = c("iso_a3" = "country_code"))

# ---- tmap static map ----
tmap_mode("plot")
tm_shape(world_data) +
  tm_polygons("value", palette = "Blues", title = "Your Data") +
  tm_layout(title = "World Map (tmap)")

# ---- leaflet interactive map ----
pal <- colorNumeric("Blues", domain = world_data$value)
leaflet(world_data) %>%
  addTiles() %>%
  addPolygons(
    fillColor = ~pal(value),
    fillOpacity = 0.7,
    color = "white",
    weight = 1,
    popup = ~paste(name, "<br>Value:", value)
  )

# ---- ggplot2 static map ----
ggplot(world_data) +
  geom_sf(aes(fill = value)) +
  scale_fill_viridis_c(option = "plasma", na.value = "lightgray") +
  theme_minimal() +
  labs(title = "World Map (ggplot2)", fill = "Value")

############################################ FAOSTAT - FIN #######################################