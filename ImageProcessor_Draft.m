

clear all
close

% Get image
RGB = imread('Test.jpg');

%convert grayscale
I = rgb2gray(RGB);

%cropping
r = centerCropWindow2d(size(I),[2500 2500]); %crop conditions
I = imcrop(I,r); %applies conditions to image and crops

%Binarize the image - needed to be adaptive for the test
bw = imbinarize(I,'adaptive','ForegroundPolarity','dark','Sensitivity',0.3);

%Flips color - needed for the later methods (imfill)
bw2 = imcomplement(bw);

%gets rid of image noise
bw2 = bwareaopen(bw2,3000);

%fills the image
bw = imfill(bw2,'holes');
imshow(bw)

%gets the ogjects boundry
[B,L] = bwboundaries(bw,'noholes');
imshow(label2rgb(L,@jet,[.5 .5 .5]))
hold on



%Sketches around boundry
for k = 1:length(B)
  boundary = B{k};
  plot(boundary(:,2),boundary(:,1),'w','LineWidth',2)
end

%gets some info
stats = regionprops('table', L,'Centroid','MajorAxisLength','MinorAxisLength','Eccentricity','Circularity')
Elongation = stats.MinorAxisLength/stats.MajorAxisLength

%makes ideal circle from parameters
centers = stats.Centroid;
diameters = mean([stats.MajorAxisLength stats.MinorAxisLength],2);
radii = diameters/2;

hold on
viscircles(centers,radii);
hold off


