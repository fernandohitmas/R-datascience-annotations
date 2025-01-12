## Matrices are very much like vectors, but 2 dimensional
## also uses only kind of class for the whole matrix

# Creating a sequence of numbers using ":"
# such as 1:10 (1,2,3, ... 10)
v <- 1:10
v

# matrix function creates a matrix
# nrow - number of rows
# ncol - number of columns
# byrow - complete the matrix by row elements
matrix(v)
matrix(v, nrow=2)
matrix(1:12, nrow=4)
matrix(1:12, ncol=4, byrow=T)

# Matrix from multiple vectors
# Matrix rownames, colnames
v1 <- c(1:5)
v2 <- c(11:15)
st.matrix <- matrix(c(v1, v2), byrow=TRUE, nrow=2) 

days <- c('mon', 'tue', 'wed', 'thu', 'fri')
st.names <- c('st1', 'st2')

rownames(st.matrix) <- st.names
colnames(st.matrix) <- days

st.matrix


## Basic Matrix Arithmetics
# Operations with scalar is calculated with each individual
# element of the matrix
m1 <- matrix(1:25, byrow=T, nrow=5)
m1 + 10
m1 - 10
m1 * 10
m1 / 10
1 / m1

# Logical operations
m1 > 10
m1[m1 > 10]

# Operations between matrices
m1*m1
m1/m1
m1^m1  

# Mathematical matrix multiplication: %*%
m1 %*% m1