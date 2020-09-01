library(shiny)
library(shinythemes)

ui <- fluidPage(
  theme = shinytheme("superhero"),
  titlePanel("Kalkulator"),
  sidebarLayout(
    sidebarPanel(
      numericInput("mojNumer1Input", "Wpisz pierwsza liczbe:", value = 0),
      
      numericInput("mojNumer2Input", "Wpisz druga liczbe", value = 0),
                  
    ),
    mainPanel(
      h3("Wyniki dla liczb:"),
      strong(textOutput("wyjsciowyNumer")),
      em(tableOutput("table")),
      em(tableOutput("table2")),
      textInput("text", label = h3("Notes"), value = "Napisz cos..."),
      
      
    )
    )
  )


server <- function(input, output) {
  
  wynikdodawania <- reactive({
    wynik_dodawania <-input$mojNumer1Input + input$mojNumer2Input
    data.frame(wynik_dodawania)
  
  })
  wynikodejmowania <- reactive({
    wynik_odejmowania <-input$mojNumer1Input - input$mojNumer2Input
    data.frame(wynik_odejmowania)
  })
  

  
  output$wyjsciowyNumer <- renderText(paste(input$mojNumer1Input,";", input$mojNumer2Input))
  output$table <- renderTable(wynikdodawania())
  output$table2 <- renderTable(wynikodejmowania())
}
shinyApp(ui, server)
