
shinyServer(function(input, output, session) {
  # Login module;
  source("RScript/Login.R",  local = TRUE)
  source("RScript//jsFun.R",  local = TRUE)
  observe({
    if (USER$Logged == TRUE) {
      write(input$log, "www/log.txt", append = TRUE)
      # Source input and output;
      load("M500.RData")
      source("RScript//input.R",  local = TRUE)
      source("RScript//output.R", local = TRUE)
    }
  })
})
