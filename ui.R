# Load libraries
library(shiny)

# Define UI ---------------------------------------------------------------

# Define UI for application
shinyUI(fluidPage(

    # Application title
    headerPanel("Distribution Viewer"),
    sidebarLayout(
        
        # Sidebar with a list of options
        sidebarPanel(
            selectInput(inputId = "dist", label = "Distribution", 
                        choices = c(Normal = "rnorm", Binomial = "rbinom"), selected = "rnorm"),
            
            # Only display this panel for normal distribution
            conditionalPanel(condition = "input.dist == 'rnorm'",
                             sliderInput("slider5", "Pick Minimum and Maximun X Values",
                                         -100, 100, value = c(-5, 5)),
                             sliderInput("slider1", "Mean", -50, 50, 0),
                             sliderInput("slider2", "Standar Deviation", 0.1, 10, 1)),
            
            # Only display this panel for binomial distribution
            conditionalPanel(condition ="input.dist == 'rbinom'",
                             sliderInput("slider3", "Successes", 1, 100, 15),
                             sliderInput("slider4", "Probability", 0, 1, 0.5, 0.01))
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("plot"),
            div(textOutput("area"), align = "center", style = "font-size:150%;"))
    )
))
