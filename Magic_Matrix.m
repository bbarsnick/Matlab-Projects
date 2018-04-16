function [ matrix_out ] = Magic_Matrix(r, c)
%Magic_Matrix This function will output a matrix with the
%value of each element in the first row is the number of the column,
%the value of each element in the first column is the number of the row,and
%the rest of the elements each has a value equal to the sum of the element
%above it and element to the left.
%Inputs:
% r = number of rows
% c = number of columns
%outputs:
%matrix_out = the Magic_Matrix
M=zeros(r,c); %seting up a bucket big enough to put the chicken in
for i=1:r %seting variable i to the omount of rows
    for j=1:c %setting variable j to the amount of columns
        if i==1 %When the row is equal to one
            M(i,j)=j; %Defining the first row 1 to c
        elseif j==1 %when the column id equal to one
            M(i,j)=i; %setting the first column 1 to r
        else %for all otgher values (everything in the middle)
            M(i,j)=M(i-1,j)+M(i,j-1); %add the variable to the top and left
        end
    end      %end all
end
matrix_out = M; %put the chicken in the bucket
end

