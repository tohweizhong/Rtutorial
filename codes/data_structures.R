val <- 23

string <- "R rocks! 23 is a prime number."

obj1 <- "23"
obj2 <- 23

val <- 5
val == 6
#FALSE
val < 12
#TRUE

v <- c(1,5,6)
u <- c("foo","bar","foobar")
w <- "foobarfoobar"

fac <- factor(v)
fac
# [1] 1 5 6
# Levels: 1 5 6

fac2 <- factor(u)
fac2
# [1] foo    bar    foobar
# Levels: bar foo foobar

ord <- ordered(u, levels=c("foo","bar","foobar"))
ord
# [1] foo    bar    foobar
# Levels: foo < foobar < bar

fac3 <- factor(v, labels=c("lb1","lb2","lb3"))
fac3
# [1] lb1 lb2 lb3
# Levels: lb1 lb2 lb3

mat1 <- matrix(v)
mat2<- matrix(v, ncol=3)

x <- c(2.2,3,89)
mat1a <- cbind(mat1,x)
mat2a <- rbind(mat2,x)

charMat <- cbind(u,v)
charMat
# u         v  
# [1,] "foo"     "1"
# [2,] "bar"     "5"
# [3,] "foobar"  "6"

df <- data.frame(charMat,stringsAsFactors=FALSE)
df
# u  v
# 1     foo 1
# 2     bar 5
# 3  foobar 6

df$v <- as.numeric(df$v)
df

str(df)
# 'data.frame':   3 obs. of  2 variables:
#  $ u: chr  "foo" "bar" "foobar"
#  $ v: num  1 5 6