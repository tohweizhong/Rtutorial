require(randomForest)

df<-read.csv("C:/Users/Toh Wei Zhong/Desktop/adult.txt",
             stringsAsFactors=T)

#for a categorical target attribute
mod.income<-randomForest(data=df,income~.,
                  importance=TRUE)
#confusion matrix
cm.income<-mod.income$confusion
cm.income<-cm.income[,-ncol(cm.income)]

acc.income<-sum(diag(cm.income))/sum(cm.income)

mod.income$importance

#for a continuous target attribute
# mod.age<-randomForest(data=df,age~.,
#                       importance=TRUE)
# cm.age<-mod.age$confusion
# cm.age<-cm.age[,-ncol(cm.age)]

acc.age<-sum
