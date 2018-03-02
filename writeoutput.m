%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Purpose: To write all relevant calculated and given values to an output
% file.
%
% Inputs: 
% filename = name of file
% T0 = initial temperature of calorimeter
% sigT0 = error in T0
% T2 = equilibrium temperature of calorimeter and sample
% sigT2 = error 
% mc = mass of calorimeter
% sigmc = erorr in mass of calorimeter
% ms = mass of sample
% sigms = error in mass of sample
% cs = specific heat of sample
% sigcs = error in specific heat of sample 
%
% Outputs: None
%
% Assumptions: Output file does not need to have a specific format
% 
% Author's ID Number: 60 
% Date Created: 10/19/17
% Date Modified: 10/27/17
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = writeoutput(filename,T0,sigT0,T2,sigT2,mc,sigmc,ms,sigms,cs,sigcs)
% Open text file
fileID = fopen(filename,'w');
% Write data to text file
fprintf(fileID,'Initial Temperature of Calorimeter (T0): \n');
fprintf(fileID,'%.3f\n\n',T0);
fprintf(fileID,'Error in Initial Temperature of Calorimeter(T0): \n');
fprintf(fileID,'%.4f\n\n',sigT0);
fprintf(fileID,'Equlibrium Temperature of Calorimeter and Sample (T2): \n');
fprintf(fileID,'%.3f\n\n',T2);
fprintf(fileID,'Error in Equilibrium Temperature of Calorimeter and Sample (T2): \n')';
fprintf(fileID,'%f\n\n',sigT2);
fprintf(fileID,'Mass of Calorimeter: \n');
fprintf(fileID,'%f\n\n',mc);
fprintf(fileID,'Error in Mass of Calorimeter: \n');
fprintf(fileID,'%f\n\n',sigmc);
fprintf(fileID,'Mass of Sample: \n');
fprintf(fileID,'%f\n\n',ms);
fprintf(fileID,'Error in Mass of Sample: \n');
fprintf(fileID,'%f\n\n',sigms);
fprintf(fileID,'Specific Heat of Sample (J/gK): \n');
fprintf(fileID,'%f\n\n',cs);
fprintf(fileID,'Error in Specific Heat of Sample (J/gK): \n');
fprintf(fileID,'%f\n\n',sigcs);
fprintf(fileID,'Identity of Sample: \n');
fprintf(fileID,'Tellurium Copper (Alloy 145) w/ C = 0.261 J/gK');
% Close text file
fclose(fileID);
end

