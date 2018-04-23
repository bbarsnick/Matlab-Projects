function [ root,fx,ea,iter ] = bisect(func,xl,xu,es,maxit,varargin)
% bisect - this function will find the roots of a given function by using
% the bisection method
% inputs:
% func - function being evaluated
% xl - lower guess
% xu - upper guess
% es - desired relative error (default = 0.0001%)
% maxit - maximum allowable iterations (default = 50)
% p1,p2,... - additional parameters use by function
%Outputs:
% root - real root
% fx - function value at root
% ea - approximate relative arror
% iter - number of iterations
clear

if nargin < 3
    error('at least three inputs required')
end
test = func(xl,varargin{:}) * func(xu,varargin{:});
if test > 0
    error('no sign change')
end
if nargin < 4| isempty(es)
    es = 0.0001;
end
if nargin<5| isempty(maxit)
    maxit = 50;
end
iter = 0;
xr = xl;
ea = 100;

while (1)
    xrold = xr;
    xr = (xl + xu)/2;
    iter = iter +1;
    if xr ~= 0
        ea = abs((xr - xrold)/xr) * 100;
    end
    test = func(xl,vargin{:}) * func(xr,vargin{:});
    if test < 0
        xu = xr;
    elseif test > 0
        xl = xr;
    else
        ea = 0;
    end
    if ea <= es | iter >= maxit,break
    end
end
root = xr;
fx = func(xr, varargin{:});
        







