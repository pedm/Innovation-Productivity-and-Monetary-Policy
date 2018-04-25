clc; clear all; close all;

load slowtightening_shocks.mat; % obtained by running run_findshocks_slowtightening.m
year_shocks = year_target; clear year_target;


Tadd = 6; % shocks currently run through 2030 (see year_shocks); add a few more


year =[
year_shocks;
(year_shocks(end)+1:year_shocks(end)+Tadd)';
];


% load current estimation 
load Estimation_Results.mat


% set shocks
epsilonm =[
epsilonmsol;
zeros( Tadd,1)];

ex_ = zeros( length(epsilonm), 6);
ex_( : , strmatch('epsilon_m', M_.exo_names,'exact') ) =  epsilonm;



% simulate
clear y_ yss_ ydev_  r_diff A_diff gdp_diff rd_diff tfp_diff infl_diff MONSHK_diff
y_   = simult_(oo_.dr.ys, oo_.dr, ex_, 1);
yss_ = simult_(oo_.dr.ys, oo_.dr, 0*ex_, 1);
ydev_ = y_ - yss_;


vartheta = M_.params( strmatch('vartheta', M_.param_names,'exact') );

r_diff = ydev_(strmatch('R_nom',M_.endo_names,'exact'),2:end)';
A_diff =  [ cumsum( ydev_(strmatch('g', M_.endo_names, 'exact'), 1:end-1)' )];
gdp_diff = ydev_(strmatch('YD',M_.endo_names,'exact'),2:end)' + A_diff;
rd_diff  = ydev_(strmatch('ND',M_.endo_names,'exact'),2:end)' + A_diff;
tfp_diff = (1/(vartheta-1))*A_diff;
infl_diff= ydev_(strmatch('pi',M_.endo_names,'exact'),2:end)';
MONSHK_diff= ydev_(strmatch('MONSHK',M_.endo_names,'exact'),2:end)';






ffr_alt2 = [ffr_bl; ffr_bl(end)*ones(Tadd,1)];

ffr_alt2( find(year_ffr==2016) : end ) = ffr_alt2( find(year_ffr==2016) : end ) + 100*r_diff;

year_ffr_add = [
year_ffr;
(year_ffr(end)+1:year_ffr(end)+Tadd)'];







%%------------------%%%
%% ----- PLOT ------ %%
%%%-----------------%%%

nice_blue = [0  0.447  0.741];

% first plot is FFR, actual and counterfactual
fig = figure('position', [118 66 1606 916] );
subplot(2,3,1);
plot( year_ffr_add, [ffr_bl; ffr_bl(end)*ones(Tadd,1)], 'linewidth', 2, 'color', 'k' ); hold on;
plot( year_ffr_add, ffr_alt2, 'linewidth', 1.75, 'color', [.3 .3 .3], 'linestyle', '-.');   
hold off;
xlim([2006 2036]);
title('Fed funds rate');
ylabel('%');
ylim([-.25 5.5]);
shade(2016, 2036, [0.95 0.95 0.95])

axesfig  = get(fig, 'CurrentAxes');
childfig = get(axesfig, 'Children');
leg = legend(childfig([2 1]), 'baseline','alternative');
legend('boxoff');

year_append = [ ((year(1)-10):year(1)-1)'; year ];
Tadd = 10;
subplot(2,3,2);
plot(  year_append, zeros(size(MONSHK_diff)+10),  'linewidth', 2, 'color', 'k' ); hold on;
plot(  year_append, [zeros(Tadd,1); MONSHK_diff * 100], 'linewidth', 1.75, 'color', [.3 .3 .3], 'linestyle', '-.');   
hold off;
title('Shock to Taylor rule (\Delta^r_t)');
ylabel('%');
ylim([-3 1]);
xlim([2006 2036]);
shade(2016, 2036, [0.95 0.95 0.95])

axesfig  = get(fig, 'CurrentAxes');
childfig = get(axesfig, 'Children');
leg = legend(childfig([2 1]), 'baseline','alternative');
legend('boxoff');


load slowtighteningexog.mat % produced by running run_slowtightening_experiment_EXOG.m

subplot(2,3,3);
plot(  year_append, [zeros(Tadd,1); gdp_diff * 100], 'linewidth', 2.5  ); hold on;
plot(  year_append, [zeros(Tadd,1); gdp_diff_exog * 100], 'linewidth', 2.0, 'linestyle', '--', 'color', [0 .5 0]  ); hold off;
title('GDP, alternative rel. to baseline');
ylabel('% diff.');
ylim([-0.5 2.5]);
xlim([2006 2036]);
shade(2016, 2036, [0.95 0.95 0.95])


subplot(2,3,4);
plot(  year_append, [zeros(Tadd,1); infl_diff * 100], 'linewidth', 2.5  ); hold on;
plot(  year_append, [zeros(Tadd,1); infl_diff_exog * 100], 'linewidth', 2.0, 'linestyle', '--', 'color', [0 .5 0]  ); hold off;
title('Inflation, alternative rel. to baseline');
ylabel('pp. diff.');
ylim([-0.1 .25]);
xlim([2006 2036]);
shade(2016, 2036, [0.95 0.95 0.95])


subplot(2,3,5);
plot(  year_append, [zeros(Tadd,1); rd_diff * 100], 'linewidth', 2.5  ); 
title('R&D, alternative rel. to baseline');
ylabel('% diff.');
ylim([-0.5 2.5]);
xlim([2006 2036]);
shade(2016, 2036, [0.95 0.95 0.95])


subplot(2,3,6);
plot(  year_append, [zeros(Tadd,1); tfp_diff * 100], 'linewidth', 2.5  ); hold on;
plot(  year_append, [zeros(Tadd,1); tfp_diff_exog * 100], 'linewidth', 2.0, 'linestyle', '--', 'color', [0 .5 0]  ); hold off;
title('TFP level, alternative rel. to baseline');
ylabel('% diff.');
ylim([-0.5 2.5]);
xlim([2006 2036]);
shade(2016, 2036, [0.95 0.95 0.95])

set(gcf,'Color',[1 1 1]); % make the background white


% Requires export_fig, available on mathworks file exchange
% export_fig Fig9_SlowTightening -eps
% export_fig Fig9_SlowTightening -pdf
