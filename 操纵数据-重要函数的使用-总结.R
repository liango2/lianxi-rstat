
    # 显示前6行
    head(airquality)
    # 显示后6行
    tail(airquality)

# 对 数据框 进行总结
    summary
    str(airquality)
    列出 airquality 中变量的名称 与 数值

# 使用 table函数 对 数据库的列 进行总结

    # 显示取值与对应的出现频率
        table(airquality$Month)
        table(airquality$Month, useNA = "ifany")
        table(airquality$Month, airquality$Day, useNA = "ifany")
    
    #缺省值的个数
        sum(is.na(airquality$Ozone))    
    
    #判断
        
        any(is.na(airquality$Ozone)) #判断是否存在缺省值
        # TRUE
        
            #统计缺省值的个数
            sum(is.na(airquality$Ozone))    
        
        all(airquality$Month < 12) #判断月份中的数值是否全都小于12
        # TRUE
        
################################################################################   
class(Titanic)
#[1] "table"

    ################################################################################   
    titanic <- as.data.frame(Titanic)
    head(titanic)

        ################################################################################   
        # 交叉表
        x <- xtabs(Freq ~ Class + Age, data = titanic)
        #       Age
        # Class  Child Adult
        #   1st      6   319
        #   2nd     24   261
        #   3rd     79   627
        #   Crew     0   885
        
        #说明:
        #交叉表的 第1列 显示Class: 头等舱， 二等舱， 三等舱， 船员舱
        #交叉表的 第2列 显示Age=Child的孩子的个数
        #交叉表的 第3列 显示Age=Adult的成人的个数
        
            ################################################################################   
            #fatable 将上面的结果扁平化显示,f代表flat 
            ftable(x)
              Age Child Adult
            Class                
            1st           6   319
            2nd          24   261
            3rd          79   627
            Crew          0   885

        
################################################################################   
# object.size函数
#作用：输出 传入对象 的大小

object.size(airquality)
#5496 bytes

    ################################################################################   
    print(object.size(airquality), units = "kb")
    #Error in match.arg(units, c("b", "auto", "Kb", "Mb", "Gb", "B", "KB",  : 
    #  'arg'应当是“b”, “auto”, “Kb”, “Mb”, “Gb”, “B”, “KB”, “MB”, “GB”其中的一个
    print(object.size(airquality), units = "Kb")
    #5.4 Kb
    print(object.size(airquality), units = "Mb")
    #0 Mb
    print(object.size(airquality), units = "Gb")
    #0 Gb


