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

### Barplots
df <- mpg

# DATA AND AESTHETICS LAYERS
pl <- ggplot(df, aes(x=class))

# GEOMETRY
pl + geom_bar(aes(fill = drv), position = 'dodge')
pl + geom_bar(aes(fill = drv), position = 'fill')


### Boxplots
df <- mtcars

pl <- ggplot(df, aes(x=factor(cyl), y=mpg))

pl + geom_boxplot() + coord_flip()

pl + geom_boxplot(aes(fill=factor(cyl)))


### 2 Variables plot

# DATA AND AESTHETICS LAYERS
library(hexbin)
pl <- ggplot(movies, aes(x = year, y = rating))

pl2 <- pl + geom_bin2d(binwidth=c(5,1))

pl2 + scale_fill_gradient(high='red', low='green')

pl + geom_hex() + scale_fill_gradient(high='red', low='green')

install.packages('hexbin')
pl + geom_density2d()
pl + geom_density2d_filled()

### Coordinates and facetting

pl <- ggplot(mpg, aes(x=displ, y=hwy)) + geom_point()

pl + coord_cartesian(xlim = c(1,4), ylim = c(15,30))

pl + coord_fixed(ratio = 0.5/3)

pl + facet_grid(. ~ cyl)
pl + facet_grid(cyl ~ .)
pl + facet_grid(drv ~ . )
pl + facet_grid(drv ~ cyl)

### THEME
#theme_set(theme_minimal())
library(ggthemes)
ggplot(mtcars, aes(x=wt, y=mpg)) + 
    geom_point() +
    theme_economist()
#install.packages('ggthemes')

