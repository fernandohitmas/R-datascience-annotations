# to indicate a specific column use the name of the columns of interest
## One of the most important data structures in R
# Able to use different types of data inside the same object

# Sample data frames - data() to get all data frames available
state.x77
USPersonalExpenditure
women
data()

# Navigating through the data frame
# head or tail to shows the leading/last rows
# str (from structure and not string) to get info about an object
# summary to get statistical info from the object
head(state.x77)
tail(state.x77)
str(state.x77)
summary(state.x77)

# Creating a data frame
days <- c('mon', 'tue', 'wed', 'thu', 'fri')
temp <- c(19.0, 20.1, 25.1, 21.2, 23.0)
rain <- c(T,T,F,F,T)
df <- data.frame(days,temp,rain)
df
str(df)
summary(df)

# Data Frame Indexing and Selection
# Slicing data is similar to matrix slicing
# [, c(column1, column2...)]
# Another option is dataframe$column, but in both ways the data returned 
# comes in a vector instead of a dataframe
# which can be obtained with dataframe[columns] (no comma)
df
df$days
df[,'days']
df['days']
df[c('rain','days')]

# SUBSET - returns a subset of the dataframe based on a condition
# usually the condition is a comparison for a whole column
# ??subset
# example: subset(airquality, Day == 1, select = -Temp)
# selects the data from airqulity datafrarme where day is 1
# and selects all the columns, except for Temp
subset(df, temp<22)
subset(df, temp<22, select=c('days', 'rain'))
subset(df, temp<22, select=-temp)

# ORDER - to order a dataframe
# help(order)
# the function order returns the indexes of the dataframe
# corresponding to the ordered column
sorted.temp <- order(df[,'temp'])
df[sorted.temp,]
sorted.temp <- order(df[,'temp'], decreasing = TRUE)
df[sorted.temp,]
sorted.temp <- order(-df[,'temp']) # does the same as decreasing argument
df[sorted.temp,]
