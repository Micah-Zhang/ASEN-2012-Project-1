%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Purpose: Calculate T1, the initial temperature of the sample using least 
% squares best fit.
%
% Inputs: time,tempw,timeadded,timebeforeadded
%
% Outputs: time3a,temp3a,liny3a,T1,time3b,liny3b,Amatrix3
%
% Assumptions: None
% 
% Author's ID Number: 60 
% Date Created: 10/19/17
% Date Modified: 10/27/17
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ time3a,temp3a,liny3a,T1,time3b,liny3b,Amatrix3 ] = findT1( time,tempw,timeadded,timebeforeadded )
% Isolate temp values for boiling water before sample was removed
time3a = time(1:timebeforeadded);
temp3a = tempw(1:timebeforeadded);
% Build A matrix
Amatrix3 = [time3a ones(length(time3a),1)];
% Build d matrix
dmatrix3 = temp3a;
% Find P matrix
Pmatrix3 = (Amatrix3'*Amatrix3)^-1*Amatrix3'*dmatrix3;
% Find linear line of best fit
liny3a = Pmatrix3(1) * time3a + Pmatrix3(2);
% Extrapolate the line forward to the time the sample
% was added
T1 = Pmatrix3(1) * timeadded + Pmatrix3(2);
% Create another set of vectors used to plot extropolated line
time3b = time(timebeforeadded:find(time>660,1));
liny3b = Pmatrix3(1) * time3b + Pmatrix3(2);
end




