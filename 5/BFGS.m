clear,clc;
n=224;
x0=zeros(n,1);  x=x0;
a=unidrnd(10,n,1);  G=a*a'+unidrnd(2)*eye(n);  b=0.5*G*ones(n,1);

lanmed=0;   eps=1e-4;   g=G*x-b;

disp('BFGS����');
H=eye(n);   mu=0;

while(1)
    if(norm(g)<eps)
        break;
    end

	s=-H*g;

    d2f=s'*G*s;
    while(1)
        df=(1/2)*(s'*G*x0+x0'*G*s+2*lanmed*s'*G*s)-b'*s;
        if(norm(df)<eps)
            break;
        end
        lanmed=lanmed-df/d2f;
    end
    x=x0+lanmed*s;

    dx=x-x0;dg=G*x-G*x0;
	mu=1+(dg'*H*dg)/(dx'*dg);
	H=H+(mu*(dx*dx')-H*dg*dx'-dx*dg'*H)/(dx'*dg);
	x0=x;
	g=G*x-b;

end

val=(1/2)*x'*G*x-b'*x;
fprintf('BFGS���ó����Ƽ�СֵΪ%.4f\n',val)
disp('���ݶ�Gx-b��2-������֤�Ƿ�õ����Ƽ�С�㣬���ǽ��Ƽ�С�㣬���õ�һ������Ϊ0��ֵ');
fprintf('|Gx-b|��%.15f\n',norm(G*x-b));
disp('��Сֵ��');
disp(x);
