function f=compare(x) 
global r_al penalty N_eq N_ineq;
N_eq=1;
N_ineq=4;
h_ineq=zeros(4,1);
[h,g]=constrains(x);

for i=1:1 
      h_eq=abs(h(i)); 
end

for i=1:4
h_ineq=abs(max(g(i),-r_al(i+1)/penalty));
end
f= max(h_ineq);
% f= max(abs(h_eq),h1); %sqrt(h_eq+h_ineq);

