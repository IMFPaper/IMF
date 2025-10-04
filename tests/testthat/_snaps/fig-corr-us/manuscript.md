# R code chunks in manuscript.qmd execute correctly and match snapshots

    Code
      snapshot_data
    Output
      $chunk_name
      [1] "fig-corr-us"
      
      $code
      [1] "corrplot::corrplot(corr_US, method = 'color', addCoef.col = 'darkgrey', tl.col = \"black\")"
      
      $output
      character(0)
      
      $result
      $result$class
      [1] "list"
      
      $result$summary
       [1] "List of 3"                                                            
       [2] " $ corr   : num [1:3, 1:3] 1 0.096 0.162 0.096 1 ..."                 
       [3] "  ..- attr(*, \"dimnames\")=List of 2"                                
       [4] " $ corrPos:'data.frame':\t9 obs. of  5 variables:"                    
       [5] "  ..$ xName: chr [1:9] \"Voting\" \"Voting\" \"Voting\" \"Trade\" ..."
       [6] "  ..$ yName: chr [1:9] \"Voting\" \"Trade\" \"Bank\" \"Voting\" ..."  
       [7] "  ..$ x    : num [1:9] 1 1 1 2 2 2 3 3 3"                             
       [8] "  ..$ y    : num [1:9] 3 2 1 3 2 1 3 2 1"                             
       [9] "  ..$ corr : num [1:9] 1 0.096 0.162 0.096 1 ..."                     
      [10] " $ arg    :List of 1"                                                 
      [11] "  ..$ type: chr \"full\""                                             
      
      

