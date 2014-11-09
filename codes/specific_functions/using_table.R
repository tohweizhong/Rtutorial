#using_table.R

tab.dat<-df[c("workclass","education")]
tab1<-table(tab.dat[c("workclass","education")])
str(tab1)
colnames(tab1)
rownames(tab1)

tab2<-t(tab1)
str(tab2)




str(tab.dat)
state.gov.row<-which(tab.dat$workclass == " State-gov")
self.row<-which(tab.dat$workclass == " Self-emp-not-inc")

bachelors.row<-which(tab.dat$education == " Bachelors")
hs.row<-which(tab.dat$education == " HS-grad") 
masters.row<-which(tab.dat$education == " Masters")

rows<-intersect(union(state.gov.row,self.row),
                union(bachelors.row,union(hs.row,masters.row)))

tmp.df<-tab.dat[rows,]
tmp.df<-droplevels(tmp.df)


# experimenting witht table()
table(tmp.df)

tmp.df2<-subset(tmp.df,select=c(education,workclass))
str(tmp.df2)

table(tmp.df2)

###

clerical.row<-which(df$occupation == " Adm-clerical")

rows3<-intersect(clerical.row,
                 intersect(union(state.gov.row,self.row),
                union(bachelors.row, hs.row)))


tmp.df3<-tab.dat[rows3,]
tmp.df3<-droplevels(tmp.df3)

t(table(tmp.df3))




dat<-df[c("workclass","education","sex")]
mantelhaen.test(table(dat))


