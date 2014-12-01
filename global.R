library(shiny)
library(RCurl)
library(RJSONIO)


  wells <- getURL("104.131.248.249/?q=well-data&wellserial=136B9D32")

  well.serials <- getURL("http://104.131.248.249/?q=well-serials")
  well.serials.parsed <- data.frame(serial=character())
  w.handler <- basicJSONHandler(simplify=T)
  tp <- fromJSON(well.serials)

  for(n in tp$wells) {
    row <- data.frame(serial=n$well[2])
    well.serials.parsed <- rbind(well.serials.parsed, row)
  }


  wl <- data.frame(serial=character(),datetime=as.Date(character()),level=numeric())

  handler <- basicJSONHandler(simplify=T)
  wells1 <- fromJSON(wells)


  for(n in wells1$nodes) {
    row <- data.frame(serial=n$node[3], datetime=as.POSIXct(as.numeric(as.character(n$node[2])),origin="1970-01-01"), level=as.numeric(n$node[1]))
    wl <- rbind(wl, row)
  }


date.min <- min(wl$datetime)
date.max <- max(wl$datetime)

ymin <- min(wl$level)
ymax <- max(wl$level)

