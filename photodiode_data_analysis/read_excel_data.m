%�����������ڽ���������xls�ļ��еĵ�21�ж�ȡ����

path='D:\my_data-201508-201710\test-data\IV-test\20170702\';
%�˴��ļ���ַ��Ϊ��Ҫ���ļ���·����Ȼ��Ҫע��б��Ҫ����ת��

Files = dir(strcat(path,'*.xlsx'));

LengthFiles = length(Files);
c(105,14)=0;%����һ���㹻��ľ����㹻д����������ݵ�

for i = 1:LengthFiles
    a = xlsread(strcat(path,Files(i).name));
    %���ζ�ȡ�ļ�������
    if i<10
        eval(['b00',num2str(i),'=a']);
        [m,n]=size(eval(['b00',num2str(i)]));        
        for j=1:n
            c(i,j)=eval(['b00',num2str(i),'(21,j)']);
        end
    end
    if 10<=i&&i<100
        eval(['b0',num2str(i),'=a']);
         [m,n]=size(eval(['b0',num2str(i)]));
        for j=1:n
            c(i,j)=eval(['b0',num2str(i),'(21,j)']);
        end
    end
    if i>=100
        eval(['b',num2str(i),'=a']);
       [m,n]=size(eval(['b',num2str(i)]));
        for j=1:n
            c(i,j)=eval(['b',num2str(i),'(21,j)']);
        end
    end
        
end
xlswrite('C:\Users\ye\Desktop\matlab_export_data.xlsx',c,'sheet1','B1');
%���·���������棬���ļ���Ϊ�̶���
for i = 1:LengthFiles
    d=Files(i).name;
    f(i)=cellstr(d);%ת��Ϊ�ַ����ٽ��и�ֵ
end
f=f.';
%ת��
xlswrite('C:\Users\ye\Desktop\matlab_export_data.xlsx',f,'sheet1','A1');
clear;
clc;