#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$lotteryResults <- reactive({
    
    # Set random seed so it'll be different every time
    set.seed( as.integer((as.double(Sys.time())*1000+Sys.getpid()) %% 2^31))
    
    guesses <- c(input$slider1, input$slider2, input$slider3, input$slider4,
                input$slider5, input$slider6)
    
    if (length(unique(guesses)) < 6) {
      return("Please enter 6 UNIQUE numbers in order to play. Try again.")
    }
    winningNumbers <- sample(1:60, 6, replace=F)
    matching <- intersect(guesses, winningNumbers)
    
    prize <- 0
    if (length(matching) == 3) {
      prize <- 50
    } else if (length(matching) == 4) {
      prize <- 1000
    } else if (length(matching) == 5) {
      prize <- 50000
    } else if (length(matching) == 6) {
      prize <- 6000000
    }
    
    outputs <- c(
      "The winning numbers were (",
      paste(winningNumbers, collapse=", "),
      "). You correctly matched (",
      paste(matching, collapse=", "),
      "). You've won $",
      prize,
      " dollars! "
    )
    paste(outputs, collapse="")
  })
})
