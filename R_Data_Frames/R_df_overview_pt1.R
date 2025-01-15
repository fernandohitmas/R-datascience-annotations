####  OVERVIEW 1 OF DATAFRAMES
# Creting a dataframe
# empty dataframe = data.frame()
# data.frame(column.name1=vector1, column.name2=vector2...)
c1 <- 1:10
c2 <- letters[1:10]
df <- data.frame(numbers = c1, letters = c2)
df

# read.csv() - reads a csv file
# write.csv(df, file = 'path') - writes a csv file
write.csv(df, file = 'letters_num.csv')
df <- read.csv('letters_num.csv')
df <- df[,-1]
df

# NROW and NCOL - for number of rows and columns
# ROWNAMES and COLNAMES - for names of col and rows
# STR - structure function to describe the dataframe
# SUMMARY - statitical information
nrow(df)
ncol(df)
colnames(df)
str(df)
summary(df)

# Referencing a single cell: df[[row, col]], col can be number or name
# it is possible to change only that single referenced cell
df[[5,2]]
df[[5,'letters']]

# Referencing rows: df[row,] - returns a dataframe
df[1,]

# Referencing columns: df$col, df[,col], df[,n_of_col], df[[col]] returns vector 
df$numbers
df[,'numbers']
df[['numbers']]

# df[col|c(col1,col2...)] - If the desired result is a dataframe
df['numbers']
df[c('numbers', 'letters')]

# HEAD and TAIL - sample the first observations or the latter
head(mtcars[c('mpg', 'cyl')])
