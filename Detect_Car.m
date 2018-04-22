% function [car_position,detect_car,car_size]=Detect_Car(background,image)
% This function is for detecting car
% Use background picture to detect moving objects
% Inputs:
%           background:      jpg
%           image:           jpg
% Outputs:
%           car_position:    matrix
%           detect_car:      boolean
%           car_size:        integer
function [car_position,detect_car,car_size]=Detect_Car(background,image)
    background_image=imread(background);                              
    image_to_detect=imread(image);                         
    image=background_image-image_to_detect;
    image=rgb2gray(image);
    % Morphology Operation  erode to remove small noise
    image=bwmorph(image,'erode',4);
    % select largest object
    [image,nn]=bwlabel(image,8);

    [m,n,k]=size(image);

    STATS_1 = regionprops(image,'Centroid');
    STATS_2 = regionprops(image,'Area');
    [Largerst_number,Largerst_index]=max([STATS_2.Area]);
    car_position=[0 0];
    if Largerst_number>30% can find car
        car_position=[STATS_1(Largerst_index).Centroid(1) STATS_1(Largerst_index).Centroid(2)];
        detect_car=1;
        car_size=Largerst_number;
    else
        detect_car=0;
        car_size=0;
    end

end

 

