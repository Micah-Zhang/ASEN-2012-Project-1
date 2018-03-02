%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Purpose: Calculate T0, the initial temperature of the sample using least
% squares best fit.
%
% Inputs: time,tempc
%
% Outputs: timebeforeadded,time1a,temp1a,liny1a,timeadded,T0,time1b,liny1b,Amatrix1
%
% Assumptions: None
% 
% Author's ID Number: 60 
% Date Created: 10/19/17
% Date Modified: 10/27/17
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ timebeforeadded,time1a,temp1a,liny1a,timeadded,T0,time1b,liny1b,Amatrix1 ] = findT0( time,tempc )
% Find index of first time > 10 minutes = 600 seconds
timebeforeadded = find(time > 600,1);

time1a = time(1:timebeforeadded);
temp1a = tempc(1:timebeforeadded);
% Build A matrix
Amatrix1 = [time1a ones(length(time1a),1)];
% Build d matrix
dmatrix1 = temp1a;
% Find P matrix
Pmatrix1 = (Amatrix1'*Amatrix1)^-1*Amatrix1'*dmatrix1;
% Find linear line of best fit
liny1a = Pmatrix1(1) * time1a + Pmatrix1(2);
% Find index of first time > 11 minutes = 660 seconds
timeadded = time(find(time > 660,1));
% Extrapolate the line forward to the time the sample
% was added
T0 = Pmatrix1(1) * timeadded + Pmatrix1(2);
% Create another set of vectors used to plot extropolated line
time1b = time(timebeforeadded:find(time>660,1));
liny1b = Pmatrix1(1) * time1b + Pmatrix1(2);
end

