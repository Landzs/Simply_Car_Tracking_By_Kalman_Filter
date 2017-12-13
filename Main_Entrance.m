% figure,imshow(image,[]);title('Raw');
% hold on;
clc;
clear all;
num=0;
for i=2:71
    image_to_detect=['Data/',num2str(i,'%03d'),'.jpg'];
    [car_position,detect_car]=Detect_Car('Data/001.jpg',image_to_detect);
    image=imread(image_to_detect);                
    % figure,imshow(im2,[]);title('Raw')
%     if detect_car==1
%         plot(car_position(1),car_position(2),'ro');
        figure,imshow(image,[]);title('Raw');
        hold on;
        rectangle('Position',[car_position(1)-50,car_position(2)-50,100,100],'EdgeColor','r');
        hold on;
%         plot(car_position(1),car_position(2),'ro');
%         axis([0 700 0 800 0 500]) 
        rect = [0, 0, 700, 800];
        f(i-1) = getframe(gca,rect);
        num=num+1;
        hold on;
        
%     end
    
end
close all;   % 关闭现有的画图窗口。
[h, w, p] = size(f(1).cdata);  % 获得动画的尺寸。
hf = figure('Position',[0 0 w h]);  % 生成一个新的图像窗口，用来显示动画。
movie(hf,f,1,30);   % 按每秒30帧的速度播放动画1次。