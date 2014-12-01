library(shiny)

#date.min <- min(wl$datetime)
#date.max <- max(wl$datetime)

#ymin <- min(wl$level)
#ymax <- max(wl$level)

shinyUI(
    fluidPage({
      titlePanel("WaterMonitor Views")
      
      sidebarLayout(
        sidebarPanel(
          #TODO autopopulate a dropdown list with all the wells
          
          #Date Range
          dateRangeInput("daterange", "Date Range", start=date.min, end=date.max),
          
          #ylim range
          sliderInput("ylimrange", "Y Axis Range", ymin, ymax, c(ymin, ymax)),
          
        
          #Labels
          textInput("title", "Title")
          

          #pretty stuff
      
          ),
      
      mainPanel(
        plotOutput("wellplot")
        )
      )
    }) 
)
