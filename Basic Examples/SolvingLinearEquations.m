%{
This is a simple example using MATLAB to solve a linear system of the form
A*x=B
You can find more details on the following webpage:
http://www.mathworks.com/help/matlab/ref/linsolve.html

Author: Huo Chen

Revison History
===========================================================================
First commit                                                      8/28/2016
%}

A=randi(10,3,3);
B=randi(10,3,1);

fprintf('The linear system is A*x=B, where A is:\n')
disp(A)
fprintf('B is:\n')
disp(B)

if rank(A)~=3 
    fprintf('The matrix A is singular.') % Suppose we have the rank(A)==rank([A B]) but rank(A)~=3. In this case, there are infinite numeber of solutions.
    if rank(A)==rank([A B])
        dimx=3-rank(A);
        fprintf('The particular solution is:\n')
        disp(pinv(A)*B);
        fprintf('The homogeneous solution is:\n')
        disp(null(A));
    else
    end
else
    x=linsolve(A,B);
    fprintf('The solution is:\n')
    disp(x)
end
