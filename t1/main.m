%第二题
[X,FX]=penalty(@fun,@g,@h,[0.001;0.001]);


disp('第二题')
disp(['x=(' num2str(X(1)) ','  num2str(X(2)) ') f(x)=' num2str(FX)])



