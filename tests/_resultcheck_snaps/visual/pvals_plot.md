# Snapshot: tbl_df

## print
# A tibble: 4 × 5
  outcome                  p_value  y_pos stars     label              
  <chr>                      <dbl>  <dbl> <chr>     <chr>              
1 IMF loan approval         0.122   2.06  ""        "p == 0.122"       
2 IMF loan to GDP ratio     0.0214  3.29  "~\"**\"" "p == 0.021~\"**\""
3 IMF participation rate    0.0144  0.761 "~\"**\"" "p == 0.014~\"**\""
4 Number of IMF conditions  0.301  15.0   ""        "p == 0.301"       

## str
tibble [4 × 5] (S3: tbl_df/tbl/data.frame)
 $ outcome: chr [1:4] "IMF loan approval" "IMF loan to GDP ratio" "IMF participation rate" "Number of IMF conditions"
 $ p_value: num [1:4] 0.1217 0.0214 0.0144 0.3009
 $ y_pos  : num [1:4] 2.061 3.288 0.761 15.049
 $ stars  : chr [1:4] "" "~\"**\"" "~\"**\"" ""
 $ label  : chr [1:4] "p == 0.122" "p == 0.021~\"**\"" "p == 0.014~\"**\"" "p == 0.301"
