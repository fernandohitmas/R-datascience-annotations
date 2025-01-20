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
