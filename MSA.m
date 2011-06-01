function [x,err,xx] = MSA(g,x0,TolX,MaxIter)
% solve x = g(x) starting from x0 by fixed-point iteration.
%input : g,x0 = the function and the initial guess
% TolX = upperbound of incremental difference |x(n + 1) - x(n)|
% MaxIter = maximum # of iterations
%output: x = point which the algorithm has reached
% err = last value |x(k) - x(k - 1)| achieved
% xx = history of x

if nargin < 4, MaxIter = 50; end
if nargin < 3, TolX = 1e-3; end
xx=zeros(1, MaxIter);%for pre-allocating
xx(1) = x0;
xx(2)=feval(g,xx(1));
xx(3)=feval(g,xx(2));

for k = 4:MaxIter    
  lamda = (feval(g,xx(k - 1))- feval(g,xx(k - 2)))/(xx(k - 1)-xx(k - 2)) ;  
  alpha = 1/(1-lamda); 
  xx(k) = xx(k-1)+alpha*(feval(g,xx(k - 1))-xx(k-1)); 
  err = abs(xx(k) - xx(k - 1)); if err < TolX, break; end
end
x = xx(k);

if k == MaxIter
fprintf('Do not rely on me, though best in %d iterations \n',MaxIter)
end