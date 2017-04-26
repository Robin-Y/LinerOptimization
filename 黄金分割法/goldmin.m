esp=0.0001; a(1)=-1; b(1)=1; tau = (sqrt(5)-1)/2;     %esp是误差，分别给a1 b1赋初始值，tau是黄金分割比的值,数组的下标是从1开始，所以初始值
lambda(1) = a(1) +(1-tau)*(b(1) - a(1));      %求出lamda的初始值
miu(1) = a(1) + tau*(b(1) - a(1));   %求出miu的初始值
faiLambda(1) = 2*lambda(1)^2-lambda(1)+1;   %计算fai函数中当alpha取值是lambda(0)的值
faiMiu(1) = 2*miu(1)^2 - miu(1) + 1;        %计算出fai函数中当alpha取值是miu(0)的值
k = 1;  %给计数器进行赋值
flag = 1;   %循环的标识符
while flag == 1

    if faiLambda(k) < faiMiu(k)   %比较lambda 以及 miu的函数值
   
        a(k+1) = a(k);      
        b(k+1) = miu(k);     %对区间进行调整
        miu(k+1) = lambda(k);   %将lamda K 的值赋值给miu K+1
        faiLambda(k) = 2*lambda(k)^2-lambda(k)+1;   %计算fai函数中当alpha取值是lambda(k)的值
        faiMiu(k+1) = faiLambda(k);       %将Lamda取值是k时候的fai函数值 赋值给 miu取值是k+1时的函数值
        if abs(b(k+1) - a(k+1)) < esp       %判断区间长度是都小于esp的值
            alpha = (a(k+1) + b(k+1))/2;        %将区间的中点赋值给alpha
            break;      %跳出循环
        else
            lambda(k+1) = a(k+1) + (1 - tau)*(b(k+1) - a(k+1));
            faiLambda(k+1) = 2*lambda(k+1)^2-lambda(k+1)+1;   %计算fai函数中当alpha取值是lambda(k+1)的值
            k = k+1;    %k自增1
        end
    else
       a(k+1) = lambda(k);  %区间边界赋值操作
       b(k+1) = b(k);
       lambda(k+1) = miu(k);
       faiMiu(k) = 2*miu(k)^2 - miu(k) + 1;
       faiLambda(k+1) = faiMiu(k);  %将miu k 的函数值 赋值给lamda的函数值
       if abs(b(k+1) - a(k+1)) < esp       %判断区间长度是都小于esp的值
            alpha = (a(k+1) + b(k+1))/2;        %将区间的中点赋值给alpha
            break;      %跳出循环
       else
           miu(k+1) = a(k+1) + tau*(b(k+1) - a(k+1));   %计算下一部k的值
           faiMiu(k+1) = 2*miu(k+1)^2 - miu(k+1) +1;
           k = k+1;  
        end
    end
end
alpha
faiAlpha = 2*alpha^2 - alpha +1
