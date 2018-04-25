clc; clear all; close all;

addpath('C:\dynare\4.4.1\matlab');

% dynare endog_baseline.mod; % run dynare if not in memory
load Estimation_Results.mat

sizeir = 15;

% set shock for IRF
ex_ = zeros( sizeir, 6);
ex_(1, strmatch('epsilon_m', M_.exo_names,'exact') ) = 1 * 0.25 / 0.5677; % 


% update decision rules
[oo_.dr, info, M_, options_] = resol(0, M_, options_,oo_);

% simulate
clear y_ yss_ ydev_ g A_ir_ALT1 IR_ALT1
y_   = simult_(oo_.dr.ys, oo_.dr, ex_, 1);
yss_ = simult_(oo_.dr.ys, oo_.dr, 0*ex_, 1);
ydev_ = y_ - yss_;

% rescale to get FFR rise of 0.594 in the first year:
FFR = ydev_(strmatch('R_nom',M_.endo_names,'exact'),2:end)';
ydev_= ydev_ * ( 0.6082 / (100*FFR(1)) );
A_ir = [  cumsum( ydev_(strmatch('g', M_.endo_names, 'exact'), 1:end-1)' )];

vartheta = M_.params( strmatch('vartheta', M_.param_names,'exact') );
lambda_ss = M_.params( strmatch('lambda_ss', M_.param_names,'exact') );

V_ir        = ydev_(strmatch('VD',M_.endo_names,'exact'),2:end)' + A_ir;
lambda_ir   = lambda_ss ./ exp(ydev_(strmatch('lambda',M_.endo_names,'exact'),2:end)');
M_ir        = ydev_(strmatch('M',M_.endo_names,'exact'),2:end)';
LAMJ_ir     = ydev_(strmatch('LAMBDAJlead',M_.endo_names,'exact'),2:end)';
LAMHJ_ir    = ydev_(strmatch('LAMBDAHJlead',M_.endo_names,'exact'),2:end)';
R_real_ir   = ydev_(strmatch('R_real',M_.endo_names,'exact'),2:end)';

R_nom_ir   = ydev_(strmatch('R_nom',M_.endo_names,'exact'),2:end)';


        
fig = figure('position', [310 180 1364 776] );
subplot(2,3,1);
plot(       -1*V_ir * 100, 'linewidth', 2.50 );
xlabel('years');
ylabel('% dev');
title('New innovation (V)');
ylim([-0.02 0.2]);

subplot(2,3,2);
plot(      lambda_ir*100, 'linewidth', 2.50 ); 
hh = hline(lambda_ss*100, 'k:', {'', 'steady state'}); set(hh, 'linewidth', 1.5);
ylim([19.96 20.1]);
xlabel('years');
ylabel('%');
title('Adoption rate (\lambda)');        

subplot(2,3,3);
plot(       -1*M_ir * 100, 'linewidth', 2.50 );
xlabel('years');
ylabel('% dev');
title('Adoption expenditure per innovation (M)');
ylim([-0.15 0.5]);

subplot(2,3,4);
plot(       -1*LAMJ_ir * 100, 'linewidth', 2.50 );
xlabel('years');
ylabel('% dev');
title('Discounted value of innovation, E[\LambdaJ]');
ylim([-0.1 1.2]);

subplot(2,3,5);
plot(      -1*LAMHJ_ir * 100, 'linewidth', 2.50 );
xlabel('years');
ylabel('% dev');
title('Discounted value of adoption, E[\Lambda(H-J)]');
ylim([-0.1 1.2]);

subplot(2,3,6);
plot(      -1*R_real_ir * 100, 'linewidth', 2.50 );
xlabel('years');
ylabel('% dev');
title('Real interest rate');

set(gcf,'Color',[1 1 1]); % make the background white

% Requires export_fig, available on mathworks file exchange
% export_fig Fig7_MonetaryAdd_no_subs -eps
% export_fig Fig7_MonetaryAdd_no_subs -pdf
