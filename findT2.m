%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Purpose: Calculate T2, the equilibrium temperature of the calorimeter
% and sample using least squares best fit.
%
% Inputs: time,tempc,timeadded,T0
%
% Outputs: time2a,temp2a,liny2a,Tavgtime,T2,time2b,liny2b,Amatrix2
%
% Assumptions: None
% 
% Author's ID Number: 60 
% Date Created: 10/19/17
% Date Modified: 10/27/17
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ time2a,temp2a,liny2a,Tavgtime,T2,time2b,liny2b,Amatrix2 ] = findT2( time,tempc,timeadded,T0 )
% Find location of maxmium temperature reading
[~, maxtempindex]= max(tempc);
% Isolate temp and time values needed to find Thigh
time2a = time(maxtempindex:end);
temp2a = tempc(maxtempindex:end);
% Build A matrix
Amatrix2 = [time2a ones(length(time2a),1)];
% Build d matrix
dmatrix2 = temp2a;
% Solve for P matrix
Pmatrix2 = (Amatrix2'*Amatrix2)^-1*Amatrix2'*dmatrix2;
% Find linear line of best fit
liny2a = Pmatrix2(1) * time2a + Pmatrix2(2);
% Extrapolate line backwards to find Thigh
Thigh = Pmatrix2(1) * timeadded + Pmatrix2(2);
% Find average between Thigh and T0
Tavg = (Thigh + T0)/2;
% Determine the time associated with Tavg
Tavgtime = time(find(tempc > Tavg,1));
% Extrapolate 2nd line of best fit backwards to find T2
T2 = Pmatrix2(1) * Tavgtime + Pmatrix2(2);
% Create another set of vectors used to plot extropolated line
time2b = time(find(tempc > Tavg,1):maxtempindex);
liny2b = Pmatrix2(1) * time2b + Pmatrix2(2);
end



