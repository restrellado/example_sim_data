library(tidyverse)

create_yvar2 = function(yv1) {
  # Creates yvar2 as a linear outcome of yvar1 
  # Args: 
  #   yv1: yvar1
  yv1 * .25 + rnorm(n = 1, mean = 10, sd = 100)
}

# Make the dataset 
high_y_values <- tibble(
  yvar1 = sample(1000:10000, 100, replace = TRUE)
) %>% 
  mutate(yvar2 = map_dbl(yvar1, create_yvar2))

# Confirm relationship
ggplot(data = high_y_values, aes(x = yvar1, y = yvar2)) +
  geom_point() + 
  geom_smooth()