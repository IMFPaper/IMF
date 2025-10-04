# R code chunks in manuscript.qmd execute correctly and match snapshots

    Code
      snapshot_data
    Output
      $chunk_name
      [1] "percentage_variance"
      
      $code
      [1] "load('save/PCA.RData')\nUS_PC1_percentage <- US$sdev[1]^2 / sum(US$sdev^2) * 100\nEU_PC1_percentage <- EU$sdev[1]^2 / sum(EU$sdev^2) * 100"
      
      $output
      character(0)
      
      $result
      $result$class
      [1] "numeric"
      
      $result$summary
      [1] " num 62.1"
      
      

