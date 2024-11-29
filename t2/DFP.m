function x=DFP(x)
%
% DFP算法求无约束优化问题的最小值
%


global p k H
% x=[1 1]';                                             %初始迭代点
H=eye(2);                                             %初始矩阵H0＝E
eps=0.01;                                            %控制误差
g=dfun(x);
k=0;                                                  %迭代次数
while k<100
    p=-1*H*g;
    f_s = @(t) f_search(t,x);
    t_min=fminbnd(f_s,0,10);                    %进行一维搜索求t的最小值
    temp_x=x;
    x=x+t_min*p;
    temp_g=g;
    g=dfun(x);
    norm(g)
    if norm(g)<eps                                     %是否满足的要求的精度
        opt=x;                                         %求得最优值opt
        break;
    end
    s=x-temp_x;
    y=g-temp_g;
    H=H-(1/(y'*H*y))*(H*y*y'*H)+(1/(y'*s))*(s*s');     %对H进行修正
    k=k+1;
end


