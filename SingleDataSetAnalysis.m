%% Single Data Set Forward Kinematic Modeling
%  Last edited: May 1st, 2020
%  ME 18 Final Project
%  Libby Albanese and David Fricke

%% Initialize
close all
clear

l1 = .2635; %Length of upper segment, meters
l2 = .3429; %Length of lower segment, meters

%% Load and Assign Data
data=load('slowS60E90T1.csv');

thetaElb = data(:,2); %Elbow angles, degrees
thetaSh  = data(:,1); %Shoulder angles, degrees
time     = data(:,4); %time, seconds 

%% Isolate one period
[pksElb,locs] = findpeaks(thetaElb);

periodElb = thetaElb(locs(1):locs(2)); % Elbow, degrees
periodSh  = thetaSh(locs(1):locs(2));  % Shoulder angle, degrees
timeNew   = time(locs(1):locs(2));     % time, seconds

%% Convert to real coordinates
xHand = l1 * cosd(thetaSh) + l2 * cosd((180-thetaElb)+thetaSh); %meters
yHand = l1 * sind(thetaSh) + l2 * sind((180-thetaElb)+thetaSh); %meters

%% Coordinates for one period
xHandPer = l1 * cosd(periodSh) + l2 * cosd((180-periodElb)+periodSh); %meters
yHandPer = l1 * sind(periodSh) + l2 * sind((180-periodElb)+periodSh); %meters

%% Plot
figure(1);

subplot(3,2,1);
plot(time,thetaElb);
title(strcat("Elbow Degrees vs Time"))
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

subplot(3,2,2)
plot(timeNew, periodElb)
title("Single Period, Elbow Degrees vs Time")
xlabel('Time (ms)') 
ylabel('Degrees')

subplot(3,2,4)
plot(timeNew, periodSh)
title("Single Period, Shoulder Degrees vs Time")
xlabel('Time (ms)') 
ylabel('Degrees')

subplot(3,2,6)
plot(xHandPer,yHandPer)
axis equal
title('Single Period, Hand Coordinates')
xlabel('X')
ylabel('Y')
