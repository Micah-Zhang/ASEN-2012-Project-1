%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Purpose: To calculate the specific heat of of an unknown sample using the 
% data provided and to use the method of least squares to find the
% uncertainty of this value using the general error propogation formula.
%
% Inputs: None
%
% Outputs: An output file containing a summary of all relevant calculated
% and given values. The program also produces two plots. The first plot is 
% the temperature profile of the calorimeter with line of best fits included.
% The second is a temperature profile the boiling water with line of best
% fits included.
%
% Assumptions: It is assumed that the experimental procedure outlined in 
% the report is valid. It is also assumed that it is valid to calculate T1
% using the same method as used for T0.
% 
% Author's ID Number: 60 
% Date Created: 10/19/17
% Date Modified: 10/27/17
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
clc;    

%% Initial set-up and data parse
% Set filename
filename1 = 'CalorimeterData.xlsx';
% Call readinput function to parse data
[data,time,tempc,tempw] = readinput(filename1);

%% Find T0
% Call findT0 function
[timebeforeadded,time1a,temp1a,liny1a,timeadded,T0,time1b,liny1b,Amatrix1] = findT0(time,tempc);

%% Find error in T0
% Call findsigT0 function
sigT0 = findsigT0(temp1a,liny1a,Amatrix1,timeadded);

%% Find T2
% Call findT2 function
[time2a,temp2a,liny2a,Tavgtime,T2,time2b,liny2b,Amatrix2] = findT2(time,tempc,timeadded,T0);

%% Find error in T2
% Call findsigT2 function
[sigT2] = findsigT2(temp2a,liny2a,Amatrix2,Tavgtime);

%% Find T1
% Call findT1 function
[time3a,temp3a,liny3a,T1,time3b,liny3b,Amatrix3] = findT1(time,tempw,timeadded,timebeforeadded);

%% Find error in T1
% Call findsigT1 function
[sigT1] = findsigT1(temp3a,liny3a,Amatrix3,timeadded);

%% Find Cs, the specific heat of the sample
% Call findcs function
[cs,ms,mc,cc] = findcs(T2,T0,T1);

%% Find error in specific heat of sample
% Call findsigcs function
[sigcs,sigmc,sigms] = findsigcs(cc,ms,mc,T2,T0,T1,sigT0,sigT1,sigT2);

%% Plot the temperature profile and least squares best fit lines
% Call create plots function
createplots(time,tempc,time1a,liny1a,time1b,liny1b,timeadded,T0,time2a,liny2a,time2b,liny2b,Tavgtime,T2,tempw,time3a,liny3a,time3b,liny3b,T1);

%% Print findings to output file
filename2 = 'main.output';
%filename2 = '/home/micah/Comp_Project/main.output';
% Call write output function
writeoutput(filename2,T0,sigT0,T2,sigT2,mc,sigmc,ms,sigms,cs,sigcs);
