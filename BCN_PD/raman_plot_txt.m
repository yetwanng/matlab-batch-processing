
clear;
clc;

path='D:\my_data\test_data\Raman\20190410-trans\';
%�˴��ļ���ַ��Ϊ��Ҫ���ļ���·��

Files = dir(strcat(path,'*.txt'));
LengthFiles = length(Files);
%��ÿ�β��Բ�ͬ���������ݶ���ͼ
for i = 1:LengthFiles
    file_name=Files(i).name;
    [a,b] = textread(strcat(path,Files(i).name),'%f%f','headerlines', 1);%�ڶ��������Ƕ�ȡ���ݵĸ�ʽ�����ĸ�������
    set(gcf,'visible','off')%����ͼƬ����Ϊ���ɼ�
    plot(a,abs(b));
    
    set(gca,'FontSize',15);
    set(gca,'xminortick','on');
    set(gca,'yminortick','on');
    
    %semilogy(a,abs(b));%��y�����ȡ����
    %axis([-2.5,2.0,1E-10,0.03]);%�趨y��ķ�ΧΪ�̶��ģ��˴��趨����������������ڽ�y�����ȡ���������֮�� 
    xlabel('Raman shift (cm-1)');% x������
    ylabel('Intensity (a.u.)');% y������
    saveas(gcf,[path,strcat(file_name,'-'),'.jpg']);%���ͼ�ε�ָ��λ��
    delete(gcf);
end
