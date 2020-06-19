library(shiny)

dat <- read.csv(here("ad_clicks.csv"))

shinyUI(fluidPage(

    # Application title
    titlePanel("Ad Clicks Visualizer"),

    sidebarLayout(
        sidebarPanel(
            radioButtons(
                inputId = "plot_type",
                label = "Plot Type",
                choices = c("both", "scatter", "line"),
                inline = TRUE
            ),
            dateRangeInput("day","Date Range",min=min(dat$day),max=max(dat$day))
        ),

        mainPanel(
            plotOutput("plot")
        )
    )
))
