function [x,fx,df,xx] = newton(f,x0,TolX,MaxIter)
%newton.m to solve f(x) = 0 by using Newton method.
%input: f = ftn to be given as a string ’f’ if defined in an M-file
% df = df(x)/dx (If not given, numerical derivative is used.)
% x0 = the initial guess of the solution
% TolX = the upper limit of |x(k) - x(k-1)|
% MaxIter = the maximum # of iteration
%output: x = the point which the algorithm has reached
% fx = f(x(last)), xx = the history of x

if nargin < 5, MaxIter = 50; end
if nargin < 4, TolX = 1e-3; end
xx=zeros(1, MaxIter);%for pre-allocating

xx(1) = x0;
for k = 1: MaxIter
 syms x;
 fx=feval(f,xx(k));
 df = diff(f,xx(k)); %numerical drv
 dx = -fx/df; 
 xx(k+1) = xx(k)+dx;
 err = abs(xx(k) - xx(k - 1)); if err < TolX, break; end
end
x = xx(k);
if k == MaxIter
fprintf('Do not rely on me, though best in %d iterations \n',MaxIter)
end