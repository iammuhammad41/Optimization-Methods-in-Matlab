function [x,val,k]=funxZSXJ(fun,gfun,G,b,x0)
maxk=5000; %设置最大迭代次数
k=0; epsilon=1e-4; %epsilon允许误差
while(k<maxk)
    g=feval(gfun,x0,G,b); %计算梯度
    d=-g; %计算搜索方向
    ak=-g'*d/(d'*G*d);%精确线搜索产生的步长
    if(norm(d)<epsilon), break; end
    x0=x0+ak*d;%更新
    k=k+1;
end
x=x0;
val=feval(fun,x,G,b);
end
