# Tidyr is made to work with relational data
# Exploring some functions from tidyr
library(tidyr)

# GATHER - pivot table from multiple columns to one as variable
# SPREAD - pivot in the opposite direction from col to columns
comp <- c(1,1,1,2,2,2,3,3,3)
yr <- rep(c(1998,1999,2000), times=3)
q1 <- runif(9, min=0, max=100)
q2 <- runif(9, min=0, max=100)
q3 <- runif(9, min=0, max=100)
q4 <- runif(9, min=0, max=100)

df <- data.frame(comp=comp, year=yr,  Qtr1 = q1, Qtr2 = q2, Qtr3 = q3, Qtr4 = q4)

gather(df, Quarter, Revenue, Qtr1:Qtr4)

stocks <- data.frame(
    time = as.Date("2009-01-01") + 0:9,
    X = rnorm(10, 0, 1),
    Y = rnorm(10, 0, 2),
    Z = rnorm(10, 0, 4)
)
stocks.gathered <- gather(stocks, stock, price, X, Y, Z) #, X:Z)
spread(stocks.gathered, stock, price)

# SEPARATE - divides the values of a column based on a symbol (',' '.' '_')
# UNITE - to join all the values of two columns together
df <- data.frame(new.col = c(NA, "a.x", "b.y", "c.z"))
separate(df, new.col, c('ABC', 'XYZ'))
df <- data.frame(new.col = c(NA, "a_x", "b.y", "c_z"))
df.sep <- separate(df, new.col, c('ABC', 'XYZ'))
unite(df.sep, new.joined.col, ABC, XYZ)
