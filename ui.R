shinyUI(fluidPage(
  titlePanel("Predictive SAIFI"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("IEEE System Average Interruption Frequency
                Index (SAIFI) is the primary measure of
                the reliability of an electric utility.

                This app can be used throughout the year
                to forecast final system SAIFI by inputting
                the time of year and current SAIFI value.

                Input current parameters below, and the resulting
                histogram will show the range of predictected 
                SAIFI possibilites. the red line indicates the mean."),
      
      selectInput("month", 
                  label = "Choose most recently completed month:",
                  choices = c("Start of year (1/1)",
                              "January",
                              "February",
                              "March",
                              "April",
                              "May",
                              "June",
                              "July",
                              "August",
                              "September",
                              "October",
                              "November"),
                  selected = "None"),
      
      sliderInput("endSaifi", 
                  label = "Choose SAIFI as of month's end:",
                  min = 0, max = 1, value = 0, step=0.01)
      ),
    
    mainPanel(
      textOutput("msg"),
      plotOutput("distPlot")
    )
  )
))