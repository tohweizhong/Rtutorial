#using_randomForest.R

require(randomForest)
#example showing how to use randomForest for classification,
#with the response attribute being
# -> categorical
# -> continuous, but discretized using median value

df<-read.csv("C:/Users/Toh Wei Zhong/Documents/R/redhyte/data/adult.txt",
             header=TRUE,
             sep=",",
             quote='',
             stringsAsFactors=T)
str(df)

#for a categorical target attribute
runtime<-system.time(mod.income<-randomForest(data=df,income~.,
                                              importance=TRUE))
#confusion matrix
cm.income<-mod.income$confusion
cm.income<-cm.income[,-ncol(cm.income)]
#accuracy
acc.income<-sum(diag(cm.income))/sum(cm.income)
#variable importance
mod.income$importance



#for a continuous target attribute,
#do a simple discretization based on median
#discretize by median
m<-mean(df$age)
system.time(
  df$age.class<-sapply(df$age,FUN=function(a){if(a>=m){return("Old")}
                                              else return("Young")})
)
#convert to factor
df$age.class<-factor(df$age.class)

#build model
mod.age<-randomForest(data=subset(df,select=-age),age.class~.,
                      importance=TRUE)
#confusion matrix
cm.age<-mod.age$confusion
cm.age<-cm.age[,-ncol(cm.age)]
#accuracy
acc.age<-acc.income<-sum(diag(cm.income))/sum(cm.income)


#****#

#feature selection
#for redhyte's purposes
mda.income<-mod.income$importance[,"MeanDecreaseAccuracy"]
mda.age<-mod.age$importance[,"MeanDecreaseAccuracy"]

#combine the list
names(mda.income)<-paste(names(mda.income),".income",sep="")
names(mda.age)<-paste(names(mda.age),".age",sep="")

mda.both<-c(mda.income,mda.age)
mda.both<-sort(mda.both,decreasing=TRUE)

#take the first 5,
#shortlisted
sl<-names(mda.both)[seq(5)]

#remove the tails
remove.tail<-function(s){
  last.dot<-regexpr("\\.[^\\.]*$", s)
  return(substr(s,1,last.dot-1))
}

sl<-sapply(sl,FUN=remove.tail)

i<-5
while(length(unique(sl)) != length(sl)){
  dup<-which(duplicated(sl) == TRUE)
  sl<-sl[-dup[1]]
  original.name<-names(mda.both)[i+1]
  sl<-c(sl,remove.tail(names(mda.both)[i+1]))
  names(sl)[(length(sl))]<-original.name
  i<-i+1
}