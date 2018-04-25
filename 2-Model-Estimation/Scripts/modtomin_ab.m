function theta=modtomin_ab(x,a,b) 
% Transform a parameter in the [a,b] interval to (-inf,inf) 
% Inverse function is mintomod_ab.m 
c=2*( x-0.5*(a+b) )/(b-a); 
theta=c/sqrt(1-c*c);

% Code comes from https://www.economicdynamics.org/codes/09/09-248/
% Matlab codes to estimate the baseline DSGE 
% model in “Investment Shocks and the Relative Price of Investment” by 
% Justiniano, Primiceri and Tambalotti (JPT). 