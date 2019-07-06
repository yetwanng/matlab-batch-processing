path='D:\my_data\test data\IV data\20171102\��֤SnO2+spiro-PN��\';
%%%%%%%%�˴��ļ���ַ��Ϊ��Ҫ���ļ���·��

Files = dir(strcat(path,'*.xlsx'));
LengthFiles = length(Files);
%%��ÿ�β��Բ�ͬ���������ݶ���ͼ
for i = 1:LengthFiles
    xls_data = xlsread(strcat(path,Files(i).name));
    file_name=Files(i).name;
    [m,n]=size(xls_data);
    %%��ÿ����������ظ����Ե����ݶ���ͼ
    for j=3:3:n-1
       set(gcf,'visible','off')%����ͼƬ����Ϊ���ɼ�
       zeroparameter = xls_data((m+1)/2,j+1);%ȡX����㴦��y����
       y = xls_data(:,j+1)- zeroparameter;%�����������
           
       plot(xls_data(:,j),abs(y));%��ͼ
       semilogy(xls_data(:,j),abs(y));%��y�����ȡ����
       axis([-1.2,1.2,1E-12,1E-4]);%�趨y��ķ�ΧΪ�̶��ģ��˴��趨����������������ڽ�y�����ȡ���������֮�� 
       xlabel('Voltage(V)');% x������
       ylabel('Current(A)');
       k=j/3;
       saveas(gcf,[path,strcat(file_name,'-',num2str(k)),'.jpg']);%���ͼ�ε�ָ��λ��
       delete(gcf);
   end
end
clear;
clc;
