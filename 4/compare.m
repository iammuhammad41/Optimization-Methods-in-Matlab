function f=compare(x) 
global r_al pena N_equ N_inequ;
N_equ=1;
N_inequ=4;
h_inequ=zeros(4,1);
[h,g]=constrains(x);
%等式部分
for i=1:1 
      h_equ=abs(h(i)); 
end
%不等式部分 
for i=1:4
h_inequ=abs(max(g(i),-r_al(i+1)/pena));
end
f= max(h_inequ);
% f= max(abs(h_equ),h1);            %sqrt(h_equ+h_inequ);

