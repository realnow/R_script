
##### loading library
library(rPython)


#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
## Assign and get variables in Python from R
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a <- 1:4
python.assign( "a", a )
python.exec( "b = len( a )" )
python.get( "b" )
python.exec( "import math" )
python.get( "math.pi" )


#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
## Calls Python functions and methods from R
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
python.call( "len", 1:3 )
a <- 1:4
b <- 5:8
python.exec( "def concat(a,b): return a+b" )
python.call( "concat", a, b)
python.assign( "a",  "hola hola" )
python.method.call( "a", "split", " " )
## simplification of arguments
a <- 1
b <- 5:8
## Not run:
python.call("concat", a, b)
## End(Not run)
# using function I()
python.call("concat", I(a), b)
# setting as.is = TRUE
python.call("concat", a, b, as.is = TRUE)


#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
## Executes Python code contained in an R character vector.
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a <- 1:4
b <- 5:8
python.exec( c( "def concat(a,b):", "\treturn a+b" ) )
python.call( "concat", a, b)


#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
## Executes Python code.
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a <- 1:4
b <- 5:8
# this file contains the definition of function concat
setwd('/Users/xiangyuqian/Documents/R Script')
python.load( system.file( "concat.py", package = "rPython" ) )
python.call( "concat", a, b)

