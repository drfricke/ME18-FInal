%% Image Processing
%  Last edited: May 4th, 2020
%  ME 18 Final Project
%  Libby Albanese and David Fricke

clear all
close

%% Get image
RGB = imread('Test.jpg');

%% Convert  to grayscale
I = rgb2gray(RGB);

%% Crop Image
r = centerCropWindow2d(size(I),[2500 2500]); %crop conditions
I = imcrop(I,r); %applies conditions to image and crops

%% Binarize the image 
%- needed to be adaptive for the test
bw = imbinarize(I,'adaptive','ForegroundPolarity','dark','Sensitivity',0.3);

%% Flips color 
%- needed for the later methods (imfill)
bw2 = imcomplement(bw);

%% Eliminate noise
bw2 = bwareaopen(bw2,3000);

%% Fill image
bw = imfill(bw2,'holes');
imshow(bw)

%% Object boundary
[B,L] = bwboundaries(bw,'noholes');
imshow(label2rgb(L,@jet,[.5 .5 .5]))
hold on

%% Sketch around boundary
for k = 1:length(B)
  boundary = B{k};
  plot(boundary(:,2),boundary(:,1),'w','LineWidth',2)
end

%% Collect information
stats = regionprops('table', L,'Centroid','MajorAxisLength','MinorAxisLength','Eccentricity','Circularity')
Elongation = stats.MinorAxisLength/stats.MajorAxisLength

%% Draw ideal circle 
centers = stats.Centroid;
diameters = mean([stats.MajorAxisLength stats.MinorAxisLength],2);
radii = diameters/2;

hold on
viscircles(centers,radii);
hold off


