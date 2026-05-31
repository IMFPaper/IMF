# Snapshot: list

## print
$`Number of IMF conditions`

Call:
tobit(formula = tc ~ us + eu + shstaffl + shquotal + lnrgdpnew + 
    lnrgdpnewsq + rgdpchnew + rgdpchnewsquare + growth1new + 
    reserv1 + oecd1 + year1980 + year1985 + year1990 + year1995 + 
    year2000, left = 0, right = Inf, data = data, cluster = shcode)

Coefficients:
    (Intercept)               us               eu         shstaffl         shquotal        lnrgdpnew  
      -231.1645          -5.2790           1.3637          -1.6300         -11.5223          33.5981  
    lnrgdpnewsq        rgdpchnew  rgdpchnewsquare       growth1new          reserv1            oecd1  
        -1.1284          -1.3661           0.1628          -1.0779          -0.2073           7.8480  
       year1980         year1985         year1990         year1995         year2000  
       -55.6008         -53.6085         -56.6855         -49.4571         -46.8537  

Scale: 7.552 


$`Number of Fiscal conditions`

Call:
tobit(formula = numb_fiscal ~ us + eu + shstaffl + shquotal + 
    lnrgdpnew + lnrgdpnewsq + rgdpchnew + rgdpchnewsquare + growth1new + 
    reserv1 + oecd1, left = 0, right = Inf, data = data_new, 
    cluster = shcode)

Coefficients:
    (Intercept)               us               eu         shstaffl         shquotal        lnrgdpnew  
     -2.002e+02       -2.787e+01        3.219e+01       -9.906e-04       -4.664e+00        2.560e+01  
    lnrgdpnewsq        rgdpchnew  rgdpchnewsquare       growth1new          reserv1            oecd1  
     -7.410e-01       -2.332e+00        1.218e-01        1.780e-01       -1.377e+00       -2.139e+01  

Scale: 5.655 


$`RFA ($T$+1)`
OLS estimation, Dep. Var.: rfa1
Observations: 17
Standard-errors: Clustered (shcode) 
                    Estimate Std. Error   t value  Pr(>|t|)    
(Intercept)       -23.092065  36.253574 -0.636960 0.5361137    
us                  1.884813   3.790116  0.497297 0.6279662    
eu                 -2.228615   2.853119 -0.781115 0.4498705    
shstaffl           -4.110179   1.190146 -3.453509 0.0047740 ** 
shquotal           -1.202622   0.731764 -1.643458 0.1262133    
lnrgdpnew          -2.373404   4.265512 -0.556417 0.5881519    
lnrgdpnewsq         0.188536   0.180630  1.043771 0.3171630    
rgdpchnew          -0.651340   1.246514 -0.522529 0.6108134    
rgdpchnewsquare     0.055402   0.158914  0.348625 0.7334111    
growth1new         -0.078675   0.367429 -0.214124 0.8340453    
reserv1             0.584022   0.246657  2.367747 0.0355469 *  
oecd1              -5.754147   1.541186 -3.733584 0.0028552 ** 
factor(panel)2000  -0.868127   1.376891 -0.630498 0.5401905    
... 1 variable was removed because of collinearity (factor(panel)2005)
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
RMSE: 0.800229   Adj. R2: 0.459869

$`RFA (end year)`
OLS estimation, Dep. Var.: rfa2
Observations: 17
Standard-errors: Clustered (shcode) 
                   Estimate Std. Error   t value  Pr(>|t|)    
(Intercept)       -2.654988  39.395159 -0.067394 0.9473781    
us                -1.404807   5.169681 -0.271740 0.7904409    
eu                -1.896761   3.947932 -0.480444 0.6395512    
shstaffl          -5.043739   1.429021 -3.529508 0.0041502 ** 
shquotal          -1.200824   0.861869 -1.393279 0.1888063    
lnrgdpnew         -8.208661   4.627850 -1.773753 0.1014588    
lnrgdpnewsq        0.489027   0.206166  2.372010 0.0352722 *  
rgdpchnew         -0.132019   1.689187 -0.078155 0.9389926    
rgdpchnewsquare   -0.001199   0.221530 -0.005411 0.9957717    
growth1new         0.018904   0.495150  0.038178 0.9701734    
reserv1            0.689256   0.315677  2.183420 0.0495891 *  
oecd1              3.101700   1.317616  2.354023 0.0364452 *  
factor(panel)2000  1.481780   1.404625  1.054929 0.3122350    
... 1 variable was removed because of collinearity (factor(panel)2005)
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
RMSE: 0.997439   Adj. R2: 0.071


## str
List of 4
 $ Number of IMF conditions   :List of 18
  ..$ coefficients     : Named num [1:17] -231.16 -5.28 1.36 -1.63 -11.52 ...
  .. ..- attr(*, "names")= chr [1:17] "(Intercept)" "us" "eu" "shstaffl" ...
  ..$ icoef            : Named num [1:2] 14.72 2.96
  .. ..- attr(*, "names")= chr [1:2] "Intercept" "Log(scale)"
  ..$ var              : num [1:18, 1:18] 4382.5 -37.4 112.8 30.3 162.7 ...
  ..$ loglik           : num [1:2] -390 -306
  ..$ iter             : int 5
  ..$ linear.predictors: num [1:93] 4.49 9.45 9.67 5.05 16.83 ...
  ..$ df               : int 18
  ..$ scale            : num 7.55
  ..$ idf              : num 2
  ..$ df.residual      : int 75
  ..$ terms            :Classes 'terms', 'formula'  language survival::Surv(ifelse(tc <= 0, 0, tc), tc > 0, type = "left") ~ us + eu + shstaffl + shquotal + lnrgdpnew +      | __truncated__ ...
  .. .. ..- attr(*, "variables")= language list(survival::Surv(ifelse(tc <= 0, 0, tc), tc > 0, type = "left"), us, eu, shstaffl, shquotal, lnrgdpnew,      l| __truncated__ ...
  .. .. ..- attr(*, "factors")= int [1:17, 1:16] 0 1 0 0 0 0 0 0 0 0 ...
  .. .. .. ..- attr(*, "dimnames")=List of 2
  .. .. .. .. ..$ : chr [1:17] "survival::Surv(ifelse(tc <= 0, 0, tc), tc > 0, type = \"left\")" "us" "eu" "shstaffl" ...
  .. .. .. .. ..$ : chr [1:16] "us" "eu" "shstaffl" "shquotal" ...
  .. .. ..- attr(*, "term.labels")= chr [1:16] "us" "eu" "shstaffl" "shquotal" ...
  .. .. ..- attr(*, "specials")=Dotted pair list of 1
  .. .. .. ..$ strata: NULL
  .. .. ..- attr(*, "order")= int [1:16] 1 1 1 1 1 1 1 1 1 1 ...
  .. .. ..- attr(*, "intercept")= int 1
  .. .. ..- attr(*, "response")= int 1
  .. .. ..- attr(*, ".Environment")=<environment: <normalized>> 
  .. .. ..- attr(*, "predvars")= language list(survival::Surv(ifelse(tc <= 0, 0, tc), tc > 0, type = "left"), us, eu, shstaffl, shquotal, lnrgdpnew,      l| __truncated__ ...
  .. .. ..- attr(*, "dataClasses")= Named chr [1:18] "nmatrix.2" "nmatrix.1" "nmatrix.1" "numeric" ...
  .. .. .. ..- attr(*, "names")= chr [1:18] "survival::Surv(ifelse(tc <= 0, 0, tc), tc > 0, type = \"left\")" "us" "eu" "shstaffl" ...
  ..$ means            : Named num [1:17] 1 0.0687 -0.2108 -5.3092 -5.6185 ...
  .. ..- attr(*, "names")= chr [1:17] "(Intercept)" "us" "eu" "shstaffl" ...
  ..$ call             : language tobit(formula = tc ~ us + eu + shstaffl + shquotal + lnrgdpnew + lnrgdpnewsq + rgdpchnew + rgdpchnewsquare +     | __truncated__ ...
  ..$ dist             : chr "gaussian"
  ..$ y                : 'Surv' num [1:93, 1:2]  10.00    7.50    9.50    7.00   14.33   21.00    6.00   11.00   18.00    0.00- ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:93] "30" "31" "32" "33" ...
  .. .. ..$ : chr [1:2] "time" "status"
  .. ..- attr(*, "type")= chr "left"
  ..$ naive.var        : num [1:18, 1:18] 1790.1 -9.7 6.2 10.3 47.5 ...
  ..$ na.action        : 'omit' Named int [1:978] 1 2 3 4 5 6 7 8 9 10 ...
  .. ..- attr(*, "names")= chr [1:978] "1" "2" "3" "4" ...
  ..$ formula          :Class 'formula'  language survival::Surv(ifelse(tc <= 0, 0, tc), tc > 0, type = "left") ~ us + eu + shstaffl + shquotal + lnrgdpnew +      | __truncated__ ...
  .. .. ..- attr(*, ".Environment")=<environment: <normalized>> 
  ..- attr(*, "class")= chr [1:2] "tobit" "survreg"
 $ Number of Fiscal conditions:List of 18
  ..$ coefficients     : Named num [1:12] -2.00e+02 -2.79e+01 3.22e+01 -9.91e-04 -4.66 ...
  .. ..- attr(*, "names")= chr [1:12] "(Intercept)" "us" "eu" "shstaffl" ...
  ..$ icoef            : Named num [1:2] 10.71 2.27
  .. ..- attr(*, "names")= chr [1:2] "Intercept" "Log(scale)"
  ..$ var              : num [1:13, 1:13] 60486 1572 159 1535 1193 ...
  ..$ loglik           : num [1:2] -62.8 -53.6
  ..$ iter             : int 6
  ..$ linear.predictors: num [1:17] 14.58 7.54 -1.33 5.41 15.84 ...
  ..$ df               : int 13
  ..$ scale            : num 5.66
  ..$ idf              : num 2
  ..$ df.residual      : int 4
  ..$ terms            :Classes 'terms', 'formula'  language survival::Surv(ifelse(numb_fiscal <= 0, 0, numb_fiscal), numb_fiscal > 0, type = "left") ~ us + eu +      shstaff| __truncated__ ...
  .. .. ..- attr(*, "variables")= language list(survival::Surv(ifelse(numb_fiscal <= 0, 0, numb_fiscal), numb_fiscal > 0, type = "left"), us, eu,      shsta| __truncated__
  .. .. ..- attr(*, "factors")= int [1:12, 1:11] 0 1 0 0 0 0 0 0 0 0 ...
  .. .. .. ..- attr(*, "dimnames")=List of 2
  .. .. .. .. ..$ : chr [1:12] "survival::Surv(ifelse(numb_fiscal <= 0, 0, numb_fiscal), numb_fiscal > 0, type = \"left\")" "us" "eu" "shstaffl" ...
  .. .. .. .. ..$ : chr [1:11] "us" "eu" "shstaffl" "shquotal" ...
  .. .. ..- attr(*, "term.labels")= chr [1:11] "us" "eu" "shstaffl" "shquotal" ...
  .. .. ..- attr(*, "specials")=Dotted pair list of 1
  .. .. .. ..$ strata: NULL
  .. .. ..- attr(*, "order")= int [1:11] 1 1 1 1 1 1 1 1 1 1 ...
  .. .. ..- attr(*, "intercept")= int 1
  .. .. ..- attr(*, "response")= int 1
  .. .. ..- attr(*, ".Environment")=<environment: <normalized>> 
  .. .. ..- attr(*, "predvars")= language list(survival::Surv(ifelse(numb_fiscal <= 0, 0, numb_fiscal), numb_fiscal > 0, type = "left"), us, eu,      shsta| __truncated__
  .. .. ..- attr(*, "dataClasses")= Named chr [1:13] "nmatrix.2" "nmatrix.1" "nmatrix.1" "numeric" ...
  .. .. .. ..- attr(*, "names")= chr [1:13] "survival::Surv(ifelse(numb_fiscal <= 0, 0, numb_fiscal), numb_fiscal > 0, type = \"left\")" "us" "eu" "shstaffl" ...
  ..$ means            : Named num [1:12] 1 -0.2598 0.0484 -4.8937 -5.4272 ...
  .. ..- attr(*, "names")= chr [1:12] "(Intercept)" "us" "eu" "shstaffl" ...
  ..$ call             : language tobit(formula = numb_fiscal ~ us + eu + shstaffl + shquotal + lnrgdpnew + lnrgdpnewsq + rgdpchnew + rgdpchnewsqua| __truncated__
  ..$ dist             : chr "gaussian"
  ..$ y                : 'Surv' num [1:17, 1:2] 12  7  4  3 15  3  5 18  8  2 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:17] "35" "133" "216" "217" ...
  .. .. ..$ : chr [1:2] "time" "status"
  .. ..- attr(*, "type")= chr "left"
  ..$ naive.var        : num [1:13, 1:13] 54359 -481 1423 1028 906 ...
  ..$ na.action        : 'omit' Named int [1:1054] 1 2 3 4 5 6 7 8 9 10 ...
  .. ..- attr(*, "names")= chr [1:1054] "1" "2" "3" "4" ...
  ..$ formula          :Class 'formula'  language survival::Surv(ifelse(numb_fiscal <= 0, 0, numb_fiscal), numb_fiscal > 0, type = "left") ~ us + eu +      shstaff| __truncated__ ...
  .. .. ..- attr(*, ".Environment")=<environment: <normalized>> 
  ..- attr(*, "class")= chr [1:2] "tobit" "survreg"
 $ RFA ($T$+1)                :List of 36
  ..$ nobs            : int 17
  ..$ nobs_origin     : int 1071
  ..$ fml             :Class 'formula'  language rfa1 ~ us + eu + shstaffl + shquotal + lnrgdpnew + lnrgdpnewsq + rgdpchnew + rgdpchnewsquare + growth1new +      | __truncated__
  .. .. ..- attr(*, ".Environment")=<environment: <normalized>> 
  ..$ call            : language feols(fml = make_formula("rfa1"), data = data_new, cluster = "shcode")
  ..$ call_env        :<environment: <normalized>> 
  ..$ method          : chr "feols"
  ..$ method_type     : chr "feols"
  ..$ fixef.algo      :List of 4
  .. ..$ extraProj        : num 0
  .. ..$ iter_warmup      : num 15
  .. ..$ iter_projAfterAcc: num 40
  .. ..$ iter_grandAcc    : num 4
  ..$ fml_all         :List of 1
  .. ..$ linear:Class 'formula'  language rfa1 ~ us + eu + shstaffl + shquotal + lnrgdpnew + lnrgdpnewsq + rgdpchnew + rgdpchnewsquare + growth1new +      | __truncated__
  .. .. .. ..- attr(*, ".Environment")=<environment: <normalized>> 
  ..$ nparams         : int 13
  ..$ obs_selection   :List of 1
  .. ..$ obsRemoved: int [1:1054] -1 -2 -3 -4 -5 -6 -7 -8 -9 -10 ...
  ..$ model_info      : list()
  ..$ lhs_bounds      : list()
  ..$ means           : num 0
  ..$ coefficients    : Named num [1:13] -23.09 1.88 -2.23 -4.11 -1.2 ...
  .. ..- attr(*, "names")= chr [1:13] "(Intercept)" "us" "eu" "shstaffl" ...
  ..$ residuals       : num [1:17] -0.234 0.14 -0.974 0.623 -0.396 ...
  ..$ multicol        : logi TRUE
  ..$ collin.min_norm : num 0.403
  ..$ collin.var      : chr "factor(panel)2005"
  ..$ collin.coef     : Named num [1:14] -23.09 1.88 -2.23 -4.11 -1.2 ...
  .. ..- attr(*, "names")= chr [1:14] "(Intercept)" "us" "eu" "shstaffl" ...
  ..$ fitted.values   : num [1:17] 0.383 2.395 1.274 0.105 0.846 ...
  ..$ scores          : num [1:17, 1:13] -0.234 0.14 -0.974 0.623 -0.396 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:17] "35" "133" "216" "217" ...
  .. .. ..$ : chr [1:13] "(Intercept)" "us" "eu" "shstaffl" ...
  ..$ hessian         : num [1:14, 1:14] 17 -4.416 0.822 -83.193 -92.262 ...
  ..$ sigma2          : num 2.72
  ..$ cov.iid         : num [1:13, 1:13] 4625.9 -41.1 121.1 87.5 77.1 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:13] "(Intercept)" "us" "eu" "shstaffl" ...
  .. .. ..$ : chr [1:13] "(Intercept)" "us" "eu" "shstaffl" ...
  ..$ cov.unscaled    : num [1:13, 1:13] 4625.9 -41.1 121.1 87.5 77.1 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:13] "(Intercept)" "us" "eu" "shstaffl" ...
  .. .. ..$ : chr [1:13] "(Intercept)" "us" "eu" "shstaffl" ...
  ..$ coeftable       : num [1:13, 1:4] -23.09 1.88 -2.23 -4.11 -1.2 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:13] "(Intercept)" "us" "eu" "shstaffl" ...
  .. .. ..$ : chr [1:4] "Estimate" "Std. Error" "t value" "Pr(>|t|)"
  .. ..- attr(*, "vcov_type")= chr "Clustered (shcode)"
  ..$ se              : Named num [1:13] 36.254 3.79 2.853 1.19 0.732 ...
  .. ..- attr(*, "names")= chr [1:13] "(Intercept)" "us" "eu" "shstaffl" ...
  .. ..- attr(*, "vcov_type")= chr "Clustered (shcode)"
  ..$ sq.cor          : num 0.865
  ..$ ssr_null        : num 80.6
  ..$ ssr             : num 10.9
  ..$ ll_null         : num -37.4
  ..$ cov.scaled      : 'fixest_vcov' num [1:13, 1:13] 1314.322 26.846 -0.402 35.974 25.068 ...
  .. ..- attr(*, "G")= int 13
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:13] "(Intercept)" "us" "eu" "shstaffl" ...
  .. .. ..$ : chr [1:13] "(Intercept)" "us" "eu" "shstaffl" ...
  .. ..- attr(*, "min_cluster_size")= int 13
  .. ..- attr(*, "df.t")= num 12
  .. ..- attr(*, "vcov_type")= chr "Clustered (shcode)"
  .. ..- attr(*, "ssc")=List of 6
  .. .. ..$ K.adj  : logi TRUE
  .. .. ..$ K.fixef: chr "nonnested"
  .. .. ..$ G.adj  : logi TRUE
  .. .. ..$ G.df   : chr "min"
  .. .. ..$ t.df   : chr "min"
  .. .. ..$ K.exact: logi FALSE
  .. .. ..- attr(*, "class")= chr "ssc_type"
  .. .. ..- attr(*, "vcov_label")= chr "Clustered"
  .. .. ..- attr(*, "available")= chr [1:2] "K" "G"
  .. ..- attr(*, "df.K")= int 13
  ..$ summary         : logi TRUE
  ..$ summary_flags   :List of 1
  .. ..$ vcov:Class 'formula'  language cluster ~ shcode
  .. .. .. ..- attr(*, ".Environment")=<environment: <normalized>> 
  ..$ summary_from_fit: logi TRUE
  ..- attr(*, "class")= chr "fixest"
 $ RFA (end year)             :List of 36
  ..$ nobs            : int 17
  ..$ nobs_origin     : int 1071
  ..$ fml             :Class 'formula'  language rfa2 ~ us + eu + shstaffl + shquotal + lnrgdpnew + lnrgdpnewsq + rgdpchnew + rgdpchnewsquare + growth1new +      | __truncated__
  .. .. ..- attr(*, ".Environment")=<environment: <normalized>> 
  ..$ call            : language feols(fml = make_formula("rfa2"), data = data_new, cluster = "shcode")
  ..$ call_env        :<environment: <normalized>> 
  ..$ method          : chr "feols"
  ..$ method_type     : chr "feols"
  ..$ fixef.algo      :List of 4
  .. ..$ extraProj        : num 0
  .. ..$ iter_warmup      : num 15
  .. ..$ iter_projAfterAcc: num 40
  .. ..$ iter_grandAcc    : num 4
  ..$ fml_all         :List of 1
  .. ..$ linear:Class 'formula'  language rfa2 ~ us + eu + shstaffl + shquotal + lnrgdpnew + lnrgdpnewsq + rgdpchnew + rgdpchnewsquare + growth1new +      | __truncated__
  .. .. .. ..- attr(*, ".Environment")=<environment: <normalized>> 
  ..$ nparams         : int 13
  ..$ obs_selection   :List of 1
  .. ..$ obsRemoved: int [1:1054] -1 -2 -3 -4 -5 -6 -7 -8 -9 -10 ...
  ..$ model_info      : list()
  ..$ lhs_bounds      : list()
  ..$ means           : num 0
  ..$ coefficients    : Named num [1:13] -2.65 -1.4 -1.9 -5.04 -1.2 ...
  .. ..- attr(*, "names")= chr [1:13] "(Intercept)" "us" "eu" "shstaffl" ...
  ..$ residuals       : num [1:17] -0.372 0.181 -0.361 0.201 -0.38 ...
  ..$ multicol        : logi TRUE
  ..$ collin.min_norm : num 0.403
  ..$ collin.var      : chr "factor(panel)2005"
  ..$ collin.coef     : Named num [1:14] -2.65 -1.4 -1.9 -5.04 -1.2 ...
  .. ..- attr(*, "names")= chr [1:14] "(Intercept)" "us" "eu" "shstaffl" ...
  ..$ fitted.values   : num [1:17] 0.521 2.354 2.761 0.702 0.83 ...
  ..$ scores          : num [1:17, 1:13] -0.372 0.181 -0.361 0.201 -0.38 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:17] "35" "133" "216" "217" ...
  .. .. ..$ : chr [1:13] "(Intercept)" "us" "eu" "shstaffl" ...
  ..$ hessian         : num [1:14, 1:14] 17 -4.416 0.822 -83.193 -92.262 ...
  ..$ sigma2          : num 4.23
  ..$ cov.iid         : num [1:13, 1:13] 7186.8 -63.8 188.2 135.9 119.8 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:13] "(Intercept)" "us" "eu" "shstaffl" ...
  .. .. ..$ : chr [1:13] "(Intercept)" "us" "eu" "shstaffl" ...
  ..$ cov.unscaled    : num [1:13, 1:13] 7186.8 -63.8 188.2 135.9 119.8 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:13] "(Intercept)" "us" "eu" "shstaffl" ...
  .. .. ..$ : chr [1:13] "(Intercept)" "us" "eu" "shstaffl" ...
  ..$ coeftable       : num [1:13, 1:4] -2.65 -1.4 -1.9 -5.04 -1.2 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:13] "(Intercept)" "us" "eu" "shstaffl" ...
  .. .. ..$ : chr [1:4] "Estimate" "Std. Error" "t value" "Pr(>|t|)"
  .. ..- attr(*, "vcov_type")= chr "Clustered (shcode)"
  ..$ se              : Named num [1:13] 39.395 5.17 3.948 1.429 0.862 ...
  .. ..- attr(*, "names")= chr [1:13] "(Intercept)" "us" "eu" "shstaffl" ...
  .. ..- attr(*, "vcov_type")= chr "Clustered (shcode)"
  ..$ sq.cor          : num 0.768
  ..$ ssr_null        : num 72.8
  ..$ ssr             : num 16.9
  ..$ ll_null         : num -36.5
  ..$ cov.scaled      : 'fixest_vcov' num [1:13, 1:13] 1552 46.2 -33.1 48.8 31.5 ...
  .. ..- attr(*, "G")= int 13
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:13] "(Intercept)" "us" "eu" "shstaffl" ...
  .. .. ..$ : chr [1:13] "(Intercept)" "us" "eu" "shstaffl" ...
  .. ..- attr(*, "min_cluster_size")= int 13
  .. ..- attr(*, "df.t")= num 12
  .. ..- attr(*, "vcov_type")= chr "Clustered (shcode)"
  .. ..- attr(*, "ssc")=List of 6
  .. .. ..$ K.adj  : logi TRUE
  .. .. ..$ K.fixef: chr "nonnested"
  .. .. ..$ G.adj  : logi TRUE
  .. .. ..$ G.df   : chr "min"
  .. .. ..$ t.df   : chr "min"
  .. .. ..$ K.exact: logi FALSE
  .. .. ..- attr(*, "class")= chr "ssc_type"
  .. .. ..- attr(*, "vcov_label")= chr "Clustered"
  .. .. ..- attr(*, "available")= chr [1:2] "K" "G"
  .. ..- attr(*, "df.K")= int 13
  ..$ summary         : logi TRUE
  ..$ summary_flags   :List of 1
  .. ..$ vcov:Class 'formula'  language cluster ~ shcode
  .. .. .. ..- attr(*, ".Environment")=<environment: <normalized>> 
  ..$ summary_from_fit: logi TRUE
  ..- attr(*, "class")= chr "fixest"
