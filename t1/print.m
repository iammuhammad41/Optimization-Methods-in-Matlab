function print()
%
% 输出最优解和最优值
%
global k 
disp('The optimum solution is:');
solution=DFP();
disp(solution);                         %输出最优解
disp('The optimum value is:');
value=fun(solution);
disp(value);                            %输出最优值
disp('The iterative times are: ');    
disp(k);                              %输出迭代次数
