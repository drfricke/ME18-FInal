close all
clear

l1 = .3301; %meters
l2 = .3429; %meters

data=load('fastS60E90T3.csv'); %runs through each file

thetaElb = data(:,2); %degrees
thetaSh  = data(:,1); %degrees
time     = data(:,4); %seconds 

%isolate one period
[pksElb,locs] = findpeaks(thetaElb);

periodElb = thetaElb(locs(1):locs(2));
periodSh  = thetaSh(locs(1):locs(2));
timeNew   = time(locs(1):locs(2));

%Convert to real coordinates
xHand = l1 * cosd(thetaSh) + l2 * cosd((180-thetaElb)+thetaSh);
yHand = l1 * sind(thetaSh) + l2 * sind((180-thetaElb)+thetaSh);

%Coordinates for one period
xHandPer = l1 * cosd(periodSh) + l2 * cosd((180-periodElb)+periodSh);
yHandPer = l1 * sind(periodSh) + l2 * sind((180-periodElb)+periodSh);

%Plot
figure(1);

subplot(2,1,1);
plot(time,thetaElb);
title(strcat("Elbow Degrees vs Time"))
xlabel('Time (ms)') 
ylabel('Degrees')

subplot(2,1,2);
plot(time,thetaSh);
title(strcat("Shoulder Degrees vs Time"))
xlabel('Time (ms)') 
ylabel('Degrees')

figure(2)
plot(xHand,yHand)
axis equal

figure(3)
subplot(2,1,1)
plot(timeNew,periodElb)
subplot(2,1,2)
plot(timeNew,periodSh)

figure(4)
plot(xHandPer,yHandPer)
axis equal