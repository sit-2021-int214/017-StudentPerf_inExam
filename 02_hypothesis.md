# Hypothesis Testing of Students Performance in Exams

## Step to do

0. Assign variables:
   - u0 or p0
   - xbar or pbar
   - n
   - sd (or sigma)
   - alpha (default is 0.05)
1. State the hypothesis
2. Select Level of significance (alpha)
3. Select Test statistic (This formula for one population)
   - z/t <- (xbar - u0) / (sd/sqrt(n))
   - z <- (pbar-p0) / sqrt((p0\*(1-p0))/n)
4. Finding P-value approach or Critical Value approach
   - P-value for Z: `pvalue <- pnorm(z)`
   - Critical Value for Z: `zalpha <- qnorm(alpha)`
   - P-value for T: `pvalue <- pt(q, df,lower.tail = TRUE)`
   - talpha for T: `talpha <- qt(p, df, lower.tail = TRUE)`
5. Compare P-value with alpha or z/t with zalpha/talpha
6. Conclusion

## Question

จากข้อมูลที่ได้สำรวจทั้งหมด 1,000 ข้อมูล กลุ่มเราอยากทราบว่า ค่าเฉลี่ยของคะแนนหมวดคณิตศาสตร์จากจำนวนข้อมูล `100` ข้อมูล กลุ่มเราได้ตั้งสมมติฐานว่าคะแนนเฉลี่ยของหมวดคณิตศาสตร์มีคะแนนเฉลี่ยมากกว่า `66.08` คะแนน โดยที่คะแนนเฉลี่ยของหมวดคณิตศาสตร์ทั้งหมด `67.39` คะแนน จากการสุ่มตัวอย่างข้อมูล และมีส่วนเบี่ยงเบนมาตรฐาน `14.18` ซึ่งเรากำหนดค่า alpha เท่ากับ `0.05`

**หมายเหตุ:** ตัวเลขที่นำไปใช้ในการคำนวนในโปรแกรม R Studio จะคำนวนทศนิยมได้มากกว่าสองตำแหน่ง ดังนั้นในโจทย์จะลดทอนทศนิยมให้เหลือสองตำแหน่งเพื่อให้ง่ายต่อการคำนวนและไม่รกตา

### Step 0 : Assign variables

#### Pre-requisites

```R
# Install packages
install.packages("dplyr") # Data manipulation such as mutate, select, filter, etc.
install.packages("readr") # A fast and friendly way to read rectangular data

# Use libraries
library(dplyr)
library(readr)

# Dataset
HypoTesting <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/017-StudentPerf_inExam/main/StudentsPerformance_Clean.csv")
```

#### Sample data

```R
# Sample data
sample_100 <- HypoTesting %>% sample_n(100)
```

#### Variables

```R
# n
n <- 100 # 100
# mean
xbar <- mean(sample_100$Math_Score) # 67.39
# standard division
sd <- sd(sample_100$Math_Score) # 14.18
# mu0
mu0 <- mean(HypoTesting$Math_Score) # 66.08
```

### Step 1 : State the hypothesis

```R
Ho : mu0 >= 66.08
Ha : mu0  < 66.08
```

### Step 2 : Level of significance

```R
alpha <- 0.05 # 0.05
```

### Step 3 : Test statistic

```R
z <- (xbar-mu0)/(sd/sqrt(n));
z # 0.91
```

### Step 4 : Finding P-value approach or Critical Value approach

```R
# P-value approach
pvalue <- pnorm(z);
pvalue # 0.82

# Critical value approach
zalpha <- qnorm(alpha);
zalpha # -1.64
```

### Step 5 : Compare P-value with alpha or z/t with zalpha/talpha

```R
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
```

### Step 6 : Interval Estimation

```R
se_of_margin <- xbar/sqrt(n) # 6.73
margin <- 1.96*se_of_margin # 13.20

upper <- xbar+margin # 80.59
lower <- xbar-margin # 54.18
```

ดังนั้น `54.18 < xbar (67.39) < 80.59`

### Step 7 : Conclusion

จากการทดสอบสมมุติฐานสรุปได้ว่า เป็นไปตามสมมุติฐานข้างต้นคือ คะแนนเฉลี่ยของหมวดคณิตศาสตร์ มีคะแนนเฉลี่ยมากกว่า `66.08` คะแนน
