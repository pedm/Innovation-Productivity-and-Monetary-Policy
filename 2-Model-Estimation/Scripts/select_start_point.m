%% Note
% If you want to change the parameters used in estimation, go to estimation_init.m

% There usually no need to edit this file

%% Define starting point used in estimation

cmd = ['x_start = [' , strjoin(options_.EST.variables, ', '), ']'];
disp(cmd)
eval(cmd)
x_start_unbounded = boundsINV(x_start);
