%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%本程序是用于将测试数据xls文件中的某一行读取出来%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%此处文件地址改为需要的文件夹路径，然后要注意斜杠可能要进行转义
path='D:\my_data\test data\IV data\20171129\';

Files = dir(strcat(path,'*.xlsx'));
LengthFiles = length(Files);

%生成一个足够写入后续的数据的大矩阵, c(m,n)其中m是文件的个数，此处就是LengthFiles,n是每个文件中数据的列数，可以自行修改
c(LengthFiles,20)=0;
rowNumber = 101;

for i = 1:LengthFiles
    %依次读取文件的数据
    a = xlsread(strcat(path,Files(i).name));

    %用临时变量b00i来存储读取出来的数据a
    if i<10
        eval(['b00',num2str(i),'=a']);
        [m,n]=size(eval(['b00',num2str(i)]));        
        for j=1:n
            c(i,j)=eval(['b00',num2str(i),'(rowNumber,j)']);%%此处后面括号中j之前的数字是可以改的，改成想要提取的数据对应的行数
        end
    end
    %用临时变量b0i来存储读取出来的数据a
    if 10<=i&&i<100
        eval(['b0',num2str(i),'=a']);
         [m,n]=size(eval(['b0',num2str(i)]));
        for j=1:n
            c(i,j)=eval(['b0',num2str(i),'(rowNumber,j)']);
        end
    end
    %用临时变量bi来存储读取出来的数据a 
    if i>=100
        eval(['b',num2str(i),'=a']);
       [m,n]=size(eval(['b',num2str(i)]));
        for j=1:n
            c(i,j)=eval(['b',num2str(i),'(rowNumber,j)']);
        end
    end
        
end

%将矩阵c的数据写入文件，输出路径放在桌面，且文件名为固定的，此处写入数据是从B列开始，因为A列要留出来写如每个文件对应的名称
xlswrite('C:\Users\ye\Desktop\matlab_export_data.xlsx',c,'sheet1','B1');

%读取每行数据对应的文件的名称，并且存入数组，此处需把cell类型数据先转换，然后得到的数组转置一下
for i = 1:LengthFiles
    d=Files(i).name;
    f(i)=cellstr(d);%转化为字符串再进行赋值
end
f=f.';%转置

%将前面得到的每行数据对应的名称写入前面的xls文件的第一列中，并与之一一对应
xlswrite('C:\Users\ye\Desktop\matlab_export_data.xlsx',f,'sheet1','A1');
clear;
clc;