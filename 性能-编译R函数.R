mov.avg <- function(x, n = 20) {
  total <- numeric(length(x) - n + 1)
  print(paste0("length(x) = ", length(x)))
  print(paste0("n = ", n))
  print(paste0("total = ", total))
  print(total)
  print("xxxxxxxxxxxxxx")
  for (i in 1:n) {
    total <- total + x[i:(length(x) - n + i)]
  }
  total / n
}

x<-c(1,2,1,3,5)
n<-2
mov.avg(x,n)

library(compiler)
mov.avg.compiled0 <- cmpfun(mov.avg, options = list(optimize = 0))
mov.avg.compiled1 <- cmpfun(mov.avg, options = list(optimize = 1))
mov.avg.compiled2 <- cmpfun(mov.avg, options = list(optimize = 2))
mov.avg.compiled3 <- cmpfun(mov.avg, options = list(optimize = 3))


# 手动下载地址: CRAN - Package microbenchmark
# https://cran.r-project.org/web/packages/microbenchmark/index.html
install.packages("microbenchmark")
library(microbenchmark)
x <- runif(100)
bench <- microbenchmark(
  mov.avg(x),
  mov.avg.compiled0(x),
  mov.avg.compiled1(x),
  mov.avg.compiled2(x),
  mov.avg.compiled3(x)
)
bench


library(ggplot2)
autoplot(bench)



# ==============================
# a simple example
f <- function(x) x+1
fc <- cmpfun(f)
fc(2)
disassemble(fc)

# ==============================

# old R version of lapply
la1 <- function(X, FUN, ...) {
  FUN <- match.fun(FUN)
  if (!is.list(X))
    X <- as.list(X)
  rval <- vector("list", length(X))
  for(i in seq(along = X))
    rval[i] <- list(FUN(X[[i]], ...))
  names(rval) <- names(X)          # keep `names' !
  return(rval)
}

# a small variation
la2 <- function(X, FUN, ...) {
  FUN <- match.fun(FUN)
  if (!is.list(X))
    X <- as.list(X)
  rval <- vector("list", length(X))
  for(i in seq(along = X)) {
    v <- FUN(X[[i]], ...)
    if (is.null(v)) rval[i] <- list(v)
    else rval[[i]] <- v
  }
  names(rval) <- names(X)          # keep `names' !
  return(rval)
}
# Compiled versions
la1c <- cmpfun(la1)
la2c <- cmpfun(la2)
# some timings
x <- 1:10
y <- 1:100

system.time(for (i in 1:10000) lapply(x, is.null))
system.time(for (i in 1:10000) la1(x, is.null))
system.time(for (i in 1:10000) la1c(x, is.null))
system.time(for (i in 1:10000) la2(x, is.null))
system.time(for (i in 1:10000) la2c(x, is.null))
system.time(for (i in 1:1000) lapply(y, is.null))
system.time(for (i in 1:1000) la1(y, is.null))
system.time(for (i in 1:1000) la1c(y, is.null))
system.time(for (i in 1:1000) la2(y, is.null))
system.time(for (i in 1:1000) la2c(y, is.null))


f1 <-  function(){for (i in 1:10000) lapply(x, is.null); x}
f2 <-  function(){for (i in 1:10000) la1(x, is.null)   ; x}
f3 <-  function(){for (i in 1:10000) la1c(x, is.null)  ; x}
f4 <-  function(){for (i in 1:10000) la2(x, is.null)   ; x}
f5 <-  function(){for (i in 1:10000) la2c(x, is.null)  ; x}
f6 <-  function(){for (i in 1:1000) lapply(y, is.null) ; x}
f7 <-  function(){for (i in 1:1000) la1(y, is.null)    ; y}
f8 <-  function(){for (i in 1:1000) la1c(y, is.null)   ; y}
f9 <-  function(){for (i in 1:1000) la2(y, is.null)    ; y}
f10 <- function(){for (i in 1:1000) la2c(y, is.null)   ; y}

library(microbenchmark)
bench <- microbenchmark(
 f1(),        
 f2(), 
 f3(), 
 f4(), 
 f5(), 
 f6(), 
 f7(), 
 f8(), 
 f9(), 
 f10()
 )
library(ggplot2)
autoplot(bench)





