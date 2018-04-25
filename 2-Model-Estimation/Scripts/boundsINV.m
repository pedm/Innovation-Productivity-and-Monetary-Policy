function [ x_unbounded ] = boundsINV( params )
    % csminwel solves an unconstrained minimization problem.
    % this function converts the bounded params to an unbounded guess
    % Inverse function is bounds.m 
    
    global options_
    variables = options_.EST.variables;
    LB = options_.EST.LB;
    UB = options_.EST.UB;
    x_unbounded = NaN(size(variables));
    
    % For each parameter we are estimating, set the bounds accordingly
    for iii = 1:length(variables)
        lb = LB.(char(variables(iii)));
        ub = UB.(char(variables(iii)));
        x_unbounded( iii ) = modtomin_ab(params( iii ), lb, ub);
    end

end
