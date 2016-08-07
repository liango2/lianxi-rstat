isChinese <- function(x){
  x2 <- iconv(x, "UTF-8", "GBK")
  b <- is.na(x2)
  return(b)
}

x <- "abc中文"
isChinese(x)

x <- "abc,"
isChinese(x)

x <- "abc,，，，"
isChinese(x)

