clc; clear all; close all; 


cd Empirical_Taylor_Rules_FORZLBEXPERIMENT
load shocks_zlb.mat
cd ..


MONSHK_target = rm_shocks_zlb( year_zlb>=2006 & year_zlb<=2015 );
year_target   = year_zlb( year_zlb>=2006 & year_zlb<=2015 );
clear rm_shocks_zlb year_zlb


% load current estimation results
load Estimation_Results.mat


% get persistence parameter of monetary shock
rhom   = M_.params( strmatch('rhom', M_.param_names,'exact') );
sigmam = M_.params( strmatch('sigmam', M_.param_names,'exact') );

% get sequence of innovations to monetary shock required to reproduce target sequence of rm (rm_target)
% Use:
% MONSHK = rhom * MONSHK(-1) + sigmam * epsilon_m;

epsilon_m_target = zeros(size(MONSHK_target));
epsilon_m_target(1) = MONSHK_target(1) / sigmam;

for t = 2:length(MONSHK_target);
    epsilon_m_target(t) = ( MONSHK_target(t) - rhom * MONSHK_target(t-1) )/sigmam;   
end


%  run model simulation with these shocks
sizeir = 20;
ex_ = zeros( sizeir, 6);
ex_(1:length(epsilon_m_target) , strmatch('epsilon_m', M_.exo_names,'exact') ) =  epsilon_m_target;



% simulate
clear y_ yss_ ydev_  A_diff all_diff gdp_dif rd_diff tfp_diff infl_diff
y_   = simult_(oo_.dr.ys, oo_.dr, ex_, 1);
yss_ = simult_(oo_.dr.ys, oo_.dr, 0*ex_, 1);
ydev_ = y_ - yss_;



A_diff =  [ cumsum( ydev_(strmatch('g', M_.endo_names, 'exact'), 1:end-1)' )];

vartheta = M_.params( strmatch('vartheta', M_.param_names,'exact') );

all_diff = [  
ydev_(strmatch('R_nom',M_.endo_names,'exact'),2:end)',...          %% FFR
ydev_(strmatch('YD',M_.endo_names,'exact'),2:end)' + A_diff,...    %% GDP
ydev_(strmatch('ND',M_.endo_names,'exact'),2:end)' + A_diff,...    %% R&D
(1/(vartheta-1))*A_diff,...                                        %% TFP
ydev_(strmatch('pi',M_.endo_names,'exact'),2:end)',...             %% Inflation
ydev_(strmatch('MONSHK',M_.endo_names,'exact'),2:end)',...         %% Monetary shock
];

names = {'FFR', 'GDP', 'R&D', 'TFP', 'Inflation', 'MONSHK'};        


gdp_diff = ydev_(strmatch('YD',M_.endo_names,'exact'),2:end)' + A_diff;
rd_diff  = ydev_(strmatch('ND',M_.endo_names,'exact'),2:end)' + A_diff;
tfp_diff = (1/(vartheta-1))*A_diff;
infl_diff= ydev_(strmatch('pi',M_.endo_names,'exact'),2:end)';
MONSHK_diff= ydev_(strmatch('MONSHK',M_.endo_names,'exact'),2:end)';



cd Empirical_Taylor_Rules_FORZLBEXPERIMENT
load ffr_data.mat
cd ..

% first plot is FFR, actual and counterfactual
fig = figure('position', [118 66 1606 916] );
subplot(2,3,1);
plot( year, ffr_a, 'linewidth', 2, 'color', 'k' ); hold on;
plot( year, taylor_counterf, 'linewidth', 1.75, 'color', [.3 .3 .3], 'linestyle', '-.');   
hold off;
xlim([2006 2006+sizeir-1]);
title('Fed funds rate');
ylabel('%');
ylim([-8 8.25]);
shade(2016, 2006+sizeir-1, [0.95 0.95 0.95])

axesfig  = get(fig, 'CurrentAxes');
childfig = get(axesfig, 'Children');
leg = legend(childfig([2 1]), 'actual','alternative (no \Delta^R_t shocks enforcing ZLB)');
legend('boxoff');




year_diff = (2006:2006+sizeir-1)';
subplot(2,3,2);
plot(  year_diff, -MONSHK_diff * 100, 'linewidth', 2, 'color', 'k' ); hold on;
plot(  year_diff, zeros(size(MONSHK_diff)), 'linewidth', 1.75, 'color', [.3 .3 .3], 'linestyle', '-.');   
hold off;
title('Shock to Taylor rule (\Delta^r_t)');
ylabel('%');
ylim([-8 8.25]);
xlim([2006 2006+sizeir-1]);
shade(2016, 2006+sizeir-1, [0.95 0.95 0.95])

axesfig  = get(fig, 'CurrentAxes');
childfig = get(axesfig, 'Children');
leg = legend(childfig([2 1]), 'baseline','alternative');
legend('boxoff');



load ZLBexog.mat % produced by running run_zlb_experiment_EXOG.m

subplot(2,3,3);
plot(  year_diff, gdp_diff * 100, 'linewidth', 2.5  ); hold on;
plot(  year_diff, gdp_diff_exog * 100, 'linewidth', 2.0, 'linestyle', '--', 'color', [0 .5 0]  ); hold off;
title('GDP, alternative rel. to baseline');
ylabel('% diff.');
ylim([-0.5 5]);
shade(2016, 2006+sizeir-1, [0.95 0.95 0.95])
xlim([2006 2006+sizeir-1]);

subplot(2,3,4);
plot(  year_diff, infl_diff * 100, 'linewidth', 2.5  ); hold on;
plot(  year_diff, infl_diff_exog * 100, 'linewidth', 2.0, 'linestyle', '--', 'color', [0 .5 0]  );  hold off;
title('Inflation, alternative rel. to baseline');
ylabel('pp. diff.');
ylim([-0.2 0.8]);
shade(2016, 2006+sizeir-1, [0.95 0.95 0.95])
xlim([2006 2006+sizeir-1]);

subplot(2,3,5);
plot(  year_diff, rd_diff * 100, 'linewidth', 2.5  ); 
title('R&D, alternative rel. to baseline');
ylabel('% diff.');
ylim([-1 5]);
shade(2016, 2006+sizeir-1, [0.95 0.95 0.95])
xlim([2006 2006+sizeir-1]);

subplot(2,3,6);
plot(  year_diff, tfp_diff * 100, 'linewidth', 2.5  ); hold on;
plot(  year_diff, tfp_diff_exog * 100, 'linewidth', 2.0, 'linestyle', '--', 'color', [0 .5 0]  ); hold off;
title('TFP level, alternative rel. to baseline');
ylabel('% diff.');
ylim([-0.5 2]);
shade(2016, 2006+sizeir-1, [0.95 0.95 0.95])
xlim([2006 2006+sizeir-1]);


axesfig  = get(fig, 'CurrentAxes');
childfig = get(axesfig, 'Children');
leg = legend(childfig([2 1]), 'Baseline model', 'Exogenous growth model');
set(leg,'position',[0.6984 0.3981 0.1196 0.0415]);



set(gcf,'Color',[1 1 1]); % make the background white

% Requires export_fig, available on mathworks file exchange
% export_fig Fig8_ZLB -eps
% export_fig Fig8_ZLB -pdf
