
%%
clc
clear
close
figure(1)

m = [50 100 150 200 250];
time = [40.76 78.68 121.28 161.42 203];
plot(m,time,'*')
hold on
P1 = polyfit(m,time,1)
y = P1(1)*[0 250]+P1(2);
xlabel('# path points')
ylabel('Time in secs')
plot([0 250],y,'k')

% figure(2)
m = [20 40 80 100 120];
time = [40.76 78.27 128.0 178.70 206.3];
plot(m,time,'d')
hold on
P = polyfit(m,time,1)
y = P(1)*[20 120]+P(2);
xlabel('# links')
ylabel('Time in secs')
plot([20 120],y,'k')

%%
figure(3)
m = ([100 496 1020 1572 2164 2880 6162 10608 25760 50400 64770 55224 45368 34968]);
time =([ min([38.83 40.25 41.40]) min([40.95 42.95 44.55]) min([44.50 49.15 46.82 47.60 48.54])  min([53.26 51.19 53.6 53.18]) min([59.08 58.42 59.21])  min([71.54 77.98 80.97 82.48]) min([98.34 112.39 117.31 120.23]) min([131.66 152.67 159.67 163.26]) min([257.53 258.61 257.5]) min([811.08 808.86]) 888.57 755.11 646.66 298.35]);
plot(m,time,'d')
hold on
P = polyfit(m,time,1)
y = P(1)*[2 12]+P(2);
xlabel('# links')
ylabel('Time in secs')
plot([2 12],y,'k')

[xData, yData] = prepareCurveData( m, time );

% Set up fittype and options.
ft = fittype( 'power2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [25.2025133047221 0.101378397883042 0.41977204965504];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.

h = plot( fitresult, xData, yData );
legend( h, 'time vs. m', 'untitled fit 1', 'Location', 'NorthEast' );
% Label axes
xlabel('# faces')
ylabel('Time in secs')