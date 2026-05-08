# Snapshot: list

## print
$`IMF loan to GDP ratio`

Call:
tobit(formula = imfloannew100 ~ us + eu * is_african + shstaffl + 
    shquotal + lnrgdpnew + lnrgdpnewsq + rgdpchnew + rgdpchnewsquare + 
    growth1new + reserv1 + oecd1 + year1980 + year1985 + year1990 + 
    year1995 + year2000, left = 0, right = Inf, data = data, 
    cluster = shcode)

Coefficients:
    (Intercept)               us               eu       is_african         shstaffl         shquotal  
        9.55324          0.29991          1.96605         -0.97262          0.33327          0.99145  
      lnrgdpnew      lnrgdpnewsq        rgdpchnew  rgdpchnewsquare       growth1new          reserv1  
        0.36173         -0.05225          0.69578         -0.07872         -0.12953         -0.17488  
          oecd1         year1980         year1985         year1990         year1995         year2000  
       -1.81535          0.93979          0.34746         -0.18481         -0.40826          0.51454  
  eu:is_african  
       -2.18907  

Scale: 2.116 


$`IMF participation rate`

Call:
tobit(formula = imf_p ~ us + eu * is_african + shstaffl + shquotal + 
    lnrgdpnew + lnrgdpnewsq + rgdpchnew + rgdpchnewsquare + growth1new + 
    reserv1 + oecd1 + year1980 + year1985 + year1990 + year1995 + 
    year2000, left = 0, right = 1, data = data, cluster = shcode)

Coefficients:
    (Intercept)               us               eu       is_african         shstaffl         shquotal  
       -0.75475          0.09936          0.48361         -0.43215          0.07271          0.10518  
      lnrgdpnew      lnrgdpnewsq        rgdpchnew  rgdpchnewsquare       growth1new          reserv1  
        0.43506         -0.02515          0.15770         -0.01890         -0.02908         -0.03392  
          oecd1         year1980         year1985         year1990         year1995         year2000  
       -0.61015          0.51721          0.36382          0.26655          0.16162          0.28538  
  eu:is_african  
       -1.06825  

Scale: 0.4453 


$`IMF loan approval`
GLM estimation, family = binomial(link = "probit"), Dep. Var.: imf5a
Observations: 522
Standard-errors: Clustered (shcode) 
             Estimate Std. Error   z value  Pr(>|z|)    
(Intercept) -2.161909   2.504841 -0.863092 0.3880868    
us           0.167778   0.166224  1.009352 0.3128057    
eu           1.043188   0.462642  2.254850 0.0241427 *  
is_african  -0.727802   0.446571 -1.629757 0.1031528    
shstaffl     0.121393   0.090064  1.347852 0.1777061    
shquotal     0.242922   0.197783  1.228222 0.2193638    
lnrgdpnew    0.968198   0.330395  2.930426 0.0033850 ** 
lnrgdpnewsq -0.055674   0.018406 -3.024838 0.0024877 ** 
... 11 coefficients remaining (display them with summary() or use argument n)
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
Log-Likelihood: -232.0   Adj. Pseudo R2: 0.257972
           BIC:  582.9     Squared Cor.: 0.328264

$`Number of IMF conditions`

Call:
tobit(formula = tc ~ us + eu * is_african + shstaffl + shquotal + 
    lnrgdpnew + lnrgdpnewsq + rgdpchnew + rgdpchnewsquare + growth1new + 
    reserv1 + oecd1 + year1980 + year1985 + year1990 + year1995 + 
    year2000, left = 0, right = Inf, data = data, cluster = shcode)

Coefficients:
    (Intercept)               us               eu       is_african         shstaffl         shquotal  
     -281.41940         -3.51501          3.11660         11.32477         -1.66871        -11.91205  
      lnrgdpnew      lnrgdpnewsq        rgdpchnew  rgdpchnewsquare       growth1new          reserv1  
       41.88395         -1.51435         -0.24030          0.04491         -1.10325         -0.12996  
          oecd1         year1980         year1985         year1990         year1995         year2000  
        5.88529        -53.66789        -52.87287        -55.51511        -49.62264        -45.16987  
  eu:is_african  
        2.29069  

Scale: 6.758 



## str
List of 4
 $ IMF loan to GDP ratio   :List of 18
  ..$ coefficients     : Named num [1:19] 9.553 0.3 1.966 -0.973 0.333 ...
  .. ..- attr(*, "names")= chr [1:19] "(Intercept)" "us" "eu" "is_african" ...
  ..$ icoef            : Named num [1:2] -0.857 0.91
  .. ..- attr(*, "names")= chr [1:2] "Intercept" "Log(scale)"
  ..$ var              : num [1:20, 1:20] 24.336 -0.18 0.68 1.182 0.397 ...
  ..$ loglik           : num [1:2] -669 -571
  ..$ iter             : int 9
  ..$ linear.predictors: num [1:517] 0.4261 0.9269 0.5868 0.0236 0.9378 ...
  ..$ df               : int 20
  ..$ scale            : num 2.12
  ..$ idf              : num 2
  ..$ df.residual      : int 497
  ..$ terms            :Classes 'terms', 'formula'  language survival::Surv(ifelse(imfloannew100 <= 0, 0, imfloannew100), imfloannew100 > 0, type = "left") ~ us +      eu * i| __truncated__ ...
  .. .. ..- attr(*, "variables")= language list(survival::Surv(ifelse(imfloannew100 <= 0, 0, imfloannew100), imfloannew100 > 0, type = "left"),      us, eu,| __truncated__ ...
  .. .. ..- attr(*, "factors")= int [1:18, 1:18] 0 1 0 0 0 0 0 0 0 0 ...
  .. .. .. ..- attr(*, "dimnames")=List of 2
  .. .. .. .. ..$ : chr [1:18] "survival::Surv(ifelse(imfloannew100 <= 0, 0, imfloannew100), imfloannew100 > 0, type = \"left\")" "us" "eu" "is_african" ...
  .. .. .. .. ..$ : chr [1:18] "us" "eu" "is_african" "shstaffl" ...
  .. .. ..- attr(*, "term.labels")= chr [1:18] "us" "eu" "is_african" "shstaffl" ...
  .. .. ..- attr(*, "specials")=Dotted pair list of 1
  .. .. .. ..$ strata: NULL
  .. .. ..- attr(*, "order")= int [1:18] 1 1 1 1 1 1 1 1 1 1 ...
  .. .. ..- attr(*, "intercept")= int 1
  .. .. ..- attr(*, "response")= int 1
  .. .. ..- attr(*, ".Environment")=<environment: <normalized>> 
  .. .. ..- attr(*, "predvars")= language list(survival::Surv(ifelse(imfloannew100 <= 0, 0, imfloannew100), imfloannew100 > 0, type = "left"),      us, eu,| __truncated__ ...
  .. .. ..- attr(*, "dataClasses")= Named chr [1:19] "nmatrix.2" "nmatrix.1" "nmatrix.1" "numeric" ...
  .. .. .. ..- attr(*, "names")= chr [1:19] "survival::Surv(ifelse(imfloannew100 <= 0, 0, imfloannew100), imfloannew100 > 0, type = \"left\")" "us" "eu" "is_african" ...
  ..$ means            : Named num [1:19] 1 0.1655 0.0413 0.3114 -5.4046 ...
  .. ..- attr(*, "names")= chr [1:19] "(Intercept)" "us" "eu" "is_african" ...
  ..$ call             : language tobit(formula = imfloannew100 ~ us + eu * is_african + shstaffl + shquotal + lnrgdpnew + lnrgdpnewsq +      rgdpc| __truncated__ ...
  ..$ dist             : chr "gaussian"
  ..$ y                : 'Surv' num [1:517, 1:2]  0.2200   0.3976   1.3679   0.9963   6.7910   0.7445   0.0000-  0.0000-  0.0000-  0.0000- ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:517] "30" "31" "32" "33" ...
  .. .. ..$ : chr [1:2] "time" "status"
  .. ..- attr(*, "type")= chr "left"
  ..$ naive.var        : num [1:20, 1:20] 17.2284 -0.1509 -0.0943 -0.113 0.18 ...
  ..$ na.action        : 'omit' Named int [1:554] 1 2 3 4 5 6 7 8 9 10 ...
  .. ..- attr(*, "names")= chr [1:554] "1" "2" "3" "4" ...
  ..$ formula          :Class 'formula'  language survival::Surv(ifelse(imfloannew100 <= 0, 0, imfloannew100), imfloannew100 > 0, type = "left") ~ us +      eu * i| __truncated__ ...
  .. .. ..- attr(*, ".Environment")=<environment: <normalized>> 
  ..- attr(*, "class")= chr [1:2] "tobit" "survreg"
 $ IMF participation rate  :List of 18
  ..$ coefficients     : Named num [1:19] -0.7548 0.0994 0.4836 -0.4321 0.0727 ...
  .. ..- attr(*, "names")= chr [1:19] "(Intercept)" "us" "eu" "is_african" ...
  ..$ icoef            : Named num [1:2] -0.114 -0.49
  .. ..- attr(*, "names")= chr [1:2] "Intercept" "Log(scale)"
  ..$ var              : num [1:20, 1:20] 1.04366 -0.00724 0.01699 -0.00183 0.00998 ...
  ..$ loglik           : num [1:2] -392 -255
  ..$ iter             : int 9
  ..$ linear.predictors: num [1:522] 0.323 0.418 0.363 0.268 0.368 ...
  ..$ df               : int 20
  ..$ scale            : num 0.445
  ..$ idf              : num 2
  ..$ df.residual      : int 502
  ..$ terms            :Classes 'terms', 'formula'  language survival::Surv(ifelse(imf_p >= 1, 1, ifelse(imf_p <= 0, 0, imf_p)), time2 = 1, ifelse(imf_p >= 1, 0,      ifelse(| __truncated__ ...
  .. .. ..- attr(*, "variables")= language list(survival::Surv(ifelse(imf_p >= 1, 1, ifelse(imf_p <= 0, 0, imf_p)), time2 = 1, ifelse(imf_p >= 1,      0, if| __truncated__ ...
  .. .. ..- attr(*, "factors")= int [1:18, 1:18] 0 1 0 0 0 0 0 0 0 0 ...
  .. .. .. ..- attr(*, "dimnames")=List of 2
  .. .. .. .. ..$ : chr [1:18] "survival::Surv(ifelse(imf_p >= 1, 1, ifelse(imf_p <= 0, 0, imf_p)), time2 = 1, ifelse(imf_p >= 1, 0, ifelse(imf"| __truncated__ "us" "eu" "is_african" ...
  .. .. .. .. ..$ : chr [1:18] "us" "eu" "is_african" "shstaffl" ...
  .. .. ..- attr(*, "term.labels")= chr [1:18] "us" "eu" "is_african" "shstaffl" ...
  .. .. ..- attr(*, "specials")=Dotted pair list of 1
  .. .. .. ..$ strata: NULL
  .. .. ..- attr(*, "order")= int [1:18] 1 1 1 1 1 1 1 1 1 1 ...
  .. .. ..- attr(*, "intercept")= int 1
  .. .. ..- attr(*, "response")= int 1
  .. .. ..- attr(*, ".Environment")=<environment: <normalized>> 
  .. .. ..- attr(*, "predvars")= language list(survival::Surv(ifelse(imf_p >= 1, 1, ifelse(imf_p <= 0, 0, imf_p)), time2 = 1, ifelse(imf_p >= 1,      0, if| __truncated__ ...
  .. .. ..- attr(*, "dataClasses")= Named chr [1:19] "nmatrix.3" "nmatrix.1" "nmatrix.1" "numeric" ...
  .. .. .. ..- attr(*, "names")= chr [1:19] "survival::Surv(ifelse(imf_p >= 1, 1, ifelse(imf_p <= 0, 0, imf_p)), time2 = 1, ifelse(imf_p >= 1, 0, ifelse(imf"| __truncated__ "us" "eu" "is_african" ...
  ..$ means            : Named num [1:19] 1 0.1635 0.0465 0.3084 -5.4104 ...
  .. ..- attr(*, "names")= chr [1:19] "(Intercept)" "us" "eu" "is_african" ...
  ..$ call             : language tobit(formula = imf_p ~ us + eu * is_african + shstaffl + shquotal + lnrgdpnew + lnrgdpnewsq + rgdpchnew +      r| __truncated__ ...
  ..$ dist             : chr "gaussian"
  ..$ y                : 'Surv' num [1:522, 1:3] 0.2700 0.5520 0.9340 0.9493 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:522] "30" "31" "32" "33" ...
  .. .. ..$ : chr [1:3] "time1" "time2" "status"
  .. ..- attr(*, "type")= chr "interval"
  ..$ naive.var        : num [1:20, 1:20] 0.75523 -0.00727 -0.00514 -0.00358 0.00739 ...
  ..$ na.action        : 'omit' Named int [1:549] 1 2 3 4 5 6 7 8 9 10 ...
  .. ..- attr(*, "names")= chr [1:549] "1" "2" "3" "4" ...
  ..$ formula          :Class 'formula'  language survival::Surv(ifelse(imf_p >= 1, 1, ifelse(imf_p <= 0, 0, imf_p)), time2 = 1, ifelse(imf_p >= 1, 0,      ifelse(| __truncated__ ...
  .. .. ..- attr(*, ".Environment")=<environment: <normalized>> 
  ..- attr(*, "class")= chr [1:2] "tobit" "survreg"
 $ IMF loan approval       :List of 39
  ..$ nobs             : int 522
  ..$ nobs_origin      : int 1071
  ..$ fml              :Class 'formula'  language imf5a ~ us + eu * is_african + shstaffl + shquotal + lnrgdpnew + lnrgdpnewsq + rgdpchnew + rgdpchnewsquare +     | __truncated__
  .. .. ..- attr(*, ".Environment")=<environment: <normalized>> 
  ..$ call             : language feglm(fml = make_formula("imf5a"), data = data, family = binomial(link = "probit"), cluster = "shcode")
  ..$ call_env         :<environment: <normalized>> 
  ..$ method           : chr "feglm"
  ..$ method_type      : chr "feglm"
  ..$ fixef.algo       :List of 4
  .. ..$ extraProj        : num 0
  .. ..$ iter_warmup      : num 15
  .. ..$ iter_projAfterAcc: num 40
  .. ..$ iter_grandAcc    : num 4
  ..$ fml_all          :List of 1
  .. ..$ linear:Class 'formula'  language imf5a ~ us + eu * is_african + shstaffl + shquotal + lnrgdpnew + lnrgdpnewsq + rgdpchnew + rgdpchnewsquare +     | __truncated__
  .. .. .. ..- attr(*, ".Environment")=<environment: <normalized>> 
  ..$ nparams          : num 19
  ..$ obs_selection    :List of 1
  .. ..$ obsRemoved: int [1:549] -1 -2 -3 -4 -5 -6 -7 -8 -9 -10 ...
  ..$ model_info       : list()
  ..$ family           :List of 15
  .. ..$ family      : chr "binomial"
  .. ..$ link        : chr "probit"
  .. ..$ linkfun     :function (mu)  
  .. ..$ linkinv     :function (eta)  
  .. ..$ variance    :function (mu)  
  .. ..$ dev.resids  :function (y, mu, wt)  
  .. ..$ aic         :function (y, n, mu, wt, dev)  
  .. ..$ mu.eta      :function (eta)  
  .. ..$ initialize  : language {     if (NCOL(y) == 1) { ...
  .. ..$ validmu     :function (mu)  
  .. ..$ valideta    :function (eta)  
  .. ..$ simulate    :function (object, nsim)  
  .. ..$ dispersion  : num 1
  .. ..$ family_type : chr "logit"
  .. ..$ family_equiv: chr "none"
  .. ..- attr(*, "class")= chr "family"
  ..$ lhs_bounds       :List of 2
  .. ..$ zero: logi TRUE
  .. ..$ one : logi TRUE
  ..$ convStatus       : logi TRUE
  ..$ irls_weights     : num [1:522] 0.619 0.531 0.6 0.637 0.637 ...
  ..$ coefficients     : Named num [1:19] -2.162 0.168 1.043 -0.728 0.121 ...
  .. ..- attr(*, "names")= chr [1:19] "(Intercept)" "us" "eu" "is_african" ...
  ..$ collin.min_norm  : num 1.5
  ..$ linear.predictors: num [1:522] 0.2763 0.70173 0.40339 -0.01223 0.00157 ...
  ..$ fitted.values    : num [1:522] 0.609 0.759 0.657 0.495 0.501 ...
  ..$ residuals        : num [1:522] 0.391 0.241 0.343 0.505 0.499 ...
  ..$ dispersion       : num 1
  ..$ working_residuals: num [1:522] 1.019 0.774 0.934 1.266 1.252 ...
  ..$ scores           : num [1:522, 1:19] 0.631 0.411 0.56 0.806 0.797 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : NULL
  .. .. ..$ : chr [1:19] "(Intercept)" "us" "eu" "is_african" ...
  ..$ hessian          : num [1:19, 1:19] 219.6 -28.7 -59.5 86.1 -1244.5 ...
  ..$ cov.iid          : num [1:19, 1:19] 5.333 -0.0468 -0.0456 -0.0149 0.0528 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:19] "(Intercept)" "us" "eu" "is_african" ...
  .. .. ..$ : chr [1:19] "(Intercept)" "us" "eu" "is_african" ...
  ..$ cov.unscaled     : num [1:19, 1:19] 5.333 -0.0468 -0.0456 -0.0149 0.0528 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:19] "(Intercept)" "us" "eu" "is_african" ...
  .. .. ..$ : chr [1:19] "(Intercept)" "us" "eu" "is_african" ...
  ..$ coeftable        : num [1:19, 1:4] -2.162 0.168 1.043 -0.728 0.121 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:19] "(Intercept)" "us" "eu" "is_african" ...
  .. .. ..$ : chr [1:4] "Estimate" "Std. Error" "z value" "Pr(>|z|)"
  .. ..- attr(*, "vcov_type")= chr "Clustered (shcode)"
  ..$ se               : Named num [1:19] 2.5048 0.1662 0.4626 0.4466 0.0901 ...
  .. ..- attr(*, "names")= chr [1:19] "(Intercept)" "us" "eu" "is_african" ...
  .. ..- attr(*, "vcov_type")= chr "Clustered (shcode)"
  ..$ sq.cor           : num 0.328
  ..$ deviance         : num 464
  ..$ loglik           : num -232
  ..$ ll_null          : num -337
  ..$ pseudo_r2        : num 0.257
  ..$ iterations       : int 13
  ..$ cov.scaled       : 'fixest_vcov' num [1:19, 1:19] 6.27423 -0.04677 0.20407 -0.00481 0.05574 ...
  .. ..- attr(*, "G")= int 121
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:19] "(Intercept)" "us" "eu" "is_african" ...
  .. .. ..$ : chr [1:19] "(Intercept)" "us" "eu" "is_african" ...
  .. ..- attr(*, "min_cluster_size")= int 121
  .. ..- attr(*, "df.t")= num 120
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
  .. ..- attr(*, "df.K")= num 19
  ..$ summary          : logi TRUE
  ..$ summary_flags    :List of 1
  .. ..$ vcov:Class 'formula'  language cluster ~ shcode
  .. .. .. ..- attr(*, ".Environment")=<environment: <normalized>> 
  ..$ summary_from_fit : logi TRUE
  ..- attr(*, "class")= chr "fixest"
 $ Number of IMF conditions:List of 18
  ..$ coefficients     : Named num [1:19] -281.42 -3.52 3.12 11.32 -1.67 ...
  .. ..- attr(*, "names")= chr [1:19] "(Intercept)" "us" "eu" "is_african" ...
  ..$ icoef            : Named num [1:2] 14.72 2.96
  .. ..- attr(*, "names")= chr [1:2] "Intercept" "Log(scale)"
  ..$ var              : num [1:20, 1:20] 4359.6 -59.9 59.4 -144.5 23.9 ...
  ..$ loglik           : num [1:2] -390 -296
  ..$ iter             : int 6
  ..$ linear.predictors: num [1:93] 4.4 8.23 8.45 5.51 17.79 ...
  ..$ df               : int 20
  ..$ scale            : num 6.76
  ..$ idf              : num 2
  ..$ df.residual      : int 73
  ..$ terms            :Classes 'terms', 'formula'  language survival::Surv(ifelse(tc <= 0, 0, tc), tc > 0, type = "left") ~ us + eu * is_african + shstaffl + shquotal +     | __truncated__ ...
  .. .. ..- attr(*, "variables")= language list(survival::Surv(ifelse(tc <= 0, 0, tc), tc > 0, type = "left"), us, eu, is_african, shstaffl, shquotal,      | __truncated__ ...
  .. .. ..- attr(*, "factors")= int [1:18, 1:18] 0 1 0 0 0 0 0 0 0 0 ...
  .. .. .. ..- attr(*, "dimnames")=List of 2
  .. .. .. .. ..$ : chr [1:18] "survival::Surv(ifelse(tc <= 0, 0, tc), tc > 0, type = \"left\")" "us" "eu" "is_african" ...
  .. .. .. .. ..$ : chr [1:18] "us" "eu" "is_african" "shstaffl" ...
  .. .. ..- attr(*, "term.labels")= chr [1:18] "us" "eu" "is_african" "shstaffl" ...
  .. .. ..- attr(*, "specials")=Dotted pair list of 1
  .. .. .. ..$ strata: NULL
  .. .. ..- attr(*, "order")= int [1:18] 1 1 1 1 1 1 1 1 1 1 ...
  .. .. ..- attr(*, "intercept")= int 1
  .. .. ..- attr(*, "response")= int 1
  .. .. ..- attr(*, ".Environment")=<environment: <normalized>> 
  .. .. ..- attr(*, "predvars")= language list(survival::Surv(ifelse(tc <= 0, 0, tc), tc > 0, type = "left"), us, eu, is_african, shstaffl, shquotal,      | __truncated__ ...
  .. .. ..- attr(*, "dataClasses")= Named chr [1:19] "nmatrix.2" "nmatrix.1" "nmatrix.1" "numeric" ...
  .. .. .. ..- attr(*, "names")= chr [1:19] "survival::Surv(ifelse(tc <= 0, 0, tc), tc > 0, type = \"left\")" "us" "eu" "is_african" ...
  ..$ means            : Named num [1:19] 1 0.0687 -0.2108 0.1613 -5.3092 ...
  .. ..- attr(*, "names")= chr [1:19] "(Intercept)" "us" "eu" "is_african" ...
  ..$ call             : language tobit(formula = tc ~ us + eu * is_african + shstaffl + shquotal + lnrgdpnew + lnrgdpnewsq + rgdpchnew +      rgdp| __truncated__ ...
  ..$ dist             : chr "gaussian"
  ..$ y                : 'Surv' num [1:93, 1:2]  10.00    7.50    9.50    7.00   14.33   21.00    6.00   11.00   18.00    0.00- ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:93] "30" "31" "32" "33" ...
  .. .. ..$ : chr [1:2] "time" "status"
  .. ..- attr(*, "type")= chr "left"
  ..$ naive.var        : num [1:20, 1:20] 1691.826 -11.315 0.046 -82.667 6.615 ...
  ..$ na.action        : 'omit' Named int [1:978] 1 2 3 4 5 6 7 8 9 10 ...
  .. ..- attr(*, "names")= chr [1:978] "1" "2" "3" "4" ...
  ..$ formula          :Class 'formula'  language survival::Surv(ifelse(tc <= 0, 0, tc), tc > 0, type = "left") ~ us + eu * is_african + shstaffl + shquotal +     | __truncated__ ...
  .. .. ..- attr(*, ".Environment")=<environment: <normalized>> 
  ..- attr(*, "class")= chr [1:2] "tobit" "survreg"
