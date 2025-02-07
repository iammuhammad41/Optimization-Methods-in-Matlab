function [X,FX]=penalty(fun,g,h,x0)
%外点罚函数法，需要给出fun函数，g函数，和h函数以及初始点
%设置全局变量r，给出罚因子r0，权数为5，设置精度，定义全局TextF函数
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
%开始迭代
while(1)
    %设置上一次迭代的x值为Lastx，改变罚因子的值，并得到本次迭代最优值x
    Lastx=x;
    M=c*M;    %每次循环重新定义TextF函数
    %     TextF=@(x)fun(x)+r*(sum(min(g(x),0).^2)+sum(h(x).^2));
    sign=sign+1;
    %     x=fminunc(TextF,Lastx,[0 0 0 0 0 0]);%BFGS 算法
    x=DFP(Lastx);
    fx=fun(x);
    %当迭代次数大于100次或者满足精度时返回此时的x和x对应的函数值
    if sign >100
        M=Inf;
%         x=fminunc(TextF,Lastx,[0 0 0 0 0 0]);%BFGS 算法
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

