
## load library
library(genalg)
library(ggplot2)

## create raw data
dataset <- data.frame(item = c("pocketknife", "beans", "potatoes", "unions", 
                               "sleeping bag", "rope", "compass"), 
                      survivalpoints = c(10, 20, 15, 2, 30, 10, 30), 
                      weight = c(1, 5, 10, 1, 7, 5, 1))
## weight limit
weightlimit <- 20




## demo on how to set up chromosomes
# The evaluation function will evaluate the different individuals (chromosomes) of the population on the value of their gene configuration.
##    Each number in this binary string represents whether or not to take an item with you. 
##    A value of 1 refers to putting the specific item in the knapsack 
##    while a 0 refers to leave the item at home.
chromosome = c(1, 0, 0, 1, 1, 0, 0)
dataset[chromosome == 1, ]
##           item survivalpoints weight
## 1  pocketknife             10      1
## 4       unions              2      1
## 5 sleeping bag             30      7
#We can check to what amount of surivival points this configuration sums up.

cat(chromosome %*% dataset$survivalpoints)
# cat(t(chromosome) %*% dataset$survivalpoints)
## 42





#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
## set-up an evaluation function
#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

## for genalg package, which minimize the function value
evalFunc_genalg <- function(x) {
  current_solution_survivalpoints <- x %*% dataset$survivalpoints
  current_solution_weight <- x %*% dataset$weight
  
  if (current_solution_weight > weightlimit) {
    return(0) 
  } else {
    return(-current_solution_survivalpoints)
  }
  
}

## for GA package, which maximize the function value
evalFunc_ga <- function(x) {
  current_solution_survivalpoints <- x %*% dataset$survivalpoints
  current_solution_weight <- x %*% dataset$weight

  if (current_solution_weight > weightlimit) {
    return(0)
  } else {
    return(current_solution_survivalpoints)
  }

}




#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
## run the GA optimization
#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

## genalg package solution
GAmodel <- rbga.bin(size = 7, popSize = 200, iters = 100, mutationChance = 0.01, 
                    elitism = T, evalFunc = evalFunc_genalg)
cat(summary(GAmodel))
## GA Results
##   Best Solution : 1 1 0 1 1 1 1 


## GA package solution
GAmodel <- ga(type='binary', nBits = 7, names = as.character(dataset$item),
             popSize=200, maxiter=100,
             keepBest=T, fitness = evalFunc_ga)
summary(GAmodel)
# Solution = 
#   pocketknife beans potatoes unions sleeping-bag rope compass
#           1     1        0      1            1    1       1



## best solution
solution = c(1, 1, 0, 1, 1, 1, 1)
dataset[solution == 1, ]
# item survivalpoints weight
# 1  pocketknife             10      1
# 2        beans             20      5
# 4       unions              2      1
# 5 sleeping bag             30      7
# 6         rope             10      5
# 7      compass             30      1
#This in turn gives us the total number of survival points.

# solution vs available
cat(paste(solution %*% dataset$survivalpoints, "/", sum(dataset$survivalpoints)))
## 102 / 117


