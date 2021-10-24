# Pre-requisites
install.packages("dplyr")     # Data manipulation such as mutate, select, filter, etc.
install.packages("readr")     # A fast and friendly way to read rectangular data
install.packages("ggplot2")   # Histogram, Density Plot, Scatter Plot, etc.
install.packages("lubridate") # Makes it easier to work with dates and times

# Use libraries
library(dplyr)
library(readr)
library(ggplot2)
library(lubridate)

# Import dataset
Superstore_Sales <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv")

# Change to Tibble
Superstore_Sales <- as_tibble(Superstore_Sales)

# Print dataset and data types
glimpse(Superstore_Sales)

# Show dataset
View(Superstore_Sales)

# -----------------------------------------------------------------------------

Superstore_Sales %>%
  select(Order.Date) %>%
  summarise(YYYY_MM_DD = mdy(Superstore_Sales$Order.Date))

# -----------------------------------------------------------------------------

# ข้อ 1
# สินค้าแต่ละประเภทมีจำนวนรวมกันเท่าไร

Cat_Count <- Superstore_Sales %>%
  group_by(Category) %>%
  select(Category) %>%
  count(Category)

Cat_Count # Show result

# ข้อ 2
# สินค้าประเภท Technology มีสินค้าชนิดใดมากที่สุดโดยเรียงจากมากไปน้อย

Tech_Most <- Superstore_Sales %>%
  group_by(Sub.Category) %>%
  select(Category, Sub.Category) %>%
  filter(Category == "Technology") %>%
  count(Sub.Category)

Tech_Most %>% arrange(desc(n)) # Show result

# ข้อ 3
# สินค้าประเภทใดขายดีที่สุดในปี 2016 โดยเรียงจำนวนสินค้าจากมากไปน้อย

year <- year(mdy(Superstore_Sales$Order.Date))

Most_2016 <- Superstore_Sales %>%
  filter(year == 2016) %>%
  group_by(Category) %>%
  count(Category)

Most_2016 %>% arrange(desc(n)) # Show result

# ข้อ 4
# สินค้าประเภท Furniture ผลิตภัณฑ์ใดมีจำนวนสินค้ามากที่สุดและมีจำนวนเท่าไร

Total_Fur <- Superstore_Sales %>%
  group_by(Category) %>%
  select(Product.Name) %>%
  filter(Category == "Furniture") %>%
  count(Product = max(Product.Name))

data.frame(Total_Fur) # Show result

# ข้อ 5
# องค์กรเลือกการจัดส่งสินค้าแบบใดมากที่สุด

year <- year(mdy(Superstore_Sales$Order.Date))

Corporate_Ship2017 <- Superstore_Sales %>%
  group_by(Ship.Mode) %>%
  filter(Segment == "Corporate" &&
            year == 2017) %>%
  count(Ship.Mode) %>%
  arrange(desc(n))

summarise(Corporate_Ship2017, Total = n) # Show result

# ข้อ 6
# แสดงสินค้าที่ขายอยู่ใน New York City โดยให้แสดงเฉพาะ 10 รายการแรก

NY_Product <- Superstore_Sales %>%
  group_by(City) %>%
  select(City, Product.Name) %>%
  filter(City == "New York City")

head(NY_Product, 10) # Show result

# -----------------------------------------------------------------------------

# ข้อ 4.1
# แสดงกราฟแท่งของประเภทการจัดส่งและจำนวนการจัดส่งของประเภทต่าง ๆ

ShipMode_Plot <- Superstore_Sales %>% ggplot(aes(x=Ship.Mode)) + geom_bar()
ShipMode_Plot + ggtitle("Total of Shipping") + xlab("Ship Mode") + ylab("Ship Sales")

# ข้อ 4.2
# กราฟจุดที่แสดงความสัมพันธ์ระหว่างประเภทสินค้าและชนิดสินค้า

Category_Plot <- Superstore_Sales %>% ggplot(aes(x=Category, y=Sub.Category)) + geom_point()
Category_Plot + ggtitle("Category of Product") + xlab("Category") + ylab("Product Type")
