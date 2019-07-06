im=imread('C:\Users\ye\Desktop\1_0000_图层-1.png'); %文件名为1.jpg的图像，放在c盘底下，当然路径都可以自己改
if size(im,3)>1  %判断如果是彩色图像，转换为灰度图
im=rgb2gray(im);
end
hist_im=imhist(im); %计算直方图
bar(hist_im);%画直方图