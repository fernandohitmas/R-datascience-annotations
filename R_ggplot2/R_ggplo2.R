# install.packages('ggplot2movies')
library(ggplot2)
library(ggplot2movies)

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
    ylab("Count")


