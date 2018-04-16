function [ root,fx,ea,maxiter ] = falsePosition(func,xl ,xu ,es,maxiter)
% This function models the false position method which is used to
% estimate the roots of a given function
%Inputs:
% func - the function being evaluated
% xl - the lower guess
% xu - the upper guess
% es - the desired relative error (default = 0.0001%)
% maxiter - the number of iterations desired (default = 200)
%Outputs:
% root - the estimated root location
% fx - the function evaluated at the root location
% ea - the approximate relative error 
% iter - how many iterations were performed
tic %start time
format compact %user preference
fplot(func)  %
ylim([-10 10]) %%plot function with x/y parameters
xlim([-10 10]) %
refline(0,0)
if nargin < 3 %making sure minimum amount of inputs is met
    error ('at least three inputs required') %error message
elseif nargin < 4 %setting default functions
    es = 0.0001;
    maxiter = 200;
elseif nargin < 5 %setting default function
    maxiter = 200;
elseif nargin > 5 %making sure amount of inputs not exceeded
    error('too many inputs') %error message
end %end if statement
test = func(xl) * func(xu); %test inputs for sign change
if test >= 0
    error('no sign change') %error if no sign change
end %end if statement
iter = 0; %iterations start at zero
xr = xl; %initialize xr
ea = 100; %start error at 100

while ea > es && iter < maxiter %loop until one statement is false
    xrold = xr; %set value for xrold to later estimate relative error
    xr = vpa(xu - ((func(xu)*(xl - xu))/(func(xl)-func(xu)))); %equation  
    %for false position method
    iter = iter + 1; %increase iterations each time run
     if xr ~= 0 %xr cant be evaluated at zero for error
        ea = vpa(abs((xr - xrold)/xr) * 100); %calculate relative error
     end %end if statement
    if func(xr) > 0 %if xr is positive then it takes the upper bound 
        %position
        xu = xr;
    elseif func(xr) < 0 %if xr is negative then it takes the lower bound
        %position
        xl = xr;
    else
        ea = 0; %if xr is zero then the error is zero and the root is found
    end %end if statement
end %end while loop
root = xr; %define the output root
fx = func(xr); %define the f(x) output
toc %end time
        

