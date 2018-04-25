
sizeir = options_.EST.length_monetary_irfs;

% set shock for IRF
ex_ = zeros( sizeir, 6);
ex_(1, strmatch('epsilon_m', M_.exo_names,'exact') ) = 1 * 0.25 / 0.5677; % monetary shock - sized to deliver 25bps rise in nominal rate

% simulate
clear y_ yss_ ydev_ g A_ir_ALT1 IR_ALT1
y_   = simult_(oo_.dr.ys, oo_.dr, ex_, 1);
yss_ = simult_(oo_.dr.ys, oo_.dr, 0*ex_, 1);
ydev_ = y_ - yss_;

% rescale to get FFR rise of 0.6082 in the first year:
FFR = ydev_(strmatch('R_nom',M_.endo_names,'exact'),2:end)';
ydev_ = ydev_ * ( 0.6082 / (100*FFR(1)) );


g_path = ydev_(strmatch('g', M_.endo_names, 'exact'), :)'; % first is zero bc first obs is SS; so no need to add 0 to A_ir
A_ir_ALT1     = [ cumsum( g_path )];
A_ir_ALT1 = A_ir_ALT1(1:end-1); % cut last one

vartheta = M_.params( strmatch('vartheta',M_.param_names,'exact') );

IR_ALT1 = [  
ydev_(strmatch('R_nom',M_.endo_names,'exact'),2:end)',...          %% FFR
ydev_(strmatch('YD',M_.endo_names,'exact'),2:end)' + A_ir_ALT1,... %% GDP
ydev_(strmatch('ND',M_.endo_names,'exact'),2:end)' + A_ir_ALT1,... %% R&D
(1/(vartheta-1))*A_ir_ALT1,...                                     %% TFP
ydev_(strmatch('CD',M_.endo_names,'exact'),2:end)' + A_ir_ALT1,... %% Consumption
ydev_(strmatch('ID',M_.endo_names,'exact'),2:end)' + A_ir_ALT1,... %% Investment
ydev_(strmatch('pi',M_.endo_names,'exact'),2:end)',...             %% Inflation
ydev_(strmatch('MONSHK',M_.endo_names,'exact'),2:end)',...         %% Monetary shock
];

