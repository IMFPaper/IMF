# Snapshot: prcomp

## print
Standard deviations (1, .., p=3):
[1] 1.2165526 0.9463413 0.7902138

Rotation (n x k) = (3 x 3):
                 PC1        PC2         PC3
frusanew   0.4234389  0.9052079 -0.03602981
ustradenew 0.6366785 -0.3256480 -0.69899492
usq4       0.6444688 -0.2730423  0.71421842

## str
List of 5
 $ sdev    : num [1:3] 1.217 0.946 0.79
 $ rotation: num [1:3, 1:3] 0.423 0.637 0.644 0.905 -0.326 ...
  ..- attr(*, "dimnames")=List of 2
  .. ..$ : chr [1:3] "frusanew" "ustradenew" "usq4"
  .. ..$ : chr [1:3] "PC1" "PC2" "PC3"
 $ center  : Named num [1:3] -0.284 0.947 0.19
  ..- attr(*, "names")= chr [1:3] "frusanew" "ustradenew" "usq4"
 $ scale   : Named num [1:3] 0.286 3.652 0.604
  ..- attr(*, "names")= chr [1:3] "frusanew" "ustradenew" "usq4"
 $ x       : num [1:763, 1:3] -0.514 -0.848 -0.768 -0.601 -0.664 ...
  ..- attr(*, "dimnames")=List of 2
  .. ..$ : NULL
  .. ..$ : chr [1:3] "PC1" "PC2" "PC3"
 - attr(*, "class")= chr "prcomp"
