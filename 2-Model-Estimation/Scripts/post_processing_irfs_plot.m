
%===================================================================%
%%%%            PLOT IRFS                                        %%%%
%===================================================================%

%% Select small scale plot
try
    h = findobj('name', 'Small Scale VAR');
    figure(h);
catch
    figure('name', 'Small Scale VAR');
end

%% Small Scale VAR Plot
jj = 1;
ii = find(ismember(IRnames_dynare, 'RD'));
   subplot(1,2,jj);
   hold on;
   plot( 100*IR_dynare(ii,:), '-o', 'linewidth', 3.25, 'MarkerSize', 3.25); 
   hold off;
   axis tight;
   jj = jj + 1;

ii = find(ismember(IRnames_dynare, 'TFP'));
   subplot(1,2,jj);
   hold on;
   plot( 100*IR_dynare(ii,:), '-o', 'linewidth', 3.25, 'MarkerSize', 3.25); 
   hold off;
   axis tight;


%=========================================================================%
%%%%            PLOT LARGE SCALE IRFS                                  %%%%
%=========================================================================%

%% Select Large Scale VAR Plot
try
    h = findobj('name', 'Large Scale VAR' );
    fig = figure(h);
catch
    fig = figure('name', 'Large Scale VAR', 'position', [143.4000 97 1.2304e+03 588] );
end

%% Generate IRFs

sizeir = options_.EST.length_large_scale_irfs;

% set shock for IRF
ex_ = zeros( sizeir, 6);
ex_(1, strmatch('epsilon_n', M_.exo_names,'exact') ) = 1; % innovation wedge shock

% simulate
clear y_ yss_ ydev_ g A_ir_ALT1 IR_ALT1
y_   = simult_(oo_.dr.ys, oo_.dr, ex_, 1);
yss_ = simult_(oo_.dr.ys, oo_.dr, 0*ex_, 1);
ydev_ = y_ - yss_;

g = ydev_(strmatch('g', M_.endo_names, 'exact'), :)'; % first is zero bc first obs is SS; so no need to add 0 to A_ir
A_ir_ALT1     = [ cumsum( g )];
A_ir_ALT1 = A_ir_ALT1(1:end-1); % cut last one

IR_ALT1 = [  
ydev_(strmatch('YD',M_.endo_names,'exact'),2:end)' + A_ir_ALT1,... %% GDP
ydev_(strmatch('ND',M_.endo_names,'exact'),2:end)' + A_ir_ALT1,... %% R&D
ydev_(strmatch('CD',M_.endo_names,'exact'),2:end)' + A_ir_ALT1,... %% Consumption
ydev_(strmatch('ID',M_.endo_names,'exact'),2:end)' + A_ir_ALT1,... %% Investment
(1/(vartheta-1))*A_ir_ALT1,...                                     %% TFP
ydev_(strmatch('pi',M_.endo_names,'exact'),2:end)',...             %% Inflation
ydev_(strmatch('R_nom',M_.endo_names,'exact'),2:end)',...          %% FFR
ydev_(strmatch('DELTAN',M_.endo_names,'exact'),2:end)',...         %% Innov Wedge
];

%% Plot Large Scale Responses

for i = 1:7

    subplot(2,4,i); 
    hold on;
    plot(       IR_ALT1(:,i) * 100, '-o', 'linewidth', 2.75, 'MarkerSize', 2.75); 
    axis tight;
    

    if i ==8
        title('DELTAN')
        ylabel('%')
    end

end


%===================================================================%
%%%%            PLOT MONETARY IRFS                               %%%%
%===================================================================%

%% Select Monetary VAR Plot
try
    h = findobj('name', 'Monetary VAR');
    fig = figure(h);
catch
    fig = figure('name', 'Monetary VAR', 'position', [143.4000 97 1.2304e+03 588] );
end

%% Compute Response to Monetary Shock

post_processing_irfs_monetary

IRF_MON = [  
    ydev_(strmatch('YD',M_.endo_names,'exact'),2:end)' + A_ir_ALT1,... %% GDP
    ydev_(strmatch('ND',M_.endo_names,'exact'),2:end)' + A_ir_ALT1,... %% R&D
    ydev_(strmatch('CD',M_.endo_names,'exact'),2:end)' + A_ir_ALT1,... %% Consumption
    ydev_(strmatch('ID',M_.endo_names,'exact'),2:end)' + A_ir_ALT1,... %% Investment
    (1/(vartheta-1))*A_ir_ALT1,...                                     %% TFP
    ydev_(strmatch('pi',M_.endo_names,'exact'),2:end)',...             %% Inflation
    ydev_(strmatch('R_nom',M_.endo_names,'exact'),2:end)',...          %% FFR
    ydev_(strmatch('MONSHK',M_.endo_names,'exact'),2:end)',...         %% Monetary shock
];



%% Plot Monetary Shock

for i = 1:7

    subplot(2,4,i); 
    hold on;
    plot(       -1*IRF_MON(:,i) * 100, '-o', 'linewidth', 2.75, 'MarkerSize', 2.75); 
    axis tight;

    if i ==8
        title('MONSHK')
        ylabel('%')
        xlabel('years')
    end

end

%% Draw now (create plots even while estimation runs)
drawnow

