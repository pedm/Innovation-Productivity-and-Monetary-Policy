% Plot Monetary VAR IRFs from Stata
% clc; clear all; close all;

%% Load Data
IRFS = readtable('irfs_monetary.csv');
IRFS.step = IRFS.step + 1;

% Square the standard error
% IRFS.variance = IRFS.stdoirf .^ 2;

%% Specify var names, titles, and yaxis label

varnames = {
    'GDP_log'
    'RD_BEA_log'
    'Consumption_log'
    'Investment_log'
    'TFP_Util_log'
    'Inflation'    
    'FFR'
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

% Scale FFR shock down by 100
index_ffr = strmatch('FFR', varnames);
irf{index_ffr}.oirf = irf{index_ffr}.oirf / 100;
irf{index_ffr}.ub95 = irf{index_ffr}.ub95 / 100;
irf{index_ffr}.lb95 = irf{index_ffr}.lb95 / 100;
irf{index_ffr}.ub68 = irf{index_ffr}.ub68 / 100;
irf{index_ffr}.lb68 = irf{index_ffr}.lb68 / 100;

% Scale inflation response up by 4 (since we currently have quarterly infl)
index_infl = strmatch('Inflation', vartitles);
irf{index_infl}.oirf = irf{index_infl}.oirf * 4;
irf{index_infl}.ub95 = irf{index_infl}.ub95 * 4;
irf{index_infl}.lb95 = irf{index_infl}.lb95 * 4;
irf{index_infl}.ub68 = irf{index_infl}.ub68 * 4;
irf{index_infl}.lb68 = irf{index_infl}.lb68 * 4;

%% CONVERT IRFS TO ANNUAL

sizeir = options_.EST.length_monetary_irfs;
if sizeir > (length(irf{1}.oirf) - 1)/4
    sizeir = (length(irf{1}.oirf) - 1)/4;
end

for ii = 1:length(varnames)
    
    % drop the first quarter 
    irfs0 = irf{ii}(2:end, :);
    
    for t = 1:sizeir
        irf_annual{ii}.oirf(t) = mean( irfs0.oirf( 4*t-3 :4*t), 1 ) ;
        irf_annual{ii}.ub95(t) = mean( irfs0.ub95( 4*t-3 :4*t), 1 ) ;
        irf_annual{ii}.lb95(t) = mean( irfs0.lb95( 4*t-3 :4*t), 1 ) ;
        irf_annual{ii}.ub68(t) = mean( irfs0.ub68( 4*t-3 :4*t), 1 ) ;
        irf_annual{ii}.lb68(t) = mean( irfs0.lb68( 4*t-3 :4*t), 1 ) ;
        irf_annual{ii}.stdoirf(t) = mean( irfs0.stdoirf( 4*t-3 :4*t), 1 ) ;
        irf_annual{ii}.step(t) = t;
    end
end

%% Save for usage in estimation

for ii = 1:length(varnames)
    vname = varnames{ii};
    DATA.MONETARY.oirf{ii} = irf_annual{ii}.oirf;
    DATA.MONETARY.stderr{ii} = irf_annual{ii}.stdoirf;
    DATA.MONETARY.vname{ii} = vname;
    DATA.MONETARY.variance{ii} = irf_annual{ii}.stdoirf .^ 2;
end

%% ANNUAL MONETARY VAR PLOT ------

% figure('position',[190 169 1413 814]);
try
    h = findobj('name', 'Monetary VAR');
    fig = figure(h);
catch
    fig = figure('name', 'Monetary VAR', 'position', [137.8000 41.8000 1.2616e+03 740.8000] );
end

for i = 1:length(irf_annual)
    
    fill_1 = [          irf_annual{i}.step'             -1*irf_annual{i}.lb95';  ...
                 flipud(irf_annual{i}.step')     flipud(-1*irf_annual{i}.ub95');  ];
    fill_2 = [          irf_annual{i}.step'             -1*irf_annual{i}.lb68';  ...
                 flipud(irf_annual{i}.step')     flipud(-1*irf_annual{i}.ub68');  ];         

             
    subplot(2,4,i); 
    patch( fill_1(:,1), 100*fill_1(:,2), color_fill_1, 'edgecolor', color_fill_1 ); hold on;
    plot( irf_annual{i}.step, -1*100*irf_annual{i}.oirf, 'linewidth', 2, 'color', 'k' ); 
    axis tight;
    ylabel( yaxis_label{i} ); 
    title(vartitles{i});
    hh = hline(0,'-');
    hh.Color = [ 0.9290    0.6940    0.1250];
    
    % Restart Color Order
    ax = gca;
    ax.ColorOrderIndex = 1;
    
    % Make sure axes remain on top
    ax.Layer = 'top';
end
