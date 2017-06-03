#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny); library(ggplot2)

options(shiny.trace=TRUE)




shinyServer(function(input, output) {
  emi <- reactive({
    
    (input$loan * (input$interest/(12*100)) * (1+(input$interest/(12*100)))^input$Tenure)/((1+(input$interest/(12*100)))^input$Tenure-1)
    })
 
  
  output$emi <- renderPrint({round(emi(), 1)})
  output$plot <- renderPlot({
    year <- c(1:input$Tenure)
    emiPaid <- c(1:input$Tenure)*(input$loan * (input$interest/(12*100)) * (1+(input$interest/(12*100)))^input$Tenure)/((1+(input$interest/(12*100)))^input$Tenure-1)
    
    data <- data.frame(year,emiPaid)
    
    ggplot(data=data, aes(x=year, y=emiPaid )) +
      geom_bar(colour="black", stat="identity") 
    
    
  })
  
})