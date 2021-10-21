# Explore of Students Performance in Exams

Dataset: [Students Performance in Exams (Original)](https://github.com/sit-2021-int214/017-StudentPerf_inExam/blob/main/StudentsPerformance_Original.csv)

## Library and Dataset

```R
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

```R
StudentPerf <- as_tibble(StudentPerf)
glimpse(StudentPerf)
```

## Cleaning Dataset

```R
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
```

---

## Define Questions

### ข้อ 1

นักศึกษาเพศใดจบปริญญาตรีมากกว่ากัน

```R

```

ผลลัพธ์

```R

```

### ข้อ 2

คนที่ทำคะแนนการสอบทั้งคณิตศาสตร์ การอ่าน และการเขียนได้ 90 คะแนนขึ้นไปมีกี่คน

```R

```

ผลลัพธ์

```R

```

### ข้อ 3

เพศไหนทำคะแนนได้มากกว่ากัน

```R

```

ผลลัพธ์

```R

```

### ข้อ 4

คะแนนเฉลี่ยในแต่ละวิชาของชายหรือหญิงมีค่ามากน้อยต่างกันเพียงใด

```R

```

ผลลัพธ์

```R

```

### ข้อ 5

ค่าเฉลี่ยการทั้งสอบทั้งคณิตศาสตร์ การอ่าน และการเขียนมีค่าเท่าไร แล้วให้เปลี่ยนชื่อคอลัมน์ให้สื่อความหมาย เช่น `Subject_Score` เป็น `Subject_AVG` ที่จะใช้ summarise

```R
StudentPerf %>%
  select(Math_Score, Reading_Score, Writing_Score) %>%
  summarise(MATH_AVG = mean(Math_Score),
            READING_AVG = mean(Reading_Score),
            WRITING_AVG = mean(Writing_Score))
```

ผลลัพธ์

```R
# A tibble: 1 x 3
  MATH_AVG READING_AVG WRITING_AVG
     <dbl>       <dbl>       <dbl>
1     66.1        69.2        68.1
```

### ข้อ 6

ให้หาคนที่ทำคะแนนได้สูงสุด (ได้เต็ม 100 คะแนน) โดยแสดงข้อมูลคอลัมน์ของ เพศ กลุ่ม และคะแนนที่ทำได้ทั้งคณิตศาสตร์ การอ่าน และการเขียน

```R
StudentPerf %>%
  select(Gender,
         Group,
         Math_Score,
         Reading_Score,
         Writing_Score) %>%
  filter(StudentPerf$Math_Score == max(StudentPerf$Math_Score),
         StudentPerf$Reading_Score == max(StudentPerf$Reading_Score),
         StudentPerf$Writing_Score == max(StudentPerf$Writing_Score))
```

ผลลัพธ์

```R
# A tibble: 3 x 5
  Gender Group   Math_Score Reading_Score Writing_Score
  <chr>  <chr>        <int>         <int>         <int>
1 female group E        100           100           100
2 male   group E        100           100           100
3 female group E        100           100           100
```
