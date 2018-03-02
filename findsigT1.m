%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Purpose: Calculate error in T1, the initial temperature of the sample 
% using least squares best fit error analysis.
%
% Inputs: temp3a,liny3a,Amatrix3,timeadded
%
% Outputs: sigT1
%
% Assumptions: None
% 
% Author's ID Number: 60 
% Date Created: 10/19/17
% Date Modified: 10/27/17
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ sigT1 ] = findsigT1( temp3a,liny3a,Amatrix3,timeadded )
% Find the uncertainty in the "y values" = all temp values when t < 10
% minutes
sigy3 = sqrt((1/(length(temp3a)))*sum((temp3a-liny3a).^2));
% Build W matrix
errory3 = ones(1,length(temp3a))*sigy3;
inverseErrorSq3 = 1./(errory3.*errory3);
Wmatrix3 = diag(inverseErrorSq3);
% Build Q matrix
Qmatrix3 = (Amatrix3'*Wmatrix3*Amatrix3)^-1;
% Find error in extrapolated value
sigT1 = sqrt([timeadded 1]*Qmatrix3*[timeadded;1]);
end
