function print()
%
% ������Ž������ֵ
%
global k 
disp('The optimum solution is:');
solution=DFP();
disp(solution);                         %������Ž�
disp('The optimum value is:');
value=fun(solution);
disp(value);                            %�������ֵ
disp('The iterative times are: ');    
disp(k);                              %�����������
