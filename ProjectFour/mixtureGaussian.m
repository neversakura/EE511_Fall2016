%{
This is an example to create and visualize a Gaussian mixsture distribution
in MATLAB. Detailed explanation can be found at:
https://www.mathworks.com/help/stats/gmdistribution.html

This program create and and visualize a Gaussian mixture distribution with
two Gaussian clusters, with their means at (-1,-1) and (1,1). They have the
same covariance matrix as [1,0;0,1]

Author: Huo Chen

Revision History
=========================================================================gr
First Commit                                                   10/26/2016
%}

mu=[1,1;-1,-1];               % each row corresponds to the mean vector of one Gaussian cluster
sigma=[1,1];                  % this is the covariance of the Gaussians. 
p=ones(1,2)/2;                % mixture probability of two Gaussian
obj=gmdistribution(mu,sigma,p);
ezsurf(@(x,y)pdf(obj,[x y]),[-2,2],[-2,2])