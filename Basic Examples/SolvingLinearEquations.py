# This is a simple example using numpy to solve a linear system of the form
# A*x=B
# You can find more details on the following webpage:
# http://docs.scipy.org/doc/numpy/reference/generated/numpy.linalg.solve.html

# Author: Huo Chen

# Revison History
# ===========================================================================
# First commit                                                      8/28/2016
# Singular matrix                                                   9/6/2016

import numpy as np

def nullspace(A, atol=1e-13, rtol=0):
    """Compute an approximate basis for the nullspace of A.

    The algorithm used by this function is based on the singular value
    decomposition of `A`.

    Parameters
    ----------
    A : ndarray
        A should be at most 2-D.  A 1-D array with length k will be treated
        as a 2-D with shape (1, k)
    atol : float
        The absolute tolerance for a zero singular value.  Singular values
        smaller than `atol` are considered to be zero.
    rtol : float
        The relative tolerance.  Singular values less than rtol*smax are
        considered to be zero, where smax is the largest singular value.

    If both `atol` and `rtol` are positive, the combined tolerance is the
    maximum of the two; that is::
        tol = max(atol, rtol * smax)
    Singular values smaller than `tol` are considered to be zero.

    Return value
    ------------
    ns : ndarray
        If `A` is an array with shape (m, k), then `ns` will be an array
        with shape (k, n), where n is the estimated dimension of the
        nullspace of `A`.  The columns of `ns` are a basis for the
        nullspace; each element in numpy.dot(A, ns) will be approximately
        zero.
    """

    A = np.atleast_2d(A)
    u, s, vh = np.lin.svd(A)
    tol = max(atol, rtol * s[0])
    nnz = (s >= tol).sum()
    ns = vh[nnz:].conj().T
    return ns

A=np.random.randint(10,size=(3,3))
B=np.random.randint(10,size=(3,))

C=np.concatenate((A,np.transpose([B])),axis=1)

print('The linear system has the form of A*x=B, where A is:')
print(A)
print('B is:')
print(B)

# if matrix A is singluar, we have two situations-- infinite many solutions
# or no solution at all

if np.linalg.matrix_rank(A)!=3 and np.linalg.matrix_rank(C) == np.linalg.matrix_rank(A):
    print('The matrix is singular and there are infinite number of solutions.')
    print('The homogeneous solution is:')
    print(nullspace(A))
    print('The particular solution is:')
    print(np.linalg.lstsq(A,B)[0])

elif np.linalg.matrix_rank(A)!=3 and np.linalg.matrix_rank(C) != np.linalg.matrix_rank(A):
    print('Matrix A is singular and there is no proper solution.')

else:
    print('The solution x is:')
    x=np.linalg.solve(A,B)
    print(x)
