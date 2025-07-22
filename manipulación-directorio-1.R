##########################
# Manipulación de Datos 
##########################
# Local
install.packages(c("tidyverse", "readxl"))
library(tidyverse)
library(readxl)
getwd()
setwd("/Users/jmgi/Documents/Documents(iCloud)/AMEXCID-LAPTOP_06-04-2025/amexcid-dashboard-2025(v1)/AMEXCID-DASHBOARD-2025-v1")
##########################
directorio_prueba <- ("https://relacionesexteriores-my.sharepoint.com/:x:/g/personal/jmgonzalezi_cancilleria_sre_gob_mx/EYBQjk2K_0hMixSkoXLvqToBH1hGZrwBe3eFxZYIDX4sAw?e=KahW3z")
df_directorio_prueba <- as_data_frame(directorio_prueba)
class(df_directorio_prueba)
View(df_directorio_prueba)
##########################
# En-línea: Cargar a través de APIs
install.packages(c("jsonlite", "httr"))
library(jsonlite)
library(httr)
##########################

##########################