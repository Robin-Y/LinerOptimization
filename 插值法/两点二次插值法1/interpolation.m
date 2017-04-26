%二点二次次插值法一，两个函数值一个导数的情况
%函数Φ(t)=1-t*exp(-t^2),区间[0,1]
esp = 0.00001;
k=1;
a(1) = 0;
b(1) = 1; 

while 1
    fai1 = 1-a(k)*exp(-a(k)^2);
    fai2 = 1-b(k)*exp(-b(k)^2);
    faiD1 = (2*a(k)^2-1)*exp(-a(k)^2);
    minAlpha(k) = a(k) - 1/2*((a(k)-b(k))*faiD1)/(faiD1 - (fai1-fai2)/(a(k)-b(k)));
    faiMinAlpha(k) = (2*minAlpha(k)^2-1)*exp(-minAlpha(k)^2);
    if abs(faiMinAlpha(k)) < esp
        alphaStar = minAlpha(k);
        break;
    else
         a(k+1) = minAlpha(k);
         b(k+1) = b(k);
         k = k+1;
    end
end
alphaStar