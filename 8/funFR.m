function [x,val,k]=funFR(fun,gfun,x0)
maxk=5000;
rho=0.5;sigma=0.4;%Armijo搜索参数
n=length(x0);
k=0; epsilon=1e-4;
while(k<maxk)
    gk=feval(gfun,x0); % 计算梯度
    itern=k-(n+1)*floor(k/(n+1));
    itern=itern+1;
    if(itern==1)%计算搜索方向
        dk=-gk;  %d0=-g(x0)
    else
        betak=norm(gk)/norm(g0);
        dk=-gk+betak*d0;
        gd=gk'*dk;
        if(gd>=0),dk=-gk;end
    end
    if(norm(gk)<epsilon), break; end %检验终止准则
     m=0; mk=0;
    while(m<20) %Armijo搜索产生的步长
        if(feval(fun,x0+rho^m*dk)<feval(fun,x0)+sigma*rho^m*gk'*dk)
            mk=m; break;
        end
        m=m+1;
    end
    x0=x0+rho^mk*dk;
    g0=gk;
    d0=dk;
    k=k+1;
end
x=x0;
val=feval(fun,x);