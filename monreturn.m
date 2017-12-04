<<<<<<< HEAD
function [ onereturn ] = monreturn( x,y )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
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

=======
function [ onereturn ] = monreturn( x,y )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
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

>>>>>>> b932b675374bc70ce5110b3db183481fbde16346
