shinyUI(fluidPage(
  titlePanel("Miles Per Gallon(MPG) Estimator Tool"),

  sidebarLayout(
    sidebarPanel(
      helpText("Select features of your car to get an estimate of mileage(mpg)."),
      
      radioButtons("am",label="Choose Automatic or manual Transmission",
                  choices = list("Automatic"= 0,"Manual"=1),
                   selected = 0),
      br(),
      #selectInput("cyl", label ="Choose Number of Cylinders",
      #                    choices = list("4", "6","8"),selected = 4),
      #br(),
     sliderInput("hp", 
                  label = "Choose Horsepower:",
                  min = 50, max = 535, value = 150),
     br(),
     sliderInput("wt", 
                label = "Choose Weight in Tons:",
                min = 1.5, max = 5.25, value = 3),
     br(),
     submitButton("Submit")
    ),
    
  
  mainPanel(
    h4(textOutput("text1")),
    
    plotOutput("mpgPlot"),
    includeHTML("description.html")
   
    )
  
 
  
  
  )
  
)
)