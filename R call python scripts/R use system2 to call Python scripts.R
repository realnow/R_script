# use anaconda python command line 
command = "/Users/xiangyuqian/anaconda/bin/python"

## specify the python script path
# Note the single + double quotes in the string (needed if paths have spaces)
path2script='"/Users/xiangyuqian/Documents/R Script/R call python scripts/splitstr.py"'

# Build up args in a vector
string = "3523462---12413415---4577678---7967956---5456439"
pattern = "---"
args = c(string, pattern)

# Add path to script as first arg
allArgs = c(path2script, args)

# excute the python script
output = system2(command, args=allArgs, stdout=TRUE)

# print out the results
print(paste("The Substrings are:n", output))