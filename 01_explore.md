# Dataset Explore of Students Performance in Exams

Dataset from [Students Performance in Exams](https://github.com/sit-2021-int214/017-StudentPerf_inExam/blob/main/StudentsPerformance_Original.csv)

## Library and Dataset

```{R}
# Pre-requisite
install.packages("DescTools")
install.packages("MASS")
install.packages("dplyr")
install.packages("readr")
install.packages("assertive")
install.packages("stringr")

# Use libraries
library(DescTools)
library(MASS)
library(dplyr)
library(readr)
library(assertive)
library(stringr)

# Dataset
StudentPerf <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/017-StudentPerf_inExam/main/StudentsPerformance_Original.csv")
```

## Change to Tibble

```{R}
StudentPerf <- as_tibble(StudentPerf)
glimpse(StudentPerf)
```

## Cleaning Dataset

```{R}
# Cleaning Dataset
StudentPerf <- StudentPerf %>% rename(Gender='gender')
StudentPerf <- StudentPerf %>% rename(Group='race.ethnicity')
StudentPerf <- StudentPerf %>% rename(Parental_Level_of_Education='parental.level.of.education')
StudentPerf <- StudentPerf %>% rename(Lunch='lunch')
StudentPerf <- StudentPerf %>% rename(Test_Preparation_Course='test.preparation.course')
StudentPerf <- StudentPerf %>% rename(Math_Score='math.score')
StudentPerf <- StudentPerf %>% rename(Reading_Score='reading.score')
StudentPerf <- StudentPerf %>% rename(Writing_Score='writing.score')
```

---

## Define Questions

### ข้อ 1

โจทย์ (ใส่โจทย์ที่เราตั้ง)

```{R}

```

ผลลัพธ์

```{R}

```

### ข้อ 2

โจทย์ (ใส่โจทย์ที่เราตั้ง)

```{R}

```

ผลลัพธ์

```{R}

```

### ข้อ 3

โจทย์ (ใส่โจทย์ที่เราตั้ง)

```{R}

```

ผลลัพธ์

```{R}

```

### ข้อ 4

โจทย์ (ใส่โจทย์ที่เราตั้ง)

```{R}

```

ผลลัพธ์

```{R}

```

### ข้อ 5

โจทย์ (ใส่โจทย์ที่เราตั้ง)

```{R}

```

ผลลัพธ์

```{R}

```

### ข้อ 6

โจทย์ (ใส่โจทย์ที่เราตั้ง)

```{R}

```

ผลลัพธ์

```{R}

```
