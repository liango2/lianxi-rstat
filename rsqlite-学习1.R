###############################################################################################
################## RSQLite/Script.R at master · liango2/RSQLite             ###################
################## https://github.com/liango2/RSQLite/blob/master/Script.R  ###################
###############################################################################################

#install.packages("sqldf")
require(sqldf)

dPath = "d:/csv/"
dFiles = list.files(dPath)

setwd(dPath)
dat = lapply(dFiles, read.csv, header = TRUE) #not work

#Integers
nmbs = sample.int(10, 100, replace = TRUE)

#Floats
mtrx = rnorm(100)

#Dates
DTS = c()
for ( i in 1:10) {
    Dts = as.Date(rnorm(10)*5000, origin="1970-01-01")
    DTS = c(DTS, Dts)
}

rm(Dts)

#index
indx = 1:100

#dates as text
DTStxt = format(as.Date(DTS, origin="1970-01-01"), "%Y-%m-%d")

#combine to a matrix then dataframe
#DF has a combination of text, numbers and dates
DF = c()
DF = cbind(indx, DTStxt) #2列

for(n in 1:8) { # 8*4=32列
  DF = cbind(DF, DTS)         #1列
  DF = cbind(DF, DTStxt)      #1列 
  DF = cbind(DF, nmbs)        #1列
  DF = cbind(DF, mtrx)        #1列
}

DF = data.frame(DF)

rm(DTS, DTStxt, mtrx, nmbs, indx)

library(RSQLite)
db = dbConnect(SQLite(), dbname="test.db")
summary(db)

dbWriteTable(db, "SQLQ", DF)
dbWriteTable(db, "SQLQIndx", DF)

dbListTables(db)


dbGetQuery(db,"Create index indxIndx on SQLQIndx(indx, DTStxt, Nmbs)")
dbGetQuery(db,"Create index indxIndx2 on SQLQIndx(indx, DTStxt, Nmbs, Nmbs_1, Mtrx)")
dbGetQuery(db,  "select * from sqlite_master where tbl_name = 'SQLQIndx'")

###############################################################################################
##################              Working With Tables             ###############################
###############################################################################################

system.time(dbGetQuery(db, "Select Count(indx) from SQLQ"))
system.time(dbGetQuery(db, "Select Count(indx) from SQLQindx"))

system.time(dbGetQuery(db, "Select Count(indx) from SQLQ where Nmbs>200"))
system.time(dbGetQuery(db, "Select Count(indx) from SQLQindx where Nmbs>200"))

system.time(dbGetQuery(db, "Select Count(indx) from SQLQ where DTStxt>'1970-01-01'"))
system.time(dbGetQuery(db, "Select Count(indx) from SQLQindx where DTStxt>'1970-01-01'"))

dbGetQuery(db, "Select Count(indx) from SQLQ as PINDEX where Nmbs>995")
dbGetQuery(db, "Select Count(indx) from SQLQindx where Nmbs>995")

dbDisconnect(db)
