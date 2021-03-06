---
title       : App-Cars Presentation
subtitle    : A Brief Introduction
author      : Henri E.
job         : Developing Data Products
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Purpose

The purpose of the app I have written is to display the relations between
the mileage and engine size of cars. The app allows the users to select
the cars that are plotted into a graph based on the number of cylinders which
the cars have.

The app can be found here: https://aesko.shinyapps.io/App-Cars

## Data

The data comes from the mtcars data frame that is available in the 'datasets'
library, which is preinstalled in R.

The data can be viewed by running the following code in R:


```r
library(datasets)
View(mtcars)
```

--- .class #id 

## Input options

The app has a single checkbox, which has the labels 4, 6 and 8 - these stand for
the number of cylinders in the cars.

## Output

The app renders a scatter plot using the ggplot2 library. A graph will not be
produced, if none of the checkboxes are selected.

It is worth noting that the range of both axes are fixed. Also, the color in
with the data points (cars) are plotted is fixed based on the number of cylinders.

--- .class #id

## Non-interactive output

A non-interactive version of the graph presented in the chart can be drawn by running
the following R code (output on the next page):




```r
library(datasets)
library(ggplot2)
ggplot(mtcars, aes(x = disp, y = mpg)) + 
                geom_point(aes(color = factor(cyl))) +
                coord_cartesian(ylim=c(0,35), xlim=c(0,500)) +
                scale_colour_manual(
                        values = c("8" = "red", "4" = "blue",
                                "6" = "green")) +
                xlab('Engine displacement (cubic inches)') +
                ylab('Miles per gallon') + 
                geom_hline(yintercept = mean(mtcars$mpg, 
                                             na.rm = TRUE)) +
                geom_vline(xintercept = mean(mtcars$disp, 
                                             na.rm = TRUE))
```

--- .class #id

##Non-interactive output

![plot of chunk unnamed-chunk-3](assets/fig/unnamed-chunk-3-1.png) 
