shinyServer(
  function(input, output) {
   
  output$distPlot <- renderPlot({
    z <- data.frame(nrow=100, ncol=1)
    y <- 365
    
    if (input$month=="January") { y<-334}
    if (input$month=="February") { y<-306}
    if (input$month=="March") { y<-275}
    if (input$month=="April") { y<-245}
    if (input$month=="May") { y<-214}
    if (input$month=="June") { y<-183}
    if (input$month=="July") { y<-152}
    if (input$month=="August") { y<-122}
    if (input$month=="September") { y<-92}
    if (input$month=="October") { y<-61}
    if (input$month=="November") { y<-30}
    
    for (w in 1:1000) {
      x <- abs(rnorm(y, mean=0.0017, sd= 0.0017))
      z[w,1] <- sum(x)+input$endSaifi
    }
    output$msg <- renderText({ 
      paste("EOY predicted range (3 YR model), simulated beginning at ", input$month)
    })

      hist(z[,1], breaks = 100, col = 'orange', 
           main = "Predictive SAIFI", border = 'white', xlab='SAIFI')
      abline(v=mean(z[,1]),col="red",lwd=3)
    })
    
  }
)