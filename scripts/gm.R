year_country_gdp <- 
  gapminder %>% 
  select(year, country, gdpPercap) %>% 
  filter(country == "Ghana")

year_continent_gdp <- 
  gapminder %>% 
  filter(continent == 'Asia') %>%
  select(year, country, gdpPercap) %>%
  rename(gdp_per_capita = gdpPercap) 


gdp_by_continent <- gapminder %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap))


## Code from Day 2, miscellaneous exploratory functions to learn about using
# dplyr from Pat Bills, MSU ICER

lifeExp_bycountry <- gapminder %>%
  group_by(country) %>%
  summarize(mean_lifeExp = mean(lifeExp))




gapminder |>
  filter(year == 2002) |> count(continent, sort = TRUE)

gapminder %>% 
  group_by(continent) %>%
  summarize(se_le = sd(lifeExp)/sqrt(n())) |>  View()

gapminder_gdp <- gapminder %>%
  mutate(gdp = pop * gdpPercap )