%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% 本程序是用于将测试数据xls作图输出jpg文件 %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%此处文件地址改为需要的文件夹路径
path='D:\my_data\test data\IV data\20171212\';

%%设置数据列的循环周期
ct=2;

Files = dir(strcat(path,'*.xls'));
LengthFiles = length(Files);
%%将每次测试不同器件的数据都画图
for i = 1:LengthFiles
    xls_data = xlsread(strcat(path,Files(i).name));
    file_name=Files(i).name;
    [m,n]=size(xls_data);
    %%将每个器件多次重复测试的数据都画图
    for j=2:ct:n
       set(gcf,'visible','off')%设置图片弹窗为不可见
       zeroparameter = xls_data((m+1)/2,j-1);%取X轴零点处的y坐标
       y = xls_data(:,j-1)- zeroparameter;%将数据扣除掉零点漂移
           
       plot(xls_data(:,j),abs(y));%画图
       semilogy(xls_data(:,j),abs(y));%将y轴变量取对数
       axis([-2,2,1E-12,1E-4]);%设定y轴的范围为固定的，此处设定坐标轴的语句必须置于将y轴变量取对数的语句之后 
       xlabel('Voltage(V)');% x轴名称
       ylabel('Current(A)');
       k=j/3;
       saveas(gcf,[path,strcat(file_name,'-',num2str(k)),'.jpg']);%输出图形到指定位置
       delete(gcf);
   end
end
clear;
clc;
