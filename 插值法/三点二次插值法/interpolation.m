%Φ(t)=1-t*exp(-t^2),区间[0,1],三点二次插值
esp = 0.01;
alpha1 = 0.1;
alpha2 = 0.5;
alpha3 = 0.95;     %alpha三点赋初值
count =0;
while 1
    fai1 = 1-alpha1*exp(-alpha1^2);
    fai2 = 1-alpha2*exp(-alpha2^2);
    fai3 = 1-alpha3*exp(-alpha3^2);
    minAlpha = 1/2*((alpha2^2-alpha3^2)*fai1 + (alpha3^2-alpha1^2)*fai2 + (alpha1^2-alpha2^2)*fai3)/((alpha2-alpha3)*fai1 + (alpha3-alpha1)*fai2 + (alpha1-alpha2)*fai3);
    minFai = 1-minAlpha*exp(-minAlpha^2);
    
    if minAlpha>alpha2
        if minFai <= fai2    
            alpha1 = alpha2;
            alpha2 = minAlpha;
            fai1 = fai2;
            fai2 = minFai;
        else
            alpha3 = minAlpha;
            fai3 = minFai;
        end
    else
        if minFai <= fai2
            alpha3 = alpha2;
            alpha2 = minAlpha;
            fai3 = fai2;
            fai2 = minFai;
        else
            alpha1 = minAlpha;
            fai1 = minFai;
        end
    end
    count = count+1;
    %判断是否收敛
    if abs(alpha1-minAlpha) < esp
        break;
    end
end
minAlpha
minFai
