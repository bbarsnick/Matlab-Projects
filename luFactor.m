function [U,L,P] = luFactor (A)
%luFactor -  Performs L U decomposition on given square matrix
%Input
% A = coefficient matrix
%Outputs
% L = lower triangular matrix 
% U = upper triangular matrix 
% P = pivot matrix

if nargin < 1
    error('Input something broski!') %
end                                  %errors to make dummy proof
if nargin > 1                        %
    error('Too many inputs broski!')
end
[n,n] = size(A); %determines how many rows and columns
if n ~= n   %the amount of rows and columns must be equal
    error('Matrix must be square')
end
U = A; %U starts as A
P = eye(n,n); %set up p with matlab function eye
L = P; %L starts like P
for i = 1:n %start with column for loop
    [maxval row] = max(abs(U(i:n,i))); %maxval is the max abs value in col
    row= row+i-1;
    if row ~= i %if row with max value is not at top then switch them
     U([i row],:) = U([row i],:);%switch rows in U
     P([i row],:) = P([row i],:);%switch same rows in P
     if i >= 2 %L only changes after first time, and if pivots again
            lprime=L(i,1:i-1);       %
            L(i,1:i-1)=L(row,1:i-1); %switch L positions w/ pivot
            L(row,1:i-1)=lprime;     %
     end
    end
    for j = i+1:n %now row for loop
        L(j,i) = U(j,i)/U(i,i);%determine L values and place them
        U(j,:) = U(j,:)-L(j,i)*U(i,:);%Multiply U rows to cancel values
    end
end
disp(L)
disp(U)
disp(P)
% T = P*A %proof that function works and P*A=L*U
% F = L*U
end


