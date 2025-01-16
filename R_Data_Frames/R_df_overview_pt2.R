####  OVERVIEW 2 OF DATAFRAMES

# rbind - Adding rows to DF
df2 <- data.frame(numbers = 2000, letters = 'new')
df <- read.csv('letters_num.csv')
df <- df[-1]
colnames(df)
rbind(df, df2)

# df$newcolumn - Adding new column
# df[,newcolum] - Also works
# can be used to duplicate a column
df$double.num <- 2*df$numbers
head(df)

# Setting column names
# colnames(df) <- c(new.column,names)
# colnames(df)[n.col] <- new.name - rename only one of the columns

# Selecting multiple rows
# head for the first rows
# tails for the last rows
# negative sign to exclude a certain row
# df[df$col condition] - conditional selection
# subset(df, condition1 & condition2) - conditional selecion
df[1:5,]
head(df, 3)
mtcars[mtcars$mpg > 20,]
mtcars[(mtcars$mpg > 20) & (mtcars$cyl == 6), c('mpg', 'cyl', 'hp')]
subset(mtcars, mpg > 20 & cyl==6,c('mpg', 'cyl', 'hp'))

# selecting multiple column names
# df[,c(1,2,3)] - list the idexes of the columns
# df[,c(name1, name2)]
mtcars[,c(1,2,3)]

# Dealing with missing data
# is.na checks every cell in df if is na or missing
# any(is.na) check if any value inside the df is missing or na
any(is.na(mtcars))
