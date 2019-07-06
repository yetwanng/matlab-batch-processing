%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% �����������ڽ���������xls��ͼ���jpg�ļ� %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%�˴��ļ���ַ��Ϊ��Ҫ���ļ���·��
path='D:\my_data\test_data\IV\20190618-trans\';

%%���������е�ѭ������
ct=3;

Files = dir(strcat(path,'*.xls'));
LengthFiles = length(Files);
%%��ÿ�β��Բ�ͬ���������ݶ���ͼ
for i = 1:LengthFiles
    %%��ÿ����������ظ����Ե����ݶ���ͼ����Ϊ����������е�xls�ļ���β���������д�ɶ��sheet���е���һ��sheet���Ƕ�������
    
    %����xlsinfoȷ��file.xlsx���ж��ٸ�sheetҪ��
    [Type,Sheet,Format]=xlsfinfo(strcat(path,Files(i).name));
    s_end = length(Sheet);
    if s_end <= 3
       xls_data = xlsread(strcat(path,Files(i).name),Sheet{1});
       file_name=strcat(Files(i).name,'-','sheet','1');
       [m,n]=size(xls_data);
       %%��ÿ����������ظ����Ե����ݶ���ͼ
       for j=ct:ct:n  %���ݸ�ʽΪ��ct-1����X����ct����Y������Ϊct
           set(gcf,'visible','off')%����ͼƬ����Ϊ���ɼ�
           zeroparameter = xls_data((m+1)/2,j);%ȡX����㴦��y����
       
           zeroparameter = 0;%�۳������Ư���뽫����ע�͵��������뽫���䱣��
           y = xls_data(:,j-1)- zeroparameter;%�����ݿ۳������Ư��
           
           plot(xls_data(:,j),y);%��ͼ
      
           % ��y=0��X������
           line(xlim(), [0,0], 'LineWidth', 0.5, 'Color', 'k');
           grid off; 
           set(gca,'FontSize',20);
           set(gca,'xminortick','on');
           set(gca,'yminortick','on');
           %semilogy(xls_data(:,j),abs(y));%��y�����ȡ����
           %axis([-2,2,1E-12,1E-4]);%�趨y��ķ�ΧΪ�̶��ģ��˴��趨����������������ڽ�y�����ȡ���������֮�� 
           xlabel('Voltage(V)');% x������
           ylabel('Current(A)');% y������
           k=j/ct;
           saveas(gcf,[path,strcat(file_name,'-',num2str(k)),'.jpg']);%���ͼ�ε�ָ��λ��
           delete(gcf);
       end
    
    else
       xls_data = xlsread(strcat(path,Files(i).name),Sheet{1});
       file_name=strcat(Files(i).name,'-','sheet','1');
       [m,n]=size(xls_data);
       
       %%��ÿ����������ظ����Ե����ݶ���ͼ
       for j=ct:ct:n  %���ݸ�ʽΪ��ct-1����X����ct����Y������Ϊct
           set(gcf,'visible','off')%����ͼƬ����Ϊ���ɼ�
           zeroparameter = xls_data((m+1)/2,j);%ȡX����㴦��y����
       
           zeroparameter = 0;%�۳������Ư���뽫����ע�͵��������뽫���䱣��
           y = xls_data(:,j-1)- zeroparameter;%�����ݿ۳������Ư��
           
           plot(xls_data(:,j),y);%��ͼ
      
           % ��y=0��X������
           line(xlim(), [0,0], 'LineWidth', 0.5, 'Color', 'k');
           grid off; 
           set(gca,'FontSize',20);
           set(gca,'xminortick','on');
           set(gca,'yminortick','on');
           %semilogy(xls_data(:,j),abs(y));%��y�����ȡ����
           %axis([-2,2,1E-12,1E-4]);%�趨y��ķ�ΧΪ�̶��ģ��˴��趨����������������ڽ�y�����ȡ���������֮�� 
           xlabel('Voltage(V)');% x������
           ylabel('Current(A)');% y������
           k=j/ct;
           saveas(gcf,[path,strcat(file_name,'-',num2str(k)),'.jpg']);%���ͼ�ε�ָ��λ��
           delete(gcf);
       end
              
       for s = 2:length(Sheet)-2
           xls_data = xlsread(strcat(path,Files(i).name),Sheet{s+2});
           file_name=strcat(Files(i).name,'-','sheet',num2str(s));
           [m,n]=size(xls_data);
       
           %%��ÿ����������ظ����Ե����ݶ���ͼ
           for j=ct:ct:n  %���ݸ�ʽΪ��ct-1����X����ct����Y������Ϊct
           set(gcf,'visible','off')%����ͼƬ����Ϊ���ɼ�
           zeroparameter = xls_data((m+1)/2,j);%ȡX����㴦��y����
       
           zeroparameter = 0;%�۳������Ư���뽫����ע�͵��������뽫���䱣��
           y = xls_data(:,j-1)- zeroparameter;%�����ݿ۳������Ư��
           
           plot(xls_data(:,j),y);%��ͼ
      
           % ��y=0��X������
           line(xlim(), [0,0], 'LineWidth', 0.5, 'Color', 'k');
           grid off; 
           set(gca,'FontSize',20);
           set(gca,'xminortick','on');
           set(gca,'yminortick','on');
           %semilogy(xls_data(:,j),abs(y));%��y�����ȡ����
           %axis([-2,2,1E-12,1E-4]);%�趨y��ķ�ΧΪ�̶��ģ��˴��趨����������������ڽ�y�����ȡ���������֮�� 
           xlabel('Voltage(V)');% x������
           ylabel('Current(A)');% y������
           k=j/ct;
           saveas(gcf,[path,strcat(file_name,'-',num2str(k)),'.jpg']);%���ͼ�ε�ָ��λ��
           delete(gcf);
           end
           
       end
       
    end
        
end
clear;
clc;
