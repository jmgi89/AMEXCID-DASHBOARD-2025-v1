getOption("defaultPackages")
########## Manipulación de Datos Locales ################
install.packages(c("tidyverse", "readxl"))
library(tidyverse)
library(readxl)
getwd()
setwd("/Users/jmgi/Documents/AMEXCID-LAPTOP_06-04-2025/amexcid-dashboard-2025(v1)/AMEXCID-DASHBOARD-2025-v1")
########## En-línea: Cargar a través de APIs ################
# Data Portal UN Population Division: population.un.org/dataportal/about/dataapi
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
# Paquete Comisión Económica para América Latina y el Caribe (CEPAL) (simplificación de API-CEPAL)
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
################################ FAOSTAT - LOCAL ################################
library(tidyverse)
library(readxl)
paises <- read_csv("/Users/jmgi/Documents/datos-prueba/20250730_swop_paises.csv")
regiones <- read_csv("/Users/jmgi/Documents/datos-prueba/20250730_swop_regiones.csv")
# iso3166 IDs
iso3166 <- read_csv("/Users/jmgi/Documents/datos-prueba/")
iso3166
summarize(iso3166)
class(iso3166)
################################ FAOSTAT - LOCAL - TROUBLESHOOTING ###############################
gráfica_prueba <- ggplot(state_of_the_world_2025, aes(x = País, y = Población_Total(millones))) + # Error aquí 
  geom_point() +
  theme_minimal() +
  labs(title = "Población Total 2025", x = "País", y = "Población Total (millones)")
############################################ FAOSTAT - FIN #######################################