esp=0.0001; a(1)=-1; b(1)=1; tau = (sqrt(5)-1)/2;     %esp�����ֱ��a1 b1����ʼֵ��tau�ǻƽ�ָ�ȵ�ֵ,������±��Ǵ�1��ʼ�����Գ�ʼֵ
lambda(1) = a(1) +(1-tau)*(b(1) - a(1));      %���lamda�ĳ�ʼֵ
miu(1) = a(1) + tau*(b(1) - a(1));   %���miu�ĳ�ʼֵ
faiLambda(1) = 2*lambda(1)^2-lambda(1)+1;   %����fai�����е�alphaȡֵ��lambda(0)��ֵ
faiMiu(1) = 2*miu(1)^2 - miu(1) + 1;        %�����fai�����е�alphaȡֵ��miu(0)��ֵ
k = 1;  %�����������и�ֵ
flag = 1;   %ѭ���ı�ʶ��
while flag == 1

    if faiLambda(k) < faiMiu(k)   %�Ƚ�lambda �Լ� miu�ĺ���ֵ
   
        a(k+1) = a(k);      
        b(k+1) = miu(k);     %��������е���
        miu(k+1) = lambda(k);   %��lamda K ��ֵ��ֵ��miu K+1
        faiLambda(k) = 2*lambda(k)^2-lambda(k)+1;   %����fai�����е�alphaȡֵ��lambda(k)��ֵ
        faiMiu(k+1) = faiLambda(k);       %��Lamdaȡֵ��kʱ���fai����ֵ ��ֵ�� miuȡֵ��k+1ʱ�ĺ���ֵ
        if abs(b(k+1) - a(k+1)) < esp       %�ж����䳤���Ƕ�С��esp��ֵ
            alpha = (a(k+1) + b(k+1))/2;        %��������е㸳ֵ��alpha
            break;      %����ѭ��
        else
            lambda(k+1) = a(k+1) + (1 - tau)*(b(k+1) - a(k+1));
            faiLambda(k+1) = 2*lambda(k+1)^2-lambda(k+1)+1;   %����fai�����е�alphaȡֵ��lambda(k+1)��ֵ
            k = k+1;    %k����1
        end
    else
       a(k+1) = lambda(k);  %����߽縳ֵ����
       b(k+1) = b(k);
       lambda(k+1) = miu(k);
       faiMiu(k) = 2*miu(k)^2 - miu(k) + 1;
       faiLambda(k+1) = faiMiu(k);  %��miu k �ĺ���ֵ ��ֵ��lamda�ĺ���ֵ
       if abs(b(k+1) - a(k+1)) < esp       %�ж����䳤���Ƕ�С��esp��ֵ
            alpha = (a(k+1) + b(k+1))/2;        %��������е㸳ֵ��alpha
            break;      %����ѭ��
       else
           miu(k+1) = a(k+1) + tau*(b(k+1) - a(k+1));   %������һ��k��ֵ
           faiMiu(k+1) = 2*miu(k+1)^2 - miu(k+1) +1;
           k = k+1;  
        end
    end
end
alpha
faiAlpha = 2*alpha^2 - alpha +1
