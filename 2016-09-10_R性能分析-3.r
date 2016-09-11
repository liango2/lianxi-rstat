library('GUIProfiler')
 

compareMethods <- function() {
  library(RMySQL)  
  
  #�������ݿ�����  
  con <- dbConnect(MySQL(),host="localhost",dbname="test",user="root",password="")  
  
  #ɾ��testname��  
  dbRemoveTable(con,"test")  
  
  # ����һ��20���е����ݿ�
  fruits <-data.frame(
    id=1:200000,
    name=rep("some fruits: apple, banana, orange ...", 200000),
    price=rep("some fruits: apple, banana, orange ...", 200000),
    status=rep("some fruits: apple, banana, orange ...", 200000),
    f5="test f5",
    f6="test f6"
  )  
  
  #д���ݿ��  
  dbWriteTable(con,"test",fruits, row.names=FALSE)
  
  #�Ͽ�����
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
