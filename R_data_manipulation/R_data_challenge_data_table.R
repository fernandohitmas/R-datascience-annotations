# Analysing Baseball data
library(data.table)

path <- "./Data/Capstone Project/Batting.csv"
batting <- read.csv(path)
batting <- as.data.table(batting)
head(batting)

# At bats first 5 rows of AB and X2B columns
head(batting[, "AB"])
head(batting[, "X2B"])

## Feature Engineering
# Batting Average
batting[, BA := H/AB]
tail(batting[, "BA"])

# On Base Percentage (OBP)
#                  (Hits + Walks + Hit by Pitch)
# OBP =       ----------------------------------------
#        (At Bats + Walks + Hit by Pitch + Sacrifice Flies)
# 1B (singles) = H-2B-3B-HR
# SLG = (1B + 2Bx2 + 3Bx3 + HRx4)/AB
batting[, `:=` (OBP = (H + IBB + HBP) / (AB + IBB + HBP + SF),
            X1B =  H - X2B - X3B - HR)
            ][, `:=` (SLG = X1B + 2 * X2B + 3 * X3B + 4 * HR)]

# Checking Structure againg
str(batting)

## Getting salary information
path_salary <- "./Data/Capstone Project/Salaries.csv"
salary <- read.csv(path_salary)
salary <- as.data.table(salary)

# Summary of salary data - earliest year is 1985
summary(salary)

# Getting only 1985 onwards batting data
batting_1985 <- batting[yearID >= 1985]
summary(batting_1985)

# Merging batting_1985 and salary
help(merge)
combo <- merge(batting_1985, salary, 
    by.x = c('playerID', 'yearID'), by.y = c('playerID', 'yearID'))
head(combo)

# Finding the lost players statistics
lost.players <- combo[playerID %in%  c('giambja01', 'damonjo01', 'saenzol01') & 
                        yearID == 2001
                        ][, list(playerID,H,X2B,X3B,HR,OBP,BA,AB,SLG)]

# Finding replacement players
combo.2001 <- combo[yearID == 2001]
