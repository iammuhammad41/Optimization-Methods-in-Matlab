function [x,val,k]=funxZNND(fun,gfun,Hess,G,b,x0)
maxk=150;
k=0; epsilon=1e-4;
while(k<maxk)
    gk=feval(gfun,x0,G,b); % 计算梯度
    Gk=feval(Hess,G); % 计算Hesse阵
    dk=-Gk\gk; %解方程组Gk*dk=-gk, 计算搜索方向
    ak=-gk'*dk/(dk'*G*dk);%精确线搜索产生的步长
    if(norm(gk)<epsilon), break; end %检验终止准则
    x0=x0+ak*dk;%更新
    k=k+1;
end
x=x0;
val=feval(fun,x,G,b);