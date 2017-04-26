syms x;
alpha(1) = 0.5;
k=1;
miu = 0.01;
f(x) = 1-x*exp(-x^2);
f_d_1 = inline(diff(f(x)));
f_d_2 = inline(diff(f(x),2));
while true
    faiD1 = feval(f_d_1, alpha(k));
    if abs(faiD1)<miu
        alphaStar = alpha(k);
        break;
    else
        faiD2 = feval(f_d_2, alpha(k));
        alpha(k+1) = alpha(k) - faiD1/faiD2;
        k=k+1;
    end
end
alphaStar