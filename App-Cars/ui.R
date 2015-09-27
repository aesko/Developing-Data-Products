# ui.R
# 2015-09-27
# Miles/gallon vs. displacement

# Load necessary libraries
library(shiny)
library(datasets)
library(ggplot2)
library(dplyr)


# Texts for the UI
mainText <- 'The graph above is a scatter plot depicting the relationship between mileage
        and engine size of vehicles. Datapoints in the graph are colored based on the
        number of cylinders a vehicle has. The data is from the mtcars data frame in the
        datasets library which is preinstalled in R.'
sideBarText <- 'Use the checkboxes to choose which vehicles are plotted based on number of 
        cylinders.'



shinyUI(fluidPage(
        titlePanel('Plotting miles/gallon against engine size'),
        
        sidebarLayout(
                sidebarPanel(
                        helpText(sideBarText),
                        
                        checkboxGroupInput("checkCyl", 
                                           label = h3("Cylinders"), 
                                           choices = list("4" = 4, "6" = 6, 
                                                          "8" = 8),
                                           selected = c(4, 6, 8))
                ),
                
                mainPanel(plotOutput('mpgPlot'),
                          p(mainText))
        )
)
)