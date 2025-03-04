library(ggplot2)
gapminder <- read.csv("data/gapminder_data.csv")

calcGDP <- function(  gapminder_data, country = NULL){
  if( !is.null(country) ) {
    gapminder_data <- gapminder_data[gapminder_data$country == country, ]
    
  }
  gdp <- gapminder_data$pop * gapminder_data$gdpPercap
  return(gdp)
}


