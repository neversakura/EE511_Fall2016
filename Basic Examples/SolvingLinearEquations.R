# This is a simple example using R to solve a linear system of the form
# A*x=B
# You can find more details on the following webpage:
# http://www.math.ucla.edu/~anderson/rw1001/library/base/html/solve.html

# Author: Huo Chen

# Revison History
# ===========================================================================
# First commit                                                      8/28/2016
# Singular matrix                                                   9/6/2016

A=matrix(sample.int(15, size = 3*3, replace = TRUE), nrow = 3, ncol = 3)
B=matrix(sample.int(10, size = 3*1, replace = TRUE), nrow = 3, ncol = 1)
print('The linear system has the form of A*x=B, where A is:')
print(A)
print('B is:')
print(B)
C=cbind(A,B)

# if matrix A is singluar, we have two situations-- infinite many solutions
# or no solution at all

y <- qr(A)
z <- qr(C)

if ((y$rank!=3) && (y$rank!=z$rank)){
    print('Matrix A is singular, there is no proper solution.')
} else if ((y$rank!=3) && (y$rank==z$rank)){
    print('The matrix is singular and there are infinite number of solutions.')
    print('The homogeneous solution is:')
    print(Null(A))
    print('The particular solution is:')
    result <- lsfit(A,B, intercept = FALSE)
    print(result$coefficients)
} else {
    x=solve(A,B)
    print('The solution x is:')
    print(x)
}
