#using_aov.R

source('~/R/Rtutorial/codes/using_%in%.R')

df<-cbind(df,c(2,4,6,7,9,10))
names(df)[4]<-"x"

test<-aov(data=df,formula=v~x)
summary(test)[[1]]$"F value"[1]