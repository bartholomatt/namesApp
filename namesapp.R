#shiny babynames explorer 
library(dplyr)
library(ggplot2)
library(shiny)
library(babynames)
viewname = function(thisName){
  babynames %>%
  filter(name == thisName) %>%
  ggplot(aes(x = year, y = n)) + geom_line(aes(color = sex)) }
ui = fluidPage(fluidRow(textInput(inputId = 'nameHere', label = '  Select a Name to Search')),
        fluidRow(plotOutput(outputId = 'plot',height = '500')))
server = function(input, output){output$plot = renderPlot(viewname(input$nameHere))}
shinyApp(ui=ui, server = server)

# library(babynames)
# withGrowth = babynames %>%
#   group_by(name, sex) %>%
#   mutate(prev = lag(n,default = 0),change = n - prev,fold = n / prev) %>%
#   filter(year != '1880' & fold != Inf) %>% 
#   arrange(desc(fold))

  