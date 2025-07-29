########## Manipulación de Datos Locales ################
install.packages(c("tidyverse", "readxl"))
library(tidyverse)
library(readxl)
getwd()
setwd("/Users/jmgi/Documents/Documents(iCloud)/AMEXCID-LAPTOP_06-04-2025/amexcid-dashboard-2025(v1)/AMEXCID-DASHBOARD-2025-v1")
########## En-línea: Cargar a través de APIs ################
# Data Portal UN Population Division: population.un.org/dataportal/about/dataapi
################ Lista de Indicadores APIS ##################
library(jsonlite)
library(httr)
# Declares the base url for calling the API
base_url <- "https://population.un.org/dataportalapi/api/v1"

# Creates the target URL, indicators, in this instance
target <- paste0(base_url, "/indicators/")

# Get the response, which includes data as well as information on pagination and number of records
response <- fromJSON(target)

# Get the first page of data
un_population <- response$data
un_population
view(un_population)

# Loop until there are new pages with data
while (!is.null(response$nextPage)){
  
  #call the API for the next page
  response <- fromJSON(response$nextPage)
  
  #add the data of the new page to the data.frame with the data of the precious pages
  un_population <- rbind(df, response$data)
  
}

# DATA INSPECTION
colnames(un_population)
select(un_population,)
??select
########## DATA WRANGLING: PAQUETES R ###############
# Paquete Comisión Económica para América Latina y el Caribe (CEPAL) (simplificación de API-CEPAL)
  # Metodología FAIL
install.packages("CepalStatR")
library(CepalStatR)
??CepalStatR
indicadores <- call.indicators(language.en = F)
indicadores
# Error unexpected tokens '>' y '%': 
  # indicadores %>& group_by(Área, Dimensión) %>% count() 
########## DATA WRANGLING: Authorization Access Token for APIs #################
install.packages("httr2")
library(httr2)
# Token Stored in an environment variable named "MY_API_TOKEN"
access_token <- Sys.getenv("MY_API_TOKEN")
# Solicitud del portador del Token
request <- request("")
########################### DATA WRANGLING: API ################################
# Declares the base url for calling the API
base_url <- ""

# Creates the target URL, indicators, in this instance
target <- paste0(base_url, "/indicators/")

# Get the response, which includes data as well as information on pagination and number of records
response <- fromJSON(target)

# Get the first page of data
un_population <- response$data
un_population
view(un_population)

# Loop until there are new pages with data
while (!is.null(response$nextPage)){
  
  #call the API for the next page
  response <- fromJSON(response$nextPage)
  
  #add the data of the new page to the data.frame with the data of the precious pages
  un_population <- rbind(df, response$data)
################ FAOSTAT - LOCAL ################
library(tidyverse)
library(readxl)
state_of_the_world_2025 <- read_csv("/Users/jmgi/Documents/Documents/datos-prueba/clean_swop_demographic_2025.csv")
view(state_of_the_world_2025)
################ FAOSTAT - FIN ################