# 概述
# mysql
# show variables like ‘character_set_%’;
# SET character_set_database=”utf8”;
# SET character_set_server=”utf8”;

#dbSendQuery(con,'SET NAMES utf8')  
#dbSendQuery(conn,"INSERT INTO test(f1) values('xxxx')");

# 例子
# install.packages("RMySQL")
library(RMySQL)  
help(package="RMySQL") #查看RMySQL的说明文档，里面有RMySQL所有可用的方法  
#创建数据库连接  
con <- dbConnect(MySQL(),host="localhost",dbname="test",user="root",password="")  
#删除testname表  
dbRemoveTable(con,"test")  
#写数据库表  
fruits <-data.frame(id=1:5,name=c("苹果","香蕉","梨子","玉米","西瓜"),price=c(8.8,4.98,7.8,6,2.1),status=c("无","打折","无","售罄","批发"))  
dbListTables(con)  
#dbWriteTable(con,"test",fruits,row.names=FALSE)  # dbWriteTable 默认 保存 row_names
dbWriteTable(con,"test",fruits,row.names=FALSE)   # dbWriteTable 不保存 row_names
dbListTables(con)  
dbReadTable(con,"test")#中文出现乱码，这是因为字符编码格式不统一的问题  
dbSendQuery(con,'SET NAMES utf8')  
dbReadTable(con,"test")#还是乱码  
dbDisconnect(con) #断开连接  

# 引用：
#R语言读写中文编码方式 - EchoCaiCai的专栏 - 博客频道 - CSDN.NET
#http://blog.csdn.net/cl1143015961/article/details/46453495
#
