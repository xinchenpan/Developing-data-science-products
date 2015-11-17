library(shiny)


shinyUI(fluidPage(
  titlePanel("Teenage gambling in Britain prediction"),
  
  sidebarLayout(
    sidebarPanel(
    selectInput("select", label = h3("Choose gender"),
               choices = list("Male" = 0, "Female" = 1),
               selected = 0),
    helpText(" '0' represents male and '1' represents female"),
    numericInput("status", label = h3("status score"), 45, min = 15, max = 70),
    numericInput("income", label = h3("income in pounds per week"), 4.5, min = 0, max = 20),
    sliderInput("verbal", label = h3("Verbal score in words out of 12 correctly defined"),
                                      min = 1, max = 12, value = 6),
    submitButton('Submit')
    
    ),
  mainPanel(
    h2('Results of prediction'),
    h4('You entered'),
    verbatimTextOutput("select"),
    textOutput("text1"),
    verbatimTextOutput("status"),
    verbatimTextOutput("income"),
    verbatimTextOutput("verbal"),
    h4('Which resulted in a prediction of'),
    verbatimTextOutput("prediction"),
    img(src="poker.jpg", height = 417, width = 626),
    a("Photo credit: www.gamblingtreatment.net/tag/poker-gamble/"))
  )
))

