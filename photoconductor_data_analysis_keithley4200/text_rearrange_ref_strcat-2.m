path='C:\Users\ye\Desktop\test.xlsx';
[data,text] = xlsread(path);
datalength = length(text);
i=1;
while(i<datalength)
    callback1 = regexp(text{i,1},'######');
    if(~isempty(callback1))
        j=1;
        p=char(text{i,1});
        
        callback2 = regexp(text{i+j,1},'######');
        while(isempty(callback2)&&j<5)
            p=strcat(p,char(text{i+j,1}));
            j=j+1;
            callback2 = regexp(text{i+j,1},'######');
        end
       f{i}=p; 
    end
    i=i+j;
end


