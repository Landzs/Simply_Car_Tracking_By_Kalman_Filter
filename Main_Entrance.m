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
close all;   % �ر����еĻ�ͼ���ڡ�
[h, w, p] = size(f(1).cdata);  % ��ö����ĳߴ硣
hf = figure('Position',[0 0 w h]);  % ����һ���µ�ͼ�񴰿ڣ�������ʾ������
movie(hf,f,1,30);   % ��ÿ��30֡���ٶȲ��Ŷ���1�Ρ�