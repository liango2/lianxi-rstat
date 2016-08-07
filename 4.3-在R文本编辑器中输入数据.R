# 1.
# 写到剪切板中
writeClipboard(names(iris))

# 2.;
# 写到剪切板中
write.table(head(iris),
            file = "clipboard",
            sep = "\t",
            row.names = FALSE)
# 3.
# 写入到csv文件中
myfile <- file.path("d:", "test.csv")
write.table(head(iris),
            file = myfile,
            sep = ",",
            row.names = FALSE)

# 4.
# 返回一个临时文件路径
my_file <- tempfile()
my_file

# 写入到临时文件
write.csv(iris, file = my_file)
list.files(tempdir())

# 从临时文件中读取
mydataframe_iris <- read.csv(my.file)
str(mydataframe_iris)

# 删除临时文件
file.remove(my_file)
list.files(tempdir())



