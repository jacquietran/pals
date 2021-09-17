library(shiny)

# Define UI ----
ui <- fluidPage(
  
  # App title
  titlePanel("Buddy ol' pals"),
  
  # Sidebar
  sidebarLayout(
    sidebarPanel(
      
      # Inputs
      fluidRow(
        column(10,
               selectInput(
                 inputId = "select",
                 label = h3("Choose a palette"),
                 choices = c("burwood_roses",
                             "bushcraft",
                             "full_sun_in_italy",
                             "home_time_dram",
                             "jumbleberry_pie",
                             "kororaareka",
                             "monstera_mash",
                             "ponsonby_lewks"),
                 selected = "burwood_roses"))
      )
    ),
    # Main panel
    mainPanel(
      
      # Outputs
      uiOutput("pal_plot_img")
      )
    )
)

# Define server logic ----
server <- function(input, output) {
  
  selected_choice <- reactive({
    return(input$select)
  })
  
  img_path <- reactive({
    paste0(selected_choice(), ".png")
  })
  
  output$pal_plot_img <- renderUI({
    tags$img(src = img_path())
  })
}

# Run the app ----
shinyApp(ui = ui, server = server)