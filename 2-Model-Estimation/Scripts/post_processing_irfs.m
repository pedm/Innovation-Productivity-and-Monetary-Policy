
%===================================================================%
%%%%            PRODUCE CUMMULATIVE IRFS                         %%%%
%===================================================================%

% In linear form, detrended variables are defined as:
% Y_D = Y / A
% And growth rate g equals:
% g = A(+1) / A
% A(+1) = g * A

% With loglinear option specified, everything becomes: 
% logY = logY_D + logA
% logA = log(g(-1)) + logA(-1)

% Compute productivity (lagged cumsum of productivity growth log(g) )
A = [0, cumsum(oo_.irfs.g_epsilon_n(1:end-1))];

vartheta_location = strmatch('vartheta', M_.param_names);
vartheta_value = M_.params(vartheta_location);
oo_.irfs.TFP_epsilon_n = [1/(vartheta_value-1)] * A;

% Modify the detrended variables
oo_.irfs.RD_epsilon_n = oo_.irfs.ND_epsilon_n + A;
oo_.irfs.Y_epsilon_n = oo_.irfs.YD_epsilon_n + A;
oo_.irfs.I_epsilon_n = oo_.irfs.ID_epsilon_n + A;
oo_.irfs.C_epsilon_n = oo_.irfs.CD_epsilon_n + A;
oo_.irfs.S_epsilon_n = oo_.irfs.SD_epsilon_n + A;

% List of variables to use:
% Y, TFP, RD, I, C, pi, R_nom, S
% These correspond to:
% GDP, TFP, R&D, Investment, C, Infl, R, SP

% Save names
IRnames_dynare = fieldnames(oo_.irfs);

% Save data
IR_dynare = NaN(length(IRnames_dynare), options_.EST.irf_length);

for ii = 1:length(IRnames_dynare)
    full_irf = getfield(oo_.irfs, char(IRnames_dynare(ii)));
    IR_dynare(ii, :) = full_irf(1:options_.EST.irf_length);
end
IRnames_dynare = strrep(IRnames_dynare, '_epsilon_n', '');
IRnames_dynare = strrep(IRnames_dynare, '_', '');
