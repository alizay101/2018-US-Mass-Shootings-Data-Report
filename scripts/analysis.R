library(dplyr)
#Reading Data
shootings_2018 <- read.csv("data/shootings-2018.csv", stringsAsFactors = FALSE)
View(shootings_2018)

#total shootings
total_shootings <- nrow(shootings_2018)

#how many lives lost
lives_lost <- sum(shootings_2018$num_killed)

#most impacted city (city with highest shooting death toll in 2018)
most_impacted_city <- shootings_2018 %>%
  group_by(city) %>%
  summarize(total_deaths = sum(num_killed, na.rm = TRUE)) %>%
  filter(total_deaths == max(total_deaths)) %>%
  pull(city)

#most impacted state (state with highest shooting death toll in 2018)
most_impacted_state <- shootings_2018 %>%
  group_by(state) %>%
  summarize(total_deaths = sum(num_killed, na.rm = TRUE)) %>%
  filter(total_deaths == max(total_deaths)) %>%
  pull(state)

#city with highest number of people injured
most_injured_city <- shootings_2018 %>%
  group_by(city) %>%
  summarize(total_deaths = sum(num_killed, na.rm = TRUE)) %>%
  filter(total_deaths == max(total_deaths)) %>%
  pull(city)

# Parkland shooting statistics
parkland_data <- shootings_2018 %>%
  filter(city == "Pompano Beach (Parkland)")
parkland_date <- parkland_data$date
parkland_city <- parkland_data$city
parkland_state <- parkland_data$state
parkland_num_injured <- parkland_data$num_injured
parkland_num_killed <- parkland_data$num_killed
View(shootings_2018)





