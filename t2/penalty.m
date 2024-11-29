function [X,FX]=penalty(fun,g,h,x0)
%��㷣����������Ҫ����fun������g��������h�����Լ���ʼ��
%����ȫ�ֱ���r������������r0��Ȩ��Ϊ5�����þ��ȣ�����ȫ��TextF����
global M;
global TextF;

M=1;
TextF=@(x)fun(x)+M*(sum(min(g(x),0).^2)+sum(h(x).^2));
c=5;
x=x0;
sign=0;
err=0.001;
Lastx=x;
Lastfx=TextF(x);
%��ʼ����
while(1)
    %������һ�ε�����xֵΪLastx���ı䷣���ӵ�ֵ�����õ����ε�������ֵx
    Lastx=x;
    M=c*M;    %ÿ��ѭ�����¶���TextF����
    %     TextF=@(x)fun(x)+r*(sum(min(g(x),0).^2)+sum(h(x).^2));
    sign=sign+1;
    %     x=fminunc(TextF,Lastx,[0 0 0 0 0 0]);%BFGS �㷨
    x=DFP(Lastx);
    fx=fun(x);
    %��������������100�λ������㾫��ʱ���ش�ʱ��x��x��Ӧ�ĺ���ֵ
    if sign >100
        M=Inf;
%         x=fminunc(TextF,Lastx,[0 0 0 0 0 0]);%BFGS �㷨
        x=DFP(Lastx);
        fx=fun(x);
        break;
    end
    if norm(x-Lastx)<err
        break;
    end 
end
X=x;
FX=fx;
end

