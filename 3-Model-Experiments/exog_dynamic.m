function [residual, g1, g2, g3] = exog_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [M_.exo_nbr by nperiods] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           columns: equations in order of declaration
%                                                           rows: variables in order stored in M_.lead_lag_incidence
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              columns: equations in order of declaration
%                                                              rows: variables in order stored in M_.lead_lag_incidence
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              columns: equations in order of declaration
%                                                              rows: variables in order stored in M_.lead_lag_incidence
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(42, 1);
T20 = exp(y(4))/exp(y(1));
T27 = exp(y(23))^(1-params(2));
T48 = exp(y(1))^(-1);
T75 = (params(6)-1)/params(6);
T77 = (1-params(2))*1/exp(y(27))*T75;
T79 = T77*exp(y(19))/exp(y(23));
T93 = exp(y(1))*exp(y(26))/exp(y(5));
T95 = T93*y(34);
T102 = exp(y(18))*exp(y(64))/exp(y(26));
T118 = params(2)*exp(y(18))*(params(6)-1)*exp(y(60))/(params(6)*exp(y(24))*exp(y(65)));
T126 = params(14)/2;
T147 = exp(y(6))^params(37)*params(36)^(1-params(37));
T165 = exp(y(28))*exp(y(37))/(exp(y(37))-1)*exp(y(30))/exp(y(31));
T173 = params(1)*params(26)*exp(y(28))^(params(37)*(-exp(y(37))));
T175 = params(36)^((1-params(37))*(-exp(y(37))));
T176 = T173*T175;
T179 = exp(y(66))^exp(y(37));
T183 = T176*T179*exp(y(67));
T189 = params(1)*params(26)*exp(y(28))^((1-exp(y(37)))*params(37));
T191 = params(36)^((1-exp(y(37)))*(1-params(37)));
T192 = T189*T191;
T193 = exp(y(66))^(exp(y(37))-1);
T197 = T192*T193*exp(y(68));
T206 = exp(y(62))*exp(y(32))/exp(y(66))*exp(y(35));
T211 = exp(y(7))^params(24);
T214 = (exp(y(28))/params(36))^params(22);
T217 = exp(y(19))/exp(y(49));
T223 = params(1)*params(32)^(-1);
T224 = params(36)*T214*T217^params(23)/T223;
T246 = params(32)*T48*exp(y(28))^(-1)*exp(y(12));
T250 = params(36)^(1-params(29));
T251 = exp(y(6))^params(29)*T250;
T252 = T246*T251;
T264 = params(28)/(params(28)-1)*exp(y(42))/exp(y(43));
T283 = params(32)*params(1)*params(27)*exp(y(18))^(-1)*T250*exp(y(28))^params(29);
T284 = exp(y(66))^(-1);
T291 = exp(y(41))/exp(y(40));
T294 = exp(y(23))*T291^(-params(28));
T346 = exp(y(16))/exp(y(13));
T351 = exp(y(51))^(1-params(2));
T352 = exp(y(39))*T346^params(2)*T351;
T372 = params(1)*exp(y(55))/exp(y(17))*exp(y(13))^(-1);
T397 = (1-params(2))*T75*1/exp(y(50))*exp(y(49))/exp(y(51));
T409 = exp(y(13))*exp(y(53))/exp(y(15));
T411 = T409*y(59);
T418 = exp(y(47))*exp(y(76))/exp(y(53));
T434 = params(2)*(params(6)-1)*exp(y(47))*exp(y(73))/(params(6)*exp(y(54))*exp(y(74)));
T458 = params(28)/(params(28)-1)*params(5)*exp(y(51))^params(3);
T465 = (-(exp(y(4))*exp(y(1))))/(exp(y(1))*exp(y(1)));
T479 = getPowerDeriv(exp(y(20))-params(43)*exp(y(2))/exp(y(1)),(-1),1);
T495 = getPowerDeriv(T252,1-params(28),1);
T499 = getPowerDeriv(exp(y(18))*exp(y(61))-exp(y(20))*params(43),(-1),1);
T526 = getPowerDeriv(T224,1-params(24),1);
T579 = (-(exp(y(62))*(-(params(2)*exp(y(18))*(params(6)-1)*exp(y(60))*params(6)*exp(y(24))*exp(y(65))))/(params(6)*exp(y(24))*exp(y(65))*params(6)*exp(y(24))*exp(y(65)))));
T585 = (-(exp(y(1))*exp(y(26))*exp(y(5))))/(exp(y(5))*exp(y(5)));
T712 = (-(exp(y(35))*exp(y(72))*exp(y(57))/params(36)));
T806 = (-(exp(y(16))*exp(y(13))))/(exp(y(13))*exp(y(13)));
T820 = getPowerDeriv(exp(y(52))-params(43)*exp(y(14))/exp(y(13)),(-1),1);
T832 = getPowerDeriv(exp(y(47))*exp(y(75))-params(43)*exp(y(52)),(-1),1);
T870 = (-(exp(y(72))*(-(params(2)*(params(6)-1)*exp(y(47))*exp(y(73))*params(6)*exp(y(54))*exp(y(74))))/(params(6)*exp(y(54))*exp(y(74))*params(6)*exp(y(54))*exp(y(74)))));
T899 = (-(exp(y(13))*exp(y(53))*exp(y(15))))/(exp(y(15))*exp(y(15)));
lhs =exp(y(18));
rhs =params(32);
residual(1)= lhs-rhs;
lhs =exp(y(19));
rhs =exp(y(39))*T20^params(2)*T27;
residual(2)= lhs-rhs;
lhs =exp(y(19));
rhs =exp(y(20))+(1+y(33))*exp(y(26));
residual(3)= lhs-rhs;
lhs =exp(y(21));
rhs =params(1)*exp(y(22))/exp(y(3))*T48;
residual(4)= lhs-rhs;
lhs =exp(y(22));
rhs =(exp(y(20))-params(43)*exp(y(2))/exp(y(1)))^(-1)-params(1)*params(43)*(exp(y(18))*exp(y(61))-exp(y(20))*params(43))^(-1);
residual(5)= lhs-rhs;
lhs =exp(y(40));
rhs =T79;
residual(6)= lhs-rhs;
lhs =exp(y(24));
rhs =exp(y(26))+T20*(1-params(4));
residual(7)= lhs-rhs;
lhs =exp(y(25));
rhs =1+y(33)+T95-exp(y(62))*T102^2*y(69);
residual(8)= lhs-rhs;
lhs =exp(y(25));
rhs =exp(y(62))*(T118+(1-params(4))*exp(y(63)));
residual(9)= lhs-rhs;
lhs =y(33);
rhs =T126*(T93-params(32))^2;
residual(10)= lhs-rhs;
lhs =y(34);
rhs =params(14)*(T93-params(32));
residual(11)= lhs-rhs;
lhs =exp(y(28))^(1-exp(y(37)));
rhs =params(26)*T147^(1-exp(y(37)))+(1-params(26))*exp(y(29))^(1-exp(y(37)));
residual(12)= lhs-rhs;
lhs =exp(y(29));
rhs =T165;
residual(13)= lhs-rhs;
lhs =exp(y(30));
rhs =exp(y(19))*exp(y(22))*1/exp(y(27))+T183;
residual(14)= lhs-rhs;
lhs =exp(y(31));
rhs =exp(y(19))*exp(y(22))+T197;
residual(15)= lhs-rhs;
lhs =1;
rhs =T206;
residual(16)= lhs-rhs;
lhs =exp(y(32));
rhs =T211*T224^(1-params(24))*exp(y(36));
residual(17)= lhs-rhs;
lhs =exp(y(40))^(1-params(28));
rhs =(1-params(27))*exp(y(41))^(1-params(28))+params(27)*T252^(1-params(28));
residual(18)= lhs-rhs;
lhs =exp(y(41));
rhs =T264;
residual(19)= lhs-rhs;
lhs =exp(y(42));
rhs =exp(y(22))*exp(y(44))*exp(y(45))+params(1)*params(27)*exp(y(70));
residual(20)= lhs-rhs;
lhs =exp(y(43));
rhs =exp(y(22))*exp(y(44))+T283*T284*exp(y(71));
residual(21)= lhs-rhs;
lhs =exp(y(44));
rhs =T294;
residual(22)= lhs-rhs;
lhs =exp(y(45));
rhs =params(5)*exp(y(44))^params(3)/exp(y(22));
residual(23)= lhs-rhs;
lhs =y(36);
rhs =params(19)*y(9)+params(18)*x(it_, 1);
residual(24)= lhs-rhs;
lhs =y(35);
rhs =params(21)*y(8)+params(20)*x(it_, 2);
residual(25)= lhs-rhs;
lhs =exp(y(37));
rhs =params(38)*exp(y(38));
residual(26)= lhs-rhs;
lhs =y(38);
rhs =params(39)*y(10)+params(40)*x(it_, 3);
residual(27)= lhs-rhs;
lhs =y(39);
rhs =params(41)*y(11)+params(42)*x(it_, 4);
residual(28)= lhs-rhs;
lhs =exp(y(47));
rhs =params(32);
residual(29)= lhs-rhs;
lhs =exp(y(49));
rhs =T352;
residual(30)= lhs-rhs;
lhs =exp(y(49));
rhs =exp(y(52))+(1+y(58))*exp(y(53));
residual(31)= lhs-rhs;
lhs =exp(y(48));
rhs =T372;
residual(32)= lhs-rhs;
lhs =exp(y(55));
rhs =(exp(y(52))-params(43)*exp(y(14))/exp(y(13)))^(-1)-params(1)*params(43)*(exp(y(47))*exp(y(75))-params(43)*exp(y(52)))^(-1);
residual(33)= lhs-rhs;
lhs =exp(y(46));
rhs =T397;
residual(34)= lhs-rhs;
lhs =exp(y(54));
rhs =exp(y(53))+(1-params(4))*T346;
residual(35)= lhs-rhs;
lhs =exp(y(56));
rhs =1+y(58)+T411-exp(y(72))*T418^2*y(78);
residual(36)= lhs-rhs;
lhs =exp(y(56));
rhs =exp(y(72))*(T434+(1-params(4))*exp(y(77)));
residual(37)= lhs-rhs;
lhs =y(58);
rhs =T126*(T409-params(32))^2;
residual(38)= lhs-rhs;
lhs =y(59);
rhs =params(14)*(T409-params(32));
residual(39)= lhs-rhs;
lhs =exp(y(50));
rhs =params(38)/(params(38)-1);
residual(40)= lhs-rhs;
lhs =1;
rhs =exp(y(35))*exp(y(72))*exp(y(57))/params(36);
residual(41)= lhs-rhs;
lhs =exp(y(46));
rhs =T458*1/exp(y(55));
residual(42)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(42, 82);

  %
  % Jacobian matrix
  %

  g1(1,18)=exp(y(18));
  g1(2,1)=(-(T27*exp(y(39))*T465*getPowerDeriv(T20,params(2),1)));
  g1(2,19)=exp(y(19));
  g1(2,23)=(-(exp(y(39))*T20^params(2)*exp(y(23))*getPowerDeriv(exp(y(23)),1-params(2),1)));
  g1(2,4)=(-(T27*exp(y(39))*T20*getPowerDeriv(T20,params(2),1)));
  g1(2,39)=(-(exp(y(39))*T20^params(2)*T27));
  g1(3,19)=exp(y(19));
  g1(3,20)=(-exp(y(20)));
  g1(3,26)=(-((1+y(33))*exp(y(26))));
  g1(3,33)=(-exp(y(26)));
  g1(4,1)=(-(params(1)*exp(y(22))/exp(y(3))*exp(y(1))*getPowerDeriv(exp(y(1)),(-1),1)));
  g1(4,21)=exp(y(21));
  g1(4,3)=(-(T48*(-(params(1)*exp(y(22))*exp(y(3))))/(exp(y(3))*exp(y(3)))));
  g1(4,22)=(-(params(1)*exp(y(22))/exp(y(3))*T48));
  g1(5,1)=(-((-((-(exp(y(1))*params(43)*exp(y(2))))/(exp(y(1))*exp(y(1)))))*T479));
  g1(5,18)=params(1)*params(43)*exp(y(18))*exp(y(61))*T499;
  g1(5,2)=(-(T479*(-(params(43)*exp(y(2))/exp(y(1))))));
  g1(5,20)=(-(exp(y(20))*T479-params(1)*params(43)*T499*(-(exp(y(20))*params(43)))));
  g1(5,61)=params(1)*params(43)*exp(y(18))*exp(y(61))*T499;
  g1(5,22)=exp(y(22));
  g1(6,19)=(-T79);
  g1(6,23)=(-(T77*(-(exp(y(19))*exp(y(23))))/(exp(y(23))*exp(y(23)))));
  g1(6,27)=(-(exp(y(19))/exp(y(23))*(1-params(2))*T75*(-exp(y(27)))/(exp(y(27))*exp(y(27)))));
  g1(6,40)=exp(y(40));
  g1(7,1)=(-((1-params(4))*T465));
  g1(7,4)=(-(T20*(1-params(4))));
  g1(7,24)=exp(y(24));
  g1(7,26)=(-exp(y(26)));
  g1(8,1)=(-T95);
  g1(8,18)=y(69)*exp(y(62))*T102*2*T102;
  g1(8,62)=exp(y(62))*T102^2*y(69);
  g1(8,25)=exp(y(25));
  g1(8,5)=(-(y(34)*T585));
  g1(8,26)=(-(T95-y(69)*exp(y(62))*2*T102*(-(exp(y(26))*exp(y(18))*exp(y(64))))/(exp(y(26))*exp(y(26)))));
  g1(8,64)=y(69)*exp(y(62))*T102*2*T102;
  g1(8,33)=(-1);
  g1(8,34)=(-T93);
  g1(8,69)=exp(y(62))*T102^2;
  g1(9,18)=(-(exp(y(62))*T118));
  g1(9,60)=(-(exp(y(62))*T118));
  g1(9,62)=(-(exp(y(62))*(T118+(1-params(4))*exp(y(63)))));
  g1(9,24)=T579;
  g1(9,25)=exp(y(25));
  g1(9,63)=(-(exp(y(62))*(1-params(4))*exp(y(63))));
  g1(9,65)=T579;
  g1(10,1)=(-(T126*T93*2*(T93-params(32))));
  g1(10,5)=(-(T126*2*(T93-params(32))*T585));
  g1(10,26)=(-(T126*T93*2*(T93-params(32))));
  g1(10,33)=1;
  g1(11,1)=(-(T93*params(14)));
  g1(11,5)=(-(params(14)*T585));
  g1(11,26)=(-(T93*params(14)));
  g1(11,34)=1;
  g1(12,6)=(-(params(26)*params(36)^(1-params(37))*exp(y(6))*getPowerDeriv(exp(y(6)),params(37),1)*getPowerDeriv(T147,1-exp(y(37)),1)));
  g1(12,28)=exp(y(28))*getPowerDeriv(exp(y(28)),1-exp(y(37)),1);
  g1(12,29)=(-((1-params(26))*exp(y(29))*getPowerDeriv(exp(y(29)),1-exp(y(37)),1)));
  g1(12,37)=exp(y(28))^(1-exp(y(37)))*(-exp(y(37)))*log(exp(y(28)))-(params(26)*T147^(1-exp(y(37)))*(-exp(y(37)))*log(T147)+(1-params(26))*exp(y(29))^(1-exp(y(37)))*(-exp(y(37)))*log(exp(y(29))));
  g1(13,28)=(-T165);
  g1(13,29)=exp(y(29));
  g1(13,30)=(-T165);
  g1(13,31)=(-(exp(y(28))*exp(y(37))/(exp(y(37))-1)*(-(exp(y(30))*exp(y(31))))/(exp(y(31))*exp(y(31)))));
  g1(13,37)=(-(exp(y(28))*exp(y(30))/exp(y(31))*(exp(y(37))*(exp(y(37))-1)-exp(y(37))*exp(y(37)))/((exp(y(37))-1)*(exp(y(37))-1))));
  g1(14,19)=(-(exp(y(19))*exp(y(22))*1/exp(y(27))));
  g1(14,22)=(-(exp(y(19))*exp(y(22))*1/exp(y(27))));
  g1(14,27)=(-(exp(y(19))*exp(y(22))*(-exp(y(27)))/(exp(y(27))*exp(y(27)))));
  g1(14,28)=(-(exp(y(67))*T179*T175*params(1)*params(26)*exp(y(28))*getPowerDeriv(exp(y(28)),params(37)*(-exp(y(37))),1)));
  g1(14,66)=(-(exp(y(67))*T176*exp(y(66))*getPowerDeriv(exp(y(66)),exp(y(37)),1)));
  g1(14,30)=exp(y(30));
  g1(14,67)=(-T183);
  g1(14,37)=(-(exp(y(67))*(T179*(T175*params(1)*params(26)*exp(y(28))^(params(37)*(-exp(y(37))))*params(37)*(-exp(y(37)))*log(exp(y(28)))+T173*T175*(1-params(37))*(-exp(y(37)))*log(params(36)))+T176*T179*exp(y(37))*log(exp(y(66))))));
  g1(15,19)=(-(exp(y(19))*exp(y(22))));
  g1(15,22)=(-(exp(y(19))*exp(y(22))));
  g1(15,28)=(-(exp(y(68))*T193*T191*params(1)*params(26)*exp(y(28))*getPowerDeriv(exp(y(28)),(1-exp(y(37)))*params(37),1)));
  g1(15,66)=(-(exp(y(68))*T192*exp(y(66))*getPowerDeriv(exp(y(66)),exp(y(37))-1,1)));
  g1(15,31)=exp(y(31));
  g1(15,68)=(-T197);
  g1(15,37)=(-(exp(y(68))*(T193*(T191*params(1)*params(26)*exp(y(28))^((1-exp(y(37)))*params(37))*params(37)*(-exp(y(37)))*log(exp(y(28)))+T189*T191*(1-params(37))*(-exp(y(37)))*log(params(36)))+T192*T193*exp(y(37))*log(exp(y(66))))));
  g1(16,62)=(-T206);
  g1(16,66)=(-(exp(y(35))*(-(exp(y(66))*exp(y(62))*exp(y(32))))/(exp(y(66))*exp(y(66)))));
  g1(16,32)=(-T206);
  g1(16,35)=(-T206);
  g1(17,19)=(-(exp(y(36))*T211*params(36)*T214*T217*getPowerDeriv(T217,params(23),1)/T223*T526));
  g1(17,28)=(-(exp(y(36))*T211*T526*params(36)*T217^params(23)*exp(y(28))/params(36)*getPowerDeriv(exp(y(28))/params(36),params(22),1)/T223));
  g1(17,7)=(-(exp(y(36))*T224^(1-params(24))*exp(y(7))*getPowerDeriv(exp(y(7)),params(24),1)));
  g1(17,32)=exp(y(32));
  g1(17,36)=(-(T211*T224^(1-params(24))*exp(y(36))));
  g1(17,49)=(-(exp(y(36))*T211*T526*params(36)*T214*getPowerDeriv(T217,params(23),1)*(-(exp(y(19))*exp(y(49))))/(exp(y(49))*exp(y(49)))/T223));
  g1(18,1)=(-(params(27)*T251*params(32)*exp(y(12))*exp(y(28))^(-1)*exp(y(1))*getPowerDeriv(exp(y(1)),(-1),1)*T495));
  g1(18,6)=(-(params(27)*T495*T246*T250*exp(y(6))*getPowerDeriv(exp(y(6)),params(29),1)));
  g1(18,28)=(-(params(27)*T495*T251*params(32)*exp(y(12))*T48*exp(y(28))*getPowerDeriv(exp(y(28)),(-1),1)));
  g1(18,12)=(-(params(27)*T252*T495));
  g1(18,40)=exp(y(40))*getPowerDeriv(exp(y(40)),1-params(28),1);
  g1(18,41)=(-((1-params(27))*exp(y(41))*getPowerDeriv(exp(y(41)),1-params(28),1)));
  g1(19,41)=exp(y(41));
  g1(19,42)=(-T264);
  g1(19,43)=(-((-(params(28)/(params(28)-1)*exp(y(42))*exp(y(43))))/(exp(y(43))*exp(y(43)))));
  g1(20,22)=(-(exp(y(22))*exp(y(44))*exp(y(45))));
  g1(20,42)=exp(y(42));
  g1(20,70)=(-(params(1)*params(27)*exp(y(70))));
  g1(20,44)=(-(exp(y(22))*exp(y(44))*exp(y(45))));
  g1(20,45)=(-(exp(y(22))*exp(y(44))*exp(y(45))));
  g1(21,18)=(-(exp(y(71))*T284*T250*exp(y(28))^params(29)*params(32)*params(1)*params(27)*exp(y(18))*getPowerDeriv(exp(y(18)),(-1),1)));
  g1(21,22)=(-(exp(y(22))*exp(y(44))));
  g1(21,28)=(-(exp(y(71))*T284*params(32)*params(1)*params(27)*exp(y(18))^(-1)*T250*exp(y(28))*getPowerDeriv(exp(y(28)),params(29),1)));
  g1(21,66)=(-(exp(y(71))*T283*exp(y(66))*getPowerDeriv(exp(y(66)),(-1),1)));
  g1(21,43)=exp(y(43));
  g1(21,71)=(-(T283*T284*exp(y(71))));
  g1(21,44)=(-(exp(y(22))*exp(y(44))));
  g1(22,23)=(-T294);
  g1(22,40)=(-(exp(y(23))*(-(exp(y(40))*exp(y(41))))/(exp(y(40))*exp(y(40)))*getPowerDeriv(T291,(-params(28)),1)));
  g1(22,41)=(-(exp(y(23))*T291*getPowerDeriv(T291,(-params(28)),1)));
  g1(22,44)=exp(y(44));
  g1(23,22)=(-((-(exp(y(22))*params(5)*exp(y(44))^params(3)))/(exp(y(22))*exp(y(22)))));
  g1(23,44)=(-(params(5)*exp(y(44))*getPowerDeriv(exp(y(44)),params(3),1)/exp(y(22))));
  g1(23,45)=exp(y(45));
  g1(24,9)=(-params(19));
  g1(24,36)=1;
  g1(24,79)=(-params(18));
  g1(25,8)=(-params(21));
  g1(25,35)=1;
  g1(25,80)=(-params(20));
  g1(26,37)=exp(y(37));
  g1(26,38)=(-(params(38)*exp(y(38))));
  g1(27,10)=(-params(39));
  g1(27,38)=1;
  g1(27,81)=(-params(40));
  g1(28,11)=(-params(41));
  g1(28,39)=1;
  g1(28,82)=(-params(42));
  g1(29,47)=exp(y(47));
  g1(30,39)=(-T352);
  g1(30,13)=(-(T351*exp(y(39))*T806*getPowerDeriv(T346,params(2),1)));
  g1(30,49)=exp(y(49));
  g1(30,51)=(-(exp(y(39))*T346^params(2)*exp(y(51))*getPowerDeriv(exp(y(51)),1-params(2),1)));
  g1(30,16)=(-(T351*exp(y(39))*T346*getPowerDeriv(T346,params(2),1)));
  g1(31,49)=exp(y(49));
  g1(31,52)=(-exp(y(52)));
  g1(31,53)=(-((1+y(58))*exp(y(53))));
  g1(31,58)=(-exp(y(53)));
  g1(32,13)=(-(params(1)*exp(y(55))/exp(y(17))*exp(y(13))*getPowerDeriv(exp(y(13)),(-1),1)));
  g1(32,48)=exp(y(48));
  g1(32,17)=(-(exp(y(13))^(-1)*(-(params(1)*exp(y(55))*exp(y(17))))/(exp(y(17))*exp(y(17)))));
  g1(32,55)=(-T372);
  g1(33,13)=(-((-((-(exp(y(13))*params(43)*exp(y(14))))/(exp(y(13))*exp(y(13)))))*T820));
  g1(33,47)=params(1)*params(43)*exp(y(47))*exp(y(75))*T832;
  g1(33,14)=(-(T820*(-(params(43)*exp(y(14))/exp(y(13))))));
  g1(33,52)=(-(exp(y(52))*T820-params(1)*params(43)*T832*(-(params(43)*exp(y(52))))));
  g1(33,75)=params(1)*params(43)*exp(y(47))*exp(y(75))*T832;
  g1(33,55)=exp(y(55));
  g1(34,46)=exp(y(46));
  g1(34,49)=(-T397);
  g1(34,50)=(-(exp(y(49))/exp(y(51))*(1-params(2))*T75*(-exp(y(50)))/(exp(y(50))*exp(y(50)))));
  g1(34,51)=(-((1-params(2))*T75*1/exp(y(50))*(-(exp(y(49))*exp(y(51))))/(exp(y(51))*exp(y(51)))));
  g1(35,13)=(-((1-params(4))*T806));
  g1(35,53)=(-exp(y(53)));
  g1(35,16)=(-((1-params(4))*T346));
  g1(35,54)=exp(y(54));
  g1(36,13)=(-T411);
  g1(36,47)=y(78)*exp(y(72))*T418*2*T418;
  g1(36,72)=exp(y(72))*T418^2*y(78);
  g1(36,15)=(-(y(59)*T899));
  g1(36,53)=(-(T411-y(78)*exp(y(72))*2*T418*(-(exp(y(53))*exp(y(47))*exp(y(76))))/(exp(y(53))*exp(y(53)))));
  g1(36,76)=y(78)*exp(y(72))*T418*2*T418;
  g1(36,56)=exp(y(56));
  g1(36,58)=(-1);
  g1(36,59)=(-T409);
  g1(36,78)=exp(y(72))*T418^2;
  g1(37,47)=(-(exp(y(72))*T434));
  g1(37,72)=(-(exp(y(72))*(T434+(1-params(4))*exp(y(77)))));
  g1(37,73)=(-(exp(y(72))*T434));
  g1(37,74)=T870;
  g1(37,54)=T870;
  g1(37,56)=exp(y(56));
  g1(37,77)=(-(exp(y(72))*(1-params(4))*exp(y(77))));
  g1(38,13)=(-(T126*T409*2*(T409-params(32))));
  g1(38,15)=(-(T126*2*(T409-params(32))*T899));
  g1(38,53)=(-(T126*T409*2*(T409-params(32))));
  g1(38,58)=1;
  g1(39,13)=(-(params(14)*T409));
  g1(39,15)=(-(params(14)*T899));
  g1(39,53)=(-(params(14)*T409));
  g1(39,59)=1;
  g1(40,50)=exp(y(50));
  g1(41,35)=T712;
  g1(41,72)=T712;
  g1(41,57)=T712;
  g1(42,46)=exp(y(46));
  g1(42,51)=(-(1/exp(y(55))*params(28)/(params(28)-1)*params(5)*exp(y(51))*getPowerDeriv(exp(y(51)),params(3),1)));
  g1(42,55)=(-(T458*(-exp(y(55)))/(exp(y(55))*exp(y(55)))));
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],42,6724);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],42,551368);
end
end
