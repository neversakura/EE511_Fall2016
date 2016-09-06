%{
This is a simple example using MATLAB to solve a linear system of the form
A*x=B
You can find more details on the following webpage:
http://www.mathworks.com/help/matlab/ref/linsolve.html

Author: Huo Chen

Revison History
===========================================================================
First commit                                                      8/28/2016
Sigular matrix                                                     9/6/2016
%}

A=randi(10,3,3);
B=randi(10,3,1);

fprintf('The linear system is A*x=B, where A is:\n')
disp(A)
fprintf('B is:\n')
disp(B)
C=[A, B];

% if matrix A is singluar, we have two situations-- infinite many solutions
% or no solution at all
if (rank(A)~=3) && (rank(A)~=rank(C))
    fprintf('The matrix A is singular and  there is no proper solution.\n')
elseif (rank(A)~=3) && (rank(A)==rank(C))
    fprintf('The matrix A is sigular and there are infinite number of solutions.\n')    
    fprintf('The homogeneous solution is:\n')
    disp(null(A));
    fprintf('The particular solution is:\n')
    disp(A\B);
else
    x=linsolve(A,B);
    fprintf('The solution is:\n')
    disp(x)
end
