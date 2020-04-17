close all
clear

l1 = .3301; %meters
l2 = .3429; %meters
 

filelist=dir('*.csv'); %collects all csv in active directory
%csv naming convention
%Subject's speed:Shoulder starting angle:Elbow Starting angle:Trial number
%ex. fastS60S90T1
%subject was attempting to make circles quickly (fast, med, slow only)
%Shoulder Started at 60 degrees
%Elbow started at 90 degrees
%First Trial collected with above conditions

for filenow=1:length(filelist) %number of files
data=load(filelist(filenow).name); %runs through each file

thetaElb = data(:,2); %degrees
thetaSh  = data(:,1); %degrees
time     = data(:,4); %seconds 

%converts to real coordinates
xHand = l1 * cosd(thetaSh) + l2 * cosd((180-thetaElb)+thetaSh);
yHand = l1 * sind(thetaSh) + l2 * sind((180-thetaElb)+thetaSh);

figure(filenow);

subplot(3,1,1);
plot(time,thetaElb);
title(strcat("Elbow Degrees vs Time - file",filelist(filenow).name))
xlabel('Time (ms)') 
ylabel('Degrees')

subplot(3,1,2);
plot(time,thetaSh);
title(strcat("Shoulder Degrees vs Time - file",filelist(filenow).name))
xlabel('Time (ms)') 
ylabel('Degrees')

subplot(3,1,3);
plot(xHand,yHand);
strcat("Recreation of drawing from data - file",filelist(filenow).name)
xlabel('Postion (m)') 
ylabel('Postion (m)')

end
