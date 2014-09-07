#using_%in$.R

source('~/R/Rtutorial/codes/data_structures.R')

#add one more attribute
df<-cbind(df,c("w1","w2","w1"))
colnames(df)[3]<-"w"

#remove factors
df$w<-as.character(df$w)

#add more rows
df<-rbind(df,c("foo",1,"w3"),
             c("bar",20,"w3"),
             c("bar",15,"w1"))

df

tgtattr<-"u"
cmpattr<-"w"
whichtgtclasses<-c("foo","bar") #want rows 1,2,4,5,6
whichcmpclasses<-c("w1","w3") #want rows 1,3,4,5,6

rowsToUse<-which(df[,tgtattr] == whichtgtclasses)
#should give me 1,2,4,5,6
rowsToUse
#gave me 1,2,6
#this means that R is cycling the vector
#this also means the following
rowsToUse<-which(df[,cmpattr] == whichcmpclasses)
#should give 1,3,4

#resolving this now:
#use %in%
rowsToUse<-which(df[,tgtattr] %in% whichtgtclasses == TRUE)
rowsToUse2<-which(df[,cmpattr] %in% whichcmpclasses == TRUE)

#resolved

#table
rtu<-intersect(rowsToUse,rowsToUse2)
df2<-df[rtu,c(tgtattr,cmpattr)]

table(df2)