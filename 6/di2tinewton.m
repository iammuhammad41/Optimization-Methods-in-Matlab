function zy_x=di2tinewton(x)%该函数用来解大作业第二题
x=[3 -1 0 1]'
x0=x;eps=1e-4;k=0;
g0=g(x0);h0=h(x0);s0=-inv(h0)*g0;
while k>=0&k<1000
    if norm(g0)<eps
        break;
    else
        x=x0+s0;
        x0=x;
        g0=g(x);
        h0=h(x);
        s0=-inv(h0)*g0;
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


function h=h(x)%函数的海森阵%
x1=[1 0 0 0]*x;
x2=[0 1 0 0]*x;
x3=[0 0 1 0]*x;
x4=[0 0 0 1]*x;
h=[120*(x1 - x4)^2 + 2,20,0,-120*(x1 - x4)^2;20,12*(x2 - 2*x3)^2 + 200,-24*(x2 - 2*x3)^2,0;0,-24*(x2 - 2*x3)^2, 48*(x2 - 2*x3)^2 + 10,-10;-120*(x1 - x4)^2,0,-10,120*(x1 - x4)^2 + 10]

