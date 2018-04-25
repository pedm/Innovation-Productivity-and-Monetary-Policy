
%===================================================================%
%%%%            COMPARE MODEL AND VAR IRFs                       %%%%
%===================================================================%

%% Compute distance from small scale VAR 

% Select the model irfs
ii = find(ismember(IRnames_dynare, 'RD'));
mod_irf_rd = IR_dynare(ii,:);

ii = find(ismember(IRnames_dynare, 'TFP'));
mod_irf_tfp = IR_dynare(ii,:);

dist_tfp = (DATA.oirf{2}' - mod_irf_tfp);
dist_rd  = (DATA.oirf{1}' - mod_irf_rd);
DDD = [dist_rd';dist_tfp'];

% compute variances (cannot have any variances be zero)
vvv = [DATA.variance{1}; DATA.variance{2}];
vvv(vvv == 0) = 0.000001;
VVV = diag(vvv);

% distance fcn from CEE
irf_distance = DDD'* inv(VVV) * DDD;

