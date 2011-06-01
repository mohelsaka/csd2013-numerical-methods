function [c,yc,err,it,P] = bisect(f,a,b,delta)
% Inputs
%   f       name of the function
%   a       left endpoint
%   b       right endpoint
%   delta   convergence tolerance
% Return
%   c       solution: the root
%   yc      function value at c
%   err     error estimate in c
%   it      number of iterations
%   P       History vector of the iterations
P = [a b];
ya = feval(f,a);
yb = feval(f,b);
if ya*yb > 0,
    return
end
max1 = 1 + round((log(b-a)-log(delta))/log(2));
it = max1;
for k=1:max1,
  c  = (a+b)/2;
  yc = feval(f,c);
  if  yc == 0,
    a = c;
    b = c;
  elseif  yb*yc > 0,
    b = c;
    yb = yc;
  else
    a = c;
    ya = yc;
  end
  P = [P;a b];
  if b-a < delta, break, end
end
c  = (a+b)/2;
yc = feval(f,c);
err = abs(b-a)/2;
end
