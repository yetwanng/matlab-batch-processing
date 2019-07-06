%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% �����������ڽ���������xls��ͼ���jpg�ļ� %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%�˴��ļ���ַ��Ϊ��Ҫ���ļ���·��
path='D:\my_data-201711-201903\test data\IV data\20171116\';

%%���������е�ѭ������
ct=3;

Files = dir(strcat(path,'*.xlsx'));
LengthFiles = length(Files);
%%��ÿ�β��Բ�ͬ���������ݶ���ͼ
for i = 1:LengthFiles
    xls_data = xlsread(strcat(path,Files(i).name));
    file_name=Files(i).name;
    [m,n]=size(xls_data);
    
    %%��ÿ����������ظ����Ե����ݶ���ͼ
    for j=ct:ct:n-1  %���ݸ�ʽΪ��ct-1����X����ct����Y������Ϊct
       set(gcf,'visible','off')%����ͼƬ����Ϊ���ɼ�
       zeroparameter = xls_data((m+1)/2,j+1);%ȡX����㴦��y����
       y = xls_data(:,j+1)- zeroparameter;%�����ݿ۳������Ư��
           
       plot(xls_data(:,j),abs(y));%��ͼ
       semilogy(xls_data(:,j),abs(y));%��y�����ȡ����
       axis([-2,2,1E-12,1E-4]);%�趨y��ķ�ΧΪ�̶��ģ��˴��趨����������������ڽ�y�����ȡ���������֮�� 
       xlabel('Voltage(V)');% x������
       ylabel('Current(A)');% y������
       k=j/3;
       saveas(gcf,[path,strcat(file_name,'-',num2str(k)),'.jpg']);%���ͼ�ε�ָ��λ��
       delete(gcf);
   end
end
clear;
clc;
