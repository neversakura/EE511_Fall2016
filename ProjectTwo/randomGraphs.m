%{
This is an example to create a binomial random graph in MATLAB

Author: Huo Chen

Revision History
=========================================================================gr
First Commit                                                   9/22/2016
%}

% Create a random edge matrix with 20 nodes
edge=random('Binomial',1,0.5,20,20);
edge(edge==0)=-1;
edge=abs(edge'+edge);
edge(logical(eye(20)))=0;
G=graph(edge~=0);

% Plot the graph

plot(G)