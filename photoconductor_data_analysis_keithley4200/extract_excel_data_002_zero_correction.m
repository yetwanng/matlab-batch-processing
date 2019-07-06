%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%本程序是用于将测试数据xls文件中的某一行读取出来，对keithley2450%%%%%%%%%
%%%%%的数据比较匹配，特别是重复测试多次的时候，keithley2450的数据是%%%%%%%%%%
%%%%%add column的，如果多次测试是add sheet，那就不适用了%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%此处文件地址改为需要的文件夹路径，然后要注意斜杠可能要进行转义
path='D:\my_data\test data\IV data\20181026-chongce\I-V\';

Files = dir(strcat(path,'*.xls'));
LengthFiles = length(Files);

%生成一个足够写入后续的数据的大矩阵, c(m,n)其中m是文件的个数，此处就是LengthFiles,n是每个文件中数据的列数，可以自行修改
c(LengthFiles,10)=0;

%%%需要读取数据的行数序号
rowNumber = 101;


for i = 1:LengthFiles
    %依次读取文件的数据
    a = xlsread(strcat(path,Files(i).name));
    [p,t]=size(a);
    for k=2:3:t-2     %此处k的条件设置需要视测试得到的具体文件格式来定
        a(:,k+1) = a(:,k+1)- a((p+1)/2,k+1);%将需要提取的变量值进行零点修正
    end
    for j=1:t         %件将提取出来的值数组依次写入c矩阵
        c(i,j)=a(rowNumber,j);
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
%clear;
%clc;