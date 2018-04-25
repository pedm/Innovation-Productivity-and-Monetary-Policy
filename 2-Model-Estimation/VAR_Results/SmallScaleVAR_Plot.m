%% Plot Monetary VAR IRFs from Stata
% clc; clear all; close all;

global DATA

%% Load Data
IRFS = readtable(options_.EST.csv_filename);

% Square the standard error
IRFS.variance = IRFS.stdoirf .^ 2;

% Move everything forward by one period (stata IRFs start in 0. we want
% them to start in 1)
IRFS.step = IRFS.step + 1;
IRFS = IRFS( IRFS.step <= options_.EST.irf_length, :);

%% Specify var names, titles, and yaxis label

varnames = {
    'rd'
    'tfp'
    };

vartitles = {
    'R&D'
    'TFP'
    };

yaxis_label = {
    '% dev'
    '% dev'
    };

%% Save for usage in estimation

for ii = 1:length(varnames)
    vname = varnames{ii};
    irf{ii} = IRFS(strcmp(IRFS.response, vname), :);
    DATA.oirf{ii} = irf{ii}.oirf;
    DATA.stderr{ii} = irf{ii}.stdoirf;
    DATA.vname{ii} = vname;
    DATA.variance{ii} = irf{ii}.variance;
end

%% Plot the important variables
try
    h = findobj('name', 'Small Scale VAR', 'position', [62.6000 277.8000 1404 413.6000] );
    fig = figure(h);
catch
    fig = figure('name', 'Small Scale VAR', 'position', [62.6000 277.8000 1404 413.6000] );
end

% fig = figure('position', [274 560 1404 414]);

%% SMALL SCALE VAR PLOT ------

% Question: irf{i}.step is 0:40
% previously we used 1:Tirf. Do we want similar? (ie results start at 1?)

color_fill_1 = [.90 .90 .90]; 
color_fill_2 = [.80 .80 .80]; % this is a darker grey

for i = 1:length(varnames)
    fill_1 = [          irf{i}.step              irf{i}.lb95;  ...
                 flipud(irf{i}.step)     flipud(irf{i}.ub95);  ];
    fill_2 = [          irf{i}.step             irf{i}.lb68;  ...
                 flipud(irf{i}.step)     flipud(irf{i}.ub68);  ];         

    subplot(1,2,i); 
    patch( fill_1(:,1), 100*fill_1(:,2), color_fill_1, 'edgecolor', color_fill_1 ); hold on;
%     patch( fill_2(:,1), 100*fill_2(:,2), color_fill_2, 'edgecolor', color_fill_2 ); 
    plot(irf{i}.step,  100*irf{i}.oirf, 'linewidth', 2.25, 'color', 'k'); 
    hold off;
    title(vartitles{i}); axis tight; ylabel( yaxis_label{i} ); xlabel('years')
%     hline(0,'-');

    % Restart Color Order
    ax = gca;
    ax.ColorOrderIndex = 1;
end

% str1 = '95% Band';
% str2 = '68% Band';
% str3 = 'Impulse Response';

% axesfig  = get(fig, 'CurrentAxes');
% childfig = get(axesfig, 'Children');

% leg_fig = legend(childfig([1 2 3]),str3,str2,str1);
% set(leg_fig, 'position',  [0.3502 0.7757 0.1075 0.1281] );

%% Save

% set(gcf,'Color',[1 1 1]); % set white background
% % -q101 means no image compression (can set between q1 and q101)
% export_fig SmallScaleVAR -pdf -transparent -q30


