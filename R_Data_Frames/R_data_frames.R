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
