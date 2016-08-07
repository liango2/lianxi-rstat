elements <- read.csv(file.path("d:", "test.csv"))
str(elements)


# 2
elements <- read.csv(file.path("d:", "test.csv"), stringsAsFactors = FALSE)
str(elements)
