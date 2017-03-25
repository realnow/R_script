# splitstr.py
import sys

# Get the arguments passed in
string = sys.argv[1]
pattern = sys.argv[2]

# Perform the splitting
ans = string.split(pattern)

# Join the resulting list of elements into a single newline
# delimited string and print
print('n'.join(ans))