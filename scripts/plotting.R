library(ggplot2)

# get data
gapminder <- read.csv("data/gapminder_data.csv")

# plot
ggplot(data = gapminder, 
       mapping = aes(x = year,
                     y = lifeExp,
                     group = country)) +
  geom_line(mapping = aes(color = continent)) +
  geom_point()


my_plot <- ggplot(data = gapminder,
       mapping = aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point(alpha = 0.5, shape = "triangle") + 
  scale_x_log10() +
  geom_smooth(method = "lm")

ggsave("results/my_plot.png", plot = my_plot,
       width = 12,
       height = 10,
       units = "cm",
       dpi = 300)

# day 2 plot
# make a subset
americas <- gapminder[gapminder$continent == "Asia",]
panel_plot <- ggplot(americas, mapping = aes(
    x=year, 
    y = lifeExp, 
    color = continent)) +
  geom_line() + 
  facet_wrap( ~ country) + 
  theme(axis.text.x = element_text(angle = 45, size=8)) +
  labs(title = "Life Expectancy by Year", 
       x = "Year", 
       y = "Life Expectancy", 
       color = "Continent")

ggsave("results/panelplot.pdf", plot = panel_plot) 


