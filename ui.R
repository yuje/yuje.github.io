#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Lottery Simulator, by Jeffrey Yu"),

  # Make a slide panel with controls
  sidebarLayout(
    sidebarPanel(
      div("Try your luck! Pick 6 different numbers, and see if you win the lotto jackpot!"),
      sliderInput("slider1", "", 1, 60, 1),
      sliderInput("slider2", "", 1, 60, 2),
      sliderInput("slider3", "", 1, 60, 3),
      sliderInput("slider4", "", 1, 60, 4),
      sliderInput("slider5", "", 1, 60, 5),
      sliderInput("slider6", "", 1, 60, 6),
      submitButton("Submit results!")
    ),
    # Show a plot of the generated distribution
    mainPanel(
      h2("Lotto results"),
      textOutput("lotteryResults")
    )
  )
))
