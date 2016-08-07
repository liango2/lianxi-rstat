# missing value
x <- c(1, NA, 2,NA,3)
x 
  
is.na(x)


x[!is.na(x)]


x <- c(1, NA, 2,NA,3)
y <-c("a", "b", NA, "c", NA)
z <- complete.cases(x,y)
x[z]
y[z]

# ==
library(datasets)

airquality

class(airquality)

# 显示前六行
head(airquality)

# 去掉有缺失值的行，显示出来
g<-complete.cases(airquality)
g
airquality[g, ][1:10,]
