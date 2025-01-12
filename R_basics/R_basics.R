## Basic arithmetics

# sum : +
# subtraction : -
# multiplication : *
# division : /
# power : ^
# remainder of a division: %%
# operations follow the mathetical order, 
# which includes the parenthesis logic


## Variables

# variables start with lower case letters
# variables words are separeted by points or dots ('.') or
# without separation but with the second word start with capital letters
deposit <- 100
bank.account <- 10
bank.account <- bank.account + deposit


## R data types

# Numeric class: float and integers
# Logical class: TRUE (T) or FALSE (F)
# String class: "" or '', "" is more common
# class() functions to identify the class of the variable
a <- 1
b <- 1.1
c <- TRUE
d <- "Hello World" 

class(a)
class(b)
class(c)
class(d)


## Vector Basics

# Use the function c(), short for combination,to create
# a vector. The vector must have all elements of the 
# same class and will cast the wrong element.
# Vector also have 'names' which refer to individual
# id for each element of the vector.

first.vector <- c(1,2,3)
names(first.vector) <- c('prim', 'segundo', 'terceiro')
first.vector
first.vector['prim']

## Vector Operations
v1 <- c(1,2,3)
v2 <- c(5,6,7)

# Element by element
v1 + v2 
v1 - v2 
v1 * v2 
v1 / v2 

# Whole vector - sum, mean, min, max, sd
# prod > the product of all elements of the vector
# these are some of the main BUILT-IN functions
sum(v1)
sum(v2)
mean(v1)
min(v1)
max(v2)
sd(v1)
prod(v1)

## Comparison operators

# greater >
# smaller < 
# equality ==
# inequality ! =

# Using with vectors, returns a vector of logical values
v1 <- c(1,2,3,4,5,6,7)
v1 < 4
v1 == 4

# Comparing two vectors element by element
v2 <- c(7,6,5,4,3,2,1)
v1 < v2


## Vector Indexing and Slicing
# INDEXING - Each element of the vector can be accessed by [] notation
# vector[1] is the first element, vector[2] is the second and so on.
# Indexing also works with named vectors (names())
# MULTIPLE INDEXING - get multiple elements through the c() function
# inside the [] notation. vector[c(1,3,4)] returns the elements 1,3 and 4
# 

v1 <- c(1,2,3,4,5,6)
v2 <- c('a', 'b', 'c', 'd', 'e', 'f')

v1[1]
v1[4]
v1[c(1,2,4)]
v2[c(1,2,4)]

# SLICING - Get an interval of a vector using : inside the []
# Get the second up to the fifth element: vector[2:5]
v1[2:5]

# LOGICAL MASKING - Set a condition to a vector and use the result 
# in the slice place. vector[condition using vector]
v1[v1 > 3]
filter <- v1 > 3
v1[filter]