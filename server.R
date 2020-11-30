library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$plot <- renderPlot({
                  if(input$dist == "rbinom") {
                                success <- input$slider3
                                prob <- input$slider4
                                plot(1:success, dbinom(1:success, size = success ,prob = prob),
                                     type = "h",
                                     main = "Binomial Distribution",
                                     ylab = "Probability",
                                     xlab = "# Successes",
                                     lwd=3)
                  } else {
                                mean <- input$slider1
                                sd <- input$slider2
                                min_X <- input$slider5[1]
                                max_X <- input$slider5[2]
                                points <- seq(from = min_X, to = max_X, by = 0.1) 
                                plot(points, dnorm(points, mean = mean, sd = sd),
                                     type = "l",
                                     main = "Normal Distribution",
                                     ylab = "Density",
                                     xlab = "Mean",
                                     lwd=3)
                  }
    })
})
