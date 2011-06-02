function [root,yRoot,err,it,P] = secant(f,a,b,delta)
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

while abs(b-a) > delta ,
%     if a > b,
%         temp = a;
%         a = b;
%         b = temp;
%     end;
    ya = feval(f,a);
    yb = feval(f,b);
    temp = b - ( ( yb / (yb - ya ) ) * (b - a) );
    if temp < a
        b = a;
    end
    a = temp;
    P = [P;a b];
end
it = length(P);
root  = a
yRoot = feval(f,root);
err = abs(b-a)/2;
end

