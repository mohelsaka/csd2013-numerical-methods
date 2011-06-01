function [root,yRoot,err,it,P] = BirgeVieta(coff , x0 , delta)
% Inputs
%   coff    coffetient of the polynomial
%   a       Starting point
%   delta   convergence tolerance
% Return
%   root    solution: the root
%   yRoot   function value at root
%   err     error estimate in root
%   it      number of iterations
%   P       History vector of the iterations
err = 1 + delta;
x = x0;
bi = 0; ci = 0; it = 0;
coffLen = length(coff);
P = zeros(1, 1);
P(1) = x0;

while err > delta ,
	it = it + 1;
	x0 = x;
	bi = 0;ci = 0;
	for i=1:coffLen-1,
		bi = bi * x + coff(i);
		ci = ci * x + bi;
	end
	bi = bi * x + coff(coffLen);
	x = x - (bi / ci);
    P = [P;x];
	err = abs(x - x0);
end
root  = x;
yRoot = polyval(coff,root);
end

