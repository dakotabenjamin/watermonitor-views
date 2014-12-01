library(shiny)
library(RCurl)
library(RJSONIO)

options(shiny.reactlog=TRUE)
source("global.R")

#  wells <- getURL("104.131.248.249/?q=well-data&wellserial=10FADCAB")

#  wl <- data.frame(serial=character(),datetime=as.Date(character()),level=numeric())
#  date.min <- min(wl$datetime)
#  date.max <- max(wl$datetime)

#  ymin <- min(wl$level)
#  ymax <- max(wl$level)

shinyServer(function(input, output, session) {

  
#  handler <- basicJSONHandler(simplify=T)
#  wells1 <- fromJSON(wells)
  
#  for(n in wells1$nodes) {
#    row <- data.frame(serial=n$node[3], datetime=as.POSIXct(as.numeric(as.character(n$node[2])),origin="1970-01-01"), level=as.numeric(n$node[1]))
#    wl <- rbind(wl, row)
#  }
  

  output$wellplot <- renderPlot({
   #@todo make it check for which well 
    plot(y=wl$level, x=wl$datetime, pch=16, ylim= c(input$ylimrange[1], input$ylimrange[2]),xlab = "Date", ylab = "level (cm)", main = input$title) # xlim=c(as.POSIXct(input$daterange[0]), as.POSIXct(input$daterange[1]))
    #lines(y=wl$level, x=wl$datetime)
  })
  
  
})
