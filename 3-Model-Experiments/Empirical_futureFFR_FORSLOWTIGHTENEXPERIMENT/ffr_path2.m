% first load actual FFR
clc; clear all; close all; 
load_data_for_TaylorRule;




% annualize 
ffr_a      = NaN( (length(ffr)-1)/4 , 1);
unemp_a    = NaN( (length(ffr)-1)/4 , 1);
infl_a     = NaN( (length(ffr)-1)/4 , 1);
inflMA_a   = NaN( (length(ffr)-1)/4 , 1);
for t=1:length(ffr_a);
    ffr_a(t)    = mean( ffr( 4*t-3:4*t ) );
    unemp_a(t)  = mean( unemp( 4*t-3:4*t ) );
    infl_a(t)   = sum( infl( 4*t-3:4*t ) );
    inflMA_a(t) = mean( inflMA( 4*t-3:4*t ) );
end
year = (1958:2016)';


figure
plot( year, ffr_a, 'linewidth', 1.5 ); 
xlim([1999 2018]);
title('FFR annual');

ffr_ext = [
ffr_a;
1.4;  % 2017
2.1;  % 2018
2.9;  % 2019
3.0;  % 2020
3.0*ones(10,1); % through 2030
];
year_ext = (year(1):2030)';


% alternative path: much slower tighening toward 2030
ffr_alt0 = [
ffr_a;
1.25;   % 2017
1.50;   % 2018
1.75;   % 2019
2.25;   % 2020
2.25;   % 2021
2.50;   % 2022
2.75;   % 2023
2.75;   % 2024
3.00;   % 2025
3.00;   % 2026
3.00;   % 2027
3.00;   % 2028
3.00;   % 2029
3.00;   % 2030
];


figure
plot( year, ffr_a, 'linewidth', 1.5 );  hold on;
plot( year_ext, ffr_ext, 'linewidth', 1.5, 'linestyle', '--' ); 
plot( year_ext, ffr_alt0, 'linewidth', 1.5, 'linestyle', ':' ); 
xlim([1999 2030]);
title('FFR annual');

mean(ffr_ext( year_ext>=2017 & year_ext <= 2025 ))
mean(ffr_alt0( year_ext>=2017 & year_ext <= 2025 ))



% calculate smooth version


raw = [
1.25;   % 2017
1.50;   % 2018
1.75;   % 2019
2.25;   % 2020
2.25;   % 2021
2.50;   % 2022
2.75;   % 2023
2.75;   % 2024
3.00;   % 2025
3.00;   % 2026
3.00;   % 2027
3.00;   % 2028
3.00;   % 2029
3.00;   % 2030
];


append1 = smooth(raw);
append2 = smooth(raw, 'sgolay');
append3 = smooth(raw, 'sgolay', 3);


ffr_alt1 = [
ffr_a;
append1;
];

ffr_alt2 = [
ffr_a;
append2;
];

ffr_alt3 = [
ffr_a;
append3;
];



figure
subplot(2,2,1);
plot( year, ffr_a, 'linewidth', 1.5 );  hold on;
plot( year_ext, ffr_ext, 'linewidth', 1.5, 'linestyle', '--' ); 
plot( year_ext, ffr_alt1, 'linewidth', 1.5, 'linestyle', ':' ); 
xlim([1999 2030]);
title('FFR annual 1');


subplot(2,2,2);
plot( year, ffr_a, 'linewidth', 1.5 );  hold on;
plot( year_ext, ffr_ext, 'linewidth', 1.5, 'linestyle', '--' ); 
plot( year_ext, ffr_alt2, 'linewidth', 1.5, 'linestyle', ':' ); 
xlim([1999 2030]);
title('FFR annual 2');


subplot(2,2,3);
plot( year, ffr_a, 'linewidth', 1.5 );  hold on;
plot( year_ext, ffr_ext, 'linewidth', 1.5, 'linestyle', '--' ); 
plot( year_ext, ffr_alt3, 'linewidth', 1.5, 'linestyle', ':' ); 
xlim([1999 2030]);
title('FFR annual 3');


% go with baseline (version 1) 


mean(ffr_ext( year_ext>=2017 & year_ext <= 2025 ))
mean(ffr_alt1( year_ext>=2017 & year_ext <= 2025 ))


figure; plot(year_ext, ffr_alt1 - ffr_ext );


ffr_alt = ffr_alt1;
ffr_bl  = ffr_ext;
year_ffr = year_ext;


% save ffr_paths2.mat ffr_alt ffr_bl year_ffr;





















