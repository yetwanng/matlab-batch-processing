im=imread('C:\Users\ye\Desktop\1_0000_ͼ��-1.png'); %�ļ���Ϊ1.jpg��ͼ�񣬷���c�̵��£���Ȼ·���������Լ���
if size(im,3)>1  %�ж�����ǲ�ɫͼ��ת��Ϊ�Ҷ�ͼ
im=rgb2gray(im);
end
hist_im=imhist(im); %����ֱ��ͼ
bar(hist_im);%��ֱ��ͼ