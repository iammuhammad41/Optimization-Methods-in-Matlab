clc
clear
%============================程序开始================================
x_al=[0,0]';
global r_al  pena   ;      %参数（全局变量）
pena=10;                   %惩罚系数
r_al=[1,1,1,1,1];
c_scale=2;                   %乘法系数乘数
cta=0.5;                     %下降标准系数
e_al=1e-4;                   %误差控制范围
max_itera=200;
out_itera=1;                 %迭代次数
%===========================算法迭代开始=============================
while out_itera<max_itera
       x_al0=x_al;
       r_al0=r_al;
       %判断函数?
       compareFlag=compare(x_al0);  
       %无约束的拟牛顿法BFGS
       [X,fmin]=fminunc(@alobj,x_al0);
        x_al=X;       %得到新迭代点
        %判断停止条件?
        if compare(x_al)<e_al
        disp('we get the opt point');
        break
        end
        %c判断函数下降度?
        if compare(x_al)<cta*compareFlag
        pena=1*pena;      %可以根据需要修改惩罚系数变量
        else
        pena=min(1000,c_scale*pena);   %%乘法系数最大1000
        disp('pena=2*pena');
        end
        %%?更新拉格朗日乘子
        [h,g]=constrains(x_al);
        for  i=1:1
              %%等式约束部分
              r_al(i)= r_al0(i)+pena*h(i);
        end
        for  i=1:4
              %%不等式约束部分
               r_al(i+1)=max(0,(r_al0(i+1)+pena*g(i)));
        end 
        out_itera=out_itera+1;
end
%+++++++++++++++++++++++++++迭代结束+++++++++++++++++++++++++++++++++
disp('the iteration number');
k=out_itera
disp('the value of constrains'); 
compare(x_al)
disp('the opt point'); 
         x=x_al
        fmin=obj(X);