#nonparametric.R
# -> F-test to test for different variance
# -> KS-test for normality
# -> MW-test
x<-rnorm(100,mean=0,sd=1)
y<-rnorm(100,mean=0,sd=2)

t.test(x,y)

test<-var.test(x,y)
ks.test(x,y)$p.value
wilcox.test(x,y)
