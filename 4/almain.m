clc
clear
%============================����ʼ================================
x_al=[0,0]';
global r_al  pena   ;      %������ȫ�ֱ�����
pena=10;                   %�ͷ�ϵ��
r_al=[1,1,1,1,1];
c_scale=2;                   %�˷�ϵ������
cta=0.5;                     %�½���׼ϵ��
e_al=1e-4;                   %�����Ʒ�Χ
max_itera=200;
out_itera=1;                 %��������
%===========================�㷨������ʼ=============================
while out_itera<max_itera
       x_al0=x_al;
       r_al0=r_al;
       %�жϺ���?
       compareFlag=compare(x_al0);  
       %��Լ������ţ�ٷ�BFGS
       [X,fmin]=fminunc(@alobj,x_al0);
        x_al=X;       %�õ��µ�����
        %�ж�ֹͣ����?
        if compare(x_al)<e_al
        disp('we get the opt point');
        break
        end
        %c�жϺ����½���?
        if compare(x_al)<cta*compareFlag
        pena=1*pena;      %���Ը�����Ҫ�޸ĳͷ�ϵ������
        else
        pena=min(1000,c_scale*pena);   %%�˷�ϵ�����1000
        disp('pena=2*pena');
        end
        %%?�����������ճ���
        [h,g]=constrains(x_al);
        for  i=1:1
              %%��ʽԼ������
              r_al(i)= r_al0(i)+pena*h(i);
        end
        for  i=1:4
              %%����ʽԼ������
               r_al(i+1)=max(0,(r_al0(i+1)+pena*g(i)));
        end 
        out_itera=out_itera+1;
end
%+++++++++++++++++++++++++++��������+++++++++++++++++++++++++++++++++
disp('the iteration number');
k=out_itera
disp('the value of constrains'); 
compare(x_al)
disp('the opt point'); 
         x=x_al
        fmin=obj(X);