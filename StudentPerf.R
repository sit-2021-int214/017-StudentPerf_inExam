# Pre-requisites
install.packages("DescTools") # Descriptive statistics
install.packages("MASS")      # Functions and datasets
install.packages("dplyr")     # Data manipulation
install.packages("readr")     # A fast and friendly way to read rectangular data
install.packages("assertive") # Readable check functions to ensure code integrity
install.packages("stringr")   # Character manipulation

# Use libraries
library(DescTools)
library(MASS)
library(dplyr)
library(readr)
library(assertive)
library(stringr)

# Dataset
StudentPerf <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/017-StudentPerf_inExam/main/StudentsPerformance_Original.csv")

# Cleaning Dataset
StudentPerf <- StudentPerf %>% rename(Gender='gender')
StudentPerf <- StudentPerf %>% rename(Group='race.ethnicity')
StudentPerf <- StudentPerf %>% rename(Parental_Level_of_Education='parental.level.of.education')
StudentPerf <- StudentPerf %>% rename(Lunch='lunch')
StudentPerf <- StudentPerf %>% rename(Test_Preparation_Course='test.preparation.course')
StudentPerf <- StudentPerf %>% rename(Math_Score='math.score')
StudentPerf <- StudentPerf %>% rename(Reading_Score='reading.score')
StudentPerf <- StudentPerf %>% rename(Writing_Score='writing.score')

# Create Cleaning Dataset
write_csv(StudentPerf, file = "StudentsPerformance_Clean.csv")

# Change to Tibble
StudentPerf <- as_tibble(StudentPerf)

# Result of Cleaned Dataset
View(StudentPerf)
glimpse(StudentPerf)

# Define Questions

# ข้อ 1
# Code here

# ข้อ 2
# Code here

# ข้อ 3
# Code here

# ข้อ 4
# Code here

# ข้อ 5
StudentPerf %>%
  select(Math_Score, Reading_Score, Writing_Score) %>%
  summarise(MATH_AVG = mean(Math_Score),
            READING_AVG = mean(Reading_Score),
            WRITING_AVG = mean(Writing_Score))

# ข้อ 6
StudentPerf %>%
  select(Gender,
         Group,
         Parental_Level_of_Education,
         Math_Score,
         Reading_Score,
         Writing_Score) %>%
  filter(StudentPerf$Math_Score == max(StudentPerf$Math_Score) &
         StudentPerf$Reading_Score == max(StudentPerf$Reading_Score) &
         StudentPerf$Writing_Score == max(StudentPerf$Writing_Score))
