
#### Log in module ###
Logged <- TRUE;
USER <- reactiveValues(Logged = Logged)

# Load password table;
# PASSWORD <- read.table("Data/ps.txt", stringsAsFactors = FALSE, header = TRUE)
PASSWORD <- data.frame(Username = "zzb", Password = "44fb73208bbd1416c006d1905956a3c7")

# Front end;
passwdInput <- function(inputId, label) {
  tagList(
    tags$label(label),
    tags$input(id = inputId, type="password", value="")
  )
}

output$uiLogin <- renderUI({
  if (USER$Logged == FALSE) {
    wellPanel(
      textInput("userName", "User Name:"),
      passwdInput("passwd", "Pass word:"),
#       br(),
      actionButton("Login", "Log in")
    )
  }
})

output$pass <- renderText({  
  if (USER$Logged == FALSE) {
    if (!is.null(input$Login)) {
      if (input$Login > 0) {
        Username <- isolate(input$userName)
        Password <- isolate(input$passwd)
        Id <- which(PASSWORD$Username == Username)
        if (length(Id) > 0) {
          if (PASSWORD$Password[Id] == Password) {
            USER$Logged <- TRUE
          } else {
            "Password failed!"
          }
        } else  {
          "User name is not correct!"
        }
      } 
    }
  }
})
