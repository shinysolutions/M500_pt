output$uiYear <- renderUI({
  sliderInput(inputId= "year", 
              label = "显示年份：",
              min = 1512, 
              max = 1911, 
              value = 1512, 
              step = 1,
              animate=animationOptions(interval=3000)
              )
})

output$uiVariable <- renderUI({
  Items <- c("flood", "drought", "locust", "famine", "plague")
  names(Items) <- c("水", "旱", "蝗", "饥", "疫")
  selectInput(inputId   = "variable", 
              label     = "包含以下字段的记录：", 
              choices   = Items, 
              multiple  = TRUE,
              selected  = Items)
})
# output$uiMapType <- renderUI({
#   Items <- c("normal", "satellite", "terrain")
#   names(Items) <- c("地图", "卫星", "地形")
#   radioButtons(inputId = "mapType", 
#                label   = "",
#                choice  = Items, 
#                selected=names(Items)[3])
# })
