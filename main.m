function main()
clear
d=zeros(200,12);
fi='images\img\';%link for input images
fil=dir(fi);
si=length(fil)-2;
mkdir('outputimg');%make a folder for saving the results
fopen('data.txt','w');
%start the loop whcih will run exactly as the number of images in your
%img folder
for times=1:2
ti=int2str(times);
image1=strcat(fi,fil(times+2,1).name);%getting the name of that file
%displaying the input image and save
figure,
imshow(image1);
sss=strcat('outputimg\org',ti);
saveas(gcf,strcat(sss,'.jpg'));
%checking if the image is grayscal or RGB or indexed image if they are not 
%grayscale than we need to convert them into grayscal
info=imfinfo(image1);
clr=info.ColorType;
s=size(clr);
if s(2)==7
    [i1,i2]=imread(image1);
    i=ind2gray(i1,i2);
elseif s(2)==9
    if clr=='truecolor'
        i1=imread(image1);
        i=rgb2gray(i1);
    end
    if clr=='grayscale'
        i=imread(image1);
    end
end
[m,n]=size(i);
%initialization
co=1;
d(times,co)=times;co=co+1;
totalpixels=m*n;
meanimg=zeros(1,399);
im=double(i)/255;
[p,f]=prob(i);

%Rodrigues
q=findq(i,f,ti);
[t,bprr,img]=findimagesegmentation(i,q,p);
d(times,co)=q;co=co+1;
d(times,co)=t;co=co+1;
img1=img;
%SAD Rodrigues
ccc=1;
for z=0.01:0.01:4
    if(z~=1)
        [t,bprr,img]=findimagesegmentation(i,z,p);
        img=abs(im-img);
        meanimg(ccc)=(sum(sum(img)))/totalpixels;
        ccc=ccc+1;
    end
end
[mi,locc]=min(meanimg);
if(locc>99)
    locc=locc+1;
end
qq2=locc*0.01;
[t,bprr,img]=findimagesegmentation(i,qq2,p);
d(times,co)=qq2;co=co+1;
d(times,co)=t;co=co+1;
img2=img;
%Yanli method
[t,bprr,img]=globalthresh(i,q,p);
img3=img;
d(times,co)=q;co=co+1;
d(times,co)=t;co=co+1;
%SAD Yanli method
ccc=1;
for z=0.01:0.01:4
    if(z~=1)
        [t,bprr,img]=globalthresh(i,z,p);
        im=double(i)/255;
        img=abs(im-img);
        meanimg(ccc)=sum(sum(img))/totalpixels;
        ccc=ccc+1;
    end
end
[mi,locc]=min(meanimg);
if(locc>99)
    locc=locc+1;
end
qq5=locc*0.01;
[t,bprr,img]=globalthresh(i,qq5,p);
d(times,co)=qq5;co=co+1;
d(times,co)=t;co=co+1;
img4=img;
%Matlab builtin function for thresholding
threshhhh=graythresh(i);
img=imbinarize(i,threshhhh);
d(times,co)=threshhhh*256;co=co+1;
img5=img;
%Kapur Method
[t,bprr,img]=findimagesegmentationShanon(i,f);
d(times,co)=t;co=co+1;
img6=img;
%YanliKapur Method
[t,bprr,img]=findimagesegmentationShanon2(i,f);
d(times,co)=t;co=co+1;
img7=img;
%Nie Method
qq2=1.2;
[t,bprr,img]=findimagesegmentationMasi(i,qq2,p);
d(times,co)=qq2;co=co+1;
d(times,co)=t;co=co+1;
img8=img;
%SAD Nie Method
ccc=1;
for z=0.01:0.01:4
    if(z~=1)
        [t,bprr,img]=findimagesegmentationMasi(i,z,p);
        img=abs(im-img);
        meanimg(ccc)=(sum(sum(img)))/totalpixels;
        ccc=ccc+1;
    end
end
[mi,locc]=min(meanimg);
if(locc>99)
    locc=locc+1;
end
qq3=locc*0.01;
[t,bprr,img]=findimagesegmentationMasi(i,qq3,p);
d(times,co)=qq3;co=co+1;
d(times,co)=t;co=co+1;
img9=img;
%Yanli Nie Method
ccc=1;
for z=0.01:0.01:4
    if(z~=1)
        [t,bprr,img]=findimagesegmentationyanmas(i,z,p);
        img=abs(im-img);
        meanimg(ccc)=(sum(sum(img)))/totalpixels;
        ccc=ccc+1;
    end
end
[mi,locc]=min(meanimg);
if(locc>99)
    locc=locc+1;
end
qym=locc*0.01;
[t,bprr,img]=findimagesegmentationyanmas(i,qym,p);
d(times,co)=qq3;co=co+1;
d(times,co)=t;co=co+1;
img10=img;
%Sahoo Method
qq3=0.1;
[t,bprr,img]=findimagesegmentationRenyi(i,qq3,p);
d(times,co)=qq3;co=co+1;
d(times,co)=t;co=co+1;
img11=img;
%SAD Sahoo 
ccc=1;
for z=0.01:0.01:4
    if(z~=1)
        [t,bprr,img]=findimagesegmentationRenyi(i,z,p);
        img=abs(im-img);
        meanimg(ccc)=(sum(sum(img)))/totalpixels;
        ccc=ccc+1;
    end
end
[mi,locc]=min(meanimg);
if(locc>99)
    locc=locc+1;
end
qq4=locc*0.01;
[t,bprr,img]=findimagesegmentationRenyi(i,qq4,p);
d(times,co)=qq4;co=co+1;
d(times,co)=t;co=co+1;
img12=img;
%YanliSahoo method
ccc=1;
for z=0.01:0.01:4
    if(z~=1)
        [t,bprr,img]=findimagesegmentationyanren(i,z,p);
        img=abs(im-img);
        meanimg(ccc)=(sum(sum(img)))/totalpixels;
        ccc=ccc+1;
    end
end
[mi,locc]=min(meanimg);
if(locc>99)
    locc=locc+1;
end
qyr=locc*0.01;
[t,bprr,img]=findimagesegmentationyanren(i,qyr,p);
d(times,co)=qyr;co=co+1;
d(times,co)=t;co=co+1;
img13=img;

%displaying output images and saving them as .jpg format
figure, 
imshow(im)
sss=strcat('outputimg\gt',ti);
saveas(gcf,strcat(sss,'.jpg'));
figure,
imshow(img1);
sss=strcat('outputimg\rod',ti);
saveas(gcf,strcat(sss,'.jpg'));
figure,
imshow(img2);
sss=strcat('outputimg\rodm',ti);
saveas(gcf,strcat(sss,'.jpg'));
figure,
imshow(img3);
sss=strcat('outputimg\yan',ti);
saveas(gcf,strcat(sss,'.jpg'));
figure,
imshow(img4);
sss=strcat('outputimg\yanm',ti);
saveas(gcf,strcat(sss,'.jpg'));
figure,
imshow(img5);
sss=strcat('outputimg\ots',ti);
saveas(gcf,strcat(sss,'.jpg'));
figure,
imshow(img6);
sss=strcat('outputimg\sha',ti);
saveas(gcf,strcat(sss,'.jpg'));
figure,
imshow(img7);
sss=strcat('outputimg\shayan',ti);
saveas(gcf,strcat(sss,'.jpg'));
figure,
imshow(img8);
sss=strcat('outputimg\mas',ti);
saveas(gcf,strcat(sss,'.jpg'));
figure,
imshow(img9);
sss=strcat('outputimg\masm',ti);
saveas(gcf,strcat(sss,'.jpg'));
figure,
imshow(img10);
sss=strcat('outputimg\yanmas',ti);
saveas(gcf,strcat(sss,'.jpg'));
figure,
imshow(img11);
sss=strcat('outputimg\ren',ti);
saveas(gcf,strcat(sss,'.jpg'));
figure,
imshow(img12);
sss=strcat('outputimg\renm',ti);
saveas(gcf,strcat(sss,'.jpg'));
figure,
imshow(img13);
sss=strcat('outputimg\yanren',ti);
saveas(gcf,strcat(sss,'.jpg'));
%we are finding the distance between Input image and output images
%or use ime function for finding Miss-classification Error but you need to have ground truth
%or use PSNR function to find out the signal to noise ratio
d(times,co)=IMED(im,img1);co=co+1;
d(times,co)=IMED(im,img2);co=co+1;
d(times,co)=IMED(im,img3);co=co+1;
d(times,co)=IMED(im,img4);co=co+1;
d(times,co)=IMED(im,img5);co=co+1;
d(times,co)=IMED(im,img6);co=co+1;
d(times,co)=IMED(im,img7);co=co+1;
d(times,co)=IMED(im,img8);co=co+1;
d(times,co)=IMED(im,img9);co=co+1;
d(times,co)=IMED(im,img10);co=co+1;
d(times,co)=IMED(im,img11);co=co+1;
d(times,co)=IMED(im,img12);co=co+1;
d(times,co)=IMED(im,img13);co=co+1;
dlmwrite("data.txt",d(times,:),'delimiter',' ','-append'); 
close all%closing the figures not to hang the cpu
end
file1=load('data.txt');
writematrix(file1,'result.xlsx','Range','B5:ZZ550')%save as csv
end