# install.packages("tidyverse")
# install.packages("nycflights13")

library(dplyr)
library(nycflights13)
head(flights)

# filter function (masked)
head(filter(flights, month==11, day==3, carrier=='AA'))

# slice to return rows by position
slice(flights, 14:20)

# arrange to order 
# desc function in a column changes to descending
head(arrange(flights, year, month, day, arr_time))

# select - select columns
head(select(flights, carrier, arr_time))

# rename - rename columns
head(rename(flights, airline_carrier = carrier))

# distinct
distinct(select(flights, carrier))

# mutate operations with columns adding it to the end of the dataset
head(mutate(flights, new_col = arr_delay-dep_delay))

# transmute returns only the resulting column
head(transmute(flights, new_col = arr_delay-dep_delay))

# Summarise - group by
summarise(flights, avg_air_time=mean(air_time, na.rm=TRUE))

# sample of rows (n and fraction)
sample_n(flights, 5)
sample_frac(flights, 0.01)
