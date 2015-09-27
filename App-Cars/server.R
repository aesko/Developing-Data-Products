# server.R
# 2015-09-27
# Miles/gallon vs. displacement


# Load necessary libraries
library(shiny)
library(datasets)
library(ggplot2)
library(dplyr)


shinyServer(function(input, output) {
        
        # Filter based on checkboxes
        filterCar <- reactive({
                filter(mtcars, cyl %in% input$checkCyl)
        })
        
        
        # Generate a plot with desired cars only (filtered based on cylinders).
        # Set fixed color for cylinders and fix axis ranges.
        # ggplot version
        output$mpgPlot <- reactivePlot(function() {
                # ggplot required this step, as it can't use direct output from 
                # the reactive() function
                carData <- filterCar()
                p <- ggplot(carData, aes(x = disp, y = mpg)) + 
                        geom_point(aes(color = factor(cyl))) +
                        coord_cartesian(ylim=c(0,35), xlim=c(0,500)) +
                        scale_colour_manual(
                                values = c("8" = "red","4" = "blue","6" = "green"))
                        
                print(p)
        })
})

