
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% �����������ڶ�һ���ļ��������ض����͵��ļ����й̶����򣬼������ļ����� %%%%
%%% ���ļ���˳���ǰ�������Ҫ��˳�����еģ������޸�ʱ�����򣩣������㵣���� %%%%
%%% ������һЩ�����޸Ļ�ı���е�˳�򣬶��ļ�������û�а������ֱ������� %%%%
%%% ����ִ�ж��ļ����б������̶��������Ա���������þ��ǹ̶��ļ�����%%%%%%%
%%% author:yetwanng; date:2018-07-14%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

path ='D:\my_data-201508-201710\test-data\IV-test\20170702\';
%�˴�path������Ҫ�������ļ����ڵ�����·����Ӧ��ע���ļ���ַ�в�Ҫ���ֿո񣬷������ᱨ��

Files= dir(strcat(path,'*.xlsx'));
%����dir������ȡ��Ӧ·���µ��ض��ļ������ҵ���xlsx�ļ�    
for i=1:length(Files)    
    x1=Files(i).name;%ȡ����һ���ļ�������         
    a = sprintf('%03d',i);%���ơ�0001��Ϊǰ׺��������ʽ���������ε���     
    x2=num2str(a);%תΪ�ַ���   
    x3=strcat(x2,'-',x1);
    copyfile([path x1],['D:\�����õ�����\' x3]);%���Ƶ��������õ����ݡ��ļ�����
end  
clear;
clc;