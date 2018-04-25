set more off
clear

cd "C:\Users\pedm\Documents\Research\ProductivityProject\ReplicationMaterials\1-Empirics"
import excel "QuarterlyData.xlsx", sheet("Sheet1") cellrange(A4:N285) firstrow
keep quarter GDP Consumption GDPDef InvestmentExRD TFP_Util RD FFR 

* Convert to logs
local variables GDP Consumption GDPDef InvestmentExRD TFP_Util RD 
foreach var in `variables' {
	gen `var'_log = log(`var')
}

gen t = _n
tsset t
order quarter t

keep if FFR != .
keep if quarter >= td(1jan1965)

******************************************************************************************************
** Monetary VAR
******************************************************************************************************

* Decide whether to use bootstrap (very slow) or delta method (fast)
local irf_settings "bs reps(500) bsaving(monetary_bs_reps, replace)"
* local irf_settings ""

local Block1 GDP_log Consumption_log GDPDef_log InvestmentExRD_log TFP_Util_log RD_log 
local cee_vars `Block1' FFR
var `cee_vars', lags(1/2)  
irf create irfs_monetary, step(60) set(irfs_monetary, replace) `irf_settings'
irf graph oirf, impulse(FFR) byopts(rescale title("Response to Contractionary Monetary Policy Shock")  ) level(95) 
* graph export "MonetaryVAR.pdf", as(pdf) replace

******************************************************************************************************
** Compute inflation IRFs and standard errors
******************************************************************************************************

use monetary_bs_reps.dta, clear
keep if impulse == "FFR" & response == "GDPDef_log"
encode irfname, gen(rep)
xtset rep step
gen inflation = oirf - L.oirf
replace inflation = 0 if step == 0
collapse (mean) oirf = inflation (sd) stdoirf = inflation, by(step response impulse)
replace response = "Inflation"
tempfile my_results
save `my_results', replace

******************************************************************************************************
** Export impulse responses for model comparison
******************************************************************************************************

use irfs_monetary.irf, clear
keep if impulse == "FFR"
keep step oirf stdoirf irfname response impulse

append using `my_results'

gen ub95 = oirf + stdoirf*1.96
gen ub68 = oirf + stdoirf*0.995
gen lb95 = oirf - stdoirf*1.96
gen lb68 = oirf - stdoirf*0.995
export delimited using "irfs_monetary.csv", replace
