clc; clear all; close all;

%% estimation results when imposing alpha_N = 0 (i.e. no adoption spillover):
% % eta = 0.9899253541;  % pushes eta to the boundary
% % rhon = 0.7438358726;
% % sigman = 0.07869333013;

% dynare endog_baseline.mod; % run dynare if not in memory
load Estimation_Results.mat;

%%%% ===== BASELINE SIMUL ==== %%%%%

% set shock for IRF
sizeir = 15;
ex_ = zeros( sizeir, 6);
ex_(1, strmatch('epsilon_n',M_.exo_names,'exact') ) =  1;

% simulate
clear y_ yss_ ydev_ A_ir_BL IR_BL
y_   = simult_(oo_.dr.ys, oo_.dr, ex_, 1);
yss_ = simult_(oo_.dr.ys, oo_.dr, 0*ex_, 1);
ydev_ = y_ - yss_;

eta_BL = M_.params( strmatch('eta', M_.param_names,'exact') );

vartheta = M_.params( strmatch('vartheta', M_.param_names,'exact') );
lambda_ss = M_.params( strmatch('lambda_ss', M_.param_names,'exact') );


A_ir_BL = [  cumsum( ydev_(strmatch('g', M_.endo_names, 'exact'), 1:end-1)' )];

IR_BL = [ 
ydev_(strmatch('ND',M_.endo_names,'exact'),2:end)' + A_ir_BL,...
ydev_(strmatch('VD',M_.endo_names,'exact'),2:end)' + A_ir_BL,...
ydev_(strmatch('ZD',M_.endo_names,'exact'),2:end)' + A_ir_BL,...
lambda_ss*exp(ydev_(strmatch('lambda',M_.endo_names,'exact'),2:end)'),...
A_ir_BL,...
(1/(vartheta-1))*A_ir_BL,...
];

IR_names = {'R&D', 'New innovation (V)', 'Stock of innovations (Z)',...
            'Adoption rate (\lambda)', 'Adopted innovations (A)', 'TFP'}; 
        
        

%%%% === ALTERNATIVE: NO ADOPTION SPILLOVER == %%%%%
M_.params( strmatch('alpha_N', M_.param_names,'exact'), : ) = 0;
M_.params( strmatch('eta', M_.param_names,'exact'), : )     = 0.9899253541;
M_.params( strmatch('rhon', M_.param_names,'exact'), : )    = 0.7438358726;
M_.params( strmatch('sigman', M_.param_names,'exact'), : )  = 0.07869333013;




% update decision rules
[oo_.dr, info, M_, options_] = resol(0, M_, options_,oo_);

% simulate
clear y_ yss_ ydev_ a_ir_ALT1 IR_ALT1
y_   = simult_(oo_.dr.ys, oo_.dr, ex_, 1);
yss_ = simult_(oo_.dr.ys, oo_.dr, 0*ex_, 1);
ydev_ = y_ - yss_;
        
A_ir_ALT1 = [  cumsum( ydev_(strmatch('g', M_.endo_names, 'exact'), 1:end-1)' )];

IR_ALT1 = [ 
ydev_(strmatch('ND',M_.endo_names,'exact'),2:end)' + A_ir_ALT1,...
ydev_(strmatch('VD',M_.endo_names,'exact'),2:end)' + A_ir_ALT1,...
ydev_(strmatch('ZD',M_.endo_names,'exact'),2:end)' + A_ir_ALT1,...
lambda_ss*exp(ydev_(strmatch('lambda',M_.endo_names,'exact'),2:end)'),...
A_ir_ALT1,...
(1/(vartheta-1))*A_ir_ALT1,...
];



        
% % set ylimits for figure
ylimits = [0 6; % R&D
           0 6; % V
           0 2; % Z
        19.5 20.5; % lambda
           0 1; % A
           0 .8];% TFP
       
sizeir =  size(IR_BL,1);       
fig = figure('position',  [218 190 1421 790]  );        
for i = 1:size(IR_BL,2);
subplot(2,3,i); 
plot(       IR_BL(:,i) * 100, 'linewidth', 2.5); hold on;
plot(     IR_ALT1(:,i) * 100, 'linewidth', 2, 'linestyle', '-.', 'color', [0 .5 0]); 
% ylim( ylimits(i,:) );
xlim( [1 sizeir] );
if i==4; ylabel('%'); else ylabel('% dev'); end;
if i==4; plot(  lambda_ss*100 * ones(sizeir,1) , 'linewidth', 1.5, 'color', 'k', 'linestyle', ':'); end;
xlabel('years');
title(IR_names(i));
end    
leg = legend( 'Baseline',...
              'No adoption spillover' );
leg.Position =  [0.1756 0.8499 0.1647 0.0692];
set(gcf,'Color',[1 1 1]); % make the background white

% Requires export_fig, available on mathworks file exchange
% export_fig Fig4_NoSpillover -eps
% export_fig Fig4_NoSpillover -pdf















        
        