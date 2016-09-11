# 创建一个20万行的数据框
fruits <-data.frame(
  id=1:200000,
  name=rep("some fruits: apple, banana, orange ...", 200000),
  price=1:200000,
  status=1:200000,
  f5="test f5",
  f6="test f6"
)  

# 观察工作目录
print(getwd())

#save
save(fruits, file = "myfruits.rda")


# 删除变量
rm(fruits)

#reload
load("myfruits.rda")


