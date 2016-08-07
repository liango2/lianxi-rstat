1 + 1

N <- 1E5

data <- sample(1:30, size = N, replace = T)

system.time({
    data_平方 <- numeric(N)
    for (i in 1:N) {
        data_平方[i] = data[i] ^ 2
    })


system.time(data_sq2 <- data^2)