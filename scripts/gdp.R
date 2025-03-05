library(ggplot2)
library(dplyr)

# calculate the GDP for each row in the gapminder data
# frame by multiplying population by gdp per capita
# the country parameter is optional because the default
# is NULL (meaning nothing).  If no country is sent, 
# use the whole data frame.  If a country is indicated
# then first subset on that country
# if a country is sent that is not a valid country, 
# no rows will be returned. 

calcGDP <- function(  gapminder_data, country = NULL){
  if( !is.null(country) ) {
    gapminder_data <- gapminder_data[gapminder_data$country == country, ]
    
  }
  
  gdp <- gapminder_data$pop * gapminder_data$gdpPercap
  return(gdp)
}


# create a panel plot for one continent
# Filter using dplyr
# note that dplyr does not work if the the parameter has the same name as the
# column we are filtering on 
# filter(continent == continent)  does not work! 
# as a work-around, we use Continent with a capital C but could have also 
# use a variable name like continent_name or something.  
# save the plot in a variable and then return it

gapminder_by_continent <- function(df, Continent){
  # filter on the continent
  gm_plot <- df %>% filter(continent == Continent) %>%
  # then plot
    ggplot(mapping = aes(
    x=year, y = lifeExp, color = continent)) +
    geom_line() + 
    facet_wrap( ~ country) +  # one panel per country
    theme(axis.text.x = element_text(angle = 45, size=8)) +
    labs(title = "Life Expectancy by Year", 
       x = "Year", 
       y = "Life Expectancy", 
       color = "Continent")
  
  return(gm_plot)

}
