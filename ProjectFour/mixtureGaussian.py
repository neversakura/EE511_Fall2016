# This is an example of using numpy library to generate a Gaussian mixture distribution.
# More details about the API can be found at
# https://docs.scipy.org/doc/numpy/reference/generated/numpy.random.multivariate_normal.html
#
# New version of scikit-learn library have a nice model to fit mixture Gaussian
# distribution with EM algorithm. More details can be found at
# http://scikit-learn.org/stable/modules/generated/sklearn.mixture.GaussianMixture.html#sklearn.mixture.GaussianMixture
#
# The Gaussian mixture distribution generated in this example consists two 2-D Gaussian
# distribution centering at (-1,-1) and (1,1) with the same covariance matrix
# of the form [1,0;0,1].
#
# Author: Huo Chen
#
# Revison History
# =============================================================================
# First commit                                                       10/26/2016
import numpy as np

def mixGaussian(n,mean,cov,weights):
    '''
    The input of function must be numpy arrays.
    Here only the case where each component has the same covariance is implemented
    '''
    assert sum(weights)==1
    category=np.flatnonzero(np.random.multinomial(1,weights))
    cmean=mean[category,:][0]
    return np.random.multivariate_normal(cmean,cov)

n=2
mean=np.array([[-1,-1],[1,1]])
cov=np.array([[1,0],[0,1]])
weights=np.array([0.5,0.5])

print(mixGaussian(n,mean,cov,weights))
