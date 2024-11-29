function y=gfun(x)

syms x1 x2
M=1;

%定义目标函数
fx = (x1-3)^2+(x2-2)^2;
fx_x1 = diff(fx,x1);
fx_x2 = diff(fx,x1);

%可定义多个不等式约束条件gx(1)>=0
gx(1) = x1+x2-4;

gx_x1(1)=diff(gx(1),x1);
gx_x2(1)=diff(gx(1),x2);
gx_x1_val(1)=subs(gx_x1(1),[x1,x2],x);
gx_x2_val(1)=subs(gx_x2(1),[x1,x2],x);

y(1) = subs(fx_x1,[x1,x2],x);
y(2) = subs(fx_x2,[x1,x2],x);


gx_val(1)= subs(gx(1),[x1,x2],x);

if gx_val(1) < 0;
y(1) =y(1)  + 2*M* gx_val(1)*gx_x1_val(1);
y(2) =y(2) + 2*M* gx_val(1)*gx_x2_val(1);
end