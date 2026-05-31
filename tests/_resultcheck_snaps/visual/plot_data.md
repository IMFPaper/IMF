# Snapshot: data.frame

## print
                   outcome term   estimate  std.error conf.level     conf.low  conf.high  statistic df.error
1    IMF loan to GDP ratio  USA  0.3175866 0.30524704       0.95  -0.28068657  0.9158598  1.0404249      Inf
2    IMF loan to GDP ratio  EUP  1.9216969 0.56218398       0.95   0.81983655  3.0235573  3.4182705      Inf
3   IMF participation rate  USA  0.1080110 0.06413423       0.95  -0.01768983  0.2337117  1.6841389      Inf
4   IMF participation rate  EUP  0.4561377 0.12592724       0.95   0.20932482  0.7029505  3.6222320      Inf
5        IMF loan approval  USA  0.1854526 0.16672363       0.95  -0.14131975  0.5122249  1.1123352      Inf
6        IMF loan approval  EUP  0.9709969 0.47271945       0.95   0.04448376  1.8975100  2.0540658      Inf
7 Number of IMF conditions  USA -5.2790101 1.51927238       0.95  -8.25672930 -2.3012910 -3.4746963      Inf
8 Number of IMF conditions  EUP  1.3636619 6.01915469       0.95 -10.43366453 13.1609883  0.2265537      Inf
       p.value s.value group    p_value
1 0.2981425204     1.7       0.02137937
2 0.0006302045    10.6       0.02137937
3 0.0921548271     3.4       0.01438721
4 0.0002920720    11.7       0.01438721
5 0.2659940656     1.9       0.12171913
6 0.0399693224     4.6       0.12171913
7 0.0005114320    10.9       0.30087450
8 0.8207707834     0.3       0.30087450

## str
'data.frame':	8 obs. of  13 variables:
 $ outcome   : chr  "IMF loan to GDP ratio" "IMF loan to GDP ratio" "IMF participation rate" "IMF participation rate" ...
 $ term      : chr  "USA" "EUP" "USA" "EUP" ...
 $ estimate  : num  0.318 1.922 0.108 0.456 0.185 ...
 $ std.error : num  0.3052 0.5622 0.0641 0.1259 0.1667 ...
 $ conf.level: num  0.95 0.95 0.95 0.95 0.95 0.95 0.95 0.95
 $ conf.low  : num  -0.2807 0.8198 -0.0177 0.2093 -0.1413 ...
 $ conf.high : num  0.916 3.024 0.234 0.703 0.512 ...
 $ statistic : num  1.04 3.42 1.68 3.62 1.11 ...
 $ df.error  : num  Inf Inf Inf Inf Inf ...
 $ p.value   : num  0.298143 0.00063 0.092155 0.000292 0.265994 ...
 $ s.value   : chr  "1.7" "10.6" "3.4" "11.7" ...
 $ group     : chr  "" "" "" "" ...
 $ p_value   : Named num  0.0214 0.0214 0.0144 0.0144 0.1217 ...
  ..- attr(*, "names")= chr [1:8] "IMF loan to GDP ratio" "IMF loan to GDP ratio" "IMF participation rate" "IMF participation rate" ...
 - attr(*, "sigma")= num(0) 
 - attr(*, "residual_df")= num 499
 - attr(*, "pretty_names")= Named chr [1:17] "(Intercept)" "us" "eu" "shstaffl" ...
  ..- attr(*, "names")= chr [1:17] "(Intercept)" "us" "eu" "shstaffl" ...
 - attr(*, "ci")= num 0.95
 - attr(*, "ci_method")= chr "Wald"
 - attr(*, "df_method")= chr "Wald"
 - attr(*, "verbose")= logi FALSE
 - attr(*, "exponentiate")= logi FALSE
 - attr(*, "ordinal_model")= logi FALSE
 - attr(*, "linear_model")= logi TRUE
 - attr(*, "mixed_model")= logi FALSE
 - attr(*, "n_obs")= int 517
 - attr(*, "model_class")= chr [1:2] "tobit" "survreg"
 - attr(*, "bootstrap")= logi FALSE
 - attr(*, "iterations")= num 1000
 - attr(*, "robust_vcov")= logi FALSE
 - attr(*, "ignore_group")= logi TRUE
 - attr(*, "ran_pars")= logi TRUE
 - attr(*, "show_summary")= logi FALSE
 - attr(*, "log_link")= logi FALSE
 - attr(*, "logit_link")= logi FALSE
 - attr(*, "model_call")= language tobit(formula = imfloannew100 ~ us + eu + shstaffl + shquotal + lnrgdpnew + lnrgdpnewsq + rgdpchnew +      rgdpch| __truncated__ ...
 - attr(*, "test_statistic")= chr "z-statistic"
 - attr(*, "log_response")= logi FALSE
 - attr(*, "log_predictors")= logi FALSE
 - attr(*, "weighted_nobs")= num 517
 - attr(*, "model_formula")= chr "imfloannew100 ~ us + eu + shstaffl + shquotal + lnrgdpnew + lnrgdpnewsq + rgdpchnew + rgdpchnewsquare + growth1"| __truncated__
 - attr(*, "coefficient_name")= chr "Coefficient"
 - attr(*, "zi_coefficient_name")= chr "Log-Odds"
 - attr(*, "digits")= num 2
 - attr(*, "p_digits")= num 3
 - attr(*, "footer_digits")= num 3
 - attr(*, "pretty_labels")= Named chr [1:17] "(Intercept)" "us" "eu" "lagged  nationals employed as IMF economists" ...
  ..- attr(*, "names")= chr [1:17] "(Intercept)" "us" "eu" "shstaffl" ...
 - attr(*, "backend")= chr "parameters"
