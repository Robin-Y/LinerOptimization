function alphaStar=armijo(f)
%Amijo׼��
%���������������е����½�����֮�󣬼��������Armijo׼��ĵ����㣨1.����½���2.�Ҿ���ԭ��Ƚ�Զ�ĵ㣩������ȷ��
%INPUT params��
%       f:Ӧ����sym���͵ı���������syms x; f=x.^2+2.*x,�������뺯��������������мɣ�
%       rou: TODO
%       alpha:TODO
%OUTPUT:    
%       alphaStar:�����������½�����(�������Ž�)
%anthor ��˧�� <robinyellow0@gmail.com> 2017/04/26

rou=0.1;
w=0.5;
alpha=0.5;
f_d_1 = inline(diff(f,1));      %�����ű���ת�����������������㸳ֵ
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

