%% Inverse Kinematic Modeling
%  Last edited: May 1st, 2020
%  ME 18 Final Project
%  Libby Albanese and David Fricke

%Initialize
close all
clear

l1 = .3301; %meters
l2 = .3429; %meters
 
%Collect csv in active directory
filelist=dir('*.csv');
    %csv naming convention
    %Subject's speed:Shoulder starting angle:Elbow Starting angle:Trial number
    %ex. fastS60S90T1

%Cycle through data
for filenow = 1:length(filelist) %number of files
    data = load(filelist(filenow).name); 

%Separate data from csv file
    thetaElb = data(:,2); %degrees
    thetaSh  = data(:,1); %degrees
    time     = data(:,4); %seconds 
    
%isolate one period
    [pksElb,locs] = findpeaks(thetaElb);
    
%    periodElb = thetaElb(locs(1):locs(2));
%    periodSh  = thetaSh(locs(1):locs(2));
%    timeNew   = time(locs(1):locs(2));

%Convert to real coordinates
    xHand = l1 * cosd(thetaSh) + l2 * cosd((180-thetaElb)+thetaSh);
    yHand = l1 * sind(thetaSh) + l2 * sind((180-thetaElb)+thetaSh);

%Coordinates for one period
%    xHandPer = l1 * cosd(periodSh) + l2 * cosd((180-periodElb)+periodSh);
%    yHandPer = l1 * sind(periodSh) + l2 * sind((180-periodElb)+periodSh);
    
%Plot data
    figure(filenow);

    subplot(3,2,1);
    plot(time,thetaElb);
    title(strcat("Elbow Degrees vs Time - file",filelist(filenow).name))
    xlabel('Time (ms)') 
    ylabel('Degrees')

    subplot(3,2,3);
    plot(time,thetaSh);
    title("Shoulder Degrees vs Time")
    xlabel('Time (ms)') 
    ylabel('Degrees')
    
    subplot(3,2,5);
    plot(xHand,yHand)
    axis equal
    title('Hand Coordinates')
    xlabel('X')
    ylabel('Y')
    
%     subplot(3,2,2)
%     plot(timeNew, periodElb)
%     title("Single Period, Elbow Degrees vs Time")
%     xlabel('Time (ms)') 
%     ylabel('Degrees')
%     
%     subplot(3,2,4)
%     plot(timeNew, periodSh)
%     title("Single Period, Shoulder Degrees vs Time")
%     xlabel('Time (ms)') 
%     ylabel('Degrees')
%     
%     subplot(3,2,6)
%     plot(xHandPer,yHandPer)
%     axis equal
%     title('Single Period, Hand Coordinates')
%     xlabel('X')
%     ylabel('Y')
end
