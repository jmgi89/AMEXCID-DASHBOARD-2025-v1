#######################################
# Shiny Syntax Dashboard
    # Opción-2 (OK)
#######################################
library(shiny)
library(shinydashboard)
library(readxl)
library(tidyverse)
#######################################
# UI
ui <- dashboardPage(
    skin = "red",  # Optional: sets dashboard theme color
    dashboardHeader(title = span("AMEXCID Dashboard", style = "font-family: 'Noto Sans'; font-size: 20px")),
    
    dashboardSidebar(
        sidebarMenu(
            menuItem("Mapa", tabName = "tab1", icon = icon("globe")),
            menuItem("Estadísticas", tabName = "tab2", icon = icon("chart-bar")),
            menuItem("Proyectos", tabName = "tab3", icon = icon("project-diagram")),
            menuItem("Instrumentos", tabName = "tab4", icon = icon("file-alt")),
            menuItem("Contrapartes", tabName = "tab5", icon = icon("users")),
            menuItem("Directorios", tabName = "tab6", icon = icon("address-book")),
            menuItem("Convocatorias", tabName = "tab7", icon = icon("bullhorn")),
            menuItem("Sistemas de Gestión", tabName = "tab8", icon = icon("list")), # de lugar de Sistema de Folio, cambiar a Sistema de Gestión Incorporar a box() Login Credenciales
            menuItem("Tickets IT", tabName = "tab9", icon = icon("computer"))
        )
    ),
    
    dashboardBody(
        # Load Google Font
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
            tabItem(tabName = "tab1", h2("Mapa"), p("Contenido de mapas descargables aquí.")),
            tabItem(tabName = "tab2", h2("Estadísticas"), p("Información estadística relevante.")),
            tabItem(tabName = "tab3", h2("Proyectos"), p("Listado y detalles de proyectos activos.")),
            tabItem(tabName = "tab4", h2("Instrumentos"), p("Instrumentos de cooperación disponibles.")),
            tabItem(tabName = "tab5", h2("Contrapartes"), p("Contrapartes extranjeras registradas.")),
            tabItem(tabName = "tab6", h2("Directorios"), p("Directorios de dependencias y contactos.")),
            tabItem(tabName = "tab7", h2("Convocatorias"), p("Convocatorias abiertas y futuras.")),
            tabItem(tabName = "tab8", h2("Folios"), p("EPIs.")),
            tabItem(tabName = "tab9", h2("Tickets IT"), p("Incorporar colaboración con Mister Fides."))
        )
    )
)
# Server -------------------------------------------------------
server <- function(input, output) {}
# --------------------------------------------------------------

# App
shinyApp(ui, server)
#######################################
  # Option-3: Box() syntax
#######################################
library(shiny)
library(shinydashboard)
library(bslib)

# UI ------------------------------------
library(shiny)
library(shinydashboard)
library(bslib)
library(leaflet)

# UI --------------------------------------
ui <- dashboardPage(
  skin = "red",
  
  dashboardHeader(
    title = span("AMEXCID Dashboard", style = "font-family: 'Noto Sans'; font-size: 20px")
  ),
  
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
      # MAPA TAB WITH DYNAMIC MAP
      tabItem(tabName = "tab1",
              box(title = "Mapa Interactivo de Proyectos", status = "primary", solidHeader = TRUE, width = 12,
                  leafletOutput("leaflet_mapa", height = 500)
              )
      ),
      
      tabItem(tabName = "tab2",
              box(title = "Indicadores Estadísticos", status = "info", solidHeader = TRUE, width = 12,
                  p("Información estadística relevante."))
      ),
      
      tabItem(tabName = "tab3",
              box(title = "Proyectos en Curso", status = "success", solidHeader = TRUE, width = 12,
                  p("Listado y detalles de proyectos activos."),
                  downloadButton("downloadMapa", "Descargar mapa del proyecto")
              )
      ),
      
      tabItem(tabName = "tab4",
              box(title = "Instrumentos de Cooperación", status = "warning", solidHeader = TRUE, width = 12,
                  p("Instrumentos de cooperación disponibles."))
      ),
      
      tabItem(tabName = "tab5",
              box(title = "Contrapartes Internacionales", status = "danger", solidHeader = TRUE, width = 12,
                  p("Contrapartes extranjeras registradas."))
      ),
      
      tabItem(tabName = "tab6",
              box(title = "Directorios Institucionales", status = "primary", solidHeader = TRUE, width = 12,
                  p("Directorios de dependencias y contactos."))
      ),
      
      tabItem(tabName = "tab7",
              box(title = "Convocatorias Vigentes", status = "info", solidHeader = TRUE, width = 12,
                  p("Convocatorias abiertas y futuras."))
      ),
      
      tabItem(tabName = "tab8",
              box(title = "Sistema de Gestión", status = "success", solidHeader = TRUE, width = 12,
                  textInput("user", "Usuario"),
                  passwordInput("pass", "Contraseña"),
                  actionButton("login", "Iniciar sesión"))
      ),
      
      tabItem(tabName = "tab9",
              box(title = "Tickets de Soporte Técnico", status = "warning", solidHeader = TRUE, width = 12,
                  p("Incorporar colaboración con Mister Fides."))
      )
    )
  ),
  
  theme = bs_theme(
    base_font = font_google("Noto Sans"),
    primary = "#D9534F",  # red skin match
    bootswatch = "flatly"
  )
)

# SERVER ----------------------------------
server <- function(input, output, session) {
  
  # DYNAMIC MAP
  output$leaflet_mapa <- renderLeaflet({
    leaflet() |>
      addProviderTiles(providers$CartoDB.Positron) |>
      setView(lng = -99.1332, lat = 19.4326, zoom = 5) |>
      addMarkers(
        lng = -99.1332, lat = 19.4326,
        popup = "CDMX - Proyecto 1"
      )
  })
  
  # MAP DOWNLOAD
  output$downloadMapa <- downloadHandler(
    filename = function() {
      paste("mapa_proyecto_", Sys.Date(), ".png", sep = "")
    },
    content = function(file) {
      # Replace with real output if available
      file.copy("www/placeholder-map.png", file)
    }
  )
}

# RUN --------------------------------------
shinyApp(ui, server)
#######################################
# manifest.json Output
install.packages("openssl")
library(openssl)
getwd()
writeManifest(
    appDir = getwd())
#######################################