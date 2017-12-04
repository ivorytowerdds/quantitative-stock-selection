function [ IC2 ] = ic2( x,y,z )
%The function is used to calculate the value of IC
% x is closemonth, y is eps,z is hs300/zz500
%[r,c]=size(x);
a=find(y(1,2)==x(1,:));
mreturn=[];
nreturn=[];
neps=[];
feps=[];
freturn=[];
d=[];
e=[];
for i=2:(size(y,2)) 
        m=find(y(1,i)==z(1,:));%find the colume number of the trading date when eps starts to report
        if isempty(m)
            continue
        end
        n=z(:,m);%select the stock number
        n(1,:)=[];%delete the row of date
        n(n==0,:)=[];%delete the zero value
        for j=1:(length(n))
        d=[d;find(n(j)==y(:,1))];%find the row number of the selected stocks in eps
        e=[e;find(n(j)==x(:,1))];%find the row number of the selected stocks in closemonth
        end
        meps=y(d,[1,i]);
        %delete the N/A value
        meps(any(isnan(meps(:,2)),2),:)=[];
        p=a+i-2;
        mprice=x(e,[1,p,p+1]);
        for l=1:(length(e))
            mreturn=[mreturn;(mprice(l,3)-mprice(l,2))/mprice(l,2)]; % note: starts from the period following the first calculated period
        end  
        mreturn=[mprice(:,1),mreturn];
        mreturn(any(isnan(mreturn),2),:)=[];
        id=intersect(meps(:,1),mreturn(:,1));
        for k=1:(length(id))
            neps=[neps,find(id(k)==meps(:,1))];
            nreturn=[nreturn,find(id(k)==mreturn(:,1))];
        end
        feps=[feps;meps(neps,:)];
        freturn=[freturn;mreturn(nreturn,:)]; 
        meps=[];
        mreturn=[];
        neps=[];
        nreturn=[];
        d=[];
        e=[];
end
IC=corrcoef(feps(:,2),freturn(:,2));  

end

