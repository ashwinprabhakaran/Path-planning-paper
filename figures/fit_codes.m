
figure(1)

m = [50 100 150 200 250];
time = [40.76 78.68 121.28 161.42 203];
plot(m,time,'d')
hold on
P = polyfit(m,time,1)
y = P(1)*[0 250]+P(2);
xlabel('# path points')
ylabel('Time in secs')
plot([0 250],y,'k')

figure(2)
m = [20 40 80 100 120];
time = [40.76 78.27 128.0 178.70 206.3];
plot(m,time,'d')
hold on
P = polyfit(m,time,1)
y = P(1)*[20 120]+P(2);
xlabel('# links')
ylabel('Time in secs')
plot([20 120],y,'k')

figure(3)
m = [100 496 1020 1572 2164 2880];
time = [ mean([38.83 40.25 41.40]) mean([40.95 42.95 44.55]) mean([44.50 49.15 46.82 47.60 48.54])  mean([53.26 51.19 53.6 53.18]) mean([59.08 58.42 59.21])  mean([71.54 77.98 80.97 82.48])];
plot(m,time,'d')
hold on



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