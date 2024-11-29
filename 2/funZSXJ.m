function [x,val,k]=funZSXJ(fun,gfun,x0)
%Set the maximum number of iterations
maxk=5000; 
%Armijo search parameters
rho=0.5;sigma=0.4;
%Epsilon allowable error
k=0; epsilon=1e-4; 
%Calculated gradient
while(k<maxk)
    g=feval(gfun,x0); 
    %Calculate search direction
    d=-g; 
    if(norm(d)<epsilon), break; end
     m=0; mk=0;
     %Step size generated by Armijo search
    while(m<20) 
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
end