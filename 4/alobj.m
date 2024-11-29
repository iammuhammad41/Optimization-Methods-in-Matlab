function f=alobj(x) %拉格朗日增广函数
%N_equ等式约束个数?
%N_inequ不等式约束个数
N_equ=1;
N_inequ=4;
global r_al pena;%全局变量
h_equ=0;
h_inequ=0;
[h,g]=constrains(x);
%等式约束部分?
for i=1:N_equ 
      h_equ=h_equ+h(i)*r_al(i)+(pena/2)*h(i).^2;
end 
%不等式约束部分
for i=1:N_inequ
      h_inequ=h_inequ+(0.5/pena)*(max(0,(r_al(i)+pena*g(i))).^2-r_al(i).^2);
end
%拉格朗日增广函数值
f=obj(x)+h_inequ;