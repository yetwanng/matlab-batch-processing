%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% 本程序是用于将测试数据xls作图输出jpg文件 %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%此处文件地址改为需要的文件夹路径
path='D:\my_data\test_data\IV\20190618-trans\';

%%设置数据列的循环周期
ct=3;

Files = dir(strcat(path,'*.xls'));
LengthFiles = length(Files);
%%将每次测试不同器件的数据都画图
for i = 1:LengthFiles
    %%将每个器件多次重复测试的数据都画图，分为两种情况。有的xls文件多次测试数据是写成多个sheet，有的是一个sheet但是多列数据
    
    %先用xlsinfo确定file.xlsx中有多少个sheet要读
    [Type,Sheet,Format]=xlsfinfo(strcat(path,Files(i).name));
    s_end = length(Sheet);
    if s_end <= 3
       xls_data = xlsread(strcat(path,Files(i).name),Sheet{1});
       file_name=strcat(Files(i).name,'-','sheet','1');
       [m,n]=size(xls_data);
       %%将每个器件多次重复测试的数据都画图
       for j=ct:ct:n  %数据格式为第ct-1列是X，第ct列是Y，周期为ct
           set(gcf,'visible','off')%设置图片弹窗为不可见
           zeroparameter = xls_data((m+1)/2,j);%取X轴零点处的y坐标
       
           zeroparameter = 0;%扣除掉零点漂移请将本句注释掉，否则请将本句保留
           y = xls_data(:,j-1)- zeroparameter;%将数据扣除掉零点漂移
           
           plot(xls_data(:,j),y);%画图
      
           % 沿y=0画X坐标轴
           line(xlim(), [0,0], 'LineWidth', 0.5, 'Color', 'k');
           grid off; 
           set(gca,'FontSize',20);
           set(gca,'xminortick','on');
           set(gca,'yminortick','on');
           %semilogy(xls_data(:,j),abs(y));%将y轴变量取对数
           %axis([-2,2,1E-12,1E-4]);%设定y轴的范围为固定的，此处设定坐标轴的语句必须置于将y轴变量取对数的语句之后 
           xlabel('Voltage(V)');% x轴名称
           ylabel('Current(A)');% y轴名称
           k=j/ct;
           saveas(gcf,[path,strcat(file_name,'-',num2str(k)),'.jpg']);%输出图形到指定位置
           delete(gcf);
       end
    
    else
       xls_data = xlsread(strcat(path,Files(i).name),Sheet{1});
       file_name=strcat(Files(i).name,'-','sheet','1');
       [m,n]=size(xls_data);
       
       %%将每个器件多次重复测试的数据都画图
       for j=ct:ct:n  %数据格式为第ct-1列是X，第ct列是Y，周期为ct
           set(gcf,'visible','off')%设置图片弹窗为不可见
           zeroparameter = xls_data((m+1)/2,j);%取X轴零点处的y坐标
       
           zeroparameter = 0;%扣除掉零点漂移请将本句注释掉，否则请将本句保留
           y = xls_data(:,j-1)- zeroparameter;%将数据扣除掉零点漂移
           
           plot(xls_data(:,j),y);%画图
      
           % 沿y=0画X坐标轴
           line(xlim(), [0,0], 'LineWidth', 0.5, 'Color', 'k');
           grid off; 
           set(gca,'FontSize',20);
           set(gca,'xminortick','on');
           set(gca,'yminortick','on');
           %semilogy(xls_data(:,j),abs(y));%将y轴变量取对数
           %axis([-2,2,1E-12,1E-4]);%设定y轴的范围为固定的，此处设定坐标轴的语句必须置于将y轴变量取对数的语句之后 
           xlabel('Voltage(V)');% x轴名称
           ylabel('Current(A)');% y轴名称
           k=j/ct;
           saveas(gcf,[path,strcat(file_name,'-',num2str(k)),'.jpg']);%输出图形到指定位置
           delete(gcf);
       end
              
       for s = 2:length(Sheet)-2
           xls_data = xlsread(strcat(path,Files(i).name),Sheet{s+2});
           file_name=strcat(Files(i).name,'-','sheet',num2str(s));
           [m,n]=size(xls_data);
       
           %%将每个器件多次重复测试的数据都画图
           for j=ct:ct:n  %数据格式为第ct-1列是X，第ct列是Y，周期为ct
           set(gcf,'visible','off')%设置图片弹窗为不可见
           zeroparameter = xls_data((m+1)/2,j);%取X轴零点处的y坐标
       
           zeroparameter = 0;%扣除掉零点漂移请将本句注释掉，否则请将本句保留
           y = xls_data(:,j-1)- zeroparameter;%将数据扣除掉零点漂移
           
           plot(xls_data(:,j),y);%画图
      
           % 沿y=0画X坐标轴
           line(xlim(), [0,0], 'LineWidth', 0.5, 'Color', 'k');
           grid off; 
           set(gca,'FontSize',20);
           set(gca,'xminortick','on');
           set(gca,'yminortick','on');
           %semilogy(xls_data(:,j),abs(y));%将y轴变量取对数
           %axis([-2,2,1E-12,1E-4]);%设定y轴的范围为固定的，此处设定坐标轴的语句必须置于将y轴变量取对数的语句之后 
           xlabel('Voltage(V)');% x轴名称
           ylabel('Current(A)');% y轴名称
           k=j/ct;
           saveas(gcf,[path,strcat(file_name,'-',num2str(k)),'.jpg']);%输出图形到指定位置
           delete(gcf);
           end
           
       end
       
    end
        
end
clear;
clc;
