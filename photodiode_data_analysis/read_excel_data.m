%本程序是用于将测试数据xls文件中的第21行读取出来

path='D:\my_data-201508-201710\test-data\IV-test\20170702\';
%此处文件地址改为需要的文件夹路径，然后要注意斜杠要进行转义

Files = dir(strcat(path,'*.xlsx'));

LengthFiles = length(Files);
c(105,14)=0;%生成一个足够大的矩阵，足够写入后续的数据的

for i = 1:LengthFiles
    a = xlsread(strcat(path,Files(i).name));
    %依次读取文件的数据
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
%输出路径放在桌面，且文件名为固定的
for i = 1:LengthFiles
    d=Files(i).name;
    f(i)=cellstr(d);%转化为字符串再进行赋值
end
f=f.';
%转置
xlswrite('C:\Users\ye\Desktop\matlab_export_data.xlsx',f,'sheet1','A1');
clear;
clc;