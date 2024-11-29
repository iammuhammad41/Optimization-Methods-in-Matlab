%Lagrange augmented function
function f=alobj(x) 
%N_eq number of equality constraints?
%N_ineq number of inequality constraints
N_eq=1;
N_ineq=4;
%Global variable
global r_al penalty;
h_eq=0;
h_ineq=0;
[h,g]=constrains(x);
%Equality constraint part?
for i=1:N_eq 
      h_eq=h_eq+h(i)*r_al(i)+(penalty/2)*h(i).^2;
end 
%Inequality constraint part
for i=1:N_ineq
      h_ineq=h_ineq+(0.5/penalty)*(max(0,(r_al(i)+penalty*g(i))).^2-r_al(i).^2);
end
%Lagrange augmented function value
f=obj(x)+h_ineq;
