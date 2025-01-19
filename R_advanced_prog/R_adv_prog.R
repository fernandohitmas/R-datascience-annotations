# Built-in R features
# seq(start, end, step) - create sequeces
# sort(decreasing) - sort a vector, numbers and letters
# rev() - reverse elements in a object
# str() - show the structure of an object
# append(obj1, obj2) - merge objects together - vectors and lists
seq(0, 10, 2)
set.seed(42)
x <- sample.int(20, 20, replace=TRUE)
x
sort(x, decreasing = TRUE)
x <- c('x', 'b','z','m')
sort(x)
x
rev(x)

# Checking data type
# is.(vector, matrix, list...) - returns boolean
# Converting data type
# as.

# Apply function
# lapply - apply over a vector and returns a LIST
# sapply - same but returns a vector
# sapply(vector, function, arg1, arg2...) - where args are
# the arguments of the function
v <- c(1:5)

addrand <- function(x){
    ran <- sample(1:100, 1)
    return(x+ran)
}

times2 <- function(num){
    return(num*2)
}

lapply(v, addrand)
sapply(v, addrand)
sapply(v, times2)

# Anonymous function 
# no need of return
# sapply(vector, function(arg){code})