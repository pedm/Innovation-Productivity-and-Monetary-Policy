%% Transform the simulated data

% In the most recent dynare version, this only works when the loglinear option is turned off
% In the dynare version we're using, this is okay even when loglinear option is turned on
g_simul = oo_.endo_simul(1,:);

A_lead = cumprod(g_simul);
A_simul = ones(size(A_lead));
A_simul(2:end) = A_lead(1:end-1);

ND_location = strmatch('ND', M_.endo_names, 'exact');
ND_simul = oo_.endo_simul(ND_location,:);
R_simul = ND_simul .* A_simul;

YD_location = strmatch('YD', M_.endo_names, 'exact');
YD_simul = oo_.endo_simul(YD_location,:);
Y_simul = YD_simul .* A_simul;

%% Plot
TT = 200;
% Restrict sample to positive R&D
% TT = min([find(R_simul <= 0), 601]) - 1

% What shocks are causing the negative values?

%% 
Y = [Y_simul(:,1:TT)', A_simul(:,1:TT)', R_simul(:,1:TT)'];
% size(Y)


%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. estimate by OLS   %%
%%%%%%%%%%%%%%%%%%%%%%%%%

Ylag = Y(1:end-1,:);
Y    = Y(2:end  ,:);
T    = size(Y,1);


X = [ones(T,1) Ylag]; % X collects regressors

% regress Y(:,1), Y(:,2), Y(:,3) on X:
XXinv = inv(X'*X);
B1    = XXinv*X'*Y(:,1);
B2    = XXinv*X'*Y(:,2);
B3    = XXinv*X'*Y(:,3); % verified same result with "regress"

c = [B1(1); B2(1); B3(1)]; % first element of BB1,BB2,BB3 is the constant term
B = [B1(2:4)' ; B2(2:4)'; B3(2:4)'];

% the above imples the system is written as y(t) = c + B*y(t-1) + u(t)
% (with Y, c, y as column vectors)
% (could do the above more elegantly)
% % --------------------------------------------
% % %%do alternative:
% % BB = XXinv*X'*Y;
% % c_alt = BB(1,:)';
% % B_alt = BB(2:end,:)';
% % --------------------------------------------



% residuals
for t = 1:T
    u(t,:) = ( Y(t,:)' - c - B*Ylag(t,:)' );
end

% estimate var-cov matrix of residuals
SIGu = (1/T)*u'*u; % matches Stata


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. choleski & impulse-responses to R&D shock    %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


A0inv = chol(SIGu, 'lower');

eps_rd = [0;0;1]; % shock to R&D (last eq)

Tirf = 12; % length IRF

ir_rd = NaN(3, Tirf);
ir_rd(:,1) = A0inv * eps_rd;
for t=2:Tirf
    ir_rd(:,t) = B*ir_rd(:,t-1);
end




%% Scale so that it has same size on impact as model IRF
scaled_ir_rd = ir_rd ./ ir_rd(3,1) .* RD_epsilon_n(1);
