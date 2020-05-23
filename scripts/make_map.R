# making interactive map
install.packages("leaflet")
library(leaflet)
library(dplyr)

create_map <- function(shootings_2018){
  map <- leaflet(data = shootings_2018) %>%
    addProviderTiles("CartoDB.Positron") %>%
    setView(lng = -98.68 ,lat = 35.69, zoom = 3.2) %>%
    addCircles(
      lat = ~lat,
      lng = ~long,
      stroke = FALSE,
      popup = ~paste("City: ", city, "<br>", "Number of people killed: ", 
                     num_killed, "<br>", "Number of people injured: ", 
                     num_injured), 
      radius = ~sqrt(num_killed)*50000, 
      weight = 1
    )
  return(map)
}