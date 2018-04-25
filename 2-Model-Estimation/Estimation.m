%% Estimation
% Run the mod file, set the estimation options, then perform estimation

addpath('C:\dynare\4.4.3\matlab');
clear; close all; clc; 

%=========================================================================%
%%%%                        CALIBRATED PARAMS                          %%%%
%=========================================================================%

eta     = 0.3042030166;
alpha_N = 0.2943309191;
rhon    = 0.3896777118;
sigman  = 0.1727807792;

rho_lambda = 0.925;

% Tech parameters that do not change
lambda_ss = 0.20;
phi       = 0.90;

% Conventional Params
beta    = 0.9975;     % to match rstar of 1 percent. rstar=log(g/beta) 
alpha   = 0.33;       % capital share
epsilon = 1/2;        % inv Frisch; epsilon=invFrisch=0.5; here FrischE=2;
habit   = 0.5;        % Habit
delta   = 0.1;        % capital deprec
psi_I   = 1.0;        % Adjustment cost to Inv
psi_Im  = 4.0;        % Adjustment cost to adoption inv
psi_N   = 4.0;        % Adjustment cost to R&D

% Growth
vartheta  = 2.4925;  % elast. of subst. across varieties [ mkup = vartheta/(vartheta-1); calibrated to 1/(1-alpha) + 1 ]

% Taylor Rule
gamma_pi =  1.50;
gamma_y  =  1.00;
gamma_r  =  0.00;
gamma_a  =  0.00;

% sticky price parameters
theta    =  0.75;
iotap    =  0.50;     % degree of indexation to past inflation
omegabar =  6.00;     % Markup (exogenous). I took this number from Gertler-Karadi, who take them from estimates by Primiceri et al
pi_ss    =  1.02;     % ss inflation

% sticky wage parameters
thetaw =   0.65;
omegal =   6.00; %4.167;
iotaw  =   0.50; % set these to be the same as their price counterparts as a first approx

% monetary shock persistence
rhom = 0.55;

% steady-state values of endogenous variables:
g_ss      = 1.005^(vartheta-1);          % 1.005 (gross) = 0.5 percent (net) growth rate of measured TFP. gTFP = g^(1/(vartheta-1)) -> gTFP^(vartheta-1)=g
L_ss      =      1;                      % calibrate SS L; back out chi 
mkup_ss   = omegabar/(omegabar-1);

% other shock parameters (not relevant):
rhob = 0.65;
rhoomega = 0.33;
rhotfp   = 0.80;
rhozeta  = 0.00;

sigmab = 0.115;
sigmam = 0.01;
sigmaomega = 0.01;
sigmatfp   = 0.01;
sigmazeta  = 0.01;

%=========================================================================%
%%%%                           RUN DYNARE                              %%%%
%=========================================================================%

% Save mat file for dynare to inport
% save parameterfile.mat phi lambda_ss rhozeta sigmazeta rhon sigman eta sigmab rhob ...
                       % rhoomega rhotfp rhom sigmab sigmatfp sigmaomega sigmam

save parameterfile.mat eta alpha_N rhon sigman rho_lambda lambda_ss phi ...
					   beta alpha epsilon habit delta psi_I psi_Im psi_N vartheta ...
					   gamma_pi gamma_y gamma_r gamma_a theta iotap omegabar ...
					   pi_ss g_ss L_ss mkup_ss thetaw omegal iotaw rhom ...
					   rhob rhoomega rhotfp rhozeta sigmab sigmam sigmaomega ...
					   sigmatfp sigmazeta                       
                   
% If you change the calibration, run the mod file again
% Otherwise you do not need to run dynare every time
dynare endog_baseline.mod;

% Load the resultant oo and M objects
load level0workspace oo_ options_ M_

%=========================================================================%
%%%%                       ESTIMATION OPTIONS                          %%%%
%=========================================================================%

% 1. Max iterations
maxit = 400;

% 2. Which parameters to estimate
options_.EST = [];
options_.EST.variables = { 'eta', 'alpha_N', 'rhon', 'sigman'};

% 3. Starting values     
eta = 0.20;
alpha_N = 0.20;
rhon = 0.30;
sigman = 0.10;

% 4. Parameter bounds
options_.EST.LB.eta = 0.05;  
options_.EST.UB.eta = 0.99;  

options_.EST.LB.alpha_N = 0.01;
options_.EST.UB.alpha_N = 0.90;

options_.EST.LB.rhon = -0.95;
options_.EST.UB.rhon = 0.95;

options_.EST.LB.sigman = 0.001;  
options_.EST.UB.sigman = 12;  

% 5. IRF Length
options_.EST.irf_length = 15; % small scale VAR (used in estimation) 
options_.EST.length_monetary_irfs = 15; % monetary VAR (plotted)
options_.EST.length_large_scale_irfs = 15; % large scale VAR (plotted)

% 6. Small Scale IRFs Filename
options_.EST.csv_filename = 'irfs_small.csv';

%=========================================================================%
%%%%                 PLOT VAR IRF and INITIAL GUESS                    %%%%
%=========================================================================%
% Save estimation options (for use in loop)
save level0workspace oo_ options_ M_

close all;
addpath('Scripts');
addpath('VAR_Results');

% Load and Plot VAR IRFs
SmallScaleVAR_Plot
LargeScaleVAR_Plot
MonetaryVAR_Plot

% Starting point
estimation_init;
select_start_point;
check_bounds;

[ params ] = bounds( x_start_unbounded );
run_model;
post_processing_irfs; 
post_processing_irfs_plot;

% Optional: export plots for paper (and skip estimation)
export_plots

tic
%=========================================================================%
%%%%                       OPTIMIZATION                                %%%%
%=========================================================================%

% Optimizer options
H0 = 1e-2*eye(length(x_start)); % Initial Hessian
H0 = 1e-1*eye(length(x_start)); % Initial Hessian
crit = 1e-6; 					% Tolerance

% options_.qz_criterium = 1+1e-6; % required because it is empty by default, leading to a crash in k_order_pert
[fhat, params_unbounded] = csminwel(@distance_fcn, x_start_unbounded, H0,[],crit,maxit); fhat


%=========================================================================%
%%%%                       PLOT SOLUTION                               %%%%
%=========================================================================%
load level0workspace oo_ options_

% Set parameters using set_param_value()
[ params ] = bounds( params_unbounded );
run_model;
post_processing_irfs; 
post_processing_irfs_plot; 
add_legends_to_plots

% Print Estimation Results
fprintf('\nEstimation Results:\n');
for iii = 1:length( variables )
    disp(sprintf([char(variables( iii )), ' = %0.10g;'], params(iii) ));
end

fhat
toc

