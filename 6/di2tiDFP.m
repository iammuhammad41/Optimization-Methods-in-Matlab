function zy_x=di2tiDFP(x)%该函数用来解大作业第二题
x=[3 -1 0 1]'
x0=x;eps=1e-4;k=0;
g0=g(x0);H0=eye(4);s0=-H0*g0;
while k>=0&k<1000
    if norm(g0)<eps
        break;
    else
                lanmed=10;c=0.1;i=0;
       while i>=0&i<100
           x=x0+lanmed*s0;
           if f(x)>(f(x0)+c*lanmed*g0'*s0)
               lanmed=lanmed/2;
               i=i+1;
           else
               break;
           end
       end
       x=x0+lanmed*s0;
       dete_x=x-x0;
       dete_g=g(x)-g0;
       H=H0+(dete_x*dete_x')/(dete_x'*dete_g)-(H0*dete_g)*(H0*dete_g)'/(dete_g'*H0*dete_g);
       s=-H*g(x);
        x0=x;
        s0=s;
        H0=H
       g0=g(x);
        k=k+1;
    end
end
zy_x=x;
zyj=f(x);
fprintf('after %d iterations,obtain the optimal solution.\n\nThe optimal solution is %.15f\n\n The optimal "x" is "ans".\n',k,zyj);

function f=f(x)
x1=[1 0 0 0]*x;
x2=[0 1 0 0]*x;
x3=[0 0 1 0]*x;
x4=[0 0 0 1]*x;
f=(x1+10*x2)^2+5*(x3-x4)^2+(x2-2*x3)^4+10*(x1-x4)^4;

function g=g(x)%函数梯度% 
x1=[1 0 0 0]*x;
x2=[0 1 0 0]*x;
x3=[0 0 1 0]*x;
x4=[0 0 0 1]*x;
g=[2*x1 + 20*x2 + 40*(x1 - x4)^3;20*x1 + 200*x2 + 4*(x2 - 2*x3)^3;10*x3 - 10*x4 - 8*(x2 - 2*x3)^3;10*x4 - 10*x3 - 40*(x1 - x4)^3]
