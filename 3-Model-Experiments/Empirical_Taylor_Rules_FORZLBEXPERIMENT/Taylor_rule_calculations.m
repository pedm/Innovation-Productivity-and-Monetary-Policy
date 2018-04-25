% go with the unemployment gap rule. Either GDP deflator or core.
% try to figure out what the delay is due to...

clc; clear all; close all; 
load_data_for_TaylorRule;


% annualize 
ffr_a      = NaN( (length(ffr)-1)/4 , 1);
unemp_a    = NaN( (length(ffr)-1)/4 , 1);
infl_a     = NaN( (length(ffr)-1)/4 , 1);
inflMA_a   = NaN( (length(ffr)-1)/4 , 1);
for t=1:length(ffr_a);
    ffr_a(t)    = mean( ffr( 4*t-3:4*t ) );
    unemp_a(t)  = mean( unemp( 4*t-3:4*t ) );
    infl_a(t)   = sum( infl( 4*t-3:4*t ) );
    inflMA_a(t) = mean( inflMA( 4*t-3:4*t ) );
end
year = (1958:2016)';



taylor = 1 -.5*2 + 1.5*inflMA_a - 2*(unemp_a-4.8);
figure
plot( year, ffr_a, 'linewidth', 1.5 ); hold on;
plot( year, taylor );
xlim([1999 2018]);
legend('FFR','Taylor');


%% Counterfactual path of FFR: positive realizations of taylor rule error term are 0 from 2009 through 2014.

taylor_counterf = ffr_a;
taylor_counterf( year>=2009 & year<=2014 ) = taylor( year>=2009 & year<=2014 );
figure
plot( year, ffr_a, 'linewidth', 1.5 ); hold on;
plot( year, taylor_counterf);
xlim([2006 2018]);
legend('FFR actual','FFR counterfactual');



% save data:
% rm_shocks_zlb = (taylor_counterf - ffr_a)/100;
% year_zlb = year;
% save shocks_zlb.mat rm_shocks_zlb year_zlb
% % save this
% save ffr_a, taylor_counterf also
% save ffr_data.mat year ffr_a taylor_counterf










