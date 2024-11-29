function [x,val,k]=funDFP(fun,gfun,x0)
maxk=5000;
%Armijo search parameters
rho=0.5;sigma=0.4;
n=length(x0);H0=eye(n);
k=0; epsilon=1e-4;
while(k<maxk)
    %Calculated gradient
    g=feval(gfun,x0); 
    %Calculate search direction
    d=-H0*g; 
    %Inspection termination criteria
    if(norm(g)<epsilon), break; end 
     m=0; mk=0;
     %Step size generated by Armijo search
    while(m<20) 
        if(feval(fun,x0+rho^m*d)<feval(fun,x0)+sigma*rho^m*g'*d)
            mk=m; break;
        end
        m=m+1;
    end
    x0=x0+rho^mk*d;
    %X update
    dx=rho^mk*d;
    dy=feval(gfun,x0)-feval(gfun,x0-dx);
    H0=H0+dx*dx'/(dx'*dy)-(H0*dy)*(H0*dy)'/(dy'*H0*dy);
    k=k+1;
end
x=x0;
val=feval(fun,x);
