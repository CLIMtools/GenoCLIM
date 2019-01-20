library(shiny)
library(shinyjs)
library(ggplot2)
library(shinycssloaders)

shinyServer(function(input, output) {
 
descriptiondataset <-read.csv("data/datadescription.csv")
      
 output$a <- DT::renderDataTable(descriptiondataset, filter = 'top', options = list(
        pageLength = 25, autoWidth = TRUE))
  
  data <- read.csv("data/merged1.csv", header=T)
  
  # Filter data based on selections
  output$table <-DT::renderDataTable(datatable(data, options = list(
    initComplete = JS(
      "function(settings, json) {",
      "$(this.api().table().header()).css({'background-color': '#0E7DE3', 'color': '#fff'});",
      "}")
  ),
                                                rownames = FALSE,
                                                selection = 'none') %>%
                                        formatStyle('score',backgroundColor = 'orange',  color = styleInterval(c(4, 6), c('black', 'blue', 'red')),fontWeight = 'bold',
                                                    background = styleColorBar(data$score, 'lightblue'),
                                                    backgroundSize = '98% 88%',
                                                    backgroundRepeat = 'no-repeat',
                                                    backgroundPosition = 'center')
                                       
  )
      })
  
  


