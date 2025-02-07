function [x,val,k]=funxZSXJ(fun,gfun,G,b,x0)
%Set the maximum number of iterations
maxk=5000; 
%epsilon allowable error
k=0; epsilon=1e-4; 
while(k<maxk)
    %Calculated gradient
    g=feval(gfun,x0,G,b); 
    %Calculate search direction
    d=-g; 
    %Step size generated by precise line search
    ak=-g'*d/(d'*G*d);
    if(norm(d)<epsilon), break; end
    %to update
    x0=x0+ak*d;
    k=k+1;
end
x=x0;
val=feval(fun,x,G,b);
end
