clear
set more off
cd "C:\Users\pedm\Documents\Research\ProductivityProject\ReplicationMaterials\1-Empirics"

import excel "AnnualData.xlsx", sheet("Sheet1") firstrow

keep year gdp tfp rd
tsset year

******************************************************************************************************
** Small Scale VAR
******************************************************************************************************

local lags 1
local var_order gdp tfp rd 

* Decide whether to use bootstrap (slow) or delta method (fast)
local irf_settings "bs reps(500)"
* local irf_settings ""

varsoc `var_order'
var `var_order', lags(`lags') 
irf create irfs_small, step(15) set(irfs_small, replace) `irf_settings'
irf graph oirf, byopts(rescale title("Small Scale VAR")) level(95) 
* graph export "VAR_SmallScale.pdf", as(pdf) replace

******************************************************************************************************
** Export impulse responses for model estimation
******************************************************************************************************

use irfs_small.irf, clear
keep if impulse == "rd"
keep step oirf stdoirf irfname response impulse
gen ub95 = oirf + stdoirf*1.96
gen ub68 = oirf + stdoirf*0.995
gen lb95 = oirf - stdoirf*1.96
gen lb68 = oirf - stdoirf*0.995
export delimited using "irfs_small.csv", replace
