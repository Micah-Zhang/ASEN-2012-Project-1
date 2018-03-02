%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Purpose: Calculate the error in cs, the specific heat capacity of
% calorimeter using the general error propagation formula.
%
% Inputs: cc,ms,mc,T2,T0,T1,sigT0,sigT1,sigT2
%
% Outputs: sigcs,sigmc,sigms
%
% Assumptions: None
% 
% Author's ID Number: 60 
% Date Created: 10/19/17
% Date Modified: 10/27/17
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [sigcs,sigmc,sigms] = findsigcs(cc,ms,mc,T2,T0,T1,sigT0,sigT1,sigT2)
% Find error in mass of calorimeter
sigmc = 0.05;
% Find error in mass of sample
sigms = 0.05;
% Find partial mass calorimeter
parmc = (cc*(-T0+T2))/(ms*(T1-T2));
% Find partial mass sample
parT2 = (cc*mc)/(ms*(T1-T2)) + (cc*mc*(-T0+T2))/(ms*(T1-T2)^2); 
% Find partial T0
parT0 = -(cc*mc)/(ms*(T1-T2));
% Find partial T2
parT1 = -(cc*mc*(-T0+T2))/(ms*(T1-T2)^2);
% Find partial T1
parms = -(cc*mc*(-T0+T2))/(ms^2*(T1-T2));
% Find error in Cs
sigcs = sqrt((parmc*sigmc)^2+(parms*sigms)^2+(parT0*sigT0)^2+(parT2*sigT2)^2+(parT1*sigT1)^2);
end

