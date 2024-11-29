clear all
clc
syms x1 x2 x3 x4
fx=(x1+10*x2)^2+5*(x3-x4)^2+(x2-2*x3)^4+10*(x1-x4)^4;

x0=[3 -1 0 1]';
maxk=50000;         %最大迭代次数
rho=0.6;sigma=0.4;
k=0;  epsilon=1e-4; 
n=length(x0);
while(k<maxk)
    g=feval('gfun',x0);  %计算梯度
    itern=k-(n+1)*floor(k/(n+1));
    itern=itern+1;
    %计算搜索方向
    if(itern==1)  
        d=-g;  
    else
        beta=(g'*g)/(g0'*g0);
        d=-g+beta*d0;  gd=g'*d;
        if(gd>=0.0)
            d=-g;  
        end
    end
    if(norm(g)<epsilon), break; end   %检验终止条件
    m=0; mk=0;
    while(m<20)   %Armijo搜索
        if(feval('fun',x0+rho^m*d)<feval('fun',x0)+sigma*rho^m*g'*d)
            mk=m; break;
        end
        m=m+1;
    end
    x0=x0+rho^mk*d;
    val=feval('fun',x0);
    g0=g;  d0=d; 
    k=k+1;
end
x=x0;

f=subs(fx,{x1,x2 x3 x4},{x(1),x(2),x(3),x(4)});
f=vpa(f,10);



fprintf('after %d iterations,obtain the optimal solution.\n\nThe optimal solution is %.15f\n\n\n The optimal "x" is "ans".\n',k,f);
disp ('ans：');
disp(x);

function f=fun(x)
f=(x(1)+10*x(2))^2+5*(x(3)-x(4))^2+(x(2)-2*x(3))^4+10*(x(1)-x(4))^4;
end

function gf=gfun(x)
gf=[2*x(1) + 20*x(2) + 40*(x(1) - x(4))^3;20*x(1) + 200*x(2) + 4*(x(2) - 2*x(3))^3;10*x(3)-10*x(4)-8*(x(2)-2*x(3))^3;10*x(4) - 10*x(3) - 40*(x(1) - x(4))^3]
end


