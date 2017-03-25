
##############################################
### use DataFrame as the input for function
##############################################

## my sample data
n <- 100000
df <- data.frame(x = rnorm(n), y = rnorm(n), z = rnorm(n))

## customer defined function
myfunc <- function(d){
  if (d['x'] > d['y']){
    r <- 1
  }else if (d['y'] > d['z']){
    r <- 2
  }else{
    r <- 3
  }
  return(r)
}

## apply the function
df[,'outcome'] <- apply(df, MARGIN = 1, function(Z) myfunc(Z))




#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
## comparison (looping vs. vectorization)
#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
library("profvis")
profvis({
  
  ## looping
  df[,'outcome'] <- NULL
  for (i in 1:n){
    df[i,'outcome'] <- myfunc(df[i,])
  }
  
  
  ## vectorization
  df[,'outcome'] <- apply(df, MARGIN = 1, function(Z) myfunc(Z))
  
})




##############################################
### use columns / variable names as the input for function
##############################################

## my sample data
n <- 100000
df <- data.frame(x = rnorm(n), y = rnorm(n), z = rnorm(n), t = rnorm(n), k = rnorm(n))

## customer defined function
myfunc <- function(a, b, c){
  if (a > b){
    r <- 1
  }else if (b > c){
    r <- 2
  }else{
    r <- 3
  }
  return(r)
}

## apply the function
df[,'outcome'] <- apply(df, MARGIN = 1, function(Z) myfunc(a = Z['x'], b = Z['y'], c = Z['z']))






