library(dplyr)
library(data.table)
df <- mtcars
dt <- as.data.table(mtcars)

# 1. Return rows of cars that have an mpg value greater than 20 and 6 cylinders.
# ---- DPLYR
df %>%
    filter(mpg > 20 & cyl == 6) 
# ---- DATA.TABLE
dt[mpg > 20 & cyl==6] 

# 2. Reorder the Data Frame by cyl first, then by descending wt.
# ---- DPLYR
df %>%
    arrange(cyl, desc(wt)) %>%
    head()
# ---- DATA.TABLE
head(dt[order(cyl, -wt)])

# 3. Select the columns mpg and hp
# ---- DPLYR
df %>%
    select(mpg, hp) %>%
    head()
# ---- DATA.TABLE
head(dt[,.(mpg, hp)])

# 4. Select the distinct values o the gear column
# ---- DPLYR
df %>%
    select(gear) %>%
    distinct() %>%
    head()
# ---- DATA.TABLE
dt[,gear, by=gear]
unique(dt[, .(gear)])

# 5. Create a new column called "Performance" which is calculated 
# by hp divided by wt.
# ---- DPLYR
df %>%
    mutate(Perfomance = hp/wt) %>%
    head()
# ---- DATA.TABLE
dt[, `:=`(Performance = hp/wt)]
head(dt)

# 6. Find the mean mpg value using dplyr
# ---- DPLYR
df %>%
    summarise(mean_mpg = mean(mpg))
# ---- DATA.TABLE
dt[,.(mean.mpg = mean(mpg))]

# 7. Use pipe operatos to get the mean hp value for cars with 6 cylinders
# ---- DPLYR
df %>%
    filter(cyl == 6) %>%
    summarise(mean.hp = mean(hp))
# ---- DATA.TABLE
dt[cyl==6
    ][,.(mean.hp = mean(hp))]
