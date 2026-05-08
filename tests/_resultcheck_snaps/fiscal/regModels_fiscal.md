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
    reserv1 + oecd1 + year1995 + year2000, left = 0, right = Inf, 
    data = data_new, cluster = shcode)

Coefficients:
    (Intercept)               us               eu         shstaffl         shquotal        lnrgdpnew  
       -21.6022         -14.6673          18.5203          -0.2644          -2.4856          -0.7554  
    lnrgdpnewsq        rgdpchnew  rgdpchnewsquare       growth1new          reserv1            oecd1  
         0.2389          -4.7266           0.6184          -0.3348          -0.9526         -11.3693  
       year1995         year2000  
         2.7664           9.8762  

Scale: 5.208 


$`RFA ($T$+1)`
OLS estimation, Dep. Var.: rfa1
Observations: 30
Standard-errors: Clustered (shcode) 
                  Estimate Std. Error   t value  Pr(>|t|)    
(Intercept)     -57.941785  28.246662 -2.051279 0.0559774 .  
us                8.595110   3.967095  2.166601 0.0447641 *  
eu               -5.282259   3.014967 -1.752013 0.0977889 .  
shstaffl         -0.415921   0.847048 -0.491025 0.6296875    
shquotal          0.486534   0.919903  0.528896 0.6037151    
lnrgdpnew        13.912546   6.253294  2.224835 0.0399219 *  
lnrgdpnewsq      -0.723745   0.320577 -2.257632 0.0374125 *  
rgdpchnew        -2.499050   1.456026 -1.716350 0.1042623    
rgdpchnewsquare   0.229019   0.157095  1.457834 0.1631127    
growth1new        0.064177   0.210939  0.304247 0.7646326    
reserv1           0.311635   0.273706  1.138575 0.2706720    
oecd1            10.664295   2.782724  3.832322 0.0013339 ** 
year1995         -3.563488   1.648997 -2.161004 0.0452569 *  
year2000         -3.242293   2.222661 -1.458744 0.1628651    
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
RMSE: 1.80884   Adj. R2: 0.272963

$`RFA (end year)`
OLS estimation, Dep. Var.: rfa2
Observations: 30
Standard-errors: Clustered (shcode) 
                  Estimate Std. Error   t value Pr(>|t|) 
(Intercept)     -41.211250  27.270597 -1.511197  0.14910 
us                2.496989   5.400304  0.462379  0.64967 
eu                0.359729   5.198253  0.069202  0.94564 
shstaffl         -0.590355   1.469460 -0.401750  0.69287 
shquotal         -0.227855   1.004581 -0.226816  0.82327 
lnrgdpnew         7.234946   7.685587  0.941365  0.35970 
lnrgdpnewsq      -0.309385   0.427880 -0.723065  0.47947 
rgdpchnew        -2.581661   1.914769 -1.348289  0.19526 
rgdpchnewsquare   0.237756   0.206560  1.151024  0.26566 
growth1new        0.243698   0.353092  0.690184  0.49939 
reserv1           0.298323   0.412728  0.722808  0.47962 
oecd1             8.253071   5.552694  1.486318  0.15551 
year1995          0.769754   2.812866  0.273655  0.78765 
year2000         -1.153449   2.823741 -0.408483  0.68802 
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
RMSE: 2.41778   Adj. R2: 0.010679


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
  ..$ coefficients     : Named num [1:14] -21.602 -14.667 18.52 -0.264 -2.486 ...
  .. ..- attr(*, "names")= chr [1:14] "(Intercept)" "us" "eu" "shstaffl" ...
  ..$ icoef            : Named num [1:2] 8.77 2.05
  .. ..- attr(*, "names")= chr [1:2] "Intercept" "Log(scale)"
  ..$ var              : num [1:15, 1:15] 835.63 -208.29 181.66 -2.4 3.75 ...
  ..$ loglik           : num [1:2] -107.5 -95.1
  ..$ iter             : int 5
  ..$ linear.predictors: num [1:31] 14.35 3.94 4.54 1.41 7.48 ...
  ..$ df               : int 15
  ..$ scale            : num 5.21
  ..$ idf              : num 2
  ..$ df.residual      : int 16
  ..$ terms            :Classes 'terms', 'formula'  language survival::Surv(ifelse(numb_fiscal <= 0, 0, numb_fiscal), numb_fiscal > 0, type = "left") ~ us + eu +      shstaff| __truncated__ ...
  .. .. ..- attr(*, "variables")= language list(survival::Surv(ifelse(numb_fiscal <= 0, 0, numb_fiscal), numb_fiscal > 0, type = "left"), us, eu,      shsta| __truncated__ ...
  .. .. ..- attr(*, "factors")= int [1:14, 1:13] 0 1 0 0 0 0 0 0 0 0 ...
  .. .. .. ..- attr(*, "dimnames")=List of 2
  .. .. .. .. ..$ : chr [1:14] "survival::Surv(ifelse(numb_fiscal <= 0, 0, numb_fiscal), numb_fiscal > 0, type = \"left\")" "us" "eu" "shstaffl" ...
  .. .. .. .. ..$ : chr [1:13] "us" "eu" "shstaffl" "shquotal" ...
  .. .. ..- attr(*, "term.labels")= chr [1:13] "us" "eu" "shstaffl" "shquotal" ...
  .. .. ..- attr(*, "specials")=Dotted pair list of 1
  .. .. .. ..$ strata: NULL
  .. .. ..- attr(*, "order")= int [1:13] 1 1 1 1 1 1 1 1 1 1 ...
  .. .. ..- attr(*, "intercept")= int 1
  .. .. ..- attr(*, "response")= int 1
  .. .. ..- attr(*, ".Environment")=<environment: <normalized>> 
  .. .. ..- attr(*, "predvars")= language list(survival::Surv(ifelse(numb_fiscal <= 0, 0, numb_fiscal), numb_fiscal > 0, type = "left"), us, eu,      shsta| __truncated__ ...
  .. .. ..- attr(*, "dataClasses")= Named chr [1:15] "nmatrix.2" "nmatrix.1" "nmatrix.1" "numeric" ...
  .. .. .. ..- attr(*, "names")= chr [1:15] "survival::Surv(ifelse(numb_fiscal <= 0, 0, numb_fiscal), numb_fiscal > 0, type = \"left\")" "us" "eu" "shstaffl" ...
  ..$ means            : Named num [1:14] 1 -0.1522 -0.0145 -5.252 -5.7394 ...
  .. ..- attr(*, "names")= chr [1:14] "(Intercept)" "us" "eu" "shstaffl" ...
  ..$ call             : language tobit(formula = numb_fiscal ~ us + eu + shstaffl + shquotal + lnrgdpnew + lnrgdpnewsq + rgdpchnew + rgdpchnewsqua| __truncated__
  ..$ dist             : chr "gaussian"
  ..$ y                : 'Surv' num [1:31, 1:2] 12  6  7  4  3  3 15  6  3  5 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:31] "34" "82" "132" "215" ...
  .. .. ..$ : chr [1:2] "time" "status"
  .. ..- attr(*, "type")= chr "left"
  ..$ naive.var        : num [1:15, 1:15] 2847.29 -220.95 155.72 -0.94 51.73 ...
  ..$ na.action        : 'omit' Named int [1:1040] 1 2 3 4 5 6 7 8 9 10 ...
  .. ..- attr(*, "names")= chr [1:1040] "1" "2" "3" "4" ...
  ..$ formula          :Class 'formula'  language survival::Surv(ifelse(numb_fiscal <= 0, 0, numb_fiscal), numb_fiscal > 0, type = "left") ~ us + eu +      shstaff| __truncated__ ...
  .. .. ..- attr(*, ".Environment")=<environment: <normalized>> 
  ..- attr(*, "class")= chr [1:2] "tobit" "survreg"
 $ RFA ($T$+1)                :List of 34
  ..$ nobs            : int 30
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
  ..$ nparams         : num 14
  ..$ obs_selection   :List of 1
  .. ..$ obsRemoved: int [1:1041] -1 -2 -3 -4 -5 -6 -7 -8 -9 -10 ...
  ..$ model_info      : list()
  ..$ lhs_bounds      : list()
  ..$ means           : num 0
  ..$ coefficients    : Named num [1:14] -57.942 8.595 -5.282 -0.416 0.487 ...
  .. ..- attr(*, "names")= chr [1:14] "(Intercept)" "us" "eu" "shstaffl" ...
  ..$ residuals       : num [1:30] -1.699 -2.43 1.769 -0.842 -0.348 ...
  ..$ multicol        : logi FALSE
  ..$ collin.min_norm : num 0.371
  ..$ fitted.values   : num [1:30] 1.849 0.23 0.766 1.142 1.076 ...
  ..$ scores          : num [1:30, 1:14] -1.699 -2.43 1.769 -0.842 -0.348 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : NULL
  .. .. ..$ : chr [1:14] "(Intercept)" "us" "eu" "shstaffl" ...
  ..$ hessian         : num [1:14, 1:14] 30 -4.473 -0.309 -155.798 -171.019 ...
  ..$ sigma2          : num 6.13
  ..$ cov.iid         : num [1:14, 1:14] 682.91 -53.01 39.4 1.69 12.84 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:14] "(Intercept)" "us" "eu" "shstaffl" ...
  .. .. ..$ : chr [1:14] "(Intercept)" "us" "eu" "shstaffl" ...
  ..$ cov.unscaled    : num [1:14, 1:14] 682.91 -53.01 39.4 1.69 12.84 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:14] "(Intercept)" "us" "eu" "shstaffl" ...
  .. .. ..$ : chr [1:14] "(Intercept)" "us" "eu" "shstaffl" ...
  ..$ coeftable       : num [1:14, 1:4] -57.942 8.595 -5.282 -0.416 0.487 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:14] "(Intercept)" "us" "eu" "shstaffl" ...
  .. .. ..$ : chr [1:4] "Estimate" "Std. Error" "t value" "Pr(>|t|)"
  .. ..- attr(*, "vcov_type")= chr "Clustered (shcode)"
  ..$ se              : Named num [1:14] 28.247 3.967 3.015 0.847 0.92 ...
  .. ..- attr(*, "names")= chr [1:14] "(Intercept)" "us" "eu" "shstaffl" ...
  .. ..- attr(*, "vcov_type")= chr "Clustered (shcode)"
  ..$ sq.cor          : num 0.599
  ..$ ssr_null        : num 245
  ..$ ssr             : num 98.2
  ..$ ll_null         : num -74.1
  ..$ cov.scaled      : 'fixest_vcov' num [1:14, 1:14] 797.9 -77.3 32.8 -7 11.4 ...
  .. ..- attr(*, "G")= int 18
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:14] "(Intercept)" "us" "eu" "shstaffl" ...
  .. .. ..$ : chr [1:14] "(Intercept)" "us" "eu" "shstaffl" ...
  .. ..- attr(*, "min_cluster_size")= int 18
  .. ..- attr(*, "df.t")= num 17
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
  .. ..- attr(*, "df.K")= num 14
  ..$ summary         : logi TRUE
  ..$ summary_flags   :List of 1
  .. ..$ vcov:Class 'formula'  language cluster ~ shcode
  .. .. .. ..- attr(*, ".Environment")=<environment: <normalized>> 
  ..$ summary_from_fit: logi TRUE
  ..- attr(*, "class")= chr "fixest"
 $ RFA (end year)             :List of 34
  ..$ nobs            : int 30
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
  ..$ nparams         : num 14
  ..$ obs_selection   :List of 1
  .. ..$ obsRemoved: int [1:1041] -1 -2 -3 -4 -5 -6 -7 -8 -9 -10 ...
  ..$ model_info      : list()
  ..$ lhs_bounds      : list()
  ..$ means           : num 0
  ..$ coefficients    : Named num [1:14] -41.211 2.497 0.36 -0.59 -0.228 ...
  .. ..- attr(*, "names")= chr [1:14] "(Intercept)" "us" "eu" "shstaffl" ...
  ..$ residuals       : num [1:30] -1.77 -3.09 1.39 -1.41 0.14 ...
  ..$ multicol        : logi FALSE
  ..$ collin.min_norm : num 0.371
  ..$ fitted.values   : num [1:30] 1.923 1.992 1.146 3.806 0.763 ...
  ..$ scores          : num [1:30, 1:14] -1.77 -3.09 1.39 -1.41 0.14 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : NULL
  .. .. ..$ : chr [1:14] "(Intercept)" "us" "eu" "shstaffl" ...
  ..$ hessian         : num [1:14, 1:14] 30 -4.473 -0.309 -155.798 -171.019 ...
  ..$ sigma2          : num 11
  ..$ cov.iid         : num [1:14, 1:14] 1220.1 -94.72 70.39 3.01 22.95 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:14] "(Intercept)" "us" "eu" "shstaffl" ...
  .. .. ..$ : chr [1:14] "(Intercept)" "us" "eu" "shstaffl" ...
  ..$ cov.unscaled    : num [1:14, 1:14] 1220.1 -94.72 70.39 3.01 22.95 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:14] "(Intercept)" "us" "eu" "shstaffl" ...
  .. .. ..$ : chr [1:14] "(Intercept)" "us" "eu" "shstaffl" ...
  ..$ coeftable       : num [1:14, 1:4] -41.211 2.497 0.36 -0.59 -0.228 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:14] "(Intercept)" "us" "eu" "shstaffl" ...
  .. .. ..$ : chr [1:4] "Estimate" "Std. Error" "t value" "Pr(>|t|)"
  .. ..- attr(*, "vcov_type")= chr "Clustered (shcode)"
  ..$ se              : Named num [1:14] 27.27 5.4 5.2 1.47 1 ...
  .. ..- attr(*, "names")= chr [1:14] "(Intercept)" "us" "eu" "shstaffl" ...
  .. ..- attr(*, "vcov_type")= chr "Clustered (shcode)"
  ..$ sq.cor          : num 0.454
  ..$ ssr_null        : num 321
  ..$ ssr             : num 175
  ..$ ll_null         : num -78.1
  ..$ cov.scaled      : 'fixest_vcov' num [1:14, 1:14] 743.69 -118.18 73.76 -12.38 0.95 ...
  .. ..- attr(*, "G")= int 18
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:14] "(Intercept)" "us" "eu" "shstaffl" ...
  .. .. ..$ : chr [1:14] "(Intercept)" "us" "eu" "shstaffl" ...
  .. ..- attr(*, "min_cluster_size")= int 18
  .. ..- attr(*, "df.t")= num 17
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
  .. ..- attr(*, "df.K")= num 14
  ..$ summary         : logi TRUE
  ..$ summary_flags   :List of 1
  .. ..$ vcov:Class 'formula'  language cluster ~ shcode
  .. .. .. ..- attr(*, ".Environment")=<environment: <normalized>> 
  ..$ summary_from_fit: logi TRUE
  ..- attr(*, "class")= chr "fixest"
