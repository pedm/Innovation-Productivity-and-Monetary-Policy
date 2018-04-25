%% Run model given params

% Set parameters using set_param_value()
variables = options_.EST.variables;
for iii = 1:length( variables )
    set_param_value( char(variables( iii )) , params( iii ) );
end

% Run stoch_simul funtion from dynare
options_.nocorr = 1;
options_.nograph = 1;
options_.nomoments = 1;
options_.order = 1;

options_.periods = 600;
options_.irf = options_.EST.irf_length;
options_.loglinear = 0;
options_.nodisplay = 0;
options_.noprint = 0;
options_.irf_shocks=[];
options_.irf_shocks = 'epsilon_n';

steady;

var_list_=[];
info = stoch_simul(var_list_);
