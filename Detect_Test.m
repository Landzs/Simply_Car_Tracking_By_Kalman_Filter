background=imread('Data\001.jpg');                %读取原图
% figure,imshow(im1,[]);title('Raw');  %显示原图

image2=imread('Data\017.jpg');                %读取原图
% figure,imshow(im2,[]);title('Raw');  %显示原图

image=background-image2;
image=rgb2gray(image);
% Morphology Operation  erode to remove small noise
image=bwmorph(image,'erode',4);
% select largest object
[image,nn]=bwlabel(image,8);

[m,n,k]=size(image);
figure,imshow(image,[]);title('Raw');




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
if Largerst_number>5% can find car
end
figure,imshow(image,[]);title('Raw');
hold on;
plot(STATS_1(2).Centroid(1),STATS_1(2).Centroid(2),'ro');

 

