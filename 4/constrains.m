function [h,g] =constrains(x)
g=zeros(4,1);
g(1)=x(1)^2-6*x(1)+4*x(2)-11;
g(2)=-x(1)*x(2)+3*x(2)+exp(x(1)-3)-1;
g(3)=-x(1);
g(4)=-x(2);
h(1)=0;
end