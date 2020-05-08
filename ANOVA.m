elongation = [ 1.045 1.018 1.070 1.133 1.050 1.094 1.053 1.043 1.075 1.126 1.088 1.072 1.304 1.076 1.091 1.066 1.115 1.074 1.228 1.259 1.118 1.144 1.124 1.064 1.202 1.122 1.359 1 1.02 1.02 1.11 1.14 1.21 1.16 1.1 1.11 1 1 1.02 1.13 1.25 1.12 1.17 1.13 1.15 1.25 1.44 1.73 1.45 1.45 1.33 1.32 1.18 1.25];
workspace =[1 1 1 2 2 2 3 3 3 1 1 1 2 2 2 3 3 3 1 1 1 2 2 2 3 3 3 1 1 1 2 2 2 3 3 3 1 1 1 2 2 2 3 3 3 1 1 1 2 2 2 3 3 3];
speed =[1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3];
subject =[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2];

%this is how we tell anova what all the grouping variables are.
%note that each grouping variable is the same length as the data
group={workspace, speed, subject};


[p, T, STATS] = anovan(elongation, group);


figure(2)
COMPARISON = multcompare(STATS);