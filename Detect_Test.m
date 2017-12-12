im1=imread('Data\11.jpg');                %读取原图
% figure,imshow(im1,[]);title('Raw');  %显示原图

im2=imread('Data\44.jpg');                %读取原图
% figure,imshow(im2,[]);title('Raw');  %显示原图

im=im1-im2;
im=rgb2gray(im);
image=double(im);
[m,n,k]=size(image);
figure,imshow(image,[]);title('Raw');
figure,imshow(image,[]);title('Detected');
hold on;
for i=1:5:m
    for j=1:5:n
        if image(i,j)>=20
%              fprintf('%d %d\n', i,j);
            plot(j,i,'ro');
            hold on;
        end
    end
end 
            
% figure,imshow(image,[]);title('Raw');
hold on;

 

