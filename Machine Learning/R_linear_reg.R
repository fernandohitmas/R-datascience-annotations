# Linear Regression with R
# install.packages('corrgram')
# install.packages('corrplot')
# install.packages('caTools')
library(data.table)
library(ggplot2)
library(ggtheme)
library(corrgram)
library(corrplot)
library(caTools)

# The problem is to predict the grade of students of math classes (G1, G2, G3)
df <- read.csv("./Data/student-mat.csv", sep=";")
dt <- as.data.table(df)

head(dt)
summary(dt)

# checking for null/na data
any(is.na(dt))

# checking the structure of the dataset
str(dt)

# chaging chr columns to factor
for (col in colnames(dt)) {
    if (is.character(dt[[col]])) {
        print(col)
        dt[[col]] <- as.factor(as.matrix(dt[[col]]))
    }
}

# checking the structure
str(dt)

# Separating numeric columns
num.cols <- sapply(dt, is.numeric)

# filtering the dataframe
cor.data <- cor(dt[,num.cols, with = FALSE])

# visualizing
corrplot(cor.data, method = "color")
corrgram(dt, order=TRUE, lower.panel = panel.shade,
            upper.panel = panel.pie, text.panel = panel.txt)

# about G3
ggplot(dt, aes(x=G3)) +
    geom_histogram(bins=20, alpha = 0.5, fill = 'blue')


##### MODELLING
# Split data in train and test
# set a seed
set.seed(101)

# split, test and train data
sample <- sample.split(dt[,G3], SplitRatio = 0.7)
train <- dt[sample == TRUE]
test <- dt[sample == FALSE]

# creating a linear model
model <- lm(G3 ~ ., data = train)

summary(model)

# plotting residuals
res <- residuals(model)
res <- as.data.frame(res)
ggplot(res, aes(res)) + geom_histogram(fill='blue', alpha=0.5)

# predictions
g3.predictions <- predict(model, test)

results <- cbind(g3.predictions, test[,'G3'])
colnames(results) <- c('predicted', 'actual')
results <- as.data.frame(results)
head(results)

# taking care of 0 values
to_zero <- function(x){
    if (x < 0 ){
        return(0)
    }else{
        return(x)
    }
}

results['predicted'] <- sapply(results[,'predicted'], to_zero)

# MSE - to measure performance
mse <- mean((results[,'actual'] - results[, 'predicted'])^2)
print('MSE')
print(mse)

# RMSE
print(mse^0.5)

# SSE
sse <- sum((results[,'predicted'] - results[, 'actual'])^2)
sst <- sum( (mean(dt[,G3]) - results[,'actual'])^2 )

r2 <- 1 - sse/sst
print(r2)
