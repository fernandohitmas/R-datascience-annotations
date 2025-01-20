# install.packages("data.table")
library(data.table)

library(nycflights13)
head(flights)
dt.flights <- as.data.table(flights)

# filter data
head(dt.flights[month == 11 & day == 3 & carrier == "AA"])

# slice data
dt.flights[14:20]

# sort data
# minus sign changes the order to descending
dt.flights[order(year, month, day, arr_time)]
