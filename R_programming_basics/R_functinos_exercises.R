# Ex 1: Create a function that will return the product of two integers.
prod <- function(number1, number2){
    result <- number1*number2
    return(result)
}
prod(1,2)


# Ex 2: Create a function that accepts two arguments, an integer
# and a vector of integers. It returns TRUE if the integer is 
# present in the vector, otherwise it returns FALSE. Make sure 
# you pay careful attention to your placement of the return(FALSE) 
# line in your function!
num_check <- function(number, vec){
    for (n in vec) {
       if (n == number) {
          return(TRUE)
       }
    }

    return(FALSE)
}
num_check(2, c(1,2,3))
num_check(2, c(1,4,3))


# Ex 3: Create a function that accepts two arguments, an integer and 
# a vector of integers. It returns the count of the number of occurences
# of the integer in the input vector.
num_count <- function(number, vec){
    count <- 0

    for (n in vec) {
       if (n == number) {
          count <- count + 1
       }
    }

    return(count)
}
num_count(2,c(1,1,2,2,3,3))
num_count(1,c(1,1,2,2,3,1,4,5,5,2,2,1,3))
set.seed(12)
x <- sample.int(10, 12, replace=TRUE)
x
num_count(2, x)


# Ex 4: We want to ship bars of aluminum. We will create a function 
# that accepts an integer representing the requested kilograms of 
# aluminum for the package to be shipped. To fullfill these order, we
# have small bars (1 kilogram each) and big bars (5 kilograms each). 
# Return the least number of bars needed.
bar_count <- function(kilos){
    count <- floor(kilos/5) + kilos%%5
    return(count)
}
bar_count(6)

# Ex 5: Create a function that accepts 3 integer values and returns
# their sum. However, if an integer value is evenly divisible by 3, then
# it does not count towards the sum. Return zero if all numbers are evenly
# divisible by 3. Hint: You may want to use the append() function.
summer <- function(num1, num2, num3){
    num.vec <- c(num1, num2, num3)
    nums.to.sum <- c()

    for (n in num.vec) {
       if (n%%3 != 0) {
          nums.to.sum <- append(nums.to.sum, n)
       }
    }
    total.sum <- sum(nums.to.sum)
    return(total.sum)
}
summer(11,12,9)


# Ex 6: Create a function that will return TRUE if an input integer is prime.
# Otherwise, return FALSE. You may want to look into the any() function