function x=DFP(x)
%
% DFP�㷨����Լ���Ż��������Сֵ
%


global p k H
% x=[1 1]';                                             %��ʼ������
H=eye(2);                                             %��ʼ����H0��E
eps=0.01;                                            %�������
g=dfun(x);
k=0;                                                  %��������
while k<100
    p=-1*H*g;
    f_s = @(t) f_search(t,x);
    t_min=fminbnd(f_s,0,10);                    %����һά������t����Сֵ
    temp_x=x;
    x=x+t_min*p;
    temp_g=g;
    g=dfun(x);
    norm(g)
    if norm(g)<eps                                     %�Ƿ������Ҫ��ľ���
        opt=x;                                         %�������ֵopt
        break;
    end
    s=x-temp_x;
    y=g-temp_g;
    H=H-(1/(y'*H*y))*(H*y*y'*H)+(1/(y'*s))*(s*s');     %��H��������
    k=k+1;
end


