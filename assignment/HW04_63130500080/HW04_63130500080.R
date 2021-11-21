install.packages("janitor")
install.packages("psych")
install.packages("ggplot2")


# Library
library(janitor)
library(dplyr)
library(stringr)
library(tidyr)
library(assertive)
library(readr)
library(psych)   
library(data.table)
library(ggplot2)

# Dataset
prog_book  <- read.csv("C:/Users/dearfy/OneDrive/Desktop/63130500080/prog_book.csv")


In this dataset has .....
 
Rows: 271
Columns: 7
$ Rating          <dbl> 4.17, 4.01, 3.33, 3.97, 4.06, 3.84, 4.09, 4.15, 3.87, 4.62, 4.03, 3.78, 3.73, 3.87, 3.87, 3.95,~
$ Reviews         <chr> "3,829", "1,406", "0", "1,658", "1,325", "117", "5,938", "1,817", "2,093", "0", "160", "481", "~
$ Book_title      <chr> "The Elements of Style", "The Information: A History, a Theory, a Flood", "Responsive Web Desig~
$ Description     <chr> "This style manual offers practical advice on improving writing skills. Throughout, the emphasi~
$ Number_Of_Pages <int> 105, 527, 50, 393, 305, 288, 256, 368, 259, 128, 352, 352, 200, 328, 240, 288, 392, 304, 336, 5~
$ Type            <chr> "Hardcover", "Hardcover", "Kindle Edition", "Hardcover", "Kindle Edition", "Paperback", "Hardco~
$ Price           <dbl> 9.323529, 11.000000, 11.267647, 12.873529, 13.164706, 14.188235, 14.232353, 14.364706, 14.50294~

```

## Part 2: Learning function from Tidyverse &  Part 3: Transform data with dplyr and finding insight the data

# ค่าเฉลี่ยจำนวนหน้าของหนังสือมีทั้งหมดกี่หน้า

Result:

mean(com_book$Number_Of_Pages)
[1] 475.0775

# เรตติ้งที่มีค่าเฉลี่ยเท่าไหร่

Result:

mean(prog_book$Rating)
[1] 4.067417

# หนังสือที่ชื่อว่า Joel on Software มี comment และ Rating เท่าไหร่

Result:

book_Joel <- com_book%>% select(Reviews,Rating)%>%filter(com_book$Book_title == 'Joel on Software' )
book_Joel 
Reviews Rating
    <dbl>  <dbl>
1     130   4.11



## Part 4: Visualization with GGplot2
### 1.) Graph show relation between height and mass

scat_plot <- starwars %>% filter(mass<500) %>% ggplot(aes(x=height,y=mass))+
  geom_point(aes(color=gender))

scat_plot+geom_smooth()

Result:

![Graph 1](graph1.png)

**Guideline:
Embed Image by using this syntax in markdown file

![Name](imageFile)
