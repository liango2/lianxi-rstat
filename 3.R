# 回文
huiwen <- function(num) {
    digits <- floor(log(num, 10)) 
    for (x in 0:((digits %/% 2) + 1)) {
        place1 <- digits -x
        place2 <- x
        digit1 <- (num %% (10 ^ place1)) %/% (10 ^ place1)
        digit2 <- (num %% (10 ^ place2)) %/% (10 ^ place2)
        if (digit1 != digit2)
            return(FALSE)
    }
    # browser()
    return(TRUE)
}

# 最大回文
biggestHuiwen <- function() {
    best  <- 0
  for(x in 100:999) {
        for(y in x:999) {
            candidate  <- x * y
            if (candidate > best && huiwen(candidate)) {
                best <- candidate
            }
        }
    }
    best
}
