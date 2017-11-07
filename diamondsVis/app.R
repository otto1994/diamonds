library(shiny)
library(ggplot2)

#GUI
ui = fluidPage(
  titlePanel('Diamonds Data'),
  h1('I\'m header 1'),
  sidebarLayout(
    sidebarPanel(
      helpText('This app is to visualize diamond dataset'),
      textInput(inputId = 'title',
                label = 'chart title',
                value = '123'),
      selectInput(inputId = 'pos',
                  label = 'position',
                  choices = list('stack','dodge'),
                  selected = 'stack')
    ),
    mainPanel(
      plotOutput(outputId = 'plot') #connect to `output$plot=renderPlot`
    )
  )
)

#Server

server = function(input, output) {
  output$plot=renderPlot({
    ggplot(diamonds,aes(x=cut,fill=clarity))+
      geom_bar(position=input$pos)+
      ggtitle(input$title)})
}

#Run the app
shinyApp(ui,server)




