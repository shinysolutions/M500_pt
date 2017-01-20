library(rCharts)
shinyUI(bootstrapPage(
  # Add custom CSS & Javascript;
  tagList(
    tags$head(
      tags$link(rel="stylesheet", type="text/css",href="style.css"),
      tags$script(type="text/javascript", src = "md5.js"),
      tags$script(type="text/javascript", src = "passwdInputBinding.js")
      
    ),
    tags$body(
      tags$script(type="text/javascript", src = "leaflet-canvasicon.js"),
      tags$script(type="text/javascript", src = "leaflet-piechart.js")
      )
  ),

  # Log in module
  div(class = "login", uiOutput("uiLogin"), textOutput("pass")), 
  
  div(class = "control", 
      uiOutput("uiVariable"),
      uiOutput("uiYear")
      ),

  showOutput("myMap", "leaflet")
))
