%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%�����������ڽ���������xls�ļ��е�ĳһ�ж�ȡ��������keithley2450%%%%%%%%%
%%%%%�����ݱȽ�ƥ�䣬�ر����ظ����Զ�ε�ʱ��keithley2450��������%%%%%%%%%%
%%%%%add column�ģ������β�����add sheet���ǾͲ������ˡ�%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2018-12-05 ���޸ĺ��4200����Ҳ�����ˣ����sheet��Ҳ����

%�˴��ļ���ַ��Ϊ��Ҫ���ļ���·������ַ�в��ɳ�������
path='D:\my_data\test data\IV data\20181026-chongce\LDR-IV\8-FA0.7Cs0.3PbI0.6Br0.4-Vds(-2V-2V)-192.73uW-10degree\';

Files = dir(strcat(path,'*.xls'));
LengthFiles = length(Files);



%%%��Ҫ��ȡ���ݵ��������
rowNumber = 51;
%��Ҫ��ǰ�����ȫ�ֱ���������д���������ݵ�Ԫ������b��ѭ�����Ʊ���k
k=0;
b = {{},{}};


for i = 1:LengthFiles    %���ζ�ȡ�ļ�������,iΪxls�ļ�������
     
    %����xlsinfoȷ��file.xlsx���ж��ٸ�sheetҪ��
[Type,Sheet,Format]=xlsfinfo(strcat(path,Files(i).name));

%ѭ����ȡÿ��Sheet���˴�����ѭ����Ҫע�⣬���ݵĸ�ʽ��sheet1��Ȼ����ӵ�sheet�Ǵ�sheet4��ʼ��
%���Է�Ϊ���������sheet��С�ڵ���3����sheet������3
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
    %��aԪ����ȡ������Ϣ���°�˳��д�뵽��Ԫ����
    for s=1:s_end-2   
       %��aԪ���е����ݷֱ���ȡ����Ӧ�ı�����
       a_name = a(i,s,1);
       a_data = a(i,s,2);
       %a_data��Ԫ�����ݣ�������Ҫ��һ����ȡ
       a_data_arry = a_data{1};
       [p,q]=size(a_data_arry);
       a_data_arry(:,2) = a_data_arry(:,2)- a_data_arry((p+1)/2,2);%����Ҫ��ȡ�ı���ֵ�����������
       
       %����ȡ������ֵ��������д��c����
       b{k+s,1} = a_name; %���ļ�����д��c����ĵ�һ��
       b{k+s,2} = {a_data_arry(rowNumber,:)};%����������д�����ĺ�����
       
   end
       k=k+s;      
end



%������c������д���ļ������·���������棬���ļ���Ϊ�̶��ģ��˴�д�������Ǵ�B�п�ʼ����ΪA��Ҫ������д��ÿ���ļ���Ӧ������
[m,n]=size(b);
for t = 1:m
    namecell = b(t,1);
    d(t)=namecell{1,1};%ת��Ϊ�ַ����ٽ��и�ֵ
end
d=d.';%ת��
xlswrite('C:\Users\ye\Desktop\matlab_export_data.xlsx',d,'sheet1','A1');

 f(m,3)=0;%����һ��m��3�еľ������ڴ洢Ԫ��b�����ݲ��֣�datacell = b(z,2);
for z = 1:m
    datacell = b(z,2);
    datacell_mat = cell2mat(datacell{1,1});
    f(z,:) = datacell_mat;%ת��Ϊ�����ٽ��и�ֵ
end


    
%��ǰ��õ���ÿ�����ݶ�Ӧ������д��ǰ���xls�ļ��ĵ�һ���У�����֮һһ��Ӧ
xlswrite('C:\Users\ye\Desktop\matlab_export_data.xlsx',f,'sheet1','B1');

clear;
clc;

