function [x,val,k ] = funxGETD( fun,gfun,G,b,x0)
maxk=10000;
epsilon=1e-4;
n=length(x0);k=0;
while(k<maxk)
    gk=feval(gfun,x0,G,b);% 计算梯度
    itern=k-(n+1)*floor(k/(n+1));
    itern=itern+1;
    if(itern==1)%计算搜索方向
        dk=-gk;  %d0=-g(x0)
    else
        betak=(gk'*G*gk)/(g0'*G*g0);
        dk=-gk+betak*d0;
        gd=gk'*dk;
        if(gd>=0),dk=-gk;end
    end
    ak=-gk'*dk/(dk'*G*dk);%精确线搜索产生的步长
    if(norm(gk)<epsilon),break;end%检验终止准则
    x0=x0+ak*dk;
    g0=gk;
    d0=dk;
    k=k+1;
end
x=x0;
val=feval(fun,x,G,b);
end
