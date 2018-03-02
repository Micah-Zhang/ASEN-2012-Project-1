%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Purpose: Calculate error in T1, the initial temperature of the sample 
% using least squares best fit error analysis.
%
% Inputs: temp1a,liny1a,Amatrix1,timeadded
%
% Outputs: sigT0
%
% Assumptions: None
% 
% Author's ID Number: 60 
% Date Created: 10/19/17
% Date Modified: 10/27/17
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ sigT0 ] = findsigT0( temp1a,liny1a,Amatrix1,timeadded )
% Find the uncertainty in the "y values" = all temp values when time < 10
% minutes
sigy1 = sqrt((1/(length(temp1a)))*sum((temp1a-liny1a).^2));
% Build W matrix
errory1 = ones(1,length(temp1a))*sigy1;
inverseErrorSq1 = 1./(errory1.*errory1);
Wmatrix1 = diag(inverseErrorSq1);
% Build Q matrix
Qmatrix1 = (Amatrix1'*Wmatrix1*Amatrix1)^-1;
% Find error in extrapolated value
sigT0 = sqrt([timeadded 1]*Qmatrix1*[timeadded;1]);
end


