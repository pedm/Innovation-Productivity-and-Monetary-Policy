function [ x_bounded ] = bounds( params )
    % csminwel solves an unconstrained minimization problem.
    % this function converts the unbounded params to a bounded guess
    % Inverse function is boundsINV.m 
    
    global options_
    variables = options_.EST.variables;
    LB = options_.EST.LB;
    UB = options_.EST.UB;
    x_bounded = NaN(size(variables));
    
    % For each parameter we are estimating, set the bounds accordingly
    for iii = 1:length(variables)
        lb = LB.(char(variables(iii)));
        ub = UB.(char(variables(iii)));
        x_bounded( iii ) = mintomod_ab(params( iii ), lb, ub);
    end

end

