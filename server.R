shinyServer(function(input,output) {
  fit<-lm(mpg~factor(am)+wt+factor(cyl)+hp-1,data=mtcars)
  
  pred <- reactive({
    mpgout<-round(predict(fit,data.frame(am=input$am,cyl=c(4,6,8),hp=input$hp,wt=input$wt)),3)
   
  })
  
  output$text1<-renderText({
    paste("The estimated mpg for 4 cyl is",head(pred(),1)[1],", for 6 Cyl is",
          head(pred())[2]," and for 8 Cyl is",head(pred())[3])
    })
  
  output$mpgPlot<-renderPlot({
    barplot(pred(),names=c("4 Cyl","6 Cyl","8 Cyl"),ylab="Miles per gallon",
                xlab="Number of Cylinders",ylim=c(0,30),main="Miles per gallon Prediction")
      })
    })