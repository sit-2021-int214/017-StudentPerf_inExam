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
# สินค้าแต่ละประเภทมีจำนวนชนิดสินค้ารวมกันเท่าไร โดยเรียงจากมากไปน้อย

Cat_Count <- Superstore_Sales %>%
  group_by(Category) %>%
  select(Category, Sub.Category) %>%
  count(Sub.Category)

Cat_Count %>%
  summarise(Category = Category,
            Product = Sub.Category,
            Total = n) %>%
  arrange(desc(Total)) # Show result

# ข้อ 2
# สินค้าประเภท Technology มีสินค้าชนิดใดที่มียอดรวมของราคามากที่สุด โดยเรียงจากมากไปน้อย

Tech_Most <- Superstore_Sales %>%
  group_by(Product = Sub.Category) %>%
  select(Category, Sub.Category) %>%
  filter(Category == "Technology") %>%
  count(Category)

Tech_Most %>%
  summarise(Product = Product,
            Category = Category,
            Total_Amount = sum(Superstore_Sales$Sales*n, na.rm = T),
            Currency = "USD") %>%
  arrange(desc(Total_Amount)) # Show result

# ข้อ 3
# สินค้าประเภทใดมียอดขายดีที่สุดในเดือนกันยายน ปี 2016 โดยเรียงยอดขายจากมากไปน้อย

year <- year(mdy(Superstore_Sales$Order.Date))
month <- month(mdy(Superstore_Sales$Order.Date))

Most_2016 <- Superstore_Sales %>%
  filter(year == 2016,
         month == 9) %>%
  group_by(Product = Sub.Category) %>%
  select(Category, Sub.Category) %>%
  count(Category)

Most_2016 %>%
  summarise(Product = Product,
            Category = Category,
            Total_Sale = sum(n*Superstore_Sales$Sales, na.rm = T),
            Currency = "USD") %>%
  arrange(desc(Total_Sale)) # Show result

# ข้อ 4
# สินค้าประเภท Furniture ผลิตภัณฑ์ใดมีจำนวนสินค้ามากที่สุดและมีจำนวนเท่าไร

Total_Fur <- Superstore_Sales %>%
  group_by(Category) %>%
  select(Product.Name) %>%
  filter(Category == "Furniture") %>%
  count(Product = max(Product.Name))

Total_Fur %>%
  summarise(Category = Category,
            Product = Product,
            Total = n) # Show result

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
# แสดงกราฟจำนวนสินค้าของประเภทสินค้าแต่ละประเภทแบบ Pie Chart

Category_Plot <- data.frame(Superstore_Sales %>% count(Category))
ggplot(Category_Plot, aes(x = "", y = n, fill = Category)) +
  geom_col(color = "black") +
  geom_text(aes(label = n),
            position = position_stack(vjust = 0.5)) +
  coord_polar(theta = "y") +
  scale_fill_brewer() +
  theme_void() +
  ggtitle("Total of Product")
