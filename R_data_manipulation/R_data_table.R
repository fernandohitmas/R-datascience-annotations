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

# selecting columns (j)
# if columns are not wrapped by list or .() it returns a list
# if wrapped than return data.table
head(dt.flights[, carrier])
head(dt.flights[, list(carrier)])
head(dt.flights[, .(carrier)])
head(dt.flights[, .(carrier, arr_time)])

# renaming columns
# setnames(dt, old_vector_names, new_vector_names)
head(dt.flights[, .(airline.carrier = carrier, arrivel.time = arr_time)])
setnames(dt.flights, c("arr_time"), c("arrival.time"))
head(dt.flights)

# use UNIQUE to find the unique values of a column
# also works with more than one column at once
unique(dt.flights[, carrier])
head(unique(dt.flights[, .(carrier, month, day)]))

# calculate new column base on others
# calculations happen inline
dt.flights[, `:=`(new_col = arr_delay - dep_delay)]
          # new_col2 = operation)]
head(dt.flights)
