function y=dfun(x)
y=zeros(2,1);
x=x';

syms x1 x2;
global M;

%定义目标函数
fx = fun([x1 x2]);
fx_x1 = diff(fx,x1);
fx_x2 = diff(fx,x2);

y(1) = double(subs(fx_x1,[x1,x2],x));
y(2) = double(subs(fx_x2,[x1,x2],x));

%可定义多个等式约束h(1)=0
hx = h([x1 x2]);
for i=1:numel(hx)
    hx_x1=diff(hx(i),x1);
    hx_x2=diff(hx(i),x2);
    hx_x1_val=double(subs(hx_x1,[x1,x2],x));
    hx_x2_val=double(subs(hx_x2,[x1,x2],x));
    hx_val= double(subs(hx(i),[x1,x2],x));
    y(1) =y(1) + 2*M* hx_val*hx_x1_val;
    y(2) =y(2) + 2*M* hx_val*hx_x2_val;
end

%可定义多个不等式约束条件gx(1)>=0
gx = g([x1 x2]);



for i = 1:numel(gx)
    gx_x1=diff(gx(i),x1);
    gx_x2=diff(gx(i),x2);
    gx_x1_val=double(subs(gx_x1,[x1,x2],x));
    gx_x2_val=double(subs(gx_x2,[x1,x2],x));
    gx_val= double(subs(gx(i),[x1,x2],x));
    
    if gx_val < 0;
        y(1) =y(1) + 2*M* gx_val*gx_x1_val;
        y(2) =y(2) + 2*M* gx_val*gx_x2_val;
    end
    
end



