function [ onereturn ] = monreturn( x,y )
%The function is used to calculate the various rates of return
%   x is the TradeData, y is the period you wish to calculate the rate of
%   return. The unit is month
[r,c]=size(x);
mreturn=[];
onereturn=[];
date=x(1,(2+y:c));
for j=2:(c-y)
    for i=2:r
        if x(i,j)==0
            x(i,j)=NaN;
        end 
        mreturn=[mreturn;(x(i,j+y)-x(i,j))/x(i,j)]; 
    end 
    onereturn=[onereturn,mreturn];
    mreturn=[];
end
onereturn=[date;onereturn];
onereturn=[x(:,1),onereturn];

end

