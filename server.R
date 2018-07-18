library(shiny)
library(shinydashboard)
library(forecast)
library(tseries)


shinyServer(function(input, output){
  
  select.product <- reactive({                                  # function that will filter that product based on the user's input
  product_data <- data[data$PRODUCT_ID == input$product_id,] 
  return(product_data = product_data)
  }) 

  output$product_dataHead <- renderDataTable(select.product())
  )
  })
})




