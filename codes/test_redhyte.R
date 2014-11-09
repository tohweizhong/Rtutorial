mined.attr<-c("education.num","occupation","hours.per.week", "age","relationship")
mined.attr.list<-as.list(mined.attr)




names(mined.attr.list)<-mined.attr.list

df.mined<-df[,mined.attr]

for(a.ctx.attr in mined.attr)
  mined.attr.list[[a.ctx.attr]]<-unique(df[,a.ctx.attr])

as.vector(mined.attr.list)

proportions.names<-paste(mined.attr,".p",sep="")


#======

tmp<-df

rows<-c(which(tmp$workclass == " State-gov"),
        which(tmp$workclass == " Self-emp-not-inc"))

tmp<-tmp[rows,]

mean.discre<-function(an.attr){
  m<-mean(tmp[,an.attr])
  new.col<-sapply(tmp[,an.attr],
                  FUN=function(x){
                    if(x>=m) return(">= mean")
                    else return("< mean")})
  return(new.col)
}

tmp$age.class<-mean.discre("age")


rows<-which(tmp$education == " Assoc-voc")

tmp<-tmp[rows,]

tmp<-tmp[,c("age.class","workclass")]
tmp<-droplevels(tmp)

table(tmp$workclass,tmp$age.class)


#======

tmp<-df
mean.discre<-function(an.attr){
  m<-mean(tmp[,an.attr])
  new.col<-sapply(tmp[,an.attr],
                  FUN=function(x){
                    if(x>=m) return(">= mean")
                    else return("< mean")})
  return(new.col)
}

tmp$age.class<-mean.discre("age")
rows<-c(which(tmp$workclass == " State-gov"),
        which(tmp$workclass == " Self-emp-not-inc"))

tmp<-tmp[rows,]




rows<-which(tmp$education == " Assoc-voc")

tmp<-tmp[rows,]

tmp<-tmp[,c("age.class","workclass")]
tmp<-droplevels(tmp)

table(tmp$workclass,tmp$age.class)
