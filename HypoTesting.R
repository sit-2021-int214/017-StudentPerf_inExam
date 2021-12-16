# Pre-requisites
install.packages("dplyr") # Data manipulation such as mutate, select, filter, etc.
install.packages("readr") # A fast and friendly way to read rectangular data

# Use libraries
library(dplyr)
library(readr)

# Dataset
HypoTesting <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/017-StudentPerf_inExam/main/StudentsPerformance_Clean.csv")

# Question
# จากข้อมูลที่ได้สำรวจทั้งหมด 1,000 ข้อมูล กลุ่มเราอยากทราบว่า ค่าเฉลี่ยของคะแนนหมวดคณิตศาสตร์จากจำนวนข้อมูล `100` ข้อมูล กลุ่มเราได้ตั้งสมมติฐานว่าคะแนนเฉลี่ยของหมวดคณิตศาสตร์มีคะแนนเฉลี่ยมากกว่า `66.08` คะแนน โดยที่คะแนนเฉลี่ยของหมวดคณิตศาสตร์ทั้งหมด `67.39` คะแนน จากการสุ่มตัวอย่างข้อมูล และมีส่วนเบี่ยงเบนมาตรฐาน `14.18` ซึ่งเรากำหนดค่า alpha เท่ากับ `0.05`รากำหนดค่า alpha เท่ากับ 0.05  

# Sample data
sample_100 <- HypoTesting %>% sample_n(100)

# Step 0 : Assign Variables

# n
n <- 100 # 100
# mean
xbar <- mean(sample_100$Math_Score) # 67.39
# standard division
sd <- sd(sample_100$Math_Score) # 14.18
# mu0
mu0 <- mean(HypoTesting$Math_Score) # 66.089

# Step 1 : State the hypothesis

# Ho: mu0 >= 66.089
# Ha: mu0  < 66.089

#Step 2 : Level of significance

alpha <- 0.05 # 0.05

# Step 3 : Test statistic

z <- (xbar-mu0)/(sd/sqrt(n));
z # 0.91

# Step 4 : Finding P-value approach or Critical Value approach

# P-value approach
pvalue <- pnorm(z);
pvalue # 0.82

# Critical value approach
zalpha <- qnorm(alpha);
zalpha # -1.64

# Step 5 : Compare P-value with alpha or z/t with zalpha/talpha

# Using P-value approach

# Accept H0
if(pvalue<=alpha){
  print("Reject H0")
} else {
  print("Accept H0")
}

# Using critical value

# Accept H0
if(z<=zalpha){
  print("Reject H0")
} else {
  print("Accept H0")
}

# Step 6 : Interval Estimation

se_of_margin <- xbar/sqrt(n) # 6.73
margin <- 1.96*se_of_margin # 13.20

upper <- xbar+margin # 80.59
lower <- xbar-margin # 54.18

# 54.18 < xbar (67.39) < 80.59

# Step 7 : Conclusion

# จากการทดสอบสมมุติฐานสรุปได้ว่า เป็นไปตามสมมุติฐานข้างต้นคือ คะแนนเฉลี่ยของหมวดคณิตศาสตร์ มีคะแนนเฉลี่ยมากกว่า `66.08` คะแนน
