


%% Select Large Scale VAR Plot
try
    h = findobj('name', 'Large Scale VAR');
    fig = figure(h);
catch
    fig = figure('name', 'Large Scale VAR', 'position', [143.4000 97 1.2304e+03 588] );
end

axesfig  = get(fig, 'CurrentAxes');
childfig = get(axesfig, 'Children');

leg_fig = legend(childfig([1 2]), 'Final Guess', 'Initial Guess');
set(leg_fig, 'Position',  [0.8066 0.1384 0.0954 0.0621] );



%% Select Monetary VAR Plot
try
    h = findobj('name', 'Monetary VAR');
    fig = figure(h);
catch
    fig = figure('name', 'Monetary VAR', 'position', [143.4000 97 1.2304e+03 588] );
end

axesfig  = get(fig, 'CurrentAxes');
childfig = get(axesfig, 'Children');

leg_fig = legend(childfig([1 2]), 'Final Guess', 'Initial Guess');

%% Select Small Scale VAR
try
    h = findobj('name', 'Small Scale VAR');
    fig = figure(h);
catch
    fig = figure('name', 'Small Scale VAR');
end

axesfig  = get(fig, 'CurrentAxes');
childfig = get(axesfig, 'Children');

leg_fig = legend(childfig([1 2 3]), 'Final Guess', 'Initial Guess', 'Data');
set(leg_fig, 'position',  [0.8011 0.1433 0.0993 0.1281] );