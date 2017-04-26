a(1)=0;
b(1)=100000;
rou=0.1;
t=2;    
k=1;
fai0 = 50;
faiD0 = -60;
alpha(1) = 0.5;     %给定的第一个点
while 1
    faiAlpha(k) = -2*alpha(k)^3+21*alpha(k)^2-60*alpha(k)+50;
    if faiAlpha(k) <= fai0 +rou*alpha(k)*faiD0
        if faiAlpha(k) >= fai0+(1-rou)*alpha(k)*faiD0
            break;
        else
            a(k+1) = alpha(k);
            b(k+1) = b(k);
            if b(k+1) <100
                alpha(k+1) = (a(k+1)+b(k+1))/2;
                k=k+1;
            else
                alpha(k+1) = t*alpha(k);
                k=k+1;
            end
        end
    else
        a(k+1) = a(k);
        b(k+1) = alpha(k);
        alpha(k+1) = (a(k+1)+b(k+1))/2;
        k=k+1;
    end
end
alpha(k)