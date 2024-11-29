function [x,val,k]=funZNND(fun,gfun,Hess,x0)
maxk=5000;
rho=0.5;sigma=0.4;%Armijo搜索参数
k=0; epsilon=1e-4;
while(k<maxk)
    g=feval(gfun,x0); % 计算梯度
    Gk=feval(Hess,x0); % 计算Hesse阵
    d=-Gk\g; %解方程组Gk*dk=-gk, 计算搜索方向
    if(norm(g)<epsilon), break; end %检验终止准则
     m=0; mk=0;
    while(m<20) %Armijo搜索产生的步长
        if(feval(fun,x0+rho^m*d)<feval(fun,x0)+sigma*rho^m*g'*d)
            mk=m; break;
        end
        m=m+1;
    end
    x0=x0+rho^mk*d;
    k=k+1;
end
x=x0;
val=feval(fun,x);