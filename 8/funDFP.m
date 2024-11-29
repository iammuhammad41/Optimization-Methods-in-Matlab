function [x,val,k]=funDFP(fun,gfun,x0)
maxk=5000;
rho=0.5;sigma=0.4;%Armijo搜索参数
n=length(x0);H0=eye(n);
k=0; epsilon=1e-4;
while(k<maxk)
    g=feval(gfun,x0); % 计算梯度
    d=-H0*g; % 计算搜索方向
    if(norm(g)<epsilon), break; end %检验终止准则
     m=0; mk=0;
    while(m<20) %Armijo搜索产生的步长
        if(feval(fun,x0+rho^m*d)<feval(fun,x0)+sigma*rho^m*g'*d)
            mk=m; break;
        end
        m=m+1;
    end
    x0=x0+rho^mk*d;
    dx=rho^mk*d;%x更新
    dy=feval(gfun,x0)-feval(gfun,x0-dx);
    H0=H0+dx*dx'/(dx'*dy)-(H0*dy)*(H0*dy)'/(dy'*H0*dy);
    k=k+1;
end
x=x0;
val=feval(fun,x);