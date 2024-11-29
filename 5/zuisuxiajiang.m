clear,clc;
n=224;
x0=zeros(n,1);  x=x0;
a=unidrnd(10,n,1);  G=a*a'+unidrnd(2)*eye(n);  b=0.5*G*ones(n,1);
lanmed=0;   eps=1e-4;   g=G*x-b;
disp('最速下降法');
while(1)
    if(norm(g)<eps)
        break;
    end
    
    s=-g;
    
    d2f=s'*G*s;
    while(1)
        df=(1/2)*(s'*G*x0+x0'*G*s+2*lanmed*s'*G*s)-b'*s;
        if(norm(df)<eps)
            break;
        end
        lanmed=lanmed-df/d2f;
    end
    x=x0+lanmed*s;
    x0=x;
	g=G*x-b;
end

val=(1/2)*x'*G*x-b'*x;
fprintf('最速下降法法得出近似极小值为%.4f\n',val)
disp('用梯度Gx-b的2-范数验证是否得到近似极小点，若是近似极小点，将得到一个近似为0的值');
fprintf('|Gx-b|≈%.15f\n',norm(G*x-b));
disp('极小值点');
disp(x);

