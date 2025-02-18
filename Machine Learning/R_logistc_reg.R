#### LOGISTIC REGRESSION
# install.packages("Amelia")
library(Amelia)
library(data.table)
library(ggplot2)
library(corrgram)
library(corrplot)
library(caTools)

df.train <- read.csv('./Data/titanic_train.csv', stringsAsFactors=TRUE)
train <- as.data.table(df.train)

head(train)
str(train)

# Exploration of data
missmap(train,
        main = "Missing Map", 
        col = c("yellow", "black"), legend = FALSE)

ggplot(train, aes(x = Survived)) +
  geom_bar()

ggplot(train, aes(x = Pclass, fill = factor(Survived))) +
  geom_bar(position = "dodge")

ggplot(train, aes(x = Age)) +
  geom_histogram(bins = 20,
                alpha = 0.5, fill = "blue")

ggplot(train, aes(x = SibSp)) +
  geom_bar()

ggplot(train, aes(x = Fare)) +
  geom_histogram(
    fill = "green",
    color = "black", 
    alpha = 0.5)

ggplot(train, aes(x = Pclass, y = Age)) + 
  geom_boxplot(
    aes(group = Pclass, fill = factor(Pclass))
  ) + 
  scale_y_continuous(
    breaks = seq(min(0), max(80), by = 2)
  ) +
  theme_bw()

# Data imputation of age with mean for each class
set(train, which(is.na(train[,Age])  & train[,Pclass] == 1), "Age", 37)
set(train, which(is.na(train[,Age])  & train[,Pclass] == 2), "Age", 29)
set(train, which(is.na(train[,Age])  & train[,Pclass] == 3), "Age", 24)

missmap(train,
        main = "Missing Map", 
        col = c("yellow", "black"), legend = FALSE)
ggplot(train, aes(x = Pclass, y = Age)) + 
  geom_boxplot(
    aes(group = Pclass, fill = factor(Pclass))
  ) + 
  scale_y_continuous(
    breaks = seq(min(0), max(80), by = 2)
  ) +
  theme_bw()

# removing columns
train <- train[, -c("PassengerId", "Name", "Ticket", "Cabin"), with = FALSE]
str(train)
train[, ":=" (Survived = as.factor(Survived))]
train[, ":=" (Pclass = as.factor(Pclass))]
train[, ":=" (Parch = as.factor(Parch))]
train[, ":=" (SibSp = as.factor(SibSp))]
str(train)

log.model <- glm(Survived ~ ., family = binomial(link = "logit"), data = train)
summary(log.model)

# Split train validation
split <- sample.split(train[,Survived], SplitRatio = 0.7)
validation <- subset(train, split==FALSE)
train <- subset(train, split==TRUE)
str(validation)
str(train)

# new model
set.seed(101)
final.model <- glm(Survived ~ ., family = binomial(link = "logit"), data = train)
summary(final.model)
fitted.probs <- predict(final.model, validation, type = "response")
fitted.results <- ifelse(fitted.probs > 0.5, 1, 0)
mis.class.erro <-  mean(fitted.results != validation[, Survived])
print(1 - mis.class.erro)

# CONFUSION MATRIX
table(validation[, Survived], fitted.probs > 0.5)
