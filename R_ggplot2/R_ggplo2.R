# install.packages('ggplot2movies')
library(ggplot2)
library(ggplot2movies)
library(dplyr)

### HISTOGRAMS
# data and arsthetics
df <- movies
head(df)
pl <- ggplot(movies, aes(x=rating))

# geometry
pl2 <- pl + geom_histogram(
    binwidth = 0.1,
    color = "red",
    fill = "pink",
    alpha = 0.5)

pl3 <- pl2 + 
    xlab("Movie Rating") +
    ylab("Count") +
    ggtitle("Movies rating histogram")

pl + geom_histogram(bins=50, aes(fill=after_stat(count)))


### Scatterplot
df <- mtcars

# DATA & AESTHETICS LAYER
pl1 <- df %>% ggplot(aes(x=wt, y=mpg))

# GEOMETRY
# size = 5
# pl1 + geom_point(size=5, alpha=0.3)
pl1 + geom_point(
    aes(
        shape=factor(cyl),
        color=factor(cyl)),
    size=5)
pl2 <- pl1 + geom_point(aes(color=hp), size=5)
pl2 + scale_color_gradient(low="blue", high="red")
