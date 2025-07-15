#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
#######################################
# Shiny Syntax Dashboard
#######################################
# Opción-2 (OK)
#######################################
library(shiny)
library(shinydashboard)
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
            menuItem("Convocatorias", tabName = "tab7", icon = icon("bullhorn"))
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
            tabItem(tabName = "tab7", h2("Convocatorias"), p("Convocatorias abiertas y futuras."))
        )
    )
)
# Server
server <- function(input, output) {}
# App
shinyApp(ui, server)
#######################################