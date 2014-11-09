

# declare a variable
x <- 1

# do something to it
x + 1


# simple function on a constant
plusone <- function(x)  {  x + 1 }

# simple function on two parameters

plus.n <- function(x,n) { x + n }

# here there is one parameter x, where does the function get the value
# for n, when you call it later?

plus.nfree <- function(x) { x + n }

plus.nfree(10) # this will fail

n <- 10 
plus.nfree(10)  #this will work

n <- 100

plus.nfree(100)  # changing n changes the value of plus.nfree.  Dangerous!!!!

# now, let's do something interesting.  Return a function, and have the
# function that is returned enclose the value of the parameter of the
# outer function.  This is called a closure. 

plus.some <- function(n) {
    function(x) { x + n }
}

f <- plus.some(10)

# let's see what happens
f(10)

# now change n

n <- 10000000

# will it have an effect?

f(10)

