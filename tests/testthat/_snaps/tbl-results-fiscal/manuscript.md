# R code chunks in manuscript.qmd execute correctly and match snapshots

    Code
      snapshot_data
    Output
      $chunk_name
      [1] "tbl-results-fiscal"
      
      $code
      [1] "load('save/regTable_fiscal.RData')\nresultsTable |> tinytable::theme_latex(resize_width = 1, resize_direction = \"down\")"
      
      $latex_output
       [1] "\\begin{table}"                                                                                                           
       [2] "\\centering"                                                                                                              
       [3] "\\resizebox{\\ifdim\\width>\\linewidth 1\\linewidth\\else\\width\\fi}{!}{"                                                
       [4] "\\begin{talltblr}[         %% tabularray outer open"                                                                      
       [5] "entry=none,label=none,"                                                                                                   
       [6] "note{}={+ p \\num{< 0.1}, * p \\num{< 0.05}, ** p \\num{< 0.01}, *** p \\num{< 0.001}},"                                  
       [7] "note{ }={Standard errors clustered at the country level. Values in square brackets represent $p$-values from $F$-tests.},"
       [8] "]                     %% tabularray outer close"                                                                          
       [9] "{                     %% tabularray inner open"                                                                           
      [10] "colspec={Q[]Q[]Q[]Q[]Q[]},"                                                                                               
      [11] "hline{2}={1-5}{solid, black, 0.05em},"                                                                                    
      [12] "hline{26}={1-5}{solid, black, 0.05em},"                                                                                   
      [13] "hline{1}={1-5}{solid, black, 0.1em},"                                                                                     
      [14] "hline{30}={1-5}{solid, black, 0.1em},"                                                                                    
      [15] "column{2-5}={}{halign=c},"                                                                                                
      [16] "column{1}={}{halign=l},"                                                                                                  
      [17] "}                     %% tabularray inner close"                                                                          
      [18] "& Number of IMF conditions & Number of Fiscal conditions & RFA ($T$+1) & RFA (end year) \\\\"                             
      [19] "USA Influence & \\num{-5.279}*** & \\num{-14.667}+ & \\num{8.595}* & \\num{2.497} \\\\"                                   
      [20] "& (\\num{1.519}) & (\\num{8.480}) & (\\num{3.967}) & (\\num{5.400}) \\\\"                                                 
      [21] "EUP Influence & \\num{1.364} & \\num{18.520}* & \\num{-5.282}+ & \\num{0.360} \\\\"                                       
      [22] "& (\\num{6.019}) & (\\num{8.082}) & (\\num{3.015}) & (\\num{5.198}) \\\\"                                                 
      [23] "IMF Staff & \\num{-1.630} & \\num{-0.264} & \\num{-0.416} & \\num{-0.590} \\\\"                                           
      [24] "& (\\num{1.027}) & (\\num{1.456}) & (\\num{0.847}) & (\\num{1.469}) \\\\"                                                 
      [25] "IMF Quota & \\num{-11.522}*** & \\num{-2.486}* & \\num{0.487} & \\num{-0.228} \\\\"                                       
      [26] "& (\\num{3.488}) & (\\num{1.200}) & (\\num{0.920}) & (\\num{1.005}) \\\\"                                                 
      [27] "GDP & \\num{33.598}*** & \\num{-0.755} & \\num{13.913}* & \\num{7.235} \\\\"                                              
      [28] "& (\\num{9.677}) & (\\num{8.536}) & (\\num{6.253}) & (\\num{7.686}) \\\\"                                                 
      [29] "GDP$^2$ & \\num{-1.128}** & \\num{0.239} & \\num{-0.724}* & \\num{-0.309} \\\\"                                           
      [30] "& (\\num{0.438}) & (\\num{0.498}) & (\\num{0.321}) & (\\num{0.428}) \\\\"                                                 
      [31] "GDPpc & \\num{-1.366} & \\num{-4.727}*** & \\num{-2.499} & \\num{-2.582} \\\\"                                            
      [32] "& (\\num{1.562}) & (\\num{1.162}) & (\\num{1.456}) & (\\num{1.915}) \\\\"                                                 
      [33] "GDPpc$^2$ & \\num{0.163} & \\num{0.618}*** & \\num{0.229} & \\num{0.238} \\\\"                                            
      [34] "& (\\num{0.174}) & (\\num{0.154}) & (\\num{0.157}) & (\\num{0.207}) \\\\"                                                 
      [35] "GDPpc growth & \\num{-1.078}** & \\num{-0.335} & \\num{0.064} & \\num{0.244} \\\\"                                        
      [36] "& (\\num{0.337}) & (\\num{0.487}) & (\\num{0.211}) & (\\num{0.353}) \\\\"                                                 
      [37] "Reserves & \\num{-0.207} & \\num{-0.953}* & \\num{0.312} & \\num{0.298} \\\\"                                             
      [38] "& (\\num{0.350}) & (\\num{0.449}) & (\\num{0.274}) & (\\num{0.413}) \\\\"                                                 
      [39] "OECD & \\num{7.848}+ & \\num{-11.369} & \\num{10.664}** & \\num{8.253} \\\\"                                              
      [40] "& (\\num{4.144}) & (\\num{7.245}) & (\\num{2.783}) & (\\num{5.553}) \\\\"                                                 
      [41] "(Intercept) & \\num{-231.165}*** & \\num{-21.602} & \\num{-57.942}+ & \\num{-41.211} \\\\"                                
      [42] "& (\\num{66.201}) & (\\num{28.907}) & (\\num{28.247}) & (\\num{27.271}) \\\\"                                             
      [43] "USA=EUP & [0.301] & [0.053+] & [0.035*] & [0.83] \\\\"                                                                    
      [44] "Period FE & Yes & Yes & Yes & Yes \\\\"                                                                                   
      [45] "Regression & Tobit & Tobit & OLS & OLS \\\\"                                                                              
      [46] "$N$ & \\num{93} & \\num{31} & \\num{30} & \\num{30} \\\\"                                                                 
      [47] "\\end{talltblr}"                                                                                                          
      [48] "}"                                                                                                                        
      [49] "\\end{table} "                                                                                                            
      

