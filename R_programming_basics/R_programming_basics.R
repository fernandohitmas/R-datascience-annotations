# Logical Operators
# & AND - | OR - ! NOT
# Use () to make it more readable
df <- mtcars

subset(df, mpg > 20)
subset(df, (mpg > 20) & (hp > 100))
subset(df, (mpg > 20) | (hp > 100))

# IF ELSE statement
#  if(condition){}
# if (condition){
# }else if (condition2){
# }else
if (x > 10){
    print('Bigger than 10')
}else if (x < 10) {
   print('Smaller than 10')
}else {
   print('X is 10!')
}

# WHILE loops
# while (condition){code}
n <- 0

while (n < 5){
    print(n)

    if (n == 3){
        print("N reached 3")
        break
    }

    n <- n + 1
}

# FOR Loops
# for (var in vector/list/matrix) {code}
# For loop iterates through a matrix by column

# FUNCTIONS
# func1 <- function(arg1,arg2,arg3=0){
#     code
#     return(something)
# }