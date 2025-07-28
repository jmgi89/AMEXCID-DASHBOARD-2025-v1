######### Shiny Syntax Dashboard ######
#######################################
library(shiny)
library(shinydashboard)
library(readxl)
library(tidyverse)
install.packages("arcgis") # Incompatible con el sistema operativo. FUENTE: esri.com/arcgis-blog/products/developers/announcements/announcing-archgis-r-package
library(arcgis)
warnings()
################ UI ####################
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
# Server --------------------------------------
server <- function(input, output) {}
# ---------------------------------------------
# App
shinyApp(ui, server)

########## Option-3: Paquetes (FAIL) #########
install.packages(c("shiny", "bslib"))
#######################################
library(shiny)
library(bslib)
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
######## Opción-4: shinydashboard ######
library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  skin = "red",
  
  # HEADER
  dashboardHeader(
    title = span("Sistema de Gestión de AMEXCID", titleWidth = 450, style = "font-family: 'Noto Sans'; font-size: 20px")
  ),
  
  # SIDEBAR MENU
  dashboardSidebar(
    sidebarMenu(
      menuItem("Mapa", tabName = "tab1", icon = icon("globe")),
      menuItem("Estadísticas", tabName = "tab2", icon = icon("chart-bar")),
      menuItem("Proyectos", tabName = "tab3", icon = icon("project-diagram")),
      menuItem("Instrumentos", tabName = "tab4", icon = icon("file-alt")),
      menuItem("Contrapartes", tabName = "tab5", icon = icon("users")),
      menuItem("Directorios", tabName = "tab6", icon = icon("address-book"))
    )
  ),
  
  # MAIN BODY WITH BOXES IN EACH TAB
  dashboardBody(
    tabItems(
      tabItem(tabName = "tab1",
              box(title = "Mapa Interactivo", status = "primary", solidHeader = TRUE, width = 12,
                  p("Aquí irá el mapa con funciones de descarga.")
              )
      ),
      
      tabItem(tabName = "tab2",
              box(title = "Estadísticas", status = "info", solidHeader = TRUE, width = 12,
                  p("Visualizaciones estadísticas.")
              )
      ),
      
      tabItem(tabName = "tab3",
              box(title = "Proyectos", status = "success", solidHeader = TRUE, width = 12,
                  p("Listado y detalles de proyectos activos.")
              )
      ),
      
      tabItem(tabName = "tab4",
              box(title = "Instrumentos de Cooperación", status = "warning", solidHeader = TRUE, width = 12,
                  p("Instrumentos disponibles.")
              )
      ),
      
      tabItem(tabName = "tab5",
              box(title = "Contrapartes Internacionales", status = "danger", solidHeader = TRUE, width = 12,
                  p("Listado de contrapartes como JICA, KOICA, etc.")
              )
      ),
      
      tabItem(tabName = "tab6",
              box(title = "Directorios", status = "secondary", solidHeader = TRUE, width = 12,
                  p("Directorios institucionales con enlaces.")
              )
      )
    )
  )
)

server <- function(input, output) {}

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
################# Option-5: Sonnet (OK) ###################
# Load required libraries
library(shiny)
library(shinydashboard)
library(ggplot2)
library(tidyverse)
library(tmap)
library(leaflet)

# Sample data for demonstration
# Replace this with your actual data
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
              box(title = "Mapa Interactivo", status = "primary", solidHeader = TRUE, 
                  leafletOutput("map", height = 500),
                  downloadButton("downloadMap", "Descargar Mapa"))
      ),
      tabItem(tabName = "tab2", 
              h2("Estadísticas"), 
              box(title = "Gráficos Estadísticos", status = "primary", solidHeader = TRUE, 
                  plotOutput("statPlot"))
      ),
      tabItem(tabName = "tab3", 
              h2("Proyectos"), 
              box(title = "Listado de Proyectos", status = "primary", solidHeader = TRUE, 
                  p("Listado y detalles de proyectos activos."))
      ),
      tabItem(tabName = "tab4", 
              h2("Instrumentos"), 
              box(title = "Instrumentos de Cooperación", status = "primary", solidHeader = TRUE, 
                  p("Instrumentos de cooperación disponibles."))
      ),
      tabItem(tabName = "tab5", 
              h2("Contrapartes"), 
              box(title = "Contrapartes Extranjeras", status = "primary", solidHeader = TRUE, 
                  p("Contrapartes extranjeras registradas."))
      ),
      tabItem(tabName = "tab6", 
              h2("Directorios"), 
              box(title = "Directorios de Dependencias", status = "primary", solidHeader = TRUE, 
                  p("Directorios de dependencias y contactos."))
      ),
      tabItem(tabName = "tab7", 
              h2("Convocatorias"), 
              box(title = "Convocatorias Abiertas", status = "primary", solidHeader = TRUE, 
                  p("Convocatorias abiertas y futuras."))
      ),
      tabItem(tabName = "tab8", 
              h2("Sistemas de Gestión"), 
              box(title = "EPIs", status = "primary", solidHeader = TRUE, 
                  p("EPIs."))
      ),
      tabItem(tabName = "tab9", 
              h2("Tickets IT"), 
              box(title = "Colaboración IT", status = "primary", solidHeader = TRUE, 
                  p("Incorporar colaboración con Mister Fides."))
      )
    )
  )
)

# Server
server <- function(input, output) {
  
  # Render Leaflet map
  output$map <- renderLeaflet({
    leaflet(data = world_map) %>%
      addTiles() %>%
      addPolygons(fillColor = "blue", weight = 1, opacity = 1, color = "white", 
                  fillOpacity = 0.7, highlightOptions = highlightOptions(weight = 2, color = "white", 
                                                                         fillOpacity = 0.7, bringToFront = TRUE)) %>%
      setView(lng = 0, lat = 20, zoom = 2)
  })
  
  # Downloadable map
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
  
  # Render statistical plot
  output$statPlot <- renderPlot({
    ggplot(un_population, aes(x = , y = mpg)) +
      geom_point() +
      theme_minimal() +
      labs(title = "Relación entre Peso y MPG", x = "Peso (wt)", y = "Millas por Galón (mpg)")
  })
}

# Run the application 
shinyApp(ui, server)
