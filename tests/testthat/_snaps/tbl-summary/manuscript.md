# R code chunks in manuscript.qmd execute correctly and match snapshots

    Code
      snapshot_data
    Output
      $chunk_name
      [1] "tbl-summary"
      
      $code
      [1] "library(modelsummary)\ndsummary(\n  (`IMF loan to GDP ratio (%)` = imfloannew100) +\n    (`IMF participation rate` = imf_p) +\n    (`IMF loan approval` = imf5a) +\n    (`Number of IMF conditions` = tc) +\n    (`USA Influence` = us) +\n    (`EUP Influence` = eu) +\n    (`IMF Staff (log)` = shstaffl) +\n    (`IMF Quota (log)` = `shquotal`) +\n    (`GDP (log)` = lnrgdpnew) +\n    (`GDPpc (thousands USD)` = rgdpchnew) +\n    (`GDPpc growth (%)` = growth1new) +\n    (`Reserves (months of imports)` = reserv1) +\n    (OECD = oecd1) ~ \n    Mean + SD + Min + (Q1 = P25) + Median + (Q3 = P75) + Max + N,\n  output = \"latex\",\n  data = dta\n) |> tinytable::theme_latex(resize_width = 1, resize_direction = \"down\")"
      
      $latex_output
       [1] "\\begin{table}"                                                                                                                             
       [2] "\\centering"                                                                                                                                
       [3] "\\resizebox{\\ifdim\\width>\\linewidth 1\\linewidth\\else\\width\\fi}{!}{"                                                                  
       [4] "\\begin{tblr}[         %% tabularray outer open"                                                                                            
       [5] "]                     %% tabularray outer close"                                                                                            
       [6] "{                     %% tabularray inner open"                                                                                             
       [7] "colspec={Q[]Q[]Q[]Q[]Q[]Q[]Q[]Q[]Q[]},"                                                                                                     
       [8] "column{1}={}{halign=l,},"                                                                                                                   
       [9] "column{2-9}={}{halign=r,},"                                                                                                                 
      [10] "}                     %% tabularray inner close"                                                                                            
      [11] "\\toprule"                                                                                                                                  
      [12] "& Mean & SD & Min & Q1 & Median & Q3 & Max & N \\\\ \\midrule %% TinyTableHeader"                                                           
      [13] "IMF loan to GDP ratio (\\%) & \\num{0.33} & \\num{1.08} & \\num{0.00} & \\num{0.00} & \\num{0.00} & \\num{0.16} & \\num{12.57} & 995 \\\\"  
      [14] "IMF participation rate & \\num{0.14} & \\num{0.26} & \\num{0.00} & \\num{0.00} & \\num{0.00} & \\num{0.20} & \\num{1.00} & 1049 \\\\"       
      [15] "IMF loan approval & \\num{0.28} & \\num{0.45} & \\num{0.00} & \\num{0.00} & \\num{0.00} & \\num{1.00} & \\num{1.00} & 1050 \\\\"            
      [16] "Number of IMF conditions & \\num{21.95} & \\num{25.89} & \\num{0.00} & \\num{6.00} & \\num{13.00} & \\num{29.00} & \\num{179.00} & 137 \\\\"
      [17] "USA Influence & \\num{0.00} & \\num{1.00} & \\num{-1.17} & \\num{-0.50} & \\num{-0.27} & \\num{0.12} & \\num{8.22} & 763 \\\\"              
      [18] "EUP Influence & \\num{0.00} & \\num{1.00} & \\num{-0.84} & \\num{-0.47} & \\num{-0.29} & \\num{0.10} & \\num{11.20} & 649 \\\\"             
      [19] "IMF Staff (log) & \\num{-5.75} & \\num{1.20} & \\num{-7.01} & \\num{-7.01} & \\num{-5.85} & \\num{-4.97} & \\num{-1.41} & 989 \\\\"         
      [20] "IMF Quota (log) & \\num{-6.03} & \\num{1.34} & \\num{-8.52} & \\num{-7.03} & \\num{-6.37} & \\num{-5.20} & \\num{-1.57} & 992 \\\\"         
      [21] "GDP (log) & \\num{9.40} & \\num{2.39} & \\num{4.63} & \\num{7.60} & \\num{9.10} & \\num{11.26} & \\num{16.21} & 954 \\\\"                   
      [22] "GDPpc (thousands USD) & \\num{5.76} & \\num{8.59} & \\num{0.00} & \\num{0.43} & \\num{1.68} & \\num{6.87} & \\num{51.98} & 981 \\\\"        
      [23] "GDPpc growth (\\%) & \\num{1.99} & \\num{3.67} & \\num{-28.98} & \\num{0.16} & \\num{1.95} & \\num{3.81} & \\num{24.43} & 949 \\\\"         
      [24] "Reserves (months of imports) & \\num{3.49} & \\num{3.03} & \\num{0.02} & \\num{1.51} & \\num{2.73} & \\num{4.50} & \\num{24.86} & 934 \\\\" 
      [25] "OECD & \\num{0.16} & \\num{0.37} & \\num{0.00} & \\num{0.00} & \\num{0.00} & \\num{0.00} & \\num{1.00} & 1071 \\\\"                         
      [26] "\\bottomrule"                                                                                                                               
      [27] "\\end{tblr}"                                                                                                                                
      [28] "}"                                                                                                                                          
      [29] "\\end{table} "                                                                                                                              
      

