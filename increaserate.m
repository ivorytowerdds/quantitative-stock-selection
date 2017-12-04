function [ increase ] = increaserate(x)
%This function is used to calculate the various rates of growth
%   Detailed explanation goes here
[r,c]=size(x);
a=x(:,(2:(end-1)));
a(a==0)=NaN;
b=x(:,(3:end));
c=b./a-1;
increase=[x(:,1),c];
increase=[x(1,[1,(3:end)]);increase];
end

