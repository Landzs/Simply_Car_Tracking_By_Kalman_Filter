function [car_position,detect_car,car_size]=Detect_Car(background,image)
%
    background_image=imread(background);                 
    % figure,imshow(im1,[]);title('Raw');              
    image_to_detect=imread(image);                
    % figure,imshow(im2,[]);title('Raw');          

    image=background_image-image_to_detect;
    image=rgb2gray(image);
    % Morphology Operation  erode to remove small noise
    image=bwmorph(image,'erode',4);
    % select largest object
    [image,nn]=bwlabel(image,8);

    [m,n,k]=size(image);
%     figure,imshow(image,[]);title('Raw');




    % average_i=0;
    % average_j=0;
    % number=0;
    % figure,imshow(image,[]);title('Detected');
    % hold on;
    % for i=1:1:m
    %     for j=1:1:n
    %         if image(i,j)>=1
    %             plot(j,i,'ro');
    %             average_i=average_i+i;
    %             average_j=average_j+j;
    %             number=number+1;
    %         end
    %     end
    % end

    STATS_1 = regionprops(image,'Centroid');
    STATS_2 = regionprops(image,'Area');
    [Largerst_number,Largerst_index]=max([STATS_2.Area]);
    car_position=[0 0];
    if Largerst_number>30% can find car
%         figure,imshow(image,[]);title('Raw');
%         hold on;
%         plot(STATS_1(Largerst_index).Centroid(1),STATS_1(Largerst_index).Centroid(2),'ro');
        car_position=[STATS_1(Largerst_index).Centroid(1) STATS_1(Largerst_index).Centroid(2)];
        detect_car=1
        car_size=Largerst_number;
    else
        detect_car=0;
        car_size=0;
    end

end

 

