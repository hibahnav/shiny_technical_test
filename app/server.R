library(shiny)
library(here)
library(dplyr)

source(here("ggplot.R"))

plot_clicks <- function(ad_clicks, plot_type = "both"){
    
    plot_expr <- switch(plot_type,
                        scatter = ggplot2::geom_point(size = 4),
                        line = ggplot2::geom_line(size = 1.2),
                        both = list(ggplot2::geom_line(size = 1.2), 
                                    ggplot2::geom_point(size = 4))
    )
    
    ad_clicks %>% 
        dplyr::group_by(name, day) %>% 
        dplyr::summarise(clicks = sum(clicks)) %>% 
        dplyr::ungroup() %>% 
        ggplot2::ggplot(ggplot2::aes(x = day,
                                     y = clicks,
                                     col = name)) +
        plot_expr + 
        ggplot2::scale_x_date(date_breaks = "1 week",
                              date_labels = "%d%b%Y") + 
        ggplot2::labs(
            x = "",
            y = "",
            title = ""
        ) + 
        ggplot2::guides(col = ggplot2::guide_legend(title = "")) + 
        ggplot2::theme(
            legend.position = "bottom"
        )
    
}


shinyServer(function(input, output) {

    options(stringsAsFactors = FALSE)
    
    # Import data
    ad_clicks <- read.csv(here("ad_clicks.csv")) %>%
        mutate(day = as.Date(day))
    
    # Create plot output object
    output$plot <- renderPlot({
        day = ad_clicks %>% filter(day==input$day)
        #ad_clicks <- ad_clicks[date>=input$day[1] & date<=input$day[2]]
        #idea: subset data between first input date picked and second input date picked
        plot_clicks(ad_clicks,input$plot_type)
    })

})
