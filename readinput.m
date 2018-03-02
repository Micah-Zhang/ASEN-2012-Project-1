%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Purpose: Take the given data file and parse for measurement times,
% temperature of the calorimeter, and temperature of boiling water
%
% Inputs: filename
%
% Outputs: data,time,tempc,tempw
%
% Assumptions: None
% 
% Author's ID Number: 60 
% Date Created: 10/19/17
% Date Modified: 10/27/17
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [data,time,tempc,tempw] = readinput(filename)
% Import calorimetry data
data = xlsread(filename);
% Parse data for measurement times
time = data(:,1);
% Parse data for temperature of calorimeter
tempc = data(:,2 );
% Parse data for temperature of boiling water
tempw = data(:,3);
end
