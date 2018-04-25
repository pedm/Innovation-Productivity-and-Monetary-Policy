function [ f ] = distance_fcn( params_unbounded )

    % get Dynare structures
    global oo_ M_ options_ DATA
    % This ensures that we don't use the dr or irfs from the last stoch_simul()
    load level0workspace oo_ options_

    %% 1. Update parameters
    [ params ] = bounds( params_unbounded );
    variables = options_.EST.variables;
    for iii = 1:length( variables )
        set_param_value( char(variables( iii )) , params( iii ) );
    end

    try
        %% 2. Solve Again
        % Here we want to run the following dynare command:
        % stoch_simul(order=1,periods=600, irf=10, nograph, nodisplay, nocorr, nofunctions, nomoments, noprint, loglinear);
        % Dynare commands do not work in m files. Here's what it is in matlab:
        
        options_.irf = options_.EST.irf_length;
        options_.loglinear = 0;
        options_.nocorr = 1;
        options_.nodisplay = 1;
        options_.nograph = 1;
        options_.nomoments = 1;
        options_.noprint = 1;          % this turns off all display
        options_.order = 1;
        options_.periods = 600;
        options_.irf_shocks=[];
        options_.irf_shocks = 'epsilon_n';
        var_list_=[];
        info = stoch_simul(var_list_); 
        
        %% 3. Compute Distance from IRFs
        post_processing_irfs;                                              % Create IRFs with trend
        post_processing_irfs_distance;                                     % Compute distance between model and VAR IRFs
        
        if sum(oo_.steady_state == Inf) > 0
            % Dynare got a steady state with Inf values
            disp('Dynare got a steady state with Inf values. Why?')
            f = 10000000000;
        else
            f = irf_distance;
        end
    catch
        disp('Error: No ss or no irfs found')
        % Dynare threw an error. Apply large penalty
        f = 10000000000;
    end
    
end

