# Ex 1: Write a script that will print "Even Number" if 
# the variable x is an even number, otherwise print "Not Even":
x <- 0
if (x %% 2 == 0) {
   print('X is Even')
}else{
    print('X is no Even')
}

# Ex 2: Write a script that will print 'Is a Matrix' if the
# variable x is a matrix, otherwise print "Not a Matrix". 
# Hint: You may want to check out help(is.matrix)
mat <- matrix(1:12, nrow = 3, byrow=TRUE)
mat <- 10
if (is.matrix(mat)) {
    print('Is matrix')
} else {
    print('Not matrix')
}

# Ex 3: Create a script that given a numeric vector x with a 
# length 3, will print out the elements in order from high to low.
# You must use if,else if, and else statements for your logic. 
# (This code will be relatively long)
vec <- c(3,20,1)

if (vec[1] > vec[2]){
   first <- vec[1]
   second <- vec[2]
} else {
   first <- vec[2]
   second <- vec[1]
}

if ((vec[3] > first) & (vec[3] > second)){
   third <- second
   second <- first
   first <- vec[3]
}else if((vec[3] < first) & vec[3] < second){
   third <- vec[3]
}
paste(first, second, third)
# Ex 4: Write a script that uses if,else if, and else statements to 
# print the max element in a numeric vector with 3 elements.
vec <- c(3,2,1)
if ((vec[1] > vec[2]) & (vec[1] > vec[3])){
   print(vec[1])
}else if(vec[2] > vec[3]){
   print(vec[2])
}else{
   print(vec[3])
}
