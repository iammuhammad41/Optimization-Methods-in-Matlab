clear,clc;
n=224;
x0=zeros(n,1);  x=x0;
a=unidrnd(10,n,1);  G=a*a'+unidrnd(2)*eye(n);  b=0.5*G*ones(n,1);
lanmed=0;   eps=1e-4;   g=G*x-b;
disp('�����ݶȷ�');
s=zeros(n,1);   mu=0;

while(1)
    if(norm(g)<eps)
        break;
    end

	s=-g+mu*s;

    d2f=s'*G*s;
    while(1)
        df=(1/2)*(s'*G*x0+x0'*G*s+2*lanmed*s'*G*s)-b'*s;
        if(norm(df)<eps)
            break;
        end
        lanmed=lanmed-df/d2f;
    end
    x=x0+lanmed*s;
    
    mu=norm(G*x-b)^2/(norm(G*x0-b)^2);
	x0=x;
	g=G*x-b;
end

val=(1/2)*x'*G*x-b'*x;
fprintf('�����ݶȷ��ó����Ƽ�СֵΪ%.4f\n',val)
disp('���ݶ�Gx-b��2-������֤�Ƿ�õ����Ƽ�С�㣬���ǽ��Ƽ�С�㣬���õ�һ������Ϊ0��ֵ');
fprintf('|Gx-b|��%.15f\n',norm(G*x-b));
disp('��Сֵ��');
disp(x);
