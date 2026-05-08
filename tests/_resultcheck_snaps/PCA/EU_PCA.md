# Snapshot: prcomp

## print
Standard deviations (1, .., p=3):
[1] 1.3651725 0.9079569 0.5584964

Rotation (n x k) = (3 x 3):
                  PC1        PC2        PC3
frdfgnew    0.4215260 -0.8970212 -0.1329241
eutradenew  0.6558648  0.2003534  0.7278049
avgukfrgmq4 0.6262246  0.3939689 -0.6727788

## str
List of 5
 $ sdev    : num [1:3] 1.365 0.908 0.558
 $ rotation: num [1:3, 1:3] 0.422 0.656 0.626 -0.897 0.2 ...
  ..- attr(*, "dimnames")=List of 2
  .. ..$ : chr [1:3] "frdfgnew" "eutradenew" "avgukfrgmq4"
  .. ..$ : chr [1:3] "PC1" "PC2" "PC3"
 $ center  : Named num [1:3] 0.276 0.488 0.329
  ..- attr(*, "names")= chr [1:3] "frdfgnew" "eutradenew" "avgukfrgmq4"
 $ scale   : Named num [1:3] 0.271 1.352 1.54
  ..- attr(*, "names")= chr [1:3] "frdfgnew" "eutradenew" "avgukfrgmq4"
 $ x       : num [1:649, 1:3] -1.068 -0.971 -0.667 -0.429 -1.059 ...
  ..- attr(*, "dimnames")=List of 2
  .. ..$ : NULL
  .. ..$ : chr [1:3] "PC1" "PC2" "PC3"
 - attr(*, "class")= chr "prcomp"
