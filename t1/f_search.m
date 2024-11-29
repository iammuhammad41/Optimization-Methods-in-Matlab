function y=f_search(t,x)
%
% 一维搜索求最小值
%
global p M
xx0=x+t.*p;
% r=5;
TextF=@(xx)fun(xx)+M*(sum(min(g(xx),0).^2)+sum(h(xx).^2));
y=TextF(xx0);