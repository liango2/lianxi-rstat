# for each row of dataframe
dat <- data.frame(x=c(1,2), y=c(3,4), z=c(5,6))
apply(dat[,c('x','z')], 1, function(x) sum(x) )

################################################################################
# 性能测试
################################################################################
insertSql <- function(myDataFrame, myTableName){
  #  INSERT INTO test (
  #   id, name, price, status
  #  ) VALUES 
  #  (id, name, price, status)
  # ,(id, name, price, status)
  
  line1 <- paste("INSERT INTO", myTableName, "(")
  
  cols <- colnames(myDataFrame)
  line2 <- paste(cols, collapse=",")
  
  line3 <- paste(") VALUES")
  
  #line4_0 <- sprintf("('%s', '%s', '%s', '%s')", myDataFrame[2:5, 1], myDataFrame[1:5, 2], myDataFrame[1:5, 3], myDataFrame[1:5, 4])
  nr <- nrow(myDataFrame)
  nc <- ncol(myDataFrame)
  
  

  print("# 部分写死, 经过测试，最慢")
  ptm <- proc.time()
  line4_1 <- apply(myDataFrame, 1, function(x) {paste0("'",x[1],"',", x[2],"',", x[3],"',", x[4],"'")})
  line4 <- paste0("(", line4_1,  ")", collapse = ",")
  print(proc.time() - ptm)
  print(line4)

  
  print("# 使用遍历，不写死")
  # apply 
  # 1: by row
  # 2: by col
  ptm <- proc.time()
  line4_1 <- apply(myDataFrame, 1, function(x) {
    #paste0("'",x[1],"',", x[2],"',", x[3],"',", x[4],"'") #err
    #paste0("'", paste0(x, collapse = "','"), "'") #ok
    paste0("'", x, "'",collapse = ",") #ok
    })
  line4 <- paste0("(", line4_1,  ")", collapse = ",")
  print(proc.time() - ptm)
  
  print("# 使用for循环, 经过测试，最快")
  ptm <- proc.time()
  line4_1 <- sprintf("('%s'", myDataFrame[1:nr, 1])
  for(i in 2:nc) {
    #    line4_1 <- sprintf(paste0(line4_1, ",'%s'"), myDataFrame[1:nr, i]) 
    line4_1 <-paste0(line4_1, ",'",myDataFrame[1:nr, i], "'")  
  }
  line4 <- paste0(line4_1,  ")", collapse = ",")
  print(proc.time() - ptm)
  
  lines <- paste0(line1, line2, line3, line4)
  
  
  return(lines)
}

myDataFrame <-data.frame(id=1:10, name=c("苹果","香蕉","梨子","玉米","西瓜"),price=c(8.8,4.98,7.8,6,2.1),status=c("无","打折","无","售罄","批发"))  
strSql <- insertSql(myDataFrame, "test")
print(strSql)


### 
# [1] "# 部分写死"
# 用户 系统 流逝 
# 1.00 0.02 1.02 
# [1] "# 使用遍历，不写死"
# 用户 系统 流逝 
# 0.90 0.01 0.93 
# [1] "# 使用for循环"
# 用户 系统 流逝 
# 0.44 0.00 0.43 
################################################################################
