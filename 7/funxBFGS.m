function [x,val,k]=funxBFGS(fun,gfun,G,b,x0)
n=length(x0);
maxk=150;
k=0; epsilon=1e-4;
H0=eye(n);
while(k<maxk)
    gk=feval(gfun,x0,G,b); % 计算梯度
    dk=-H0*gk; %计算搜索方向
    ak=-gk'*dk/(dk'*G*dk);%精确线搜索产生的步长
    if(norm(gk)<epsilon), break; end %检验终止准则
    x0=x0+ak*dk;%更新
    dx=ak*dk;%x更新
    dy=feval(gfun,x0,G,b)-feval(gfun,x0-dx,G,b);
    a1=dx*dy'/(dx'*dy);%Hk公式部分
    n1=length(a1);
    a2=dy*dx'/(dx'*dy);
    n2=length(a2);
    H0=(eye(n1)-a1)*H0*(eye(n2)-a2)+dx*dx'/(dx'*dy);
    k=k+1;
end
x=x0;
val=feval(fun,x,G,b);