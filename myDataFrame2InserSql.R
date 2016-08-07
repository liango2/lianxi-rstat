fruits <-data.frame(id=1:5,name=c("苹果","香蕉","梨子","玉米","西瓜"),price=c(8.8,4.98,7.8,6,2.1),status=c("无","打折","无","售罄","批发"))  


insertSql <- function(fruits){
  #  INSERT INTO test (
  #   id, name, price, status
  #  ) VALUES 
  #  (id, name, price, status)
  # ,(id, name, price, status)
  
  myTableName <- "test" 
  line1 <- paste("INSERT INTO", myTableName, "(")
  
  cols <- colnames(fruits)
  line2 <- paste(cols, collapse=",")
  
  line3 <- paste(") VALUES")
  
  #line4_0 <- sprintf("('%s', '%s', '%s', '%s')", fruits[1:5, 1], fruits[1:5, 2], fruits[1:5, 3], fruits[1:5, 4])
  nr <- nrow(fruits)
  nc <- ncol(fruits)
  
  line4_1 <- sprintf("('%s'", fruits[1:nr, 1])
  
  for(i in 2:nc) {
      line4_1 <- sprintf(paste0(line4_1, ",'%s'"), fruits[1:nr, i]) 
  }
  
  line4 <- paste0(line4_1,  ")", collapse = ",")
  
  lines <- paste0(line1, line2, line3, line4)

  return(lines)
}

strSql <- insertSql(fruits)
print(strSql)