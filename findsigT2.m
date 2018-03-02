%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Purpose: Calculate error in T2, the equilibrium temperature of the 
% calorimeter and sample using least squares best fit error analysis.
%
% Inputs: temp2a,liny2a,Amatrix2,Tavgtime
%
% Outputs: sigT2
%
% Assumptions: None
% 
% Author's ID Number: 60 
% Date Created: 10/19/17
% Date Modified: 10/27/17
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ sigT2 ] = findsigT2( temp2a,liny2a,Amatrix2,Tavgtime )
% Find the uncertainty in the "y values" = all temp values from temp max to end
% minutes
sigy2 = sqrt((1/(length(temp2a)))*sum((temp2a-liny2a).^2));
% Build W matrix
errory2 = ones(1,length(temp2a))*sigy2;
inverseErrorSq2 = 1./(errory2.*errory2);
Wmatrix2 = diag(inverseErrorSq2);
% Build Q matrix
Qmatrix2 = (Amatrix2'*Wmatrix2*Amatrix2)^-1;
% Find error in extrapolated value
sigT2 = sqrt([Tavgtime 1]*Qmatrix2*[Tavgtime;1]);
end


