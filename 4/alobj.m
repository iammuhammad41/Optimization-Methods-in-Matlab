function f=alobj(x) %�����������㺯��
%N_equ��ʽԼ������?
%N_inequ����ʽԼ������
N_equ=1;
N_inequ=4;
global r_al pena;%ȫ�ֱ���
h_equ=0;
h_inequ=0;
[h,g]=constrains(x);
%��ʽԼ������?
for i=1:N_equ 
      h_equ=h_equ+h(i)*r_al(i)+(pena/2)*h(i).^2;
end 
%����ʽԼ������
for i=1:N_inequ
      h_inequ=h_inequ+(0.5/pena)*(max(0,(r_al(i)+pena*g(i))).^2-r_al(i).^2);
end
%�����������㺯��ֵ
f=obj(x)+h_inequ;