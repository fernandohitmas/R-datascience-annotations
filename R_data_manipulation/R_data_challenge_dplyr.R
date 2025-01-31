# Analysing Baseball data
library(dplyr)

path_batting <- "./Data/Capstone Project/Batting.csv"
batting <- read.csv(path_batting)

# sample of dataset
head(batting)

# Structure of the dataset
str(batting)

# At bats first 5 rows of AB and X2B columns
head(batting[, "AB"])
head(batting[, "X2B"])

## Feature Engineering
# Batting Average
batting["BA"] <- transmute(batting, BA = H/AB)
tail(batting[, "BA"])

# On Base Percentage (OBP)
#                  (Hits + Walks + Hit by Pitch)
# OBP =       ----------------------------------------
#        (At Bats + Walks + Hit by Pitch + Sacrifice Flies)
batting["OBP"] <- transmute(
                            batting,
                            OBP = (H + IBB + HBP) / (AB + IBB + HBP + SF))

# 1B (singles) = H-2B-3B-HR
batting["X1B"] <- transmute(batting, X1B =  H - X2B - X3B - HR)

# SLG = (1B + 2Bx2 + 3Bx3 + HRx4)/AB
batting["SLG"] <- transmute(batting, SLG = X1B + 2 * X2B + 3 * X3B + 4 * HR)

# Checking Structure againg
str(batting)

## Getting salary information
path_salary <- "./Data/Capstone Project/Salaries.csv"
salary <- read.csv(path_salary)

# Summary of salary data - earliest year is 1985
summary(salary)

# Getting only 1985 onwards batting data
batting_1985 <- batting %>% subset(yearID >= 1985)
summary(batting_1985)

# Merging batting_1985 and salary
help(merge)
combo <- merge(batting_1985, salary, 
    by.x = c('playerID', 'yearID'), by.y = c('playerID', 'yearID'))

# Finding the lost players statistics
lost.players <- combo %>%
                    subset(
                        playerID %in% c('giambja01', 'damonjo01', 'saenzol01') &
                        yearID == 2001 )

lost.players <- lost.players %>% select(playerID,H,X2B,X3B,HR,OBP,SLG,BA,AB)

# Finding replacement players
combo.2001 <- combo %>% subset(yearID == 2001)
