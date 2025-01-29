library(ggplot2)
library(ggthemes)
library(dplyr)
write.csv(mpg, 'Data/mpg.csv')

# Histogram of hwy mpg values:
mpg %>%
    ggplot(aes(x=hwy)) + 
    geom_histogram(bins=20,
        #color='red',
        fill='red',
        alpha=0.5)

# Barplot of car counts per manufacturer with color fill 
# defined by cyl count
mpg %>%
    ggplot(aes(x = manufacturer, fill = factor(cyl))) +
    geom_bar() +
    theme_economist_white()

# Create a scatterplot of volume versus sales. Afterwards 
# play around with alpha and color arguments to clarify 
# information.
txhousing %>%
    ggplot(aes(x=sales, y=volume)) +
    geom_point(size=5,
        color='#3f54ad',
        alpha=0.3) + 
    geom_smooth(color='red')
