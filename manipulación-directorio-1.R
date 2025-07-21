##########################
# Manipulación de Datos 
##########################
library(tidyverse)
library(readxl)
getwd()
##########################
directorio_prueba <- read_excel("/Users/jmgi/Documents/AMEXCID-LAPTOP_06-04-2025/amexcid-dashboard-2025(v1)/datos-directorios/datos-directorios/DIRECTORIO-EMBAJADAS-avance-140725.xlsx")
df_directorio_prueba <- as_data_frame(directorio_prueba)
class(df_directorio_prueba)
##########################

##########################