# load knitr library
library(knitr)

# creating table
create_table <- function (dataframe) {
  group_by(state) %>%
    summarize(num_dead = sum(num_killed), num_injured = sum(num_injured))
  table <- kable(dataframe, col.names = c("State", "Number of people killed", "Number of people injured"))
  return(table)
}