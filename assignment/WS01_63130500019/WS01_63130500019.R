# Student_ID: 631305000019

# Install packages, and loading library and dataset

# Packages
install.packages("dplyr")
install.packages("readr")
install.packages("assertive")
install.packages("stringr")

# Libraries
library(dplyr)     # Data manipulation
library(readr)     # A fast and friendly way to read rectangular data
library(stringr)   # Character manipulation
library(assertive) # Readable check functions to ensure code integrity

# Dataset
sat <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/SAT_original.csv")

# ------------------------------------------------------------------------

# Explore

# xxxx

# USEFUL FUNCTION (After finished please remove it) -------------------------
## Stat
sum()
min()
mean()
max()

## Explore
head()      # See 6 observation (rows)
str()       # Structure of object
summary()

## dplyr package
glimpse()
select()
filter()
arrange()
mutate()
group_by()
summarise()
count()

## Cleaning
as.vector()
as.numeric()
na.omit()
is.na()
replace()
distinct()
duplicated()

#assertive package
assert_is_numeric()
assert_all_are_in_closed_range()

# ------------------------------------------------------------------------

# Questions

# 1.

# 2.

# 3.

# 4.

# 5.

# 6.
