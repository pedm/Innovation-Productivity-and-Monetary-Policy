
% Plot Large Scale VAR IRFs from Stata
% clc; clear all; close all;

%% Load Data
IRFS = readtable('var_largescale.csv');

IRFS.step = IRFS.step + 1;
IRFS = IRFS( IRFS.step <= options_.EST.length_large_scale_irfs , :);

%% Specify var names, titles, and yaxis label

varnames = {
    
    'gdp'
    'rd'
    'cons'
    'invexrd'
    'tfp'
    'infl'
    'r'
    };

vartitles = {
    'GDP'
    'R&D'
    'Consumption'
    'Investment'
    'TFP'
    'Inflation'
    'Fed funds rate'
    };

yaxis_label = {
    '% dev'
    '% dev'
    '% dev'
    '% dev'
    '% dev'
    '% dev'
    '% dev'
    };

for ii = 1:length(varnames)
    vname = varnames{ii};
    irf{ii} = IRFS(strcmp(IRFS.response, vname), :);
end

%% Select Large Scale VAR Plot
try
    h = findobj('name', 'Large Scale VAR', 'position', [137.8000 41.8000 1.2616e+03 740.8000] );
    fig = figure(h);
catch
    fig = figure('name', 'Large Scale VAR', 'position', [137.8000 41.8000 1.2616e+03 740.8000] );
end

%% LARGE SCALE VAR PLOT ------

color_fill_1 = [.90 .90 .90]; 
color_fill_2 = [.80 .80 .80]; % this is a darker grey

% fig = figure('position', [195 112 1571 841]);
for i = 1:length(varnames)
    fill_1 = [          irf{i}.step              irf{i}.lb95;  ...
                 flipud(irf{i}.step)     flipud(irf{i}.ub95);  ];
    fill_2 = [          irf{i}.step             irf{i}.lb68;  ...
                 flipud(irf{i}.step)     flipud(irf{i}.ub68);  ];         

    subplot(2,4,i); 
    patch( fill_1(:,1), 100*fill_1(:,2), color_fill_1, 'edgecolor', color_fill_1 ); hold on;
    plot(irf{i}.step,  100*irf{i}.oirf, 'linewidth', 2, 'color', 'k'); 
    hold off;
    title(vartitles{i}); axis tight; ylabel( yaxis_label{i} ); 
    hh = hline(0,'-');
    hh.Color = [ 0.9290    0.6940    0.1250];
    
    % Restart Color Order
    ax = gca;
    ax.ColorOrderIndex = 1;
    
    % Make sure axes remain on top
    ax.Layer = 'top';
    
end

set(gcf,'Color',[1 1 1]); % set white background
% -q101 means no image compression (can set between q1 and q101)
% export_fig LargeScaleVAR -pdf -transparent -q30
