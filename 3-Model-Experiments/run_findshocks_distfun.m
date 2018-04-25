function dist = run_findshocks_distfun( xx ); % find shocks to match FFR target in "slowtightening" experiment
global ffr_target
load Estimation_Results.mat

[~,cols]=size(xx);

for i=1:cols   

epsilonm = xx(:,i);
    
ex_ = zeros( length(epsilonm), 6);
ex_( : , strmatch('epsilon_m', M_.exo_names,'exact') ) =  epsilonm;

% simulate
clear y_ yss_ ydev_  
y_   = simult_(oo_.dr.ys, oo_.dr, ex_, 1);
yss_ = simult_(oo_.dr.ys, oo_.dr, 0*ex_, 1);
ydev_ = y_ - yss_;

r_diff = ydev_(strmatch('R_nom',M_.endo_names,'exact'),2:end)';


% distance: 
dist(:,i) = abs( 100*r_diff - ffr_target );

end

end

