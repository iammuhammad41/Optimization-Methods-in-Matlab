clc
clear
%----Program start----
x_al=[0,0]';
%Parameters (global variables)
global r_al  penalty;  
%Penalty coefficient
penalty=10;                   
r_al=[1,1,1,1,1];
%Multiplication coefficient multiplier
coef_scale=2;  
%Falling standard coefficient
coefta=0.5;    
%Error control range
err_al=1e-4;                   
max_iter=200;
%Number of iterations
out_iter=1;                 
%----Algorithm iteration starts----
while out_iter<max_iter
       x_al0=x_al;
       r_al0=r_al;
       %Judgment function?
       compareFlag=compare(x_al0);  
       %Unconstrained quasi Newton method BFGS
       [X,fmin]=fminunc(@alobj,x_al0);
        %Get new iteration points
        x_al=X;       
        %Judge stop condition?
        if compare(x_al)<err_al
            disp('we get the opt point');
        break
        end
        %c judge the descending degree of the function?
        if compare(x_al)<coefta*compareFlag
            %You can modify the penalty coefficient variable as needed
            penalty=1*penalty;      
        else
            %%Maximum multiplication coefficient 1000
            penalty=min(1000,coef_scale*penalty);
            disp('penalty=2*penalty');
        end
        %%Updated Lagrange multiplier
        [h,g]=constrains(x_al);
        for  i=1:1
              %%Equality constraint part
              r_al(i)= r_al0(i)+penalty*h(i);
        end
        for  i=1:4
              %%Inequality constraint part
               r_al(i+1)=max(0,(r_al0(i+1)+penalty*g(i)));
        end 
        out_iter=out_iter+1;
end
%----End of iteration----
disp('Iteration number: ');
k=out_iter
disp('Value of constrains: '); 
compare(x_al)
disp('Opt points: '); 
         x=x_al
        fmin=obj(X);
