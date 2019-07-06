%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%本程序是用于将测试数据xls文件中的某一行读取出来，对keithley2450%%%%%%%%%
%%%%%的数据比较匹配，特别是重复测试多次的时候，keithley2450的数据是%%%%%%%%%%
%%%%%add column的，如果多次测试是add sheet，那就不适用了。%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2018-12-05 经修改后对4200数据也适用了，多个sheet的也适用

%此处文件地址改为需要的文件夹路径，地址中不可出现中文
path='D:\my_data\test data\IV data\20181026-chongce\LDR-IV\8-FA0.7Cs0.3PbI0.6Br0.4-Vds(-2V-2V)-192.73uW-10degree\';

Files = dir(strcat(path,'*.xls'));
LengthFiles = length(Files);



%%%需要读取数据的行数序号
rowNumber = 51;
%需要提前定义的全局变量，用来写入最终数据的元胞变量b和循环控制变量k
k=0;
b = {{},{}};


for i = 1:LengthFiles    %依次读取文件的数据,i为xls文件的序数
     
    %先用xlsinfo确定file.xlsx中有多少个sheet要读
[Type,Sheet,Format]=xlsfinfo(strcat(path,Files(i).name));

%循环读取每个Sheet，此处设置循环需要注意，数据的格式是sheet1，然后添加的sheet是从sheet4开始。
%所以分为两种情况，sheet数小于等于3，和sheet数大于3
s_end = length(Sheet);

if s_end <= 3
    s=1;
    a(i,s,1) =cellstr(strcat(Files(i).name,'-sheet'));
    a(i,s,2) = {xlsread(strcat(path,Files(i).name),Sheet{s})}; 

else
   
    a(i,1,1) = cellstr(strcat(Files(i).name,'-sheet1'));
    a(i,1,2) = {xlsread(strcat(path,Files(i).name),Sheet{1})};   
    for s = 2:length(Sheet)-2
    a(i,s,1) = cellstr(strcat(Files(i).name,'-sheet',num2str(s)));
    a(i,s,2) ={ xlsread(strcat(path,Files(i).name),Sheet{s+2})};
    end
end
    %将a元胞读取到的信息重新按顺序写入到新元胞中
    for s=1:s_end-2   
       %将a元胞中的数据分别提取到相应的变量中
       a_name = a(i,s,1);
       a_data = a(i,s,2);
       %a_data是元胞数据，所以需要进一步提取
       a_data_arry = a_data{1};
       [p,q]=size(a_data_arry);
       a_data_arry(:,2) = a_data_arry(:,2)- a_data_arry((p+1)/2,2);%将需要提取的变量值进行零点修正
       
       %将提取出来的值数组依次写入c矩阵
       b{k+s,1} = a_name; %将文件名称写到c矩阵的第一列
       b{k+s,2} = {a_data_arry(rowNumber,:)};%将数据依次写入矩阵的后序列
       
   end
       k=k+s;      
end



%将矩阵c的数据写入文件，输出路径放在桌面，且文件名为固定的，此处写入数据是从B列开始，因为A列要留出来写如每个文件对应的名称
[m,n]=size(b);
for t = 1:m
    namecell = b(t,1);
    d(t)=namecell{1,1};%转化为字符串再进行赋值
end
d=d.';%转置
xlswrite('C:\Users\ye\Desktop\matlab_export_data.xlsx',d,'sheet1','A1');

 f(m,3)=0;%生成一个m行3列的矩阵，用于存储元胞b中数据部分，datacell = b(z,2);
for z = 1:m
    datacell = b(z,2);
    datacell_mat = cell2mat(datacell{1,1});
    f(z,:) = datacell_mat;%转化为矩阵再进行赋值
end


    
%将前面得到的每行数据对应的名称写入前面的xls文件的第一列中，并与之一一对应
xlswrite('C:\Users\ye\Desktop\matlab_export_data.xlsx',f,'sheet1','B1');

clear;
clc;

