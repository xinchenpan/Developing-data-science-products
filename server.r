library(faraway)
data("teengamb")
model <- lm(gamble ~ sex + status + income + verbal, data = teengamb)

gamblePredict <- function(select, status, income, verbal)
predict(model, data.frame(sex = select, status = status,
                          income = income,
                          verbal = verbal), type
        = "response", interval = "prediction")[1]

shinyServer(
  function(input, output){
    output$select <- renderPrint({input$select})
    output$status <- renderPrint({input$status})
    output$income <- renderPrint({input$income})
    output$verbal <- renderPrint({input$verbal})
    output$prediction <- renderPrint({gamblePredict(as.numeric(input$select), 
                                                    input$status, input$income,
                                                    input$verbal)})
  }
)