library(devtools)
#install_github("nik01010/dashboardthemes")
library(shiny)
library(shinydashboard)
library(shinythemes)


data <- read.csv("D:/Projects/Demand Forecasting/Sathish model/07182018_V2/salestable.csv", stringsAsFactors = FALSE)
dataChoices <- c(data$Product_category)



# Define UI logic required for prediction
shinyUI(
  
  dashboardPage(skin = c("green"),
    dashboardHeader(title = "Demand Forecasting",
                    tags$li(a(href = 'http://www.i2decisions.com',
                              img(src = "i2Decisionslogo.png",
                                  title = "Company Home", height = "30px"),
                              style = "padding-top:10px; padding-bottom:10px;"),
                            class = "dropdown")),
    
    
    dashboardSidebar(
      
      sidebarMenu(
        selectInput(inputId = "product_id",
                    "Category",
                  #  choices = dataChoices,
                  choices = c("Accessories","Bikes","Clothing"),
                    selected = "Accessories"),
        
        
        dateRangeInput("dateRange",
                       "Date range",
                       start = "1980-01-01",
                       end   = "2016-12-31")
      ),
      

      selectInput("frequency",
                  "Frequency",
                  choices = c("Days" = "Daily","Weeks" = "Weekly", "Months" = "Monthly"), 
                  selected = "Months"),
      
      radioButtons("method",( "Forecast Technique: "), 
     
                   c("Naive" = "naive",
                     "Moving Average" = "ma",
                     "Exponential Smoothing" = "es"))

    ),
    
    dashboardBody(
      fluidRow(
        valueBoxOutput("progressBox"),
        tabBox(
          title = "First tabBox",
          # The id lets us use input$tabset1 on the server to find the current tab
          id = "tabset1", height = "250px",
          tabPanel("Tab1", "First tab content"),
          tabPanel("Tab2", "Tab content 2")
        ),
        tabBox(
          side = "right", height = "250px",
          selected = "Tab3",
          tabPanel("Tab1", "Tab content 1"),
          tabPanel("Tab2", "Tab content 2"),
          tabPanel("Tab3", "Note that when side=right, the tab order is reversed.")
        )
      ),
      fluidRow(
     
        tabBox(
          # Title can include an icon
          title = tagList(shiny::icon("gear"), "tabBox status"),
          tabPanel("Tab1",
                   "Currently selected tab from first box:",
                   verbatimTextOutput("tabset1Selected")
          ),
          tabPanel("Tab2", "Tab content 2")
        )
    
      ),

      
      
    tabItem(
    box(dataTableOutput("product_dataHead"),width = 250)
      )
      
      ))
)