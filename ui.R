#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(theme = "bootstrap.min.css",
                  
                  # Application title
                  titlePanel("Loan EMI Calculator"),
                  
                  # Sidebar with a slider input for number of bins
                  sidebarLayout(
                    sidebarPanel(
                      h3("How to Use"),
                      p("Provide the principal amount, rate of interest (in percentage) and tenure of loan and click calculate."),
                      h3("Functionality"),
                      
                      p("This application calculates the EMI per month")
                      
                    
                     
                    ),
                    
                    mainPanel(
                     
                      fluidRow(
                        column(width = 2, numericInput("loan", label = h4("Loan Amount"), min = 0, value = 1000)),
                        column(width = 2, numericInput("interest", label = h4("Interest Rate"), min = 1, value = 15, step = .5))),
                      
                      
                      
                      
                      fluidRow(
                        
                        column(width = 4, sliderInput("Tenure", label = h4("Tenure [Years]"), min = 0, max = 100, value = 10))
                      ),
                      submitButton("Calculate"),
                    
                      h3("Your EMI is:"), verbatimTextOutput("emi"),
                      hr(),
                      h3("Total amount paid uptill each year"),
                      plotOutput("plot")
                    )
                  )
))