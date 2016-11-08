%{
This is an example to illustrate one step of EM algorithm in MATLAB.

This program create a Gaussian mixture distribution sample set, with their 
model parameters being: means at (-1,-1) and (1,1); covariance matrix
[1,0;0,1].

The program only illustrate one step of the EM algorithm.

Author: Huo Chen

Revision History
=========================================================================gr
First Commit                                                   11/8/2016
%}

num=100;                      % number od data points
mu=[1,1;-1,-1];               % each row corresponds to the mean vector of one Gaussian cluster
sigma=[1,1];                  % this is the covariance of the Gaussians. 
p=ones(1,2)/2;                % mixture probability of two Gaussian
obj=gmdistribution(mu,sigma,p);
sample=random(obj,num);       % generate the a mixture Gaussian sample set

% define the initial guess for all the parameters
theta(1).mu=[2,2];
theta(1).sigma=[2,2];
theta(1).p=0.4;
theta(2).mu=[-2,-2];
theta(2).sigma=[2,2];
theta(2).p=0.6;

% E step, calculate the responsibility
r=zeros(num,2);
r(:,1)=theta(1).p*mvnpdf(sample,theta(1).mu,theta(1).sigma);
r(:,2)=theta(2).p*mvnpdf(sample,theta(2).mu,theta(2).sigma);
r=bsxfun(@rdivide,r,sum(r,2));

% M step, calculate the estimation of parameters
r_k=sum(r);
pi_vec=sum(r)/num;
theta(1).p=pi_vec(1);
theta(2).p=pi_vec(2);
theta(1).mu=sum(bsxfun(@times,r(:,1),sample))/r_k(1);
theta(2).mu=sum(bsxfun(@times,r(:,2),sample))/r_k(2);
sigmaOne=zeros(2,2);
sigmaTwo=zeros(2,2);
for i=1:num
    sigmaOne=sigmaOne+sample(i,:)'*sample(i,:)*r(i,1);
    sigmaTwo=sigmaTwo+sample(i,:)'*sample(i,:)*r(i,2);
end
theta(1).sigma=sigmaOne/r_k(1)-theta(1).mu'*theta(1).mu;
theta(2).sigma=sigmaOne/r_k(2)-theta(2).mu'*theta(2).mu;

% One iteration completed
