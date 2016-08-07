x <- Sys.time()
x
class(x)

p <- as.POSIXlt(x)
p
class(p)

unclass(p)
names(unclass(p))

p$sec


c <- as.POSIXct(p)
class(c)


#--
as.Date("2016-07-05")


x1 <- "七月 1, 2015 01:01"
x1
strptime(x1, "%B %d, %Y %H:%M")

# 总结
# 字符类型 转为 日期或者时间类型
# as.Date()
# as.POSIXct()/as.POSIXlt()/strptime  



