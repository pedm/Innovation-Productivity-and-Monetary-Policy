%% Initialize Estimation
% No need to edit code beyond this line

global options_

%% Distance between Bounds
% No need to edit this

% (Only used in grid search)

options_.EST.DIST = [];
FF = options_.EST.variables;
for ii = 1:length(FF)
    var_ii = char(FF(ii));
    options_.EST.DIST.(var_ii) = options_.EST.UB.(var_ii) - options_.EST.LB.(var_ii);
end
