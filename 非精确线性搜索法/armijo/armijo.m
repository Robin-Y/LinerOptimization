function alphaStar=armijo(f)
%Amijo准则
%功能描述：在已有迭代下降方向之后，计算出符合Armijo准则的迭代点（1.充分下降，2.且距离原点比较远的点），不精确。
%INPUT params：
%       f:应该是sym类型的变量，例如syms x; f=x.^2+2.*x,不能输入函数句柄。。。（切忌）
%       rou: TODO
%       alpha:TODO
%OUTPUT:    
%       alphaStar:满足条件的下降步长(不是最优解)
%anthor 黄帅彬 <robinyellow0@gmail.com> 2017/04/26

rou=0.1;
w=0.5;
alpha=0.5;
f_d_1 = inline(diff(f,1));      %将符号变量转化成内联函数，方便赋值
f_inline = inline(f);
while true
    if f_inline(alpha) <= f_inline(0)+rou*alpha*f_d_1(0)
        alphaStar = alpha;
        break;
    else
        alpha = w*alpha;
    end
end
return 

