path='D:\my_data-201508-201710\test-data\solar_cell_mode\20161017\1014-1\';
%�˴��ļ���ַ��Ϊ��Ҫ���ļ���·��

Files = dir(strcat(path,'*.txt'));
LengthFiles = length(Files);
%��ÿ�β��Բ�ͬ���������ݶ���ͼ
for i = 1:LengthFiles
    file_name=Files(i).name;
    [a,b] = textread(strcat(path,Files(i).name),'%f%f',353,'headerlines', 2);
    set(gcf,'visible','off')%����ͼƬ����Ϊ���ɼ�
    plot(a,abs(b));
    semilogy(a,abs(b));%��y�����ȡ����
    axis([-2.5,2.0,1E-10,0.03]);%�趨y��ķ�ΧΪ�̶��ģ��˴��趨����������������ڽ�y�����ȡ���������֮�� 
    xlabel('Voltage(V)');% x������
    ylabel('Current(A)');
    saveas(gcf,[path,strcat(file_name,'-'),'.jpg']);%���ͼ�ε�ָ��λ��
    delete(gcf);
end