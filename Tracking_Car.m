% figure,imshow(image,[]);title('Raw');

function Tracking_Car(File,File_Number)
%     clc;
%     clear all;
    num=0;
    v.FrameRate=1;
    v = VideoWriter('Simply_Car_Tracking_By_Kalman_Filter_Example2.avi');
    open(v);
    dt=1;
    A = [1 0 dt 0; 0 1 0 dt; 0 0 1 0; 0 0 0 1];
    B = [0 0 ;0 0; dt 0;0 dt];
    C = [1 0 0 0;0 1 0 0];
    X=[0;0;0;0];
    P = 10*eye(4);
    u=[3.8;1];
    % the simulated noise 

    R = diag([(0.1)^2 (0.1)^2 (1)^2 (1)^2]);
    Q =  diag([(0.1)^2 (0.1)^2]);
    Car_state(:,1) = X;
    for i=2:File_Number
        image_to_detect=[File,'/',num2str(i,'%03d'),'.jpg'];
        [car_position,detect_car,car_size]=Detect_Car([File,'/','001.jpg'],image_to_detect);
        image=imread(image_to_detect);                
        % figure,imshow(im2,[]);title('Raw')
        if detect_car==1
            figure,imshow(image,[]);title('Raw');
            hold on;
            u=u+[0.15;0.15];
             [car_state_pocessed,P]=Kalman_Filter(X,car_position',A,B,C,Q,R,P,u);
            rectangle('Position',[car_state_pocessed(1)-50,car_state_pocessed(2)-50,100,100],'EdgeColor','r');
            hold on;
            f(i-1) = getframe(gca);
%             writeVideo(v,f)
            num=num+1;
            Car_state(:,num+1)=car_state_pocessed;
        else
            figure,imshow(image,[]);title('Raw');
            f(i-1) = getframe(gca);
            
            hold on;
        end

    end

    close all;   % 关闭现有的画图窗口。
    writeVideo(v,f);

    close(v);
%     [h, w, p] = size(f(1).cdata);  % 获得动画的尺寸。
%     hf = figure('Position',[0 0 w h]);  % 生成一个新的图像窗口，用来显示动画。
%      movie(hf,f,1,30);   % 按每秒30帧的速度播放动画1次。
end