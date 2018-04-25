function x=mintomod_ab(theta,a,b) 
% Transform a parameter in the (-inf,inf) interval to [a,b]
% This is the inverse function to modtomin_ab.m 
x=0.5*(a+b)+0.5*(b-a)*theta/sqrt(1+theta*theta);

% Code comes from https://www.economicdynamics.org/codes/09/09-248/
% Matlab codes to estimate the baseline DSGE 
% model in “Investment Shocks and the Relative Price of Investment” by 
% Justiniano, Primiceri and Tambalotti (JPT). 