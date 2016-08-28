# This is a simple example using R to solve a linear system of the form
# A*x=B
# You can find more details on the following webpage:
# http://www.math.ucla.edu/~anderson/rw1001/library/base/html/solve.html

# Author: Huo Chen

# Revison History
# ===========================================================================
# First commit

A=matrix(sample.int(15, size = 3*3, replace = TRUE), nrow = 3, ncol = 3)
B=matrix(sample.int(10, size = 3*1, replace = TRUE), nrow = 3, ncol = 1)
print('The linear system has the form of A*x=B, where A is:')
print(A)
print('B is:')
print(B)
y <- qr(A)
if (y$rank!=3) {
    print('Matrix A is singular, there is no proper solution.')
} else {
    x=solve(A,B)
    print('The solution x is:')
    print(x)
}
