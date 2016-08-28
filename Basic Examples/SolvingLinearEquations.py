# This is a simple example using numpy to solve a linear system of the form
# A*x=B
# You can find more details on the following webpage:
# http://docs.scipy.org/doc/numpy/reference/generated/numpy.linalg.solve.html

# Author: Huo Chen

# Revison History
# ===========================================================================
# First commit                                                      8/28/2016

import numpy as np

A=np.random.randint(10,size=(3,3))
B=np.random.randint(10,size=(3,))

print('The linear system has the form of A*x=B, where A is:')
print(A)
print('B is:')
print(B)

if np.linalg.matrix_rank(A)!=3:
    print('Matrix A is singular, there is no proper solution.')
else:
    print('The solution x is:')
    x=np.linalg.solve(A,B)
    print(x)
