# ����һ��20���е����ݿ�
fruits <-data.frame(
  id=1:200000,
  name=rep("some fruits: apple, banana, orange ...", 200000),
  price=1:200000,
  status=1:200000,
  f5="test f5",
  f6="test f6"
)  

# �۲칤��Ŀ¼
print(getwd())

#save
save(fruits, file = "myfruits.rda")


# ɾ������
rm(fruits)

#reload
load("myfruits.rda")


