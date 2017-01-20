output$myMap <- renderMap({
  ## Map;
  m <- Leaflet$new()
  m$addParams(width="100%", height=1000)
  m$addParams(bounds = list(c(18,100), c(42,120)))

  
  if(!is.null(input$variable)) {
    ptn <- NULL
    if ("flood" %in% input$variable) {
      ptn <- c(ptn, c('水','溢','决'))
    }
    if ("drought" %in% input$variable) {
      ptn <- c(ptn, '旱')
    }
    if ("locust" %in% input$variable) {
      ptn <- c(ptn, c('蝗','蝻'))
    }
    if ("famine" %in% input$variable) {
      ptn <- c(ptn, c('饥','馑'))
    }
    if ("plague" %in% input$variable) {
      ptn <- c(ptn, c('瘟','疫'))
    }
    if (!is.null(ptn)) {
      id <- grep(paste(ptn, collapse = "|"), M500$Record)
      M500 <- M500[id,]
    }
  }
  
  if (!is.null(input$year)) {
    dat <- M500[which(M500$Year == as.numeric(input$year)), ]

    m$addParams(pieDat = dat)

# # JavaScript
# for (var i = 0; i<spec.pieDat.Record.length; i++) {
#   L.piechartMarker(
#     L.latLng([spec.pieDat.Lat[i], spec.pieDat.Lon[i]]),
# {
#   radius: 10,
#   data: [
# { name: 'flood',    value: spec.pieDat.Record[i].match(/水/) != null?1:0, style: { fillStyle: 'rgba(0,  0,255,.8)'} },
# { name: 'drought',  value: spec.pieDat.Record[i].match(/旱/) != null?1:0, style: { fillStyle: 'rgba(0,  0,255,.8)'} },
# { name: 'locust',   value: spec.pieDat.Record[i].match(/蝗/) != null?1:0, style: { fillStyle: 'rgba(255,140,0,.8)'} },
# { name: 'famine',   value: spec.pieDat.Record[i].match(/饥/) != null?1:0, style: { fillStyle: 'rgba(0,255,255,.8)'} },
# { name: 'epidemic', value: spec.pieDat.Record[i].match(/疫/) != null?1:0, style: { fillStyle: 'rgba(255,0,255,.8)'} }
# ]
# }
#   ).addTo(map).bindPopup(spec.pieDat.Record[i]);
# }



    
  }
  m
})