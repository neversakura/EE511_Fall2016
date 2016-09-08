%{
This is a simple example using MATLAB to to generate binomial random
experiments

Author: Huo Chen

Revison History
===========================================================================
First commit                                                      9/6/2016
%}

% generate binomiaal random experiments
binomialExample=random('Binomial',10,0.5,1000,1);

% the histogram of the data
histogram(binomialExample)  % The command histogram was introduced in MATLAB 2014b. So for those of you who use elder version of MATLAB, use hist() instead.

% axis labels and title
xlabel('Bins')
ylabel('Frequencies')
title('Example Binomial Random Variable Bin Plot')
