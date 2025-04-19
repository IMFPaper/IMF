* Replication dofile for Synthetic Control Method for Taiwan, Lipscy & Lee IO 

* Change this to the appropriate directory on your computer:
cd "C:\Users\plipscy.POL-39M8VF2\Dropbox\Lipscy_Lee_IO\IO Replication File\Taiwan_Section\"

use "taiwansyntheticmatching.dta", clear

* Generate Variables
g resgdp = reserve/ gdpnominal
g ln_resim = ln(reserve*12/import)
g gdpcapita = gdpnominal/population
g eastasia = 0 
replace eastasia = 1 if (ccode >= 710 & ccode <= 740) | (ccode >= 800 & ccode <= 860)
g tiger = 0 
replace tiger = 1 if (ccode == 713 | ccode == 732 | ccode == 830)
g asianmiracle = 0 
replace asianmiracle = 1 if (ccode == 713 | ccode == 732 | ccode == 830 | ccode == 820 | ccode == 800 | ccode == 850)
bysort ccode (year): g gdpgrowth = (gdpnominal[_n] - gdpnominal[_n-1])/gdpnominal[_n-1]
g openness = (exports+imports)/gdpnominal
g tradedeficit = (imports-exports)/gdpnominal
decode inflationcrises, generate(inflation)
destring inflation, replace
decode currencycrises, generate(exchangeratechange)
destring exchangeratechange, replace
drop inflationcrises currencycrises
g oecd = 0
replace oecd = 1 if ccode == 20 | ccode == 2 | ccode == 200 | ccode == 390 | ccode == 395 | ccode == 385 | ccode == 640 | ccode == 230 | ccode == 235 | ccode == 220 | ccode == 205 | ccode == 211 | ccode == 350 | ccode == 380 | ccode == 225 | ccode == 305 | ccode == 210 | ccode == 212 | ccode == 325 | ccode == 740 | ccode == 375 | ccode == 255 | ccode == 260
replace oecd = 1 if (ccode == 900 & year >= 1971) | (ccode == 920 & year >= 1973)

save "tempfile.dta", replace



tsset ccode year

* Keep if non-missing in relevant years (this can be adjusted depending on time period of interest)
drop if year > 1990 | year < 1970

* Dropping countries with missing data
bysort ccode (reserve) : drop if missing(reserve[1]) | missing(reserve[_N])
bysort ccode (gdpnominal) : drop if missing(gdpnominal[1]) | missing(gdpnominal[_N])
bysort ccode (imports) : drop if missing(imports[1]) | missing(imports[_N])
bysort ccode (exports) : drop if missing(exports[1]) | missing(exports[_N])
bysort ccode (population) : drop if missing(population[1]) | missing(population[_N])
bysort ccode (polity2) : drop if missing(polity2[1]) | missing(polity2[_N])
bysort ccode (inflation) : drop if missing(inflation[1]) | missing(inflation[_N])
bysort ccode (exchangeratechange) : drop if missing(exchangeratechange[1]) | missing(exchangeratechange[_N])

* Last column of Table A8
mean resgdp if year == 1979 & ccode !=713
mean resgdp if year == 1975 & ccode !=713
mean resgdp if year == 1970 & ccode !=713
mean gdpcapita if year < 1980 & ccode !=713
mean gdpnominal if year < 1980 & ccode !=713
mean gdpgrowth if year < 1980 & ccode !=713
mean inflation if year < 1980 & ccode !=713
mean export if year < 1980 & ccode !=713
mean import if year < 1980 & ccode !=713
mean underval if year < 1980 & ccode !=713
mean peg if year < 1980 & ccode !=713
mean oecd if year < 1980 & ccode !=713
mean eastasia if year < 1980 & ccode !=713


* Figure 1, Appendix Table A7, A8

synth resgdp resgdp(1979) resgdp(1975) resgdp(1970) gdpcapita gdpnominal gdpgrowth inflation export import peg underval oecd eastasia, trunit(713) trperiod(1980) xperiod(1970(1)1979) mspeperiod(1970(1)1979) nested resultsperiod(1970(1)1990) keep(synth_Taiwan, replace)

use synth_Taiwan, clear
rename _time years
gen tr_effect_713 = _Y_treated - _Y_synthetic
g ytreat = _Y_treated
g ysynth = _Y_synthetic

twoway (line ytreat year, lcolor(black) lwidth(medthick) lpattern(solid)) (line ysynth year, lcolor(black) lpattern(dash)), legend(order(1 "Taiwan" 2 "Synthetic Taiwan") position(2) ring(0)) xline(1980, lcolor(gray) lpattern(solid) lwidth(thin)) ytitle(Reserves/GDP) xlabel(1970(5)1990) legend(position(9) ring(0)) xtitle("Year")



* Figure A1 in Appendix (Placebo test of 1971 UN Expulsion)

use "tempfile.dta", clear
tsset ccode year
drop if year > 1990 | year < 1965
bysort ccode (reserve) : drop if missing(reserve[1]) | missing(reserve[_N])
bysort ccode (gdpnominal) : drop if missing(gdpnominal[1]) | missing(gdpnominal[_N])
bysort ccode (imports) : drop if missing(imports[1]) | missing(imports[_N])
bysort ccode (exports) : drop if missing(exports[1]) | missing(exports[_N])
bysort ccode (population) : drop if missing(population[1]) | missing(population[_N])
bysort ccode (polity2) : drop if missing(polity2[1]) | missing(polity2[_N])
bysort ccode (inflation) : drop if missing(inflation[1]) | missing(inflation[_N])
bysort ccode (exchangeratechange) : drop if missing(exchangeratechange[1]) | missing(exchangeratechange[_N])
bysort ccode ( gdpgrowth ) : drop if missing( gdpgrowth [1]) | missing( gdpgrowth [_N])
bysort ccode ( peg ) : drop if missing( peg [1]) | missing( peg [_N])
bysort ccode ( underval ) : drop if missing( underval [1]) | missing( underval [_N])

synth resgdp resgdp(1979) resgdp(1975) resgdp(1970) gdpcapita gdpnominal gdpgrowth inflation export import peg underval oecd eastasia, trunit(713) trperiod(1971) xperiod(1965(1)1970) mspeperiod(1965(1)1970) nested resultsperiod(1965(1)1990) keep(synth_Taiwan, replace)
use synth_Taiwan, clear
rename _time years
gen tr_effect_713 = _Y_treated - _Y_synthetic
g ytreat = _Y_treated
g ysynth = _Y_synthetic
twoway (line ytreat year, lcolor(black) lwidth(medthick) lpattern(solid)) (line ysynth year, lcolor(black) lpattern(dash)), legend(order(1 "Taiwan" 2 "Synthetic Taiwan") position(2) ring(0)) xline(1971, lcolor(gray) lpattern(solid) lwidth(thin)) ytitle(Reserves/GDP) xlabel(1965(5)1990) legend(position(12) ring(0)) xtitle("Year")


* Figure3, Permutation Test
* Note: Singapore (ccode 830) is dropped as it is very poorly estimated in the pre-treatment period 

use "tempfile.dta", clear
tsset ccode year
drop if year > 1990 | year < 1970
bysort ccode (reserve) : drop if missing(reserve[1]) | missing(reserve[_N])
bysort ccode (gdpnominal) : drop if missing(gdpnominal[1]) | missing(gdpnominal[_N])
bysort ccode (imports) : drop if missing(imports[1]) | missing(imports[_N])
bysort ccode (exports) : drop if missing(exports[1]) | missing(exports[_N])
bysort ccode (population) : drop if missing(population[1]) | missing(population[_N])
bysort ccode (polity2) : drop if missing(polity2[1]) | missing(polity2[_N])
bysort ccode (inflation) : drop if missing(inflation[1]) | missing(inflation[_N])
bysort ccode (exchangeratechange) : drop if missing(exchangeratechange[1]) | missing(exchangeratechange[_N])



foreach num of numlist 713 2 20 42 70 90 91 92 94 95 100 101 130 135 140 145 150 155 160 165 200 210 211 220 230 235 305 325 350 375 380 385 390 437 452 475 482 501 551 552 600 615 616 640 651 732 740 750 780 800 820  840 850 900 {
qui synth resgdp resgdp(1979) resgdp(1975) resgdp(1970) gdpcapita gdpnominal gdpgrowth inflation export import peg underval oecd eastasia, trunit(`num') trperiod(1980) xperiod(1970(1)1979) mspeperiod(1970(1)1979)  resultsperiod(1970(1)1990) keep(synth_`num', replace)
}

foreach num of numlist 713 2 20 42 70 90 91 92 94 95 100 101 130 135 140 145 150 155 160 165 200 210 211 220 230 235 305 325 350 375 380 385 390 437 452 475 482 501 551 552 600 615 616 640 651 732 740 750 780 800 820  840 850 900 {
use synth_`num', clear
rename _time years
gen tr_effect_`num' = _Y_treated - _Y_synthetic
keep years tr_effect_`num'
drop if missing(years)
save synth_`num', replace
}

use synth_2, clear

foreach num of numlist 713 2 20 42 70 90 91 92 94 95 100 101 130 135 140 145 150 155 160 165 200 210 211 220 230 235 305 325 350 375 380 385 390 437 452 475 482 501 551 552 600 615 616 640 651 732 740 750 780 800 820  840 850 900  {
qui merge 1:1 years using synth_`num', nogenerate
}

local lp

foreach num of numlist 713 2 20 42 70 90 91 92 94 95 100 101 130 135 140 145 150 155 160 165 200 210 211 220 230 235 305 325 350 375 380 385 390 437 452 475 482 501 551 552 600 615 616 640 651 732 740 750 780 800 820  840 850 900  {
   local lp `lp' line tr_effect_`num' years, lcolor(gs12) ||
}

*Create Plot
twoway `lp' || line tr_effect_713 years, lcolor(black) lwidth(medthick) lpattern(solid) legend(off) xline(1980, lpattern(dash)) xtitle(Year) ytitle(Gap in Reserves/GDP) xlabel(1970(5)1990) 



* Figure 3 Monthly Reserves in Taiwan, raw data plot

use "taiwan_monthlyreserves.dta", clear

g time = monthly(month,"YM")
g counter = monthly(month,"YM")
g lnreserves = log(foreignexchangereservesusmillion)
tsset time, monthly
twoway line lnreserves time if counter >=180 & counter <= 311, lcolor(black) lwidth(medthick) lpattern(solid) xline(243, lcolor(gray) lpattern(solid) lwidth(thin)) ytitle(Log Reserves (Current US$)) xtitle(Month) text(9.5 217 "IMF Expulsion (April 1980)", place(e)) graphregion(margin(r+10))

