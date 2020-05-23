# make_bar_graph.R
library("dplyr")
library("ggplot2")
library("plotly")


make_bar_graph <- function(dataframe) {
  info <- dataframe %>%
    group_by(state) %>%
    summarize(num_dead = sum(num_killed))
  plot <- ggplot(data = info) +
    geom_col(mapping = aes(x = state, y = num_dead)) +
    ggtitle("Total Number of People Killed in Each State Due to Mass 
            Shootings in 2018") +
    ylab("Number of People Killed") +
    xlab("State") +
    theme(axis.text.x = element_text(angle = 90, hjust = 1))
  plot <- ggplotly(plot)
  return(plot)
}

library(lintr)
library(styler)
style_file("scripts/make_bar_graph.R")
lint("scripts/make_bar_graph.R")
