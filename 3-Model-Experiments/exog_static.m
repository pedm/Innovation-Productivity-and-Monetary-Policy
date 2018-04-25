function [residual, g1, g2] = exog_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                    columns: equations in order of declaration
%                                                    rows: variables in declaration order
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: equations in order of declaration
%                                                       rows: variables in declaration order
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 42, 1);

%
% Model equations
%

T18 = exp(y(7))/exp(y(1));
T25 = exp(y(6))^(1-params(2));
T44 = exp(y(1))^(-1);
T50 = exp(y(3))-exp(y(3))*params(43)/exp(y(1));
T66 = (params(6)-1)/params(6);
T68 = (1-params(2))*1/exp(y(10))*T66;
T70 = T68*exp(y(2))/exp(y(6));
T80 = exp(y(1))*exp(y(9))/exp(y(9));
T94 = params(2)*exp(y(2))*exp(y(1))*(params(6)-1)/(params(6)*exp(y(7))*exp(y(10)));
T100 = params(14)/2;
T108 = exp(y(11));
T119 = T108^params(37)*params(36)^(1-params(37));
T137 = T108*exp(y(20))/(exp(y(20))-1)*exp(y(13))/exp(y(14));
T145 = params(1)*params(26)*T108^(params(37)*(-exp(y(20))));
T147 = params(36)^((1-params(37))*(-exp(y(20))));
T148 = T145*T147;
T149 = T108^exp(y(20));
T151 = exp(y(13))*T148*T149;
T159 = params(36)^((1-exp(y(20)))*(1-params(37)));
T160 = params(1)*params(26)*T108^((1-exp(y(20)))*params(37))*T159;
T161 = T108^(exp(y(20))-1);
T175 = exp(y(15))^params(24);
T178 = (T108/params(36))^params(22);
T181 = exp(y(2))/exp(y(32));
T187 = params(1)*params(32)^(-1);
T188 = params(36)*T178*T181^params(23)/T187;
T205 = T108^(-1);
T213 = T108^params(29)*params(36)^(1-params(29));
T226 = params(28)/(params(28)-1)*exp(y(25))/exp(y(26));
T245 = exp(y(24))/exp(y(23));
T248 = exp(y(6))*T245^(-params(28));
T294 = exp(y(37))/exp(y(30));
T299 = exp(y(34))^(1-params(2));
T300 = exp(y(22))*T294^params(2)*T299;
T322 = exp(y(35))-params(43)*exp(y(35))/exp(y(30));
T338 = (1-params(2))*T66*1/exp(y(33))*exp(y(32))/exp(y(34));
T346 = exp(y(30))*exp(y(36))/exp(y(36));
T360 = params(2)*exp(y(32))*(params(6)-1)*exp(y(30))/(params(6)*exp(y(37))*exp(y(33)));
T382 = params(28)/(params(28)-1)*params(5)*exp(y(34))^params(3);
T389 = (-(exp(y(1))*exp(y(7))))/(exp(y(1))*exp(y(1)));
T396 = exp(y(1))*getPowerDeriv(exp(y(1)),(-1),1);
T405 = getPowerDeriv(exp(y(1))*exp(y(3))-exp(y(3))*params(43),(-1),1);
T430 = getPowerDeriv(params(32)*exp(y(23))*T44*T205*T213,1-params(28),1);
T448 = getPowerDeriv(T188,1-params(24),1);
T461 = (-(exp(y(4))*exp(y(15))/T108*exp(y(18))));
T491 = (-(exp(y(4))*(-(params(2)*exp(y(2))*exp(y(1))*(params(6)-1)*params(6)*exp(y(7))*exp(y(10))))/(params(6)*exp(y(7))*exp(y(10))*params(6)*exp(y(7))*exp(y(10)))));
T562 = params(36)^(1-params(29))*T108*getPowerDeriv(T108,params(29),1);
T596 = (-(exp(y(18))*exp(y(31))*exp(y(40))/params(36)));
T689 = (-(exp(y(30))*exp(y(37))))/(exp(y(30))*exp(y(30)));
T705 = getPowerDeriv(exp(y(30))*exp(y(35))-params(43)*exp(y(35)),(-1),1);
T753 = (-(exp(y(31))*(-(params(2)*exp(y(32))*(params(6)-1)*exp(y(30))*params(6)*exp(y(37))*exp(y(33))))/(params(6)*exp(y(37))*exp(y(33))*params(6)*exp(y(37))*exp(y(33)))));
lhs =exp(y(1));
rhs =params(32);
residual(1)= lhs-rhs;
lhs =exp(y(2));
rhs =exp(y(22))*T18^params(2)*T25;
residual(2)= lhs-rhs;
lhs =exp(y(2));
rhs =exp(y(3))+(1+y(16))*exp(y(9));
residual(3)= lhs-rhs;
lhs =exp(y(4));
rhs =params(1)*exp(y(5))/exp(y(5))*T44;
residual(4)= lhs-rhs;
lhs =exp(y(5));
rhs =T50^(-1)-params(1)*params(43)*(exp(y(1))*exp(y(3))-exp(y(3))*params(43))^(-1);
residual(5)= lhs-rhs;
lhs =exp(y(23));
rhs =T70;
residual(6)= lhs-rhs;
lhs =exp(y(7));
rhs =exp(y(9))+T18*(1-params(4));
residual(7)= lhs-rhs;
lhs =exp(y(8));
rhs =1+y(16)+T80*y(17)-y(17)*exp(y(4))*T80^2;
residual(8)= lhs-rhs;
lhs =exp(y(8));
rhs =exp(y(4))*(T94+(1-params(4))*exp(y(8)));
residual(9)= lhs-rhs;
lhs =y(16);
rhs =T100*(T80-params(32))^2;
residual(10)= lhs-rhs;
lhs =y(17);
rhs =params(14)*(T80-params(32));
residual(11)= lhs-rhs;
lhs =T108^(1-exp(y(20)));
rhs =params(26)*T119^(1-exp(y(20)))+(1-params(26))*exp(y(12))^(1-exp(y(20)));
residual(12)= lhs-rhs;
lhs =exp(y(12));
rhs =T137;
residual(13)= lhs-rhs;
lhs =exp(y(13));
rhs =exp(y(2))*exp(y(5))*1/exp(y(10))+T151;
residual(14)= lhs-rhs;
lhs =exp(y(14));
rhs =exp(y(2))*exp(y(5))+exp(y(14))*T160*T161;
residual(15)= lhs-rhs;
lhs =1;
rhs =exp(y(4))*exp(y(15))/T108*exp(y(18));
residual(16)= lhs-rhs;
lhs =exp(y(15));
rhs =T175*T188^(1-params(24))*exp(y(19));
residual(17)= lhs-rhs;
lhs =exp(y(23))^(1-params(28));
rhs =(1-params(27))*exp(y(24))^(1-params(28))+params(27)*(params(32)*exp(y(23))*T44*T205*T213)^(1-params(28));
residual(18)= lhs-rhs;
lhs =exp(y(24));
rhs =T226;
residual(19)= lhs-rhs;
lhs =exp(y(25));
rhs =exp(y(5))*exp(y(27))*exp(y(28))+exp(y(25))*params(1)*params(27);
residual(20)= lhs-rhs;
lhs =exp(y(26));
rhs =exp(y(5))*exp(y(27))+exp(y(26))*T205*T213*params(32)*T44*params(1)*params(27);
residual(21)= lhs-rhs;
lhs =exp(y(27));
rhs =T248;
residual(22)= lhs-rhs;
lhs =exp(y(28));
rhs =params(5)*exp(y(27))^params(3)/exp(y(5));
residual(23)= lhs-rhs;
lhs =y(19);
rhs =y(19)*params(19)+params(18)*x(1);
residual(24)= lhs-rhs;
lhs =y(18);
rhs =y(18)*params(21)+params(20)*x(2);
residual(25)= lhs-rhs;
lhs =exp(y(20));
rhs =params(38)*exp(y(21));
residual(26)= lhs-rhs;
lhs =y(21);
rhs =y(21)*params(39)+params(40)*x(3);
residual(27)= lhs-rhs;
lhs =y(22);
rhs =y(22)*params(41)+params(42)*x(4);
residual(28)= lhs-rhs;
lhs =exp(y(30));
rhs =params(32);
residual(29)= lhs-rhs;
lhs =exp(y(32));
rhs =T300;
residual(30)= lhs-rhs;
lhs =exp(y(32));
rhs =exp(y(35))+(1+y(41))*exp(y(36));
residual(31)= lhs-rhs;
lhs =exp(y(31));
rhs =params(1)*exp(y(38))/exp(y(38))*exp(y(30))^(-1);
residual(32)= lhs-rhs;
lhs =exp(y(38));
rhs =T322^(-1)-params(1)*params(43)*(exp(y(30))*exp(y(35))-params(43)*exp(y(35)))^(-1);
residual(33)= lhs-rhs;
lhs =exp(y(29));
rhs =T338;
residual(34)= lhs-rhs;
lhs =exp(y(37));
rhs =exp(y(36))+(1-params(4))*T294;
residual(35)= lhs-rhs;
lhs =exp(y(39));
rhs =1+y(41)+T346*y(42)-y(42)*exp(y(31))*T346^2;
residual(36)= lhs-rhs;
lhs =exp(y(39));
rhs =exp(y(31))*(T360+(1-params(4))*exp(y(39)));
residual(37)= lhs-rhs;
lhs =y(41);
rhs =T100*(T346-params(32))^2;
residual(38)= lhs-rhs;
lhs =y(42);
rhs =params(14)*(T346-params(32));
residual(39)= lhs-rhs;
lhs =exp(y(33));
rhs =params(38)/(params(38)-1);
residual(40)= lhs-rhs;
lhs =1;
rhs =exp(y(18))*exp(y(31))*exp(y(40))/params(36);
residual(41)= lhs-rhs;
lhs =exp(y(29));
rhs =T382*1/exp(y(38));
residual(42)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(42, 42);

  %
  % Jacobian matrix
  %

  g1(1,1)=exp(y(1));
  g1(2,1)=(-(T25*exp(y(22))*T389*getPowerDeriv(T18,params(2),1)));
  g1(2,2)=exp(y(2));
  g1(2,6)=(-(exp(y(22))*T18^params(2)*exp(y(6))*getPowerDeriv(exp(y(6)),1-params(2),1)));
  g1(2,7)=(-(T25*exp(y(22))*T18*getPowerDeriv(T18,params(2),1)));
  g1(2,22)=(-(exp(y(22))*T18^params(2)*T25));
  g1(3,2)=exp(y(2));
  g1(3,3)=(-exp(y(3)));
  g1(3,9)=(-((1+y(16))*exp(y(9))));
  g1(3,16)=(-exp(y(9)));
  g1(4,1)=(-(params(1)*exp(y(5))/exp(y(5))*T396));
  g1(4,4)=exp(y(4));
  g1(5,1)=(-((-((-(exp(y(1))*exp(y(3))*params(43)))/(exp(y(1))*exp(y(1)))))*getPowerDeriv(T50,(-1),1)-params(1)*params(43)*exp(y(1))*exp(y(3))*T405));
  g1(5,3)=(-(T50*getPowerDeriv(T50,(-1),1)-params(1)*params(43)*(exp(y(1))*exp(y(3))-exp(y(3))*params(43))*T405));
  g1(5,5)=exp(y(5));
  g1(6,2)=(-T70);
  g1(6,6)=(-(T68*(-(exp(y(2))*exp(y(6))))/(exp(y(6))*exp(y(6)))));
  g1(6,10)=(-(exp(y(2))/exp(y(6))*(1-params(2))*T66*(-exp(y(10)))/(exp(y(10))*exp(y(10)))));
  g1(6,23)=exp(y(23));
  g1(7,1)=(-((1-params(4))*T389));
  g1(7,7)=exp(y(7))-T18*(1-params(4));
  g1(7,9)=(-exp(y(9)));
  g1(8,1)=(-(T80*y(17)-y(17)*exp(y(4))*T80*2*T80));
  g1(8,4)=y(17)*exp(y(4))*T80^2;
  g1(8,8)=exp(y(8));
  g1(8,16)=(-1);
  g1(8,17)=(-(T80-exp(y(4))*T80^2));
  g1(9,1)=(-(exp(y(4))*T94));
  g1(9,2)=(-(exp(y(4))*T94));
  g1(9,4)=(-(exp(y(4))*(T94+(1-params(4))*exp(y(8)))));
  g1(9,7)=T491;
  g1(9,8)=exp(y(8))-exp(y(4))*(1-params(4))*exp(y(8));
  g1(9,10)=T491;
  g1(10,1)=(-(T100*T80*2*(T80-params(32))));
  g1(10,16)=1;
  g1(11,1)=(-(T80*params(14)));
  g1(11,17)=1;
  g1(12,11)=T108*getPowerDeriv(T108,1-exp(y(20)),1)-params(26)*params(36)^(1-params(37))*T108*getPowerDeriv(T108,params(37),1)*getPowerDeriv(T119,1-exp(y(20)),1);
  g1(12,12)=(-((1-params(26))*exp(y(12))*getPowerDeriv(exp(y(12)),1-exp(y(20)),1)));
  g1(12,20)=T108^(1-exp(y(20)))*(-exp(y(20)))*log(T108)-(params(26)*T119^(1-exp(y(20)))*(-exp(y(20)))*log(T119)+(1-params(26))*exp(y(12))^(1-exp(y(20)))*(-exp(y(20)))*log(exp(y(12))));
  g1(13,11)=(-T137);
  g1(13,12)=exp(y(12));
  g1(13,13)=(-T137);
  g1(13,14)=(-(T108*exp(y(20))/(exp(y(20))-1)*(-(exp(y(13))*exp(y(14))))/(exp(y(14))*exp(y(14)))));
  g1(13,20)=(-(T108*exp(y(13))/exp(y(14))*(exp(y(20))*(exp(y(20))-1)-exp(y(20))*exp(y(20)))/((exp(y(20))-1)*(exp(y(20))-1))));
  g1(14,2)=(-(exp(y(2))*exp(y(5))*1/exp(y(10))));
  g1(14,5)=(-(exp(y(2))*exp(y(5))*1/exp(y(10))));
  g1(14,10)=(-(exp(y(2))*exp(y(5))*(-exp(y(10)))/(exp(y(10))*exp(y(10)))));
  g1(14,11)=(-(exp(y(13))*(T149*T147*params(1)*params(26)*T108*getPowerDeriv(T108,params(37)*(-exp(y(20))),1)+T148*T108*getPowerDeriv(T108,exp(y(20)),1))));
  g1(14,13)=exp(y(13))-T151;
  g1(14,20)=(-(exp(y(13))*(T149*(T147*params(1)*params(26)*T108^(params(37)*(-exp(y(20))))*params(37)*(-exp(y(20)))*log(T108)+T145*T147*(1-params(37))*(-exp(y(20)))*log(params(36)))+T148*T149*exp(y(20))*log(T108))));
  g1(15,2)=(-(exp(y(2))*exp(y(5))));
  g1(15,5)=(-(exp(y(2))*exp(y(5))));
  g1(15,11)=(-(exp(y(14))*(T161*T159*params(1)*params(26)*T108*getPowerDeriv(T108,(1-exp(y(20)))*params(37),1)+T160*T108*getPowerDeriv(T108,exp(y(20))-1,1))));
  g1(15,14)=exp(y(14))-exp(y(14))*T160*T161;
  g1(15,20)=(-(exp(y(14))*(T161*(T159*params(1)*params(26)*T108^((1-exp(y(20)))*params(37))*params(37)*(-exp(y(20)))*log(T108)+params(1)*params(26)*T108^((1-exp(y(20)))*params(37))*T159*(1-params(37))*(-exp(y(20)))*log(params(36)))+T160*T161*exp(y(20))*log(T108))));
  g1(16,4)=T461;
  g1(16,11)=(-(exp(y(18))*(-(T108*exp(y(4))*exp(y(15))))/(T108*T108)));
  g1(16,15)=T461;
  g1(16,18)=T461;
  g1(17,2)=(-(exp(y(19))*T175*params(36)*T178*T181*getPowerDeriv(T181,params(23),1)/T187*T448));
  g1(17,11)=(-(exp(y(19))*T175*T448*params(36)*T181^params(23)*T108/params(36)*getPowerDeriv(T108/params(36),params(22),1)/T187));
  g1(17,15)=exp(y(15))-exp(y(19))*T188^(1-params(24))*exp(y(15))*getPowerDeriv(exp(y(15)),params(24),1);
  g1(17,19)=(-(T175*T188^(1-params(24))*exp(y(19))));
  g1(17,32)=(-(exp(y(19))*T175*T448*params(36)*T178*getPowerDeriv(T181,params(23),1)*(-(exp(y(2))*exp(y(32))))/(exp(y(32))*exp(y(32)))/T187));
  g1(18,1)=(-(params(27)*T213*params(32)*exp(y(23))*T205*T396*T430));
  g1(18,11)=(-(params(27)*T430*(T213*params(32)*exp(y(23))*T44*T108*getPowerDeriv(T108,(-1),1)+params(32)*exp(y(23))*T44*T205*T562)));
  g1(18,23)=exp(y(23))*getPowerDeriv(exp(y(23)),1-params(28),1)-params(27)*params(32)*exp(y(23))*T44*T205*T213*T430;
  g1(18,24)=(-((1-params(27))*exp(y(24))*getPowerDeriv(exp(y(24)),1-params(28),1)));
  g1(19,24)=exp(y(24));
  g1(19,25)=(-T226);
  g1(19,26)=(-((-(params(28)/(params(28)-1)*exp(y(25))*exp(y(26))))/(exp(y(26))*exp(y(26)))));
  g1(20,5)=(-(exp(y(5))*exp(y(27))*exp(y(28))));
  g1(20,25)=exp(y(25))-exp(y(25))*params(1)*params(27);
  g1(20,27)=(-(exp(y(5))*exp(y(27))*exp(y(28))));
  g1(20,28)=(-(exp(y(5))*exp(y(27))*exp(y(28))));
  g1(21,1)=(-(exp(y(26))*T205*T213*params(32)*params(1)*params(27)*T396));
  g1(21,5)=(-(exp(y(5))*exp(y(27))));
  g1(21,11)=(-(exp(y(26))*(T213*params(32)*T44*params(1)*params(27)*T108*getPowerDeriv(T108,(-1),1)+T205*params(32)*T44*params(1)*params(27)*T562)));
  g1(21,26)=exp(y(26))-exp(y(26))*T205*T213*params(32)*T44*params(1)*params(27);
  g1(21,27)=(-(exp(y(5))*exp(y(27))));
  g1(22,6)=(-T248);
  g1(22,23)=(-(exp(y(6))*(-(exp(y(23))*exp(y(24))))/(exp(y(23))*exp(y(23)))*getPowerDeriv(T245,(-params(28)),1)));
  g1(22,24)=(-(exp(y(6))*T245*getPowerDeriv(T245,(-params(28)),1)));
  g1(22,27)=exp(y(27));
  g1(23,5)=(-((-(exp(y(5))*params(5)*exp(y(27))^params(3)))/(exp(y(5))*exp(y(5)))));
  g1(23,27)=(-(params(5)*exp(y(27))*getPowerDeriv(exp(y(27)),params(3),1)/exp(y(5))));
  g1(23,28)=exp(y(28));
  g1(24,19)=1-params(19);
  g1(25,18)=1-params(21);
  g1(26,20)=exp(y(20));
  g1(26,21)=(-(params(38)*exp(y(21))));
  g1(27,21)=1-params(39);
  g1(28,22)=1-params(41);
  g1(29,30)=exp(y(30));
  g1(30,22)=(-T300);
  g1(30,30)=(-(T299*exp(y(22))*T689*getPowerDeriv(T294,params(2),1)));
  g1(30,32)=exp(y(32));
  g1(30,34)=(-(exp(y(22))*T294^params(2)*exp(y(34))*getPowerDeriv(exp(y(34)),1-params(2),1)));
  g1(30,37)=(-(T299*exp(y(22))*T294*getPowerDeriv(T294,params(2),1)));
  g1(31,32)=exp(y(32));
  g1(31,35)=(-exp(y(35)));
  g1(31,36)=(-((1+y(41))*exp(y(36))));
  g1(31,41)=(-exp(y(36)));
  g1(32,30)=(-(params(1)*exp(y(38))/exp(y(38))*exp(y(30))*getPowerDeriv(exp(y(30)),(-1),1)));
  g1(32,31)=exp(y(31));
  g1(33,30)=(-((-((-(exp(y(30))*params(43)*exp(y(35))))/(exp(y(30))*exp(y(30)))))*getPowerDeriv(T322,(-1),1)-params(1)*params(43)*exp(y(30))*exp(y(35))*T705));
  g1(33,35)=(-(T322*getPowerDeriv(T322,(-1),1)-params(1)*params(43)*(exp(y(30))*exp(y(35))-params(43)*exp(y(35)))*T705));
  g1(33,38)=exp(y(38));
  g1(34,29)=exp(y(29));
  g1(34,32)=(-T338);
  g1(34,33)=(-(exp(y(32))/exp(y(34))*(1-params(2))*T66*(-exp(y(33)))/(exp(y(33))*exp(y(33)))));
  g1(34,34)=(-((1-params(2))*T66*1/exp(y(33))*(-(exp(y(32))*exp(y(34))))/(exp(y(34))*exp(y(34)))));
  g1(35,30)=(-((1-params(4))*T689));
  g1(35,36)=(-exp(y(36)));
  g1(35,37)=exp(y(37))-(1-params(4))*T294;
  g1(36,30)=(-(T346*y(42)-y(42)*exp(y(31))*T346*2*T346));
  g1(36,31)=y(42)*exp(y(31))*T346^2;
  g1(36,39)=exp(y(39));
  g1(36,41)=(-1);
  g1(36,42)=(-(T346-exp(y(31))*T346^2));
  g1(37,30)=(-(exp(y(31))*T360));
  g1(37,31)=(-(exp(y(31))*(T360+(1-params(4))*exp(y(39)))));
  g1(37,32)=(-(exp(y(31))*T360));
  g1(37,33)=T753;
  g1(37,37)=T753;
  g1(37,39)=exp(y(39))-exp(y(31))*(1-params(4))*exp(y(39));
  g1(38,30)=(-(T100*T346*2*(T346-params(32))));
  g1(38,41)=1;
  g1(39,30)=(-(params(14)*T346));
  g1(39,42)=1;
  g1(40,33)=exp(y(33));
  g1(41,18)=T596;
  g1(41,31)=T596;
  g1(41,40)=T596;
  g1(42,29)=exp(y(29));
  g1(42,34)=(-(1/exp(y(38))*params(28)/(params(28)-1)*params(5)*exp(y(34))*getPowerDeriv(exp(y(34)),params(3),1)));
  g1(42,38)=(-(T382*(-exp(y(38)))/(exp(y(38))*exp(y(38)))));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],42,1764);
end
end
