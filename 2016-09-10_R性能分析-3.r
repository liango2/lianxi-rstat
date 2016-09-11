library('GUIProfiler')
 

compareMethods <- function() {
  library(RMySQL)  
  
  #创建数据库连接  
  con <- dbConnect(MySQL(),host="localhost",dbname="test",user="root",password="")  
  
  #删除testname表  
  dbRemoveTable(con,"test")  
  
  # 创建一个20万行的数据框
  fruits <-data.frame(
    id=1:200000,
    name=rep("some fruits: apple, banana, orange ...", 200000),
    price=rep("some fruits: apple, banana, orange ...", 200000),
    status=rep("some fruits: apple, banana, orange ...", 200000),
    f5="test f5",
    f6="test f6"
  )  
  
  #写数据库表  
  dbWriteTable(con,"test",fruits, row.names=FALSE)
  
  #断开连接
  dbDisconnect(con)   
}

 
# Profile the code

RRprofStart()
compareMethods()
RRprofStop()
# Uncomment to open the report
#RRprofReport()

RRprofReport(file.name = "RRprof.out", notepad.path =
               "d:/Program Files (x86)/Notepad++/notepad++.exe",reportname = "my_report")
