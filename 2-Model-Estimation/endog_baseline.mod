% add sticky wages to "endog_baseline_Z.mod"


%===================================================================%
%                    DECLARATION OF VARIABLES                       %
%===================================================================%

var

% ENDOGENOUS VARIABLES
g             % g(t) = A(t+1)/A(t)
ZD            % Total Measure of Technologies (adopted or not); detrended
lambda        % Adoption probability
VD            % New innovation / technologies created this period (adopted or not); detrended
M             % Adoption effort (per unadopted tech)
J             % Value of unadopted tech
H             % Value of adopted tech
PI            % Profit flow
ND            % R&D; detrended
YD            % Output; detrended
CD            % Consumption; detrended
LAMBDA        % Household SDF
UCD           % Marginal utility of consumption; detrended
L             % Hours
KD            % Physical capital; detrended
Q             % Tobin's Q (for investment in physical capital)
ID            % Investment; detrended
Qm            % price of adoption good
Qn            % "price" of R&D good (shortcut for adj costs)
ImD           % aggregate purchases of adoption good; detrended
SD

% Sticky Price Variables
mkup          % Markup
pi            % Inflation
pi_star       % Reset inflation
x1D           % Simplification 1 used in Optimal Reset Price
x2D           % Simplification 2 used in Optimal Reset Price
R_nom         % Policy rate


%  Auxilliary functions - note: these are technically detrended
g_fcn            
g_fcn_prime       
gm_fcn
gm_fcn_prime
f_fcn
f_fcn_prime

% Exogenous Shocks
zeta          % 1  Shock to innovators' productivity
DELTAN        % 2  "Innovation wedge" shock
DELTAB        % 3  liquidity demand shock
MONSHK        % 4  Monetary sock
omega         %   elasticity of subst across varieties (-> mkup shock)
OMEGASHK      % 5  markup shock
TFPSHK        % 6  exogenous TFP shock


Aratio  % ratio of A to Apot

% Sticky wage variables
wD
wDstar
xw1
xw2
Lstar
MRSD
wD_pot

% Potential Economy Variables; and new additions
g_pot
lambda_pot
ZD_pot
VD_pot
ND_pot
KD_pot
J_pot
M_pot
LAMBDA_pot
H_pot
PI_pot
YD_pot
mkup_pot
g_fcn_prime_pot
g_fcn_pot
L_pot
CD_pot
ID_pot
UCD_pot
Q_pot
R_nom_pot
Qm_pot
Qn_pot
ImD_pot
gm_fcn_pot
gm_fcn_prime_pot
f_fcn_pot
f_fcn_prime_pot
d_I
d_N
;



% EXOGENOUS SHOCKS
varexo

epsilon_chi    % disturbance to innovators' productivity
epsilon_n      % disturbance to innovation wedge
epsilon_m      % disturbance to monetary shock
epsilon_b      % disturbance to liquidity demand shock
epsilon_omega  % disturbance to markup shock
epsilon_tfp    % disturbance to exogenous TFP shock
;  

%=========================================================================%
%%%%                    DECLARATION OF PARAMETERS                      %%%%
%=========================================================================%
 
parameters 

% ORIGINAL PARAMETERS 
beta                 
alpha               
epsilon       % Inverse Frisch labor supply elasticity
delta                
chi           % disutility of labor supply
vartheta              
phi         
eta                    
rhozeta              % persistence of exogenous "innovation productivity" shock
sigmazeta            % size of impulse on exogenous "innovation productivity" shock
zeta_bar       
rhon                 % persistence of financial shock on innovators
sigman               % sd of financial shock on innovators

psi_I                % Magniturde if I investment cost
psi_Im
psi_N

alpha_N              %  spillover from innovation to adoption

sigmam             % monetary policy shock (iid) variance
rhom               % monetary policy shock persistence

sigmab
rhob


% Taylor rule & sticky price parameters
gamma_pi       % Taylor rule infl
gamma_y        % Taylor rule y
gamma_r        % Taylor rule inertia
gamma_a        % Taylor rule coeff on Aratio
theta          % Calvo price stickiness

% Sticky wage parameters
thetaw
omegal
iotaw

% SEPTEMBER ADDITIONS
lambda_bar     
rho_lambda         % 0 < rho_lambda < 1


% CALIBRATED STEADY-STATE VALUES
g_ss                 % Steady-state growth rate (seen in adjustment cost functions)
L_ss                 % Steady-state labor
lambda_ss            % Steady-state adoption rate
mkup_ss       
pi_ss          % steady-state inflation (GROSS)

% MARCH ADDITIONS
iotap
omegabar
rhoomega
sigmaomega
rhotfp
sigmatfp
habit % habit
;

%=========================================================================%
%%%%                     PARAMETERS' VALUES                            %%%%
%=========================================================================%

% 
% eta        =  0.2994925118;
% alpha_N    =  0.1816781153;
% rhon       =  0.7808915044;
% sigman     =  0.03653164641;
% 
% rho_lambda = 0.95;
% 
% % tech parameters that do not change
% lambda_ss = 0.20;
% phi       = 0.90;
% 
% 
% % CONVENTIONAL
% beta    = 0.9978;     % discount factor
% alpha   = 0.33;       % capital share
% epsilon = 1/2;        % inv Frisch; epsilon=invFrisch=0.5; here FrischE=2;
% h       = 0.50;       % Habit
% delta   = 0.1;        % capital deprec
% psi_I   = 0.75;       % Adjustment cost to Inv
% psi_Im  = 5.0;        % Adjustment cost to adoption inv
% psi_N   = 5.0;        % Adjustment cost to R&D
% 
% % GROWTH
% vartheta  = 2.4925;  % elast. of subst. across varieties [ mkup = vartheta/(vartheta-1); calibrated to 1/(1-alpha) + 1 ]
% 
% 
% % NEW VARIABLES - sticky price part
% gamma_pi =  1.50;
% gamma_y  =  1.00;
% gamma_r  =  0.00;
% gamma_a  =  0.00;
% theta    =  0.70;
% iotap    =  1.00;     % degree of indexation to past inflation
% omegabar =  4.167;    %  Markup. In the flex price model, markup is exogenous and given by M = ?/(? ? 1). I took this numbers from Gertler-Karadi “a model of unconventional monetary policy??, who take them from estimates by Primiceri et al
% pi_ss    =  1.02;     % ss inflation
% 
% 
% % steady-state values of endogenous variables:
% g_ss      = 1.0120^(vartheta-1);         %1.0118; %1.02; % calibrate g (growth rate); back out zeta_bar
% L_ss      =      1;                      % calibrate SS L; back out chi 
% mkup_ss   = omegabar/(omegabar-1);
%   
% 
% % need to back out: zeta_bar, lambda_bar, chi -> set in steady-state file
% 
% % sticky wage parameters
% thetaw =   0.70;
% omegal =  4.167;
% iotaw  =   1.00; % set these to be the same as their price counterparts as a first approx
% 
% % shock parameters
% rhom = 0.66;
% 
% 
% rhob = 0.65;
% rhoomega = 0.33;
% rhotfp   = 0.80;
% rhozeta  = 0.00;
% 
% sigmab = 0.115;
% sigmam = 0.01;
% sigmaomega = 0.01;
% sigmatfp   = 0.01;
% sigmazeta  = 0.01; % need to reestimate these....

%=========================================================================%
%%%%                 CALIBRATED PARAMETERS' VALUES                     %%%%
%=========================================================================%

% Note: comment out all parameters above or all set_param_values below
% Let me know if you would prefer for me to make this as a separate mod file

load parameterfile.mat;

set_param_value('eta', eta); 
set_param_value('alpha_N', alpha_N); 
set_param_value('rhon', rhon); 
set_param_value('sigman', sigman); 
set_param_value('rho_lambda', rho_lambda); 
set_param_value('lambda_ss', lambda_ss); 
set_param_value('phi', phi); 
set_param_value('beta', beta); 
set_param_value('alpha', alpha); 
set_param_value('epsilon', epsilon); 
set_param_value('habit', habit); 
set_param_value('delta', delta); 
set_param_value('psi_I', psi_I); 
set_param_value('psi_Im', psi_Im); 
set_param_value('psi_N', psi_N); 
set_param_value('vartheta', vartheta); 
set_param_value('gamma_pi', gamma_pi); 
set_param_value('gamma_y', gamma_y); 
set_param_value('gamma_r', gamma_r); 
set_param_value('gamma_a', gamma_a); 
set_param_value('theta', theta); 
set_param_value('iotap', iotap); 
set_param_value('omegabar', omegabar); 
set_param_value('pi_ss', pi_ss); 
set_param_value('g_ss', g_ss); 
set_param_value('L_ss', L_ss); 
set_param_value('mkup_ss', mkup_ss); 
set_param_value('thetaw', thetaw); 
set_param_value('omegal', omegal); 
set_param_value('iotaw', iotaw); 
set_param_value('rhom', rhom); 
set_param_value('rhob', rhob); 
set_param_value('rhoomega', rhoomega); 
set_param_value('rhotfp', rhotfp); 
set_param_value('rhozeta', rhozeta); 
set_param_value('sigmab', sigmab); 
set_param_value('sigmam', sigmam); 
set_param_value('sigmaomega', sigmaomega); 
set_param_value('sigmatfp', sigmatfp); 
set_param_value('sigmazeta', sigmazeta); 

%=========================================================================%
%%%%                     EQUILIBRIUM CONDITIONS                        %%%%
%=========================================================================%

model;


%=========================   ACTUAL ECONOMY   ============================%

% 1. Evolution of number of firm varieties
exp(g) = exp(lambda) * phi * ( exp(ZD)-1 ) + phi;

% 2. Evolution of technological frontier Z
exp(ZD) * exp(g(-1)) = phi * exp(ZD(-1)) + exp(VD(-1));

% 3. Innovators' production function
exp(VD) = zeta_bar * exp(zeta) * exp(ZD)^(1-eta) * exp(ND)^eta;

% 4. Value unadopted
exp(J) = -exp(M)*exp(Qm) + phi * exp(LAMBDA(+1)) * (  exp(lambda)*exp(H(+1)) + (1-exp(lambda))*exp(J(+1))  );

% 5. Adoption-good producers
exp(Qm) = 1 + gm_fcn + (( exp(ImD) * exp(g(-1)) ) / exp(ImD(-1)) ) * gm_fcn_prime - exp(LAMBDA(+1)) * ( ( exp(ImD(+1)) * exp(g) ) / exp(ImD) )^2 * gm_fcn_prime(+1);

% 6. Price of adopted technology H
exp(H) = exp(PI) + phi * ( exp(LAMBDA(+1)) * exp(H(+1)) );

% 7. Profits per period
exp(PI) = (1/vartheta) * (1/exp(mkup)) * exp(YD);

% 8. Innovators' FOC wrt N
exp(LAMBDA(+1)) * exp(J(+1)) * zeta_bar * exp(zeta)  = (exp(ND)/exp(ZD))^(1-eta) * exp(DELTAN) * exp(Qn);

% 9. Qn - adj cost to R&D
exp(Qn) = 1 + f_fcn + (( exp(ND) * exp(g(-1)) ) / exp(ND(-1)) ) * f_fcn_prime - exp(LAMBDA(+1)) * ( ( exp(ND(+1)) * exp(g) ) / exp(ND) )^2 * f_fcn_prime(+1);

% 10. Adopters' FOC
rho_lambda * lambda_bar * phi * ( exp(ND)^alpha_N ) * exp(LAMBDA(+1)) * (  exp(H(+1)) - exp(J(+1))  ) =  exp(Qm) * exp(M) ^ (1 - rho_lambda);

% 11. Adoption Probability:
exp(lambda) = lambda_bar * ( exp(ND)^alpha_N ) * exp(M) ^ rho_lambda;

% 12. Aggregate production function 
exp(YD)  = exp(TFPSHK) * (( exp(KD(-1)) / exp(g(-1))  )^alpha) * exp(L)^(1-alpha);

% 13. Resource constraint, with adjustment cost
exp(YD) = exp(CD) + ( 1 + g_fcn ) * exp(ID) + ( 1 + gm_fcn )*exp(ImD) + ( 1 + f_fcn )*exp(ND);

% 14. HH's stochastic discount factor
exp(LAMBDA) = ( ( beta * exp(UCD) ) / exp(UCD(-1)) ) * exp(g(-1))^(-1);

% 15. Marginal utility of consumption
exp(UCD) = ( exp(CD) - habit*exp(CD(-1))/exp(g(-1)) )^(-1) - beta * habit * ( exp(CD(+1)) * exp(g) - habit * exp(CD) )^(-1);

% 16. Labor demand by firms
exp(wD)  = (1/exp(mkup)) * ((vartheta - 1)/vartheta) * (1 - alpha) * ( exp(YD)/exp(L) );

% 17. Capital evolution
exp(KD) = (1-delta) * ( exp(KD(-1)) / exp(g(-1)) ) + exp(ID) ;

% 18. Q-equation (capital producers)
exp(Q) = 1 + g_fcn + (( exp(ID) * exp(g(-1)) ) / exp(ID(-1)) ) * g_fcn_prime - exp(LAMBDA(+1)) * ( ( exp(ID(+1)) * exp(g) ) / exp(ID) )^2 * g_fcn_prime(+1);

% 19. Capital Euler Equation
exp(Q) = exp(LAMBDA(+1)) * ( ( exp(g)*(vartheta - 1)*exp(YD(+1)) * alpha)/( exp(mkup(+1)) * exp(KD) * vartheta ) + exp(Q(+1)) * (1 - delta)   );

% 20. Innovation/Adoption good 
exp(ImD) = ( exp(ZD)-1 )*exp(M);

%====================== ADJUSTMENT COST FCNS =============================%
g_fcn        =  (psi_I / 2) * ( ( exp(ID) * exp(g(-1)) / exp(ID(-1)) ) - g_ss)^2 ;   % 21
g_fcn_prime  =  psi_I *       ( ( exp(ID) * exp(g(-1)) / exp(ID(-1)) ) - g_ss)   ;   % 22
gm_fcn       =  (psi_Im / 2) *( ( exp(ImD) * exp(g(-1)) / exp(ImD(-1)) ) - g_ss)^2 ; % 23
gm_fcn_prime =  psi_Im *      ( ( exp(ImD) * exp(g(-1)) / exp(ImD(-1)) ) - g_ss)   ; % 24
f_fcn        =  (psi_N / 2) * ( ( exp(ND) * exp(g(-1)) / exp(ND(-1)) ) - g_ss)^2 ;   % 25
f_fcn_prime  =  psi_N *       ( ( exp(ND) * exp(g(-1)) / exp(ND(-1)) ) - g_ss)   ;   % 26


%=========================STICKY PRICE EQNS===============================%
% 27. Pricing Equation
exp(pi)^( 1-exp(omega) ) = theta*( exp(pi(-1))^iotap * pi_ss^(1-iotap) )^( 1-exp(omega) ) + (1-theta)*exp(pi_star)^(1-exp(omega));

% 28. Optimal Pricing Equation 
exp(pi_star) = (  exp(omega) / ( exp(omega) - 1 )) * ( exp(x1D) / exp(x2D) ) * exp(pi);

% 29, 30. Simplifications used in the Optimal Pricing Equation
exp(x1D) = exp(UCD) * ( 1/exp(mkup) ) * exp(YD) + beta * theta * exp(pi)^(-exp(omega)*iotap) * pi_ss^( -exp(omega)*(1-iotap) ) * exp(pi(+1))^exp(omega) * exp(x1D(+1));
exp(x2D) = exp(UCD) * exp(YD)                   + beta * theta * exp(pi)^((1-exp(omega))*iotap) * pi_ss^( (1-exp(omega))*(1-iotap) ) * exp(pi(+1))^( exp(omega)-1) * exp(x2D(+1));

% 31. Euler Equation
1 = exp(LAMBDA(+1)) * exp(R_nom) / exp(pi(+1)) * exp(DELTAB);

% 32. Taylor Rule
exp(R_nom)  = ( exp(R_nom(-1)) )^gamma_r * ( (exp(pi)/pi_ss)^gamma_pi * ( exp(YD)*(exp(Aratio)^gamma_a)/exp(YD_pot) )^gamma_y *  pi_ss/(beta*g_ss^(-1))  )^(1-gamma_r) * exp(MONSHK);


%=========================STICKY WAGE EQNS===============================%
% 33. Evolution of (detrended) real wage
exp(wD)^(1-omegal) = (1-thetaw)*exp(wDstar)^(1-omegal) + thetaw*( exp(g(-1))^(-1)*exp(pi)^(-1)*exp(wD(-1))*g_ss * ( exp(pi(-1))^iotaw * pi_ss^(1-iotaw) )  )^(1-omegal);

% 34. Optimal reset wage
exp(wDstar) = (omegal/(omegal-1)) * exp(xw1)/exp(xw2);

% 35, 36. Recursive wage Calvo terms
exp(xw1) =  exp(Lstar)*exp(UCD)*exp(MRSD) + beta*thetaw*exp(xw1(+1));
exp(xw2) =  exp(Lstar)*exp(UCD) + beta*thetaw*exp(g)^(-1)*g_ss * (exp(pi)^iotaw*pi_ss^(1-iotaw)) * exp(pi(+1))^(-1)*exp(xw2(+1));

% 37. Labor demand
exp(Lstar) = (exp(wDstar)/exp(wD))^(-omegal) * exp(L);

% 38. Marginal rate of substitution (detrended)
exp(MRSD) = chi*exp(Lstar)^epsilon / exp(UCD);

 % ---------------- %
 % ---------------- %
 % EXOGENOUS SHOCKS %
 % ---------------- %
 % ---------------- %
 
 
 
% 39. Monetary policy shock
MONSHK = rhom * MONSHK(-1) + sigmam * epsilon_m;

% 40. "Consumption wedge" / liquidity shock
DELTAB = rhob * DELTAB(-1) + sigmab * epsilon_b;

% 41, 42. Markup shock
exp(omega)  = omegabar * exp(OMEGASHK);
OMEGASHK = rhoomega * OMEGASHK(-1) + sigmaomega * epsilon_omega;

% 43. Exogenous TFP Shock
TFPSHK   = rhotfp * TFPSHK(-1) + sigmatfp * epsilon_tfp;

% 44. Exogenous shock to entrepreneurs' production function
zeta = rhozeta * zeta(-1) + sigmazeta * epsilon_chi;

% 45. Exogenous financial shock on innovators
DELTAN = rhon * DELTAN(-1) - sigman * epsilon_n;



 % ---------------- %
 % ---------------- %
 


%=======================   POTENTIAL ECONOMY   ===========================%

% 37. Evolution of number of firm varieties
exp(g_pot) = exp(lambda_pot) * phi * ( exp(ZD_pot)-1 ) + phi;

% 38. Evolution of technological frontier Z
exp(ZD_pot) * exp(g_pot(-1)) = phi * exp(ZD_pot(-1)) + exp(VD_pot(-1));

% 39. Innovators' production function
exp(VD_pot) = zeta_bar * exp(zeta) * exp(ZD_pot)^(1-eta) * exp(ND_pot)^eta;

% 40. Euler equation for adopters
exp(J_pot) = -exp(M_pot)*exp(Qm_pot) + phi * exp(LAMBDA_pot(+1)) * ( exp(lambda_pot)*exp(H_pot(+1)) + ( 1 - exp(lambda_pot) )*exp(J_pot(+1))   );

% 41. Adoption-good producers
exp(Qm_pot) = 1 + gm_fcn_pot + (( exp(ImD_pot) * exp(g_pot(-1)) ) / exp(ImD_pot(-1)) ) * gm_fcn_prime_pot - exp(LAMBDA_pot(+1)) * ( ( exp(ImD_pot(+1)) * exp(g_pot) ) / exp(ImD_pot) )^2 * gm_fcn_prime_pot(+1);

% 42. Price of adopted technology H
exp(H_pot) = exp(PI_pot) + phi * ( exp(LAMBDA_pot(+1)) * exp(H_pot(+1)) );

% 43. Profits per period
exp(PI_pot) = (1/vartheta) * (1/ exp(mkup_pot) ) * exp(YD_pot) ;

% 44. Innovators' FOC wrt N
exp(LAMBDA_pot(+1)) * exp(J_pot(+1)) * zeta_bar * exp(zeta)  = (exp(ND_pot)/exp(ZD_pot))^(1-eta) * exp(DELTAN) * exp(Qn_pot);

% 45. Qn - adj cost to R&D
exp(Qn_pot) = 1 + f_fcn_pot + (( exp(ND_pot) * exp(g_pot(-1)) ) / exp(ND_pot(-1)) ) * f_fcn_prime_pot - exp(LAMBDA_pot(+1)) * ( ( exp(ND_pot(+1)) * exp(g_pot) ) / exp(ND_pot) )^2 * f_fcn_prime_pot(+1);

% 46. Adopters' FOC
rho_lambda * lambda_bar * phi * ( exp(ND_pot)^alpha_N ) * exp(LAMBDA_pot(+1)) * ( exp(H_pot(+1)) - exp(J_pot(+1))  )  = exp(Qm_pot)*exp(M_pot) ^ (1 - rho_lambda);

% 47. Adoption Probability:
exp(lambda_pot) = lambda_bar * ( exp(ND_pot)^alpha_N ) * exp(M_pot) ^ rho_lambda;

% 48. Aggregate production function
exp(YD_pot) = exp(TFPSHK) * ( ( exp(KD_pot(-1)) / exp(g_pot(-1)) )^alpha) * exp(L_pot)^(1-alpha);

% 49. Resource constraint, with adjustment cost
exp(YD_pot) = exp(CD_pot) + (1+g_fcn_pot) * exp(ID_pot) + (1+gm_fcn_pot)*exp(ImD_pot) + (1+f_fcn_pot)*exp(ND_pot);

% 50. HH's stochastic discount factor
exp(LAMBDA_pot) = (( beta * exp(UCD_pot) ) / exp(UCD_pot(-1)) ) * exp(g_pot(-1))^(-1);

% 51. Marginal utility of consumption
exp(UCD_pot) = ( exp(CD_pot) - habit*exp(CD_pot(-1))/exp(g_pot(-1)) )^(-1) - beta * habit * ( exp(CD_pot(+1)) * exp(g_pot) - habit * exp(CD_pot) )^(-1);

% 52. Labor market equilibrium
exp(wD_pot) = (1/exp(mkup_pot)) * ((vartheta - 1)/vartheta) * (1 - alpha) * (exp(YD_pot)/exp(L_pot));

% 53. Capital evolution
exp(KD_pot) = (1-delta) * ( exp(KD_pot(-1)) / exp(g_pot(-1)) ) + exp(ID_pot);

% 54. Q-equation (capital producers)
exp(Q_pot) =  1 + g_fcn_pot +  ( exp(ID_pot) * exp(g_pot(-1)) / exp(ID_pot(-1)) ) * g_fcn_prime_pot - exp(LAMBDA_pot(+1)) * ( exp(ID_pot(+1)) * exp(g_pot) / exp(ID_pot) )^2 * g_fcn_prime_pot(+1);

% 55. Capital Euler Equation
exp(Q_pot) = exp(LAMBDA_pot(+1)) * ( ( exp(g_pot)* (vartheta - 1) * exp(YD_pot(+1)) * alpha)/( exp(mkup_pot(+1)) * exp(KD_pot) * vartheta) + exp(Q_pot(+1)) * (1 - delta)   );

% 56. Adoption good 
exp(ImD_pot) = ( exp(ZD_pot)-1 )*exp(M_pot);

%====================== ADJUSTMENT COST FCNS =============================%
g_fcn_pot =  (psi_I / 2) * (( exp(ID_pot) * exp(g_pot(-1)) / exp(ID_pot(-1)) ) - g_ss)^2 ; % 57
g_fcn_prime_pot =  psi_I * (( exp(ID_pot) * exp(g_pot(-1)) / exp(ID_pot(-1)) ) - g_ss)   ; % 58
gm_fcn_pot =  (psi_Im / 2) * ( ( exp(ImD_pot) * exp(g_pot(-1)) / exp(ImD_pot(-1)) ) - g_ss)^2 ; % 59
gm_fcn_prime_pot =  psi_Im * ( ( exp(ImD_pot) * exp(g_pot(-1)) / exp(ImD_pot(-1)) ) - g_ss)   ; % 60
f_fcn_pot        =  (psi_N / 2) * ( ( exp(ND_pot) * exp(g_pot(-1)) / exp(ND_pot(-1)) ) - g_ss)^2 ;   % 61
f_fcn_prime_pot  =   psi_N *      ( ( exp(ND_pot) * exp(g_pot(-1)) / exp(ND_pot(-1)) ) - g_ss)   ;   % 62

%=========================STICKY PRICE EQNS===============================%
% 63. Optimal Pricing Equation 
exp(mkup_pot) = omegabar/(omegabar - 1);   % NOTE: no markup shocks in potential economy

% 64. Euler Equation
1 = exp(LAMBDA_pot(+1)) * exp(R_nom_pot) * exp(DELTAB) / pi_ss;

% 65. Real (detrended) wage
exp(wD_pot) = (omegal/(omegal-1)) * chi * exp(L_pot)^epsilon * (1/exp(UCD_pot) );

%% ---- %%
% extras %
%% ---- %%

% 66. Ratio of A to Apot (needed for output gap in the Taylor rule)
exp(Aratio) = exp(Aratio(-1)) * exp(g(-1)) / exp(g_pot(-1));

% 67. Stock price (detrended)
exp(SD) = exp(Q)*exp(KD) + (exp(H) - exp(PI)) + ( exp(J) + exp(M)*exp(Qm) )*(exp(ZD) - 1);

% 68. investment growth
exp(d_I) = exp(ID) * exp(g(-1)) / exp(ID(-1));

% 69. R&D growth
exp(d_N) = exp(ND) * exp(g(-1)) / exp(ND(-1));

end;




shocks;
var epsilon_chi   = 0;
var epsilon_n     = 1;
var epsilon_m     = 1;
var epsilon_b     = 1;
var epsilon_omega = 0;
var epsilon_tfp   = 0;
end;


%% -------------------
% This saves the oo_ and M_ objects without any steady state defined (used in estimation)
evalin('base','save level0workspace oo_ M_ options_')
%% -------------------


steady;
check;


%=========================================================================%
%%%%                       RUN                                         %%%%
%=========================================================================%

% stoch_simul(order=1, irf = 12, nograph, nodisplay, nocorr, nomoments);
stoch_simul(order=1, irf = 12, nograph, nodisplay, nocorr, nomoments, periods = 500);

