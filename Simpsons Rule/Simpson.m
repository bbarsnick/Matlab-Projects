function [I] = Simpson(x,y)
%Simpson function - Determines the integral between inputted 'y' function
%values as they relate to the inputted 'x' values 
%(side note - "inputted" IS a word)
%Inputs
% x - x values in vector form inputted to some function to produce y values
% y - y values prodeced from x inputs to a function
%Outputs
% I - Integral estimation
if nargin < 2 %error if user inputs less than two inputs
    error('Two inputs required')
end
if nargin > 2 %error if user inputs more then two inputs
    error('Only two inputs required')
end
[n,m] = size(x); %determines size of vector x
[r,c] = size(y); %determines size of vector y
if size(x) ~= size(y) %error if inputted vectors are not of equal size
    error('Inputs not of equal size')
end
T = x(1,2) - x(1,1); %Determined spacing between first and second x values
V = [x(1,1):T:x(1,m)]; %creates vecor with initial and final x values and spacing 'T'
if x ~= V %if both vecors dont match up then x is unevenly spaced
    error('Inputed x value not evenly spaced')
end
if rem(length(x),2) == 0 %determines if amount of x values is even or odd using remainder function
    warning('Trapazoid rule will be used on last segment') %if even amount of numbers then warn user that trapazoidal rule will be used
end
if rem(length(x),2) == 1 %if amount of x values is odd - use just 1/3 rule
    I = ((x(1,m)-x(1,1))/(3*(m-1)))*((y(1,1)+y(1,c))+4*(sum(y(1,2:2:c)))+2*(sum(y(1,3:2:c-1)))) %equation for 1/3 rule
else %else use 1/3 rule with trapazoidal rule on last interval
    I = ((x(1,m-1)-x(1,1))/(3*(m-1)))*((y(1,1)+y(1,c))+4*(sum(y(1,2:2:c-1)))+2*(sum(y(1,3:2:c-1))))+((x(1,m)-x(1,m-1))*((y(1,c)+y(1,c-1))/2));
    %equation for 1/3 rule and trapazoidal rule
end
E = ((trapz(x,y)-I)/trapz(x,y))*100; %calculates error using built in function
fprintf('The error is %s percent',E)
end

