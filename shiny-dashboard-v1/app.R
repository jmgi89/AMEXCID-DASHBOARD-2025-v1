######### Shiny Dashboard Package #####
library(shiny)
library(bslib)
################# Buena Opción: Sistema de Gestión de AMEXCID (SiGA) (OK) #########
# Librerías
  # Shiny
library(shiny)
library(shinydashboard)
  # Visualización de Datos
library(ggplot2)
library(tidyverse)
  # Mapas interactivos
library(tmap)
library(leaflet)
  # Tablas Interactivas
library(reactable)
################# Script (OK) ###################
# ESQUELETO
# Datos para el mapa mundial
world_map <- map_data("world")

# UI
ui <- dashboardPage(
  skin = "blue",
  dashboardHeader(title = span("Sistema de Gestión de AMEXCID (SiGA)", style = "font-family: 'Noto Sans'; font-size: 20px")),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Mapa", tabName = "tab1", icon = icon("globe")),
      menuItem("Estadísticas", tabName = "tab2", icon = icon("chart-bar")),
      menuItem("Proyectos", tabName = "tab3", icon = icon("project-diagram")),
      menuItem("Instrumentos", tabName = "tab4", icon = icon("file-alt")),
      menuItem("Contrapartes", tabName = "tab5", icon = icon("users")),
      menuItem("Directorios", tabName = "tab6", icon = icon("address-book")),
      menuItem("Convocatorias", tabName = "tab7", icon = icon("bullhorn")),
      menuItem("Sistemas de Gestión", tabName = "tab8", icon = icon("list")),
      menuItem("Tickets IT", tabName = "tab9", icon = icon("computer"))
    )
  ),
  
  dashboardBody(
    tags$head(
      tags$link(href = "https://fonts.googleapis.com/css2?family=Noto+Sans&display=swap", rel = "stylesheet"),
      tags$style(HTML("
        body {
          font-family: 'Noto Sans', sans-serif;
          font-size: 14px;
        }
        .main-header .logo, .main-header .navbar {
          font-family: 'Noto Sans', sans-serif;
          font-size: 20px;
        }
      "))
    ),
    
    tabItems(
      tabItem(tabName = "tab1", 
              h2("Mapa"), 
              fluidRow(
                box(title = "Mapa Descargable", width = 6, status = "primary", solidHeader = TRUE, 
                    leafletOutput("map", height = 400),
                    downloadButton("downloadMap", "Descargar Mapa")),
                box(title = "Descripción", width = 6, status = "info", solidHeader = TRUE,
                    p("Este mapa interactivo muestra información relevante para proyectos AMEXCID."))
              )
      ),
      
      tabItem(tabName = "tab2", 
              h2("Estadísticas"), 
              fluidRow(
                box(title = "Gráficos Estadísticos", width = 12, status = "primary", solidHeader = TRUE, 
                    plotOutput("statPlot"))
              )
      ),
      
      tabItem(tabName = "tab3", 
              h2("Proyectos"), 
              fluidRow(
                box(title = "Listado de Proyectos", width = 6, status = "primary", solidHeader = TRUE, 
                    p("Listado y detalles de proyectos activos.")),
                box(title = "Estadísticas de Proyectos", width = 6, status = "info", solidHeader = TRUE,
                    p("Visualización de indicadores por proyecto."))
              )
      ),
      
      tabItem(tabName = "tab4", 
              h2("Instrumentos"), 
              fluidRow(
                box(title = "Instrumentos de Cooperación", width = 12, status = "primary", solidHeader = TRUE, 
                    p("Instrumentos de cooperación disponibles."))
              )
      ),
      
      tabItem(tabName = "tab5", 
              h2("Contrapartes"), 
              fluidRow(
                box(title = "Contrapartes Extranjeras", width = 12, status = "primary", solidHeader = TRUE, 
                    p("Contrapartes extranjeras registradas."))
              )
      ),
      
      tabItem(tabName = "tab6", 
              h2("Directorios"), 
              fluidRow(
                box(title = "Directorios de Dependencias", width = 12, status = "primary", solidHeader = TRUE, 
                    p("Directorios de dependencias y contactos."))
              )
      ),
      
      tabItem(tabName = "tab7", 
              h2("Convocatorias"), 
              fluidRow(
                box(title = "Convocatorias Abiertas", width = 12, status = "primary", solidHeader = TRUE, 
                    p("Convocatorias abiertas y futuras."))
              )
      ),
      
      tabItem(tabName = "tab8", 
              h2("Sistemas de Gestión"), 
              fluidRow(
                box(title = "EPIs", width = 12, status = "primary", solidHeader = TRUE, 
                    p("EPIs."))
              )
      ),
      
      tabItem(tabName = "tab9", 
              h2("Tickets IT"), 
              fluidRow(
                box(title = "Colaboración IT", width = 12, status = "primary", solidHeader = TRUE, 
                    p("Incorporar colaboración con Mister Fides."))
              )
      )
    )
  )
)
# Server
server <- function(input, output) {
  
  # Render mapa Leaflet 
  output$map <- renderLeaflet({
    leaflet(data = world_map) %>%
      addTiles() %>%
      addPolygons(fillColor = "blue", weight = 1, opacity = 1, color = "white", 
                  fillOpacity = 0.7, highlightOptions = highlightOptions(weight = 2, color = "white", 
                                                                         fillOpacity = 0.7, bringToFront = TRUE)) %>%
      setView(lng = 0, lat = 20, zoom = 2)
  })
  
  # Mapa descargable
  output$downloadMap <- downloadHandler(
    filename = function() {
      paste("map_", Sys.Date(), ".png", sep = "")
    },
    content = function(file) {
      png(file)
      print(leaflet(data = world_map) %>%
              addTiles() %>%
              addPolygons(fillColor = "blue", weight = 1, opacity = 1, color = "white", 
                          fillOpacity = 0.7))
      dev.off()
    }
  )
  
  # Dato Estadísitco
  output$statPlot <- renderPlot({
    ggplot(un_population, aes(x = , y = mpg)) + # Añadir Variables 
      geom_point() +
      theme_minimal() +
      labs(title = "Relación entre Peso y MPG", x = "Peso (wt)", y = "Millas por Galón (mpg)")
  })
}
??gapminder
# Run the application 
shinyApp(ui, server)
########### FIN v1: Sistema de Gestión de AMEXCID (SiGA)  ###################

############ Esqueleto ################
ui <- page_sidebar(
  title = "Sistema de Gestión de AMEXCID (SiGA)",
  sidebar = "Sidebar", 
  "Menu Principal"
)

shinyApp(ui, function(input, output) {})
############## Adaptación ##############
library(ggplot2)
data(df, package = "palmerdf")

ui <- page_sidebar(
  title = "df dashboard",
  sidebar = sidebar(
    title = "Histogram controls",
    varSelectInput(
      "var", "Select variable",
      dplyr::select_if(penguins, is.numeric)
    ),
    numericInput("bins", "Number of bins", 30)
  ),
  card(
    card_header("Histogram"),
    plotOutput("p")
  )
)

server <- function(input, output) {
  output$p <- renderPlot({
    ggplot(penguins) +
      geom_histogram(aes(!!input$var), bins = input$bins) +
      theme_bw(base_size = 20)
  })
}

shinyApp(ui, server)
###### manifest.json (FAIL) ########
# APUNTES DEL FAIL: 
  # Versión de RStudio incompatible 
# manifest.json Output
install.packages("openssl")
library(openssl)
getwd()
writeManifest(
  appDir = getwd())