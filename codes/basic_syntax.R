#14/06/2014
#Basic syntax

df<-read.csv("https://dl.dropboxusercontent.com/u/36842028/homepage/Rtut/basic_syntax/iris.csv",header=T)
str(df)
head(df)
boxplot(df$Sepal.Length ~ df$Species, main="Sepal Length by Species")

?boxplot
getwd()
setwd()