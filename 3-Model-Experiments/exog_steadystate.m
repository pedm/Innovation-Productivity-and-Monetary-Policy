function [ys,check] = exog_steadystate(ys,exe);

% Inputs: 
%   - ys        [vector] vector of initial values for the steady state of
%                   the endogenous variables
%   - exo       [vector] vector of values for the exogenous variables
%
% Output: 
%   - ys        [vector] vector of steady state values fpr the the endogenous variables
%   - check     [scalar] set to 0 if steady state computation worked and to
%                    1 of not (allows to impos restriction on parameters)
    
    
global M_
    
alpha = [];
beta  = [];
gamma = []; % these 3 are needed so they don't clash with functions with the same name - in the future better to use different parameter names: bet, alph, gam

% read out parameters to access them with their name
NumberOfParameters = M_.param_nbr;
for ii = 1:NumberOfParameters
  paramname = deblank(M_.param_names(ii,:));
  eval([ paramname ' = M_.params(' int2str(ii) ');']);
end

% initialize indicator (check=failure indicator -- indicates ss computation
% failed)
check = 0;



%%%% ---------------------- %%%    
%% Solve for Steady State %%%%%
%%% ------------------------%%%
% solve for YD, KD

omega = omegabar;

L      = L_ss;
g      = g_ss;

LAMBDA = beta*g^(-1);
YD_KD_g= ( LAMBDA^(-1) + delta - 1 )/( (vartheta-1)/vartheta * 1/mkup_ss * alpha   ) ;
KD_g   = L * (YD_KD_g)^(-1/(1-alpha));
KD = KD_g * g;
YD = (KD/g)^alpha * L^(1-alpha);


% solve for the rest
ID  = ( 1 - (1-delta)/g ) * KD;
CD  = YD - ID;
UCD = (1-beta*h/g)/(CD - h*CD/g);


%  solve for labor disutility parameter chi
chi = ((omegal-1)/omegal)*(1/(L^epsilon))*UCD*(1/mkup_ss)*( (vartheta-1)/vartheta )*(1-alpha)*YD/L;

    
% solve for sticky-price variables (zero inflation steady state)
mkup = mkup_ss;
pi = pi_ss;
pi_star = pi_ss;
x1D = UCD*(1/mkup)*YD / (1 - theta*beta);
x2D = UCD*YD / (1 - theta*beta);

R_nom = pi / LAMBDA;
Q     = 1;



% solve for sticky-wage variables
Lstar = L;
MRSD  = chi*Lstar^epsilon/UCD;
xw1   = (1/(1-beta*thetaw))*Lstar*UCD*MRSD;
xw2   = (1/(1-beta*thetaw))*Lstar*UCD;
wDstar= (omegal/(omegal-1))*MRSD;
wD    = wDstar;
wD_pot= wD;



%% ========== MAP TO LOGS ============= %%

g      = log(g);
YD     = log(YD);
CD     = log(CD);
LAMBDA = log(LAMBDA);
UCD    = log(UCD);
L      = log(L);
KD     = log(KD);
Q      = log(Q);
ID     = log(ID);
mkup   = log(mkup);
pi     = log(pi);
pi_star= log(pi_star);
x1D    = log(x1D);
x2D    = log(x2D);
R_nom  = log(R_nom);
omega  = log(omega);

Lstar  = log(Lstar);
MRSD   = log(MRSD);
xw1    = log(xw1);
xw2    = log(xw2);
wDstar = log(wDstar);
wD     = log(wD);
wD_pot = log(wD_pot);


OMEGASHK = 0;
TFPSHK   = 0;
MONSHK   = 0;
DELTAB   = 0;



% Potential Economy Variables

g_pot = g;
KD_pot      = KD;
LAMBDA_pot  = LAMBDA;
YD_pot      = YD;
mkup_pot    = mkup;
KD_pot      = KD;
L_pot       = L;
CD_pot      = CD;
ID_pot      = ID;
UCD_pot     = UCD;
Q_pot       = Q;
mkup_pot    = mkup;
R_nom_pot   = R_nom;


g_fcn      = 0;
g_fcn_prime= 0;

g_fcn_pot      = 0;
g_fcn_prime_pot= 0;




%%%%---------------------------%%%%
%% End Own Steady State Solution %%
%%%%---------------------------%%%%


    
for iter = 1:length(M_.params) %update parameters set in the file
  eval([ 'M_.params(' num2str(iter) ') = ' M_.param_names(iter,:) ';' ])
end



NumberOfEndogenousVariables = M_.orig_endo_nbr; %auxiliary variables are set automatically
for ii = 1:NumberOfEndogenousVariables
  varname = deblank(M_.endo_names(ii,:));
  eval(['ys(' int2str(ii) ') = ' varname ';']);
end   
    
  
end



