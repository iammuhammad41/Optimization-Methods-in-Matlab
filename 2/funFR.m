function [x,val,k]=funFR(fun,gfun,x0)
maxk=5000;
%Armijo search parameters
rho=0.5;sigma=0.4;
n=length(x0);
k=0; epsilon=1e-4;
while(k<maxk)
    % Calculated gradient
    gk=feval(gfun,x0); 
    itern=k-(n+1)*floor(k/(n+1));
    itern=itern+1;
    %Calculate search direction
    if(itern==1)
        dk=-gk;  %d0=-g(x0)
    else
        betak=norm(gk)/norm(g0);
        dk=-gk+betak*d0;
        gd=gk'*dk;
        if(gd>=0),dk=-gk;end
    end
    %Inspection termination criteria
    if(norm(gk)<epsilon), break; end 
     m=0; mk=0;
    %Step size generated by Armijo search
    while(m<20) 
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
