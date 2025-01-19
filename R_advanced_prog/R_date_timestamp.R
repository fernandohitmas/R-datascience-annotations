# Working with dates
# date follows the format: yyyy-mm-dd
# as.Date functions also accepts the format argument
today <- Sys.Date()
class(today)
date1 <- as.Date("1999-10-23")
class(date1)
date2 <- as.Date("Nov-10-01", format="%b-%d-%y")
date2

# Timestamp usually is used along with strptime