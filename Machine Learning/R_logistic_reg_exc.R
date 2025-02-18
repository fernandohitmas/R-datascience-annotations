### Logistic Regression Exercise
#  DATASET - Adults Salaries

library(data.table)
library(ggplot2)
library(caTools)
library(Amelia)

#### Reading Data
adult <- read.csv("./Data/adult.csv")
adult <- as.data.table(adult)

#### Checking Data
head(adult)
colnames(adult)
str(adult)

#### Data Cleaning
table(adult[, workclass])

## workclass
# Never worked & without pay = unemployed
# state & local gov = SL-gov
# self-emp-inc & self-emp-not-inc = self-emp
set(adult,
  which(
    adult[, workclass] == "Never-worked" |
    adult[, workclass] == "Without-pay"),
  "workclass", "Unemployed")
set(adult,
  which(
    adult[, workclass] == "State-gov" |
    adult[, workclass] == "Local-gov"),
  "workclass", "SL-gov")
set(adult,
  which(
    adult[, workclass] == "Self-emp-inc" |
    adult[, workclass] == "Self-emp-not-inc"),
  "workclass", "Self-emp")
table(adult[, workclass])

## Marital
colnames(adult)
table(adult[, marital.status])
set(adult, grep("Married", adult[, marital.status]), "marital.status", "Married")
set(adult,
  which(
    adult[, marital.status] == "Widowed" |
    adult[, marital.status] == "Separated" |
    adult[, marital.status] == "Divorced"),
  "marital.status", "Not-Married")
table(adult[, marital.status])

## Country
table(adult[, native.country])
northAmerica <- c( "Outlying-US\\(Guam-USVI-etc\\)", "Canada", "United-States")
latam <- c("Columbia", "Dominican-Republic", "El-Salvador", "Mexico", "Haiti", "Honduras",
           "Trinadad&Tobago", "Cuba", "Ecuador", "Guatemala", "Jamaica", "Nicaragua", "Puerto-Rico",
           "Peru")
europe <- c("France", "Hungary", "Italy", "Portugal", "Scotland", "England", "Germany", "Holand-Netherlands",
            "Ireland", "Poland", "Yugoslavia", "Greece")
asia <- c("Iran", "Japan", "Taiwan", "Vietnam", "Cambodia", "China", "Hong", "India",
          "Laos", "South", "Thailand", "Philippines")
          
set(adult,
    grep(paste(northAmerica, collapse = "|"), adult[, native.country]),
    "native.country", "north.america")
set(adult,
    grep(paste(latam, collapse = "|"), adult[, native.country]),
    "native.country", "latam")
set(adult,
    grep(paste(europe, collapse = "|"), adult[, native.country]),
    "native.country", "europe")
set(adult,
    grep(paste(asia, collapse = "|"), adult[, native.country]),
    "native.country", "asia")
set(adult,
    grep("\\?", adult[, native.country]), "native.country", "Other")
table(adult[, native.country])

# chaging chr columns to factor
for (col in colnames(adult)) {
    if (is.character(adult[[col]])) {
        print(col)
        adult[[col]] <- as.factor(as.matrix(adult[[col]]))
    }
}

# Checking for missing values
str(adult)
for (col in colnames(adult)) {
  if (is.factor(adult[[col]]) & "?" %in% levels(adult[[col]])) {
    print(cat(col))
    print(levels(adult[[col]]))
    set(adult,
      grep("\\?", adult[[col]]), col, NA)
  }
}
for (col in colnames(adult)) {
  if (is.factor(adult[[col]]) & "?" %in% levels(adult[[col]])) {
    print(cat(col))
    print(levels(adult[[col]]))
  }
}
table(adult[,occupation])

missmap(adult,
        main = "Missing Map", 
        col = c("yellow", "black"), legend = FALSE)

# Removing NA
adult <- na.omit(adult)
any(is.na(adult))

#### EDA
for (col in colnames(adult)) {
  if (is.factor(adult[[col]])) {
    print(col)
    adult[[col]] <- as.factor(as.matrix(adult[[col]]))
  }
}
str(adult)

ggplot(adult, aes(x = age, fill = income)) + 
  geom_histogram(binwidth = 1, color = "black", alpha = 0.5)

#### Building the model

# Split data
split <- sample.split(adult[, income], SplitRatio = 0.7)
test <- subset(adult, split==FALSE)
train <- subset(adult, split==TRUE)

# About glm
help(glm)
model <- glm("income ~ .", family = binomial(link = "logit"), data = train)
summary(model)
new.model <- step(model)
fitted.probs <- predict(new.model, test, type = "response")
fitted.results <- ifelse(fitted.probs > 0.5, 1, 0)
mis.class.erro <-  mean(fitted.results != test[, income])
print(1 - mis.class.erro)

table(test[, income], fitted.probs > 0.5)
fitted.probs
