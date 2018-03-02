%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Purpose: Use relevant given data and calculations to create two plots,
% one of the temperature profile of the calorimeter and another of the
% temperature profile of the boiling water, both with line of best fits.
%
% Inputs: time,tempc,time1a,liny1a,time1b,liny1b,timeadded,T0,time2a,
% liny2a, time2b,liny2b,Tavgtime,T2,tempw,time3a,liny3a,time3b,liny3b,T1
%
% Outputs: None
%
% Assumptions: Output file does not need to have a specific format
% 
% Author's ID Number: 60 
% Date Created: 10/19/17
% Date Modified: 10/27/17
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = createplots(time,tempc,time1a,liny1a,time1b,liny1b,timeadded,T0,time2a,liny2a,time2b,liny2b,Tavgtime,T2,tempw,time3a,liny3a,time3b,liny3b,T1)
% Create a plot of calorimeter temperature with lines of best fit
figure(1)
hold on
% Plot original data
plot(time./60,tempc)
% Plot line of best fit used to find T0
plot(time1a./60,liny1a,'Color','k','LineWidth',2)
% Plot extrapolated line of best fit used to find T0
plot(time1b./60,liny1b,':','Color','r','LineWidth',2);
% Plot T0
plot(timeadded/60,T0,'m*','LineWidth',0.5)
% Plot line of best fit used to find T2
plot(time2a./60,liny2a,'Color','k','LineWidth',2)
% Plot extrapolated line of best fit used to find T2
plot(time2b./60,liny2b,'-.','Color','r','LineWidth',2)
% Plot T2
plot(Tavgtime/60,T2,'m*','LineWidth',0.5)
% Add titles, axis labels, and legend
title('Temperature Profile of Calorimeter');
xlabel('Time [minutes]');
ylabel('Temperature [Celsius]');
legend('Original Data','Line of Best Fit for T0','Extrapolated Line of Best Fit for T0','Line of Best Fit for T2','Extrapolated Line of Best Fit for T2','Location','southeast');
hold off

% Create a plot of boiling water temperature with lines of best fit
figure(2)
hold on
% Plot original data
plot(time./60,tempw)
% Plot line of best fit used to find T1
plot(time3a./60,liny3a,'Color','k','LineWidth',2)
% Plot extrapolated line of best fit used to find T1
plot(time3b./60,liny3b,':','Color','r','LineWidth',2)
% Plot T1
plot(timeadded/60,T1,'m*','LineWidth',0.5)
% Add title, axis labels, and legend
title('Temperature Profile of Boiling Water');
xlabel('Time [minutes]');
ylabel('Temperature [Celsius]');
legend('Original Data','Line of Best Fit for T1','Extrapolated Line of Best Fit for T1','Location','southeast');
hold off
end



