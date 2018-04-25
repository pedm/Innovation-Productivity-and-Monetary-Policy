clc; clear all; close all;

% find monetary shocks required to match alternative FFR path 

cd Empirical_futureFFR_FORSLOWTIGHTENEXPERIMENT
load ffr_paths2.mat % this contains alternative FFR path - see file "ffr_path2.m" in folder "Empirical_futureFFR_FORSLOWTIGHTENEXPERIMENT" for how to calculate it
cd ..


figure;
plot( year_ffr, ffr_bl ); hold on; plot( year_ffr, ffr_alt ); legend('bl', 'alt');
xlim([2006 2030]);

% start in 2016. construct target path for ffr:
startyear = 2016;
ffr_target = ffr_alt( find(year_ffr==startyear):end ) - ffr_bl( find(year_ffr==startyear):end  );
figure; plot( year_ffr(find(year_ffr==startyear):end), ffr_target ); title('ffr target');

year_target = year_ffr(find(year_ffr==startyear):end); 
clearvars -except ffr_target year_target ffr_alt ffr_bl year_ffr



% starting values
epsilonm0 = -0.8 * ones( length(ffr_target), 1) ;
epsilonm0(1) = 0;

global ffr_target

% search
[epsilonmsol, rc]=csolve(@run_findshocks_distfun, epsilonm0, [], 1e-11, 1000);rc

% compare
[epsilonm0 epsilonmsol]


% check:

load Estimation_Results.mat
ex_ = zeros( length(epsilonmsol), 6);
ex_( : , strmatch('epsilon_m', M_.exo_names,'exact') ) =  epsilonmsol;

% simulate
clear y_ yss_ ydev_ r_diff
y_   = simult_(oo_.dr.ys, oo_.dr, ex_, 1);
yss_ = simult_(oo_.dr.ys, oo_.dr, 0*ex_, 1);
ydev_ = y_ - yss_;

r_diff = ydev_(strmatch('R_nom',M_.endo_names,'exact'),2:end)';

figure;
plot( year_target, ffr_target); hold on;
plot( year_target, 100*r_diff, 'linestyle', '--');
legend('ffr target', 'model simul');

% plot actual epsilons and MONSHK
MONSHK_diff = ydev_(strmatch('MONSHK',M_.endo_names,'exact'),2:end)';

figure
subplot(1,2,1); plot( year_target, epsilonmsol ); title('epsilonm');
subplot(1,2,2); plot( year_target, 100*MONSHK_diff ); title('MONSHK');




% save slowtightening_shocks.mat year_target epsilonmsol ffr_alt ffr_bl year_ffr
















