%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% 本程序是用于将测试数据xls作图输出jpg文件 %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


path='C:\Users\ye\Desktop\test.xlsx';
[data,text]= xlsread(path);
datalength=length(data);
i=1;
while(i<datalength)
    if(~isnan(data(i,1)))
        j=1;
        p=char(text{i,2});
        while(isnan(data(i+j,1))&&j<6)
            p=strcat(p,char(text{i+j,2}));
            f{i}=p;
            j=j+1;
        end
        
    end
    i=i+j;
end
f=f.';


xlswrite('C:\Users\ye\Desktop\matlab_export_data.xlsx',f,'sheet1','A1')