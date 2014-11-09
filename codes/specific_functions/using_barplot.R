#using_barplot.R

barplot(table(df$workclass),las=2)
barplot(table(df$workclass),las=2,cex.names=0.5)

par(mfrow=(c(2,2)))

barplot(table(df$workclass),las=2,cex.names=0.5)
barplot(table(df$occupation),las=2,cex.names=0.5)
barplot(table(df$age.class),las=2,cex.names=0.5)
barplot(table(df$native.country),las=2,cex.names=0.5)

