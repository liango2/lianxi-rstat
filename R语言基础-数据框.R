# 创建
df <- data.frame(id    = 1:4, 
                 name  = c('a','b', 'c', 'd'), 
                 gender= c(TRUE, TRUE, FALSE,FALSE))

# 获取行数目,列数
nrow(df)
ncol(df)
  
# 数据库 转型为 矩阵
data.matrix(df)

####################################################################################################
# 创建
df2 <- data.frame(id    = c(1,2,3,4), 
                  score = c(80, 86, 90, 100))
# 数据库 转型为 矩阵
data.matrix(df2)

####################################################################################################
df <- list(id = 1:4,  score = c(80, 86, 90, 101))
df

####################################################################################################
sin(1:3)

letters[1:3]

list(foo=42, 
     bar=3)

x <- list(values=sin(1:3), 
          ids=letters[1:3], 
          sub=list(foo=42,
                   bar=13))
x          # print the list
x$values   # Get one element
x[["ids"]] # Another way to get an element
x$sub$foo  # Get sub elements
x[[c(3,2)]]  # Another way (gets 13)
str(x)     # A "summary" of the list's content

####################################################################################################
d <- data.frame(a=11:13, b=21:23)
d
is.list(d) # TRUE
str(d)

m <- lm(a ~ b, data=d)
is.list(m) # TRUE
str(m)

aaa <- vector("list", 3)
aaa
is.list(aaa)   #TRUE
is.vector(aaa)  #TRUE
is.recursive(aaa)  # TRUE
is.atomic(aaa)  # FALSE


