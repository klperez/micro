library(RColorBrewer)
library(dplyr)
library(htmlwidgets)
library(ggplot2)
library(plotly)

#setwd("assets/img/")
data(mpg)

g <- ggplot(mpg, aes(class)) + 
     geom_bar(aes(fill = drv), position = position_stack(reverse = TRUE)) +
     scale_color_brewer(palette = "Accent") + coord_flip()  + theme_minimal() + theme(legend.position = "top") 
    
g1 <- ggplotly(g, width = 600, height = 200)    

saveWidget(g1, file = "barchart.html")


mpg %>% 
    ggplot() +
    aes(x = class, color = drv, group = drv, y = cty) +
    stat_summary(fun.y = mean, geom = "point") +
    stat_summary(fun.y = mean, geom = "line") + theme_minimal()
