# R code chunks in manuscript.qmd execute correctly and match snapshots

    Code
      snapshot_data
    Output
      $chunk_name
      [1] "tbl-results"
      
      $code
      [1] "load('save/regTable.RData')\nresultsTable |> tinytable::theme_latex(resize_width = 1, resize_direction = \"down\")"
      
      $latex_output
       [1] "\\begin{table}"                                                                                                                                                                
       [2] "\\centering"                                                                                                                                                                   
       [3] "\\resizebox{\\ifdim\\width>\\linewidth 1\\linewidth\\else\\width\\fi}{!}{"                                                                                                     
       [4] "\\begin{talltblr}[         %% tabularray outer open"                                                                                                                           
       [5] "entry=none,label=none,"                                                                                                                                                        
       [6] "note{}={+ p \\num{< 0.1}, * p \\num{< 0.05}, ** p \\num{< 0.01}, *** p \\num{< 0.001}},"                                                                                       
       [7] "note{ }={Standard errors clustered at the country level. Values in square brackets represent $p$-values from $F$-tests (linear models) and Chi-squared tests (Probit model).},"
       [8] "]                     %% tabularray outer close"                                                                                                                               
       [9] "{                     %% tabularray inner open"                                                                                                                                
      [10] "colspec={Q[]Q[]Q[]Q[]Q[]},"                                                                                                                                                    
      [11] "column{2-5}={}{halign=c,},"                                                                                                                                                    
      [12] "column{1}={}{halign=l,},"                                                                                                                                                      
      [13] "hline{26}={1-5}{solid, black, 0.05em},"                                                                                                                                        
      [14] "}                     %% tabularray inner close"                                                                                                                               
      [15] "\\toprule"                                                                                                                                                                     
      [16] "& IMF loan to GDP ratio & IMF participation rate & IMF loan approval & Number of IMF conditions \\\\ \\midrule %% TinyTableHeader"                                             
      [17] "USA Influence & \\num{0.318} & \\num{0.108}+ & \\num{0.185} & \\num{-5.279}*** \\\\"                                                                                           
      [18] "& (\\num{0.305}) & (\\num{0.064}) & (\\num{0.167}) & (\\num{1.519}) \\\\"                                                                                                      
      [19] "EUP Influence & \\num{1.922}*** & \\num{0.456}*** & \\num{0.971}* & \\num{1.364} \\\\"                                                                                         
      [20] "& (\\num{0.562}) & (\\num{0.126}) & (\\num{0.473}) & (\\num{6.019}) \\\\"                                                                                                      
      [21] "IMF Staff & \\num{0.325}* & \\num{0.068}* & \\num{0.116} & \\num{-1.630} \\\\"                                                                                                 
      [22] "& (\\num{0.148}) & (\\num{0.034}) & (\\num{0.090}) & (\\num{1.027}) \\\\"                                                                                                      
      [23] "IMF Quota & \\num{0.972}** & \\num{0.103} & \\num{0.218} & \\num{-11.522}*** \\\\"                                                                                             
      [24] "& (\\num{0.339}) & (\\num{0.080}) & (\\num{0.188}) & (\\num{3.488}) \\\\"                                                                                                      
      [25] "GDP & \\num{0.273} & \\num{0.380}* & \\num{0.906}** & \\num{33.598}*** \\\\"                                                                                                   
      [26] "& (\\num{0.643}) & (\\num{0.153}) & (\\num{0.322}) & (\\num{9.677}) \\\\"                                                                                                      
      [27] "GDP$^2$ & \\num{-0.047} & \\num{-0.022}** & \\num{-0.052}** & \\num{-1.128}** \\\\"                                                                                            
      [28] "& (\\num{0.038}) & (\\num{0.009}) & (\\num{0.018}) & (\\num{0.438}) \\\\"                                                                                                      
      [29] "GDPpc & \\num{0.701}*** & \\num{0.158}*** & \\num{0.385}*** & \\num{-1.366} \\\\"                                                                                              
      [30] "& (\\num{0.190}) & (\\num{0.045}) & (\\num{0.117}) & (\\num{1.562}) \\\\"                                                                                                      
      [31] "GDPpc$^2$ & \\num{-0.079}*** & \\num{-0.019}*** & \\num{-0.047}*** & \\num{0.163} \\\\"                                                                                        
      [32] "& (\\num{0.022}) & (\\num{0.005}) & (\\num{0.011}) & (\\num{0.174}) \\\\"                                                                                                      
      [33] "GDPpc growth & \\num{-0.128}** & \\num{-0.029}** & \\num{-0.049}* & \\num{-1.078}** \\\\"                                                                                      
      [34] "& (\\num{0.041}) & (\\num{0.009}) & (\\num{0.023}) & (\\num{0.337}) \\\\"                                                                                                      
      [35] "Reserves & \\num{-0.172}** & \\num{-0.034}** & \\num{-0.088}** & \\num{-0.207} \\\\"                                                                                           
      [36] "& (\\num{0.059}) & (\\num{0.013}) & (\\num{0.034}) & (\\num{0.350}) \\\\"                                                                                                      
      [37] "OECD & \\num{-1.750}+ & \\num{-0.575}* & \\num{-1.402}* & \\num{7.848}+ \\\\"                                                                                                  
      [38] "& (\\num{1.049}) & (\\num{0.223}) & (\\num{0.625}) & (\\num{4.144}) \\\\"                                                                                                      
      [39] "(Intercept) & \\num{9.593}* & \\num{-0.582} & \\num{-2.286} & \\num{-231.165}*** \\\\"                                                                                         
      [40] "& (\\num{4.399}) & (\\num{1.021}) & (\\num{2.333}) & (\\num{66.201}) \\\\"                                                                                                     
      [41] "USA=EUP & [0.021*] & [0.014*] & [0.122] & [0.301] \\\\"                                                                                                                        
      [42] "Period FE & Yes & Yes & Yes & Yes \\\\"                                                                                                                                        
      [43] "Regression & Tobit & Tobit & Probit & Tobit \\\\"                                                                                                                              
      [44] "$N$ & \\num{517} & \\num{522} & \\num{522} & \\num{93} \\\\"                                                                                                                   
      [45] "\\bottomrule"                                                                                                                                                                  
      [46] "\\end{talltblr}"                                                                                                                                                               
      [47] "}"                                                                                                                                                                             
      [48] "\\end{table} "                                                                                                                                                                 
      

