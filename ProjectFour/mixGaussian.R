# This is an example of using mvtnorm library to generate a Gaussian mixture distribution.
# More details about the API can be found at
# http://math.furman.edu/~dcs/courses/math47/R/library/mvtnorm/html/Mvnorm.html
#
# The Gaussian mixture distribution generated in this example consists two 2-D Gaussian
# distribution centering at (-1,-1) and (1,1) with the same covariance matrix
# of the form [1,0;0,1].
#
# Author: Huo Chen
#
# Revison History
# =============================================================================
# First commit                                                       10/28/2016

library("mvtnorm")

mixGaussian <- function(n,mean,cov=diag(n),weights) {
    component <- sample(1:n,prob=weights,size=1,replace=TRUE)
    result <- rmvnorm(1,mean[component,],cov)
    return (result)
}
mean <- matrix(c(-1,-1,1,1),nrow=2,ncol=2,byrow=TRUE)
n <- 2
weights <- c(0.5,0.5)

mixGaussian(n=n,mean=mean,weights=weights)
