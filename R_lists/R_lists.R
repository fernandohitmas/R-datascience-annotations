# LISTS BASICS
# variety of data classes in a single variable
v <- c(1,2,3)
m <- matrix(1:10, nrow=2)
df <- mtcars
class(v)
class(m)
class(df)
my.list <- list(v, m, df)
my.list

# Rename objets of the list
my.named.list <- list(sample_vec = v, some_matrix = m, a_df = df)
my.named.list
my.named.list$sample_vec
my.list[1]
my.named.list['sample_vec']

# list[num] and named.list[col.name] are notations that return lists
# to return a vector, it must be either:
# list[[num]], list$num
# named.list[[col.name]], named.list$col.name
class(my.named.list['sample_vec']) # list
class(my.named.list[['sample_vec']]) # numeric
class(my.named.list$'sample_vec') # numeric

# Lists can contain other lists
double.list <- c(my.named.list, my.named.list)
double.list

# STR from structure is the best way to get information about the list
str(my.named.list)
