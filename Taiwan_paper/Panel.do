********************************************************************************
*Replication File for Panel Analysis* 
*Lipscy and Lee, IO* 
*Feb 22nd, 2018* 
********************************************************************************
clear
clear matrix
set more off


*Change this to appropriate directory on your computer:
cd "C:\Users\haillie0627\Dropbox\Lipscy_Lee_IO"

use panel_data.dta, clear

*generating average bank measures*
g avgukfrgmq4 = (ukq4 + frq4 + gmq4)/3
g avgusukfrgmq4 =  (usq4 +ukq4 + frq4 + gmq4)/4

*Rescaling Measures of Foreign Reserves*
 g lnresgdp = log(reservewgoldovergdpmil+1)
 g lnresgdp100 = log(reservewgoldovergdpmil*100+1)
 g ln_resim = log((reservewgoldmillion *12/importmil)+1)

*Rescaling Measure of IMFloan*
g imfloannew100 = imfloannew*100

*Creating single principal component score using IMF influence variables*
pca shstaffl shquotal frusanew frdfgnew ustradenew eutradenew usq4 avgukfrgmq4
predict pc1, score

*Create IMF, US and EU Scores
pca shstaffl shquotal
predict IMF, score

pca frusanew ustradenew usq4
predict US, score

pca frdfgnew eutradenew avgukfrgmq4
predict EU, score
********************************************************************************
*Tables in the Main Manuscript*
********************************************************************************

*Table 2: Evaluating the Plausibility of the IMF Influence Variable, 1980-2010 * 

tobit imfloannew100 pc1 lnrgdpnew lnrgdpnewsq rgdpchnew  rgdpchnewsquare growth1new reserv1 oecd1 year1980 year1985 year1990 year1995 year2000 year2005,vce(cluster shcode) ll(0)
estimate store table1_1

tobit imf_p pc1 lnrgdpnew lnrgdpnewsq rgdpchnew  rgdpchnewsquare growth1new reserv1 oecd1 year1980 year1985 year1990 year1995 year2000 year2005,vce(cluster shcode) ll(0) ul(1)
estimate store table1_2

probit imf5a pc1 lnrgdpnew lnrgdpnewsq rgdpchnew  rgdpchnewsquare growth1new reserv1 oecd1 year1980 year1985 year1990 year1995 year2000 year2005,vce(cluster shcode)
estimate store table1_3

tobit tc pc1  lnrgdpnew lnrgdpnewsq rgdpchnew  rgdpchnewsquare growth1new reserv1 oecd1 year1980 year1985 year1990 year1995 year2000 year2005,vce(cluster shcode) ll(0)
estimate store table1_4

esttab table1* using "tables\table1.rtf", label replace mtitles("Model1" "Model2" "Model3" "Model4") se b(2) scalar(N) star(* 0.05) drop(year*)
 
*Table 3: IMF Influence and Self-insurance (Reserves/GDP), 1980-2010 *

tobit lnresgdp100 pc1 year1980 year1985 year1990 year1995 year2000 year2005, vce(cluster shcode) ll(0)
estimate store table2_1

tobit lnresgdp100  pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 year1980 year1985 year1990 year1995 year2000 year2005, vce(cluster shcode) ll(0)
estimate store table2_2

tobit lnresgdp100  pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled  currencyvaluation peg_coarse year1980 year1985 year1990 year1995 year2000 year2005, vce(cluster shcode) ll(0)
estimate store table2_3

tobit lnresgdp100 pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled  currencyvaluation peg_coarse aseanp3 year1980 year1985 year1990 year1995 year2000 year2005, vce(cluster shcode) ll(0)
estimate store table2_4

tobit lnresgdp100 pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled  currencyvaluation peg_coarse  oilexporter year1980 year1985 year1990 year1995 year2000 year2005, vce(cluster shcode) ll(0)
estimate store table2_5

xtreg lnresgdp100 pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse year1980 year1985 year1990 year1995 year2000 year2005, fe vce(cluster shcode)
estimate store table2_6 

esttab table2* using "tables\table2.rtf", label replace mtitles("Model1" "Model2" "Model3" "Model4" "Model5" "Model6") se b(2) scalar(N) drop(year*) star( * 0.05)

*Table 4: IMF Influence and Financial Crises, 1980-2010*

xtlogit banking_dum pc1 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table3_1

xtlogit currency_dum pc1 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table3_2

xtlogit banking_dum pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table3_3

xtlogit currency_dum pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table3_4

xtlogit banking_dum pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table3_5

xtlogit currency_dum pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table3_6

esttab table3* using "tables\table3.rtf", label replace mtitles("Model1" "Model2" "Model3" "Model4" "Model5" "Model6") se b(2) scalar(N) drop(year*) star( * 0.05)

********************************************************************************
*Supporting Information: Supplementary Regression Tables*
********************************************************************************

*Table A1: Political Determinants of IMF Lending and Self-Insurance (Reserves / GDP), Disaggregating the IMF Influence Variable, 1980-2010*
set more off
tobit lnresgdp100 usq4 year1980 year1985 year1990 year1995 year2000 year2005, vce(cluster shcode) ll(0)
estimate store table4_1

tobit lnresgdp100 avgukfrgmq4 year1980 year1985 year1990 year1995 year2000 year2005, vce(cluster shcode) ll(0)
estimate store table4_2

tobit lnresgdp100 shstaffl year1980 year1985 year1990 year1995 year2000 year2005, vce(cluster shcode) ll(0)
estimate store table4_3

tobit lnresgdp100 shquotal year1980 year1985 year1990 year1995 year2000 year2005, vce(cluster shcode) ll(0)
estimate store table4_4

tobit lnresgdp100 frusanew year1980 year1985 year1990 year1995 year2000 year2005, vce(cluster shcode) ll(0)
estimate store table4_5

tobit lnresgdp100 frdfgnew year1980 year1985 year1990 year1995 year2000 year2005, vce(cluster shcode) ll(0)
estimate store table4_6

tobit lnresgdp100 ustradenew year1980 year1985 year1990 year1995 year2000 year2005, vce(cluster shcode) ll(0)
estimate store table4_7

tobit lnresgdp100 eutradenew year1980 year1985 year1990 year1995 year2000 year2005, vce(cluster shcode) ll(0)
estimate store table4_8

esttab table4* using "tables\table4.rtf", label replace mtitles("Model1" "Model2" "Model3" "Model4" "Model5" "Model6" "Model7" "Model8") se b(2) scalar(N) drop(year*)

*Table A2: Disaggregating the IMF Influence Variable for Banking Crises, 1980-2010*

xtlogit banking_dum usq4 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table5_1

xtlogit banking_dum avgukfrgmq4 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table5_2

xtlogit banking_dum shstaffl year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table5_3

xtlogit banking_dum shquotal year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table5_4

xtlogit banking_dum frusanew year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table5_5

xtlogit banking_dum frdfgnew year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table5_6

xtlogit banking_dum ustradenew year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table5_7

xtlogit banking_dum eutradenew year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table5_8

 esttab table5* using "tables\table5.rtf", label replace mtitles("Model1" "Model2" "Model3" "Model4" "Model5" "Model6" "Model7" "Model8") se b(2) scalar(N) drop(year*) star( * 0.05)

*Table A3: Disaggregating the IMF Influence Variable for Currency Crises, 1980-2010*

xtlogit currency_dum usq4 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table6_1

xtlogit currency_dum avgukfrgmq4 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table6_2

xtlogit currency_dum shstaffl year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table6_3

xtlogit currency_dum shquotal year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table6_4

xtlogit currency_dum frusanew year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table6_5

xtlogit currency_dum frdfgnew year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table6_6

xtlogit currency_dum ustradenew year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table6_7

xtlogit currency_dum eutradenew year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table6_8

esttab table6* using "tables\table6.rtf", label replace mtitles("Model1" "Model2" "Model3" "Model4" "Model5" "Model6" "Model7" "Model8") se b(2) scalar(N) drop(year*) star( * 0.05)

*Table A4: IMF Influence and Various Financial Crisis Types, 1980-2010*

xtlogit twincrisis_dum pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table7_1

xtlogit marketcrash_dum pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table7_2

xtlogit inflationcrisis_dum pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table7_3

xtlogit sovt_crisis_dum pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table7_4

xtlogit crisis_tally_dum pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table7_5

 esttab table7* using "tables\table7.rtf", label replace mtitles("Model1" "Model2" "Model3" "Model4" "Model5") se b(2) scalar(N) drop(year*) star( * 0.05)

*Table A5: Bank Exposure and Self-Insurance (Reserves / GDP), 1980-2010 

tobit lnresgdp100 avgusukfrgmq4 jpq4 year1980 year1985 year1990 year1995 year2000 year2005, vce(cluster shcode) ll(0) 
estimate store table8_1

tobit lnresgdp100 avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 year1980 year1985 year1990 year1995 year2000 year2005, vce(cluster shcode) ll(0)
estimate store table8_2

tobit lnresgdp100 avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled  currencyvaluation peg_coarse year1980 year1985 year1990 year1995 year2000 year2005, vce(cluster shcode) ll(0)
estimate store table8_3

tobit lnresgdp100 avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse aseanp3 year1980 year1985 year1990 year1995 year2000 year2005, vce(cluster shcode) ll(0)
estimate store table8_4

tobit lnresgdp100 avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse oilexporter year1980 year1985 year1990 year1995 year2000 year2005, vce(cluster shcode) ll(0)
estimate store table8_5

xtreg lnresgdp100 avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse year1980 year1985 year1990 year1995 year2000 year2005, fe vce(cluster shcode)
estimate store table8_6

esttab table8* using "tables\table8.rtf", label replace mtitles("Model1" "Model2" "Model3" "Model4" "Model5" "Model6") se b(2) scalar(N) drop(year*) star( * 0.05)

*Table A6: Bank Exposure and Financial Crises, 1980-2010

xtlogit banking_dum avgusukfrgmq4 jpq4 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table9_1

xtlogit currency_dum avgusukfrgmq4 jpq4 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table9_2

xtlogit banking_dum avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table9_3

xtlogit currency_dum avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new  year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table9_4 

xtlogit banking_dum avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new  loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table9_5

xtlogit currency_dum avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table9_6

esttab table9* using "tables\table9.rtf", label replace mtitles("Model1" "Model2" "Model3" "Model4" "Model5" "Model6") se b(2) scalar(N) drop(year*) star( * 0.05)

********************************************************************************
*Replication codes for additional claims made in text or footnotes 
********************************************************************************

*footnote 61 -  Table 2 with Cubic Polynomials instead of year dummies*

g t = (panel-1970)/5
g t2 = t^2
g t3 = t^3

probit imf5a pc1 lnrgdpnew lnrgdpnewsq rgdpchnew  rgdpchnewsquare growth1new reserv1 oecd1 t t2 t3,vce(cluster shcode)
estimate store table10_1

tobit imf_p pc1 lnrgdpnew lnrgdpnewsq rgdpchnew  rgdpchnewsquare growth1new reserv1 oecd1 t t2 t3,vce(cluster shcode) ll(0) ul(1)
estimate store table10_2

probit imf5a pc1 lnrgdpnew lnrgdpnewsq rgdpchnew  rgdpchnewsquare growth1new reserv1 oecd1 t t2 t3,vce(cluster shcode)
estimate store table10_3

tobit tc pc1  lnrgdpnew lnrgdpnewsq rgdpchnew  rgdpchnewsquare growth1new reserv1 oecd1 t t2 t3,vce(cluster shcode) ll(0)
estimate store table10_4

 esttab table10* using "tables\table10.rtf", label replace mtitles("Model1" "Model2" "Model3" "Model4") se b(2) scalar(N) starlevels( * 0.10 ** 0.05)

*footnote 62 - Table 3 with reserves in months of imports as DV*  

tobit ln_resim pc1 year1980 year1985 year1990 year1995 year2000 year2005, vce(cluster shcode) ll(0)
estimate store table11_1  //significant at 0.1 level 

tobit ln_resim  pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 year1980 year1985 year1990 year1995 year2000 year2005, vce(cluster shcode) ll(0)
estimate store table11_2

tobit ln_resim  pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled  currencyvaluation peg_coarse year1980 year1985 year1990 year1995 year2000 year2005, vce(cluster shcode) ll(0)
estimate store table11_3

tobit ln_resim pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled  currencyvaluation peg_coarse aseanp3 year1980 year1985 year1990 year1995 year2000 year2005, vce(cluster shcode) ll(0)
estimate store table11_4

tobit ln_resim pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled  currencyvaluation peg_coarse  oilexporter year1980 year1985 year1990 year1995 year2000 year2005, vce(cluster shcode) ll(0)
estimate store table11_5

xtreg ln_resim pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse year1980 year1985 year1990 year1995 year2000 year2005, fe vce(cluster shcode)
estimate store table11_6 

esttab table11* using "tables\table11.rtf", label replace mtitles("Model1" "Model2" "Model3" "Model4" "Model5" "Model6") se b(2) scalar(N) drop(year*) starlevels( * 0.10 ** 0.05)

*footnote 66 - Table 3 with East Asian countries dropped*

tobit lnresgdp100 pc1 year1980 year1985 year1990 year1995 year2000 year2005 if aseanp3 == 0 , vce(cluster shcode) ll(0)
estimate store table12_1

tobit lnresgdp100  pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 year1980 year1985 year1990 year1995 year2000 year2005 if aseanp3 == 0 , vce(cluster shcode) ll(0)
estimate store table12_2

tobit lnresgdp100  pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled  currencyvaluation peg_coarse year1980 year1985 year1990 year1995 year2000 year2005 if aseanp3 == 0 , vce(cluster shcode) ll(0)
estimate store table12_3

tobit lnresgdp100 pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled  currencyvaluation peg_coarse aseanp3 year1980 year1985 year1990 year1995 year2000 year2005 if aseanp3 == 0 , vce(cluster shcode) ll(0)
estimate store table12_4

tobit lnresgdp100 pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled  currencyvaluation peg_coarse  oilexporter year1980 year1985 year1990 year1995 year2000 year2005 if aseanp3 == 0 , vce(cluster shcode) ll(0)
estimate store table12_5

xtreg lnresgdp100 pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse year1980 year1985 year1990 year1995 year2000 year2005 if aseanp3 == 0, fe vce(cluster shcode)
estimate store table12_6 

esttab table12* using "tables\table12.rtf", label replace mtitles("Model1" "Model2" "Model3" "Model4" "Model5" "Model6") se b(2) scalar(N) drop(year*) starlevels( * 0.10 ** 0.05)

*footnote 71 - Table 4 with OECD variable included*

xtlogit banking_dum pc1 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table13_1

xtlogit currency_dum pc1 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table13_2

xtlogit banking_dum pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table13_3

xtlogit currency_dum pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table13_4  //significant at p = 0.06 

xtlogit banking_dum pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse oecd1 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table13_5

xtlogit currency_dum pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse oecd1 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table13_6

esttab table13* using "tables\table13.rtf", label replace mtitles("Model1" "Model2" "Model3" "Model4" "Model5" "Model6") se b(2) scalar(N) drop(year*) starlevels( * 0.10 ** 0.05)

*footnote 75 - Table 4 with domestic political variables (democracy[liec], divided government[allhouse], and turnover[stabs])*

*democracy[liec]*

xtlogit banking_dum pc1 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table14_1

xtlogit currency_dum pc1 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table14_2

xtlogit banking_dum pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new liec  year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table14_3

xtlogit currency_dum pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new liec year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table14_4

xtlogit banking_dum pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse liec year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table14_5

xtlogit currency_dum pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse liec year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table14_6

esttab table14* using "tables\table14.rtf", label replace mtitles("Model1" "Model2" "Model3" "Model4" "Model5" "Model6") se b(2) scalar(N) drop(year*) starlevels( * 0.10 ** 0.05)

*divided government[allhouse]*

xtlogit banking_dum pc1 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table15_1

xtlogit currency_dum pc1 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table15_2

xtlogit banking_dum pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new allhouse  year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table15_3

xtlogit currency_dum pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new allhouse year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table15_4

xtlogit banking_dum pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse allhouse year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table15_5

xtlogit currency_dum pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse allhouse year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table15_6

esttab table15* using "tables\table15.rtf", label replace mtitles("Model1" "Model2" "Model3" "Model4" "Model5" "Model6") se b(2) scalar(N) drop(year*) starlevels( * 0.10 ** 0.05)

*turnover[stabs]*

xtlogit banking_dum pc1 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table16_1

xtlogit currency_dum pc1 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table16_2

xtlogit banking_dum pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new stabs  year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table16_3

xtlogit currency_dum pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new stabs year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table16_4

xtlogit banking_dum pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse stabs year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table16_5

xtlogit currency_dum pc1 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse stabs year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table16_6

esttab table16* using "tables\table16.rtf", label replace mtitles("Model1" "Model2" "Model3" "Model4" "Model5" "Model6") se b(2) scalar(N) drop(year*) starlevels( * 0.10 ** 0.05)


*footnote 77* //running Tables A5 & A6 in Appendix with robustness checks 

* with reserves in months of imports as DV*

tobit ln_resim avgusukfrgmq4 jpq4 year1980 year1985 year1990 year1995 year2000 year2005, vce(cluster shcode) ll(0) 
estimate store table17_1

tobit ln_resim avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 year1980 year1985 year1990 year1995 year2000 year2005, vce(cluster shcode) ll(0)
estimate store table17_2

tobit ln_resim avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled  currencyvaluation peg_coarse year1980 year1985 year1990 year1995 year2000 year2005, vce(cluster shcode) ll(0)
estimate store table17_3

tobit ln_resim avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse aseanp3 year1980 year1985 year1990 year1995 year2000 year2005, vce(cluster shcode) ll(0)
estimate store table17_4

tobit ln_resim avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse oilexporter year1980 year1985 year1990 year1995 year2000 year2005, vce(cluster shcode) ll(0)
estimate store table17_5

xtreg ln_resim avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse year1980 year1985 year1990 year1995 year2000 year2005, fe vce(cluster shcode)
estimate store table17_6 // p = 0.14 for avgusukfrgmq4; was p = 0.1 in Table A5

esttab table17* using "tables\table17.rtf", label replace mtitles("Model1" "Model2" "Model3" "Model4" "Model5" "Model6") se b(2) scalar(N) drop(year*) starlevels( * 0.10 ** 0.05)

*with East Asian countries dropped*

tobit lnresgdp100 avgusukfrgmq4 jpq4 year1980 year1985 year1990 year1995 year2000 year2005 if aseanp3 == 0, vce(cluster shcode) ll(0) 
estimate store table18_1

tobit lnresgdp100 avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 year1980 year1985 year1990 year1995 year2000 year2005 if aseanp3 == 0, vce(cluster shcode) ll(0)
estimate store table18_2

tobit lnresgdp100 avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled  currencyvaluation peg_coarse year1980 year1985 year1990 year1995 year2000 year2005 if aseanp3 == 0, vce(cluster shcode) ll(0)
estimate store table18_3

tobit lnresgdp100 avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse aseanp3 year1980 year1985 year1990 year1995 year2000 year2005 if aseanp3 == 0, vce(cluster shcode) ll(0)
estimate store table18_4

tobit lnresgdp100 avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse oilexporter year1980 year1985 year1990 year1995 year2000 year2005 if aseanp3 == 0, vce(cluster shcode) ll(0)
estimate store table18_5

xtreg lnresgdp100 avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse year1980 year1985 year1990 year1995 year2000 year2005 if aseanp3 == 0, fe vce(cluster shcode)
estimate store table18_6 // p = 0.14 for avgusukfrgmq4; was p = 0.1 in Table A5

esttab table18* using "tables\table18.rtf", label replace mtitles("Model1" "Model2" "Model3" "Model4" "Model5" "Model6") se b(2) scalar(N) drop(year*)  starlevels( * 0.10 ** 0.05)

*with oecd variable included 

xtlogit banking_dum avgusukfrgmq4 jpq4 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table19_1

xtlogit currency_dum avgusukfrgmq4 jpq4 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table19_2

xtlogit banking_dum avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table19_3

xtlogit currency_dum avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new oecd1  year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table19_4  //significant at 0.1 level

xtlogit banking_dum avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new  loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse oecd1 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table19_5

xtlogit currency_dum avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse oecd1 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table19_6  //significant at 0.1 level

esttab table19* using "tables\table19.rtf", label replace mtitles("Model1" "Model2" "Model3" "Model4" "Model5" "Model6") se b(2) scalar(N) drop(year*) starlevels( * 0.10 ** 0.05)


*with domestic political variables (democracy[liec], divided government[allhouse], and turnover[stabs])*

*democracy[liec]*

xtlogit banking_dum avgusukfrgmq4 jpq4 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table20_1

xtlogit currency_dum avgusukfrgmq4 jpq4 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table20_2

xtlogit banking_dum avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new liec year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table20_3

xtlogit currency_dum avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new liec year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table20_4

xtlogit banking_dum avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new  loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse liec year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table20_5

xtlogit currency_dum avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse liec year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table20_6

esttab table20* using "tables\table20.rtf", label replace mtitles("Model1" "Model2" "Model3" "Model4" "Model5" "Model6") se b(2) scalar(N) drop(year*) starlevels( * 0.10 ** 0.05)

*divided government[allhouse]*

xtlogit banking_dum avgusukfrgmq4 jpq4 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table21_1

xtlogit currency_dum avgusukfrgmq4 jpq4 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table21_2

xtlogit banking_dum avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new allhouse year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table21_3

xtlogit currency_dum avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new allhouse year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table21_4

xtlogit banking_dum avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new  loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse allhouse year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table21_5

xtlogit currency_dum avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse allhouse year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table21_6

esttab table21* using "tables\table21.rtf", label replace mtitles("Model1" "Model2" "Model3" "Model4" "Model5" "Model6") se b(2) scalar(N) drop(year*) starlevels( * 0.10 ** 0.05)


*turnover[stabs]*

xtlogit banking_dum avgusukfrgmq4 jpq4 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table22_1

xtlogit currency_dum avgusukfrgmq4 jpq4 year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table22_2

xtlogit banking_dum avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new stabs year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table22_3

xtlogit currency_dum avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new stabs  year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table22_4 // p = 0.053

xtlogit banking_dum avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new  loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse stabs year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table22_5

xtlogit currency_dum avgusukfrgmq4 jpq4 lnrgdpnew lnrgdpnewsq rgdpchnew rgdpchnewsquare growth1new loginflationcpi exportbilovergdp_scaled importbilovergdp_scaled currencyvaluation peg_coarse stabs year1980 year1985 year1990 year1995 year2000 year2005, fe
estimate store table22_6

esttab table22* using "tables\table22.rtf", label replace mtitles("Model1" "Model2" "Model3" "Model4" "Model5" "Model6") se b(2) scalar(N) drop(year*) starlevels( * 0.10 ** 0.05)
