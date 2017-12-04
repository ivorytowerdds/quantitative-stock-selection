function [fmin,fmax,fmedian,fmean,fstd,dmin] = summary2(x,y) 
% The function is used to calculate the summary statistics
%   x is eps,y is hs300 or zz500
dmin=[];
dmax=[];
dmedian=[];
dmean=[];
dstd=[];
c=[];
for i=2:(size(x,2)) %size(x,2): get the column number of eps
    a=find(x(1,i)==y(1,:)); %find the colume number of the trading date in hs300 when company started to report eps
    if isempty(a)
        continue
    end
    b=y(:,a);
    b(1,:)=[];%delete the first row(date)
    b(b==0,:)=[];%delete 0
    for j=1:(length(b))
        c=[c;find(b(j)==x(:,1))];%find the row number of the selected stocks in eps
    end
    z=x(c,i);
    c=[];
    %delete the N/A value
    nans=isnan(z);
    ind=find(nans);
    z(ind)=[];
    %z=zscore(z);
    %get the statistic summary of a single period
    mymin=min(z);
    mymax=max(z);
    mymedian=median(z);
    mymean=mean(z);
    mystd=std(z);
     
    dmin=[dmin,mymin];
    dmax=[dmax,mymax];
    dmedian=[dmedian,mymedian];
    dmean=[dmean,mymean];
    dstd=[dstd,mystd];
end
fmin=min(dmin)
fmax=max(dmax)
fmedian=mean(dmedian)
fmean=mean(dmean)
fstd=mean(dstd)  
end

