# load knitr library
library(knitr)
library(operators)
library(magrittr)

# creating table
create_table <- function(dataframe) {
  info <- dataframe %>%
    group_by(state) %>%
    summarize(num_dead = sum(num_killed), num_injured = sum(num_injured))
  table <- kable(info, col.names = c(
    "State", "Number of people killed",
    "Number of people injured"
  ))
  return(table)
}

library(lintr)
library(styler)
style_file("scripts/summary_table.R")
lint("scripts/summary_table.R")
