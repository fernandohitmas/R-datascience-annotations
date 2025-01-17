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
