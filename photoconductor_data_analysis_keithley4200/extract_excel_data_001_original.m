%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%�����������ڽ���������xls�ļ��е�ĳһ�ж�ȡ����%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%�˴��ļ���ַ��Ϊ��Ҫ���ļ���·����Ȼ��Ҫע��б�ܿ���Ҫ����ת��
path='D:\my_data\test data\IV data\20171129\';

Files = dir(strcat(path,'*.xlsx'));
LengthFiles = length(Files);

%����һ���㹻д����������ݵĴ����, c(m,n)����m���ļ��ĸ������˴�����LengthFiles,n��ÿ���ļ������ݵ����������������޸�
c(LengthFiles,20)=0;
rowNumber = 101;

for i = 1:LengthFiles
    %���ζ�ȡ�ļ�������
    a = xlsread(strcat(path,Files(i).name));

    %����ʱ����b00i���洢��ȡ����������a
    if i<10
        eval(['b00',num2str(i),'=a']);
        [m,n]=size(eval(['b00',num2str(i)]));        
        for j=1:n
            c(i,j)=eval(['b00',num2str(i),'(rowNumber,j)']);%%�˴�����������j֮ǰ�������ǿ��Ըĵģ��ĳ���Ҫ��ȡ�����ݶ�Ӧ������
        end
    end
    %����ʱ����b0i���洢��ȡ����������a
    if 10<=i&&i<100
        eval(['b0',num2str(i),'=a']);
         [m,n]=size(eval(['b0',num2str(i)]));
        for j=1:n
            c(i,j)=eval(['b0',num2str(i),'(rowNumber,j)']);
        end
    end
    %����ʱ����bi���洢��ȡ����������a 
    if i>=100
        eval(['b',num2str(i),'=a']);
       [m,n]=size(eval(['b',num2str(i)]));
        for j=1:n
            c(i,j)=eval(['b',num2str(i),'(rowNumber,j)']);
        end
    end
        
end

%������c������д���ļ������·���������棬���ļ���Ϊ�̶��ģ��˴�д�������Ǵ�B�п�ʼ����ΪA��Ҫ������д��ÿ���ļ���Ӧ������
xlswrite('C:\Users\ye\Desktop\matlab_export_data.xlsx',c,'sheet1','B1');

%��ȡÿ�����ݶ�Ӧ���ļ������ƣ����Ҵ������飬�˴����cell����������ת����Ȼ��õ�������ת��һ��
for i = 1:LengthFiles
    d=Files(i).name;
    f(i)=cellstr(d);%ת��Ϊ�ַ����ٽ��и�ֵ
end
f=f.';%ת��

%��ǰ��õ���ÿ�����ݶ�Ӧ������д��ǰ���xls�ļ��ĵ�һ���У�����֮һһ��Ӧ
xlswrite('C:\Users\ye\Desktop\matlab_export_data.xlsx',f,'sheet1','A1');
clear;
clc;