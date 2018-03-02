%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Purpose: Calculate cs, the specific heat capacity of calorimeter. 
%
% Inputs: T2,T0,T1
%
% Outputs: cs,ms,mc,cc
%
% Assumptions: None
% 
% Author's ID Number: 60 
% Date Created: 10/19/17
% Date Modified: 10/27/17
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [cs,ms,mc,cc] = findcs(T2,T0,T1)
% Find mass of sample (g)
ms = 91.75;
% Find mass of calorimeter (g)
mc = 313.50;
% Find specific heat of calorimeter (calories/(gramC))
cc = 0.214;
% Convert specific heat of calorimeter to J/gK
cc = cc * 4.184;
% Find Cs
cs = (mc * cc * (T2 - T0)) / (ms * (T1 - T2));
end
