%===================================================================%
%%%%             CLEAN PLOTS                                     %%%%
%===================================================================%

% this code relies on the export_fig matlab package

export_on = 0;

%% Select Monetary VAR Plot
try
    h = findobj('name', 'Monetary VAR' );
    fig = figure(h);
catch
    fig = figure('name', 'Monetary VAR', 'position', [137.8000 41.8000 1.2616e+03 740.8000] );
end

fig.Color = [1 1 1];
axesfig  = get(fig, 'CurrentAxes');
childfig = get(axesfig, 'Children');

leg_fig = legend(childfig([1 2 3]), 'Model', 'Data', 'Data (95% Band)');
set(leg_fig, 'Position',  [0.7725 0.2523 0.1169 0.0901] );

for i = 1:7
    subplot(2,4,i)
    xlim([1 15])
    axesfig  = get(fig, 'CurrentAxes');
%     axesfig.XTick = [ 2:2:12]; % if length is 12
    axesfig.XTick = [ 1:2:15];
    
    ylab = ylabel('% dev');
    ylab.FontSize = 10;
    
    xlab = xlabel('years');
    xlab.FontSize = 10;
end

subplot(2,4,1)
ylim([-0.28 1])

% R&d
subplot(2,4,2)
ylim([-0.28 1])

% TFP
subplot(2,4,5)
ylim([-.2 .45])

% C
subplot(2,4,3)
ylim([-0.28 1])

% investment
subplot(2,4,4)
ylim([-0.875 3.15 ])

% infl
subplot(2,4,6)
ylim([-0.4 0.11 ])

% ffr
subplot(2,4,7)
ylim([-0.82 0.22])

set(gcf,'render','painters')

if export_on == 1; export_fig MonetaryVAR -eps; end;

%% Select Large Scale VAR Plot
try
    h = findobj('name', 'Large Scale VAR');
    fig = figure(h);
catch
    fig = figure('name', 'Large Scale VAR', 'position', [137.8000 41.8000 1.2616e+03 740.8000] );
end

fig.Color = [1 1 1];
axesfig  = get(fig, 'CurrentAxes');
childfig = get(axesfig, 'Children');

leg_fig = legend(childfig([1 2 3]), 'Model', 'Data', 'Data (95% Band)');
set(leg_fig, 'Position',  [0.7725 0.2523 0.1169 0.0901] );
axesfig.Layer = 'Top';

for i = 1:7
    subplot(2,4,i)
    xlim([1 15])
    axesfig  = get(fig, 'CurrentAxes');
%     axesfig.XTick = [ 2:2:12]; % if length is 12
    axesfig.XTick = [ 1:2:15];
    
    ylab = ylabel('% dev');
    ylab.FontSize = 10;
    
    xlab = xlabel('years');
    xlab.FontSize = 10;
    
    if i >= 6
        ylim([-.6 .45])
    end
end

subplot(2,4,1)
ylim([-0.29 1.2])

subplot(2,4,5)
ylim([-0.1 0.75])

subplot(2,4,2)
ylim([-0.95 5])

subplot(2,4,3)
ylim([-0.29 1.2])

if export_on == 1; export_fig LargeScaleVAR -eps -transparent; end;

%% Select Small Scale VAR
try
    h = findobj('name', 'Small Scale VAR');
    fig = figure(h);
catch
    fig = figure('name', 'Small Scale VAR');
end

fig.Color = [1 1 1];

subplot(1,2,1)
axesfig  = get(fig, 'CurrentAxes');
axesfig.Layer = 'Top';
ylim([0 6])
axesfig.XTick = [ 1:2:15]; % if length is 15

subplot(1,2,2)
axesfig  = get(fig, 'CurrentAxes');
childfig = get(axesfig, 'Children');
leg_fig = legend(childfig([1 2 3]), 'Model', 'Data', 'Data (95% Band)');
set(leg_fig, 'position',  [0.3540 0.7623 0.1024 0.1281] );
axesfig.Layer = 'Top';
axesfig.XTick = [ 1:2:15]; % if length is 15

% -q101 means no image compression (can set between q1 and q101)
if export_on == 1; export_fig SmallScaleVAR -pdf -transparent -q30; end;
if export_on == 1; export_fig SmallScaleVAR -eps -transparent; end;

