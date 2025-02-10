# Dataset - Bikesharing demand
library(lubridate)
library(data.table)
library(corrplot)
library(corrgram)
library(ggplot2)
library(ggthemes)
library(caTools)

#### Read data
df <- read.csv("./Data/bikeshare.csv")
dt <- as.data.table(df)

#### Exploring the data
head(dt)
str(dt)
summary(dt)

#### Categorization of columns
cat_cols <- c('season', 'holiday', 'workingday', 'weather')
for (col in cat_cols) {
  dt[[col]] <- as.factor(as.matrix(dt[[col]]))
}

# char to datetime (posixct)
dt[,
   datetime := lapply(.SD, as.POSIXct, format="%Y-%m-%d %H:%M:%S"),
   .SDcols = patterns('datetime')]

str(dt)
summary(dt)

#### EDA
ggplot(dt, aes(x = temp, y = count)) +
  geom_point(aes(color = temp), alpha = 0.5, size = 5) + 
  theme_bw()

ggplot(dt, aes(x = datetime, y = count)) +
  geom_point(aes(color = temp), alpha = 0.5, size = 5) +
  scale_colour_gradient(high='red', low='green') +
  theme_bw()

# Variables correlation
cor(dt[, .(temp, count)])

# Box plot - count per season
ggplot(dt, aes(x = season, y = count)) +
  geom_boxplot(aes(color = season)) +
  theme_bw()

#### Feature engineering
# Get hour of the day
dt[, `:=`(hour = format(datetime, "%H"))]

# scatterplot - for workingday
ggplot(dt[workingday == 1], aes(x = hour, y = count)) +
  geom_point(
    aes(color = temp),
    alpha = 0.5, 
    position=position_jitter(w=1, h=0)) +
  scale_colour_gradientn(
    colors=c('#000099','blue','cyan', 'yellow','orange', 'red')) +
  theme_bw()

# scatterplot - for not workingday
ggplot(dt[workingday == 0], aes(x = hour, y = count)) +
  geom_point(
    aes(color = temp),
    alpha = 0.5, 
    position=position_jitter(w=1, h=0)) +
  scale_colour_gradientn(
    colors=c('#000099','blue','cyan', 'yellow','orange', 'red')) +
  theme_bw()

#### Modelling
temp.model <- lm(count ~ temp, data = dt)
summary(temp.model)
ggplot(dt, aes(x = temp, y = count)) +
  geom_point() +
  geom_smooth(method=lm , color="red", se=FALSE) +
  theme_bw()

# count for temp = 25
cf <- coef(temp.model)
count.pred <- cf[1] + 25*cf[2]
predict(temp.model, data.frame(temp = c(25)))

#### hour to numerical
dt[, `:=` (hour = as.numeric(hour))]
dt[, `:=` (hour = as.factor(hour))]

x <- c('season', 'holiday', 'workingday', 'weather', 'temp', 'humidity',
                   'windspeed', 'hour')
fmla <- as.formula(paste("count ~ ", paste(x, collapse = "+")))
temp.model2 <- lm(fmla, data = dt)
summary(temp.model2)
