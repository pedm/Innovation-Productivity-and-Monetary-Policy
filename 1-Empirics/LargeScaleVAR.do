clear
set more off
cd "C:\Users\pedm\Documents\Research\ProductivityProject\ReplicationMaterials\1-Empirics"

import excel "AnnualData.xlsx", sheet("Sheet1") firstrow
keep year gdp tfp rd invexrd cons infl r
tsset year

**********************************************************************************************
** Large Scale VAR
**********************************************************************************************

local var_order gdp tfp rd invexrd cons infl r
local lags 1

* Decide whether to use bootstrap (slow) or delta method (fast)
local irf_settings "bs reps(500)"
* local irf_settings ""

varsoc `var_order'
var `var_order', lags(`lags') 
irf create var_largescale, step(15) set(var_largescale, replace) `irf_settings'
irf graph oirf, byopts(rescale title("Large Scale VAR")) level(95) impulse(rd) response(`var_order')
* graph export "LargeScaleVAR.pdf", as(pdf) replace


******************************************************************************************************
** Export impulse responses for model comparison
******************************************************************************************************

use var_largescale.irf, clear
keep if impulse == "rd"
keep step oirf stdoirf irfname response impulse
gen ub95 = oirf + stdoirf*1.96
gen ub68 = oirf + stdoirf*0.995
gen lb95 = oirf - stdoirf*1.96
gen lb68 = oirf - stdoirf*0.995
list
export delimited using "var_largescale.csv", replace


