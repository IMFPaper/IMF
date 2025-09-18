get_stars <- function(p){
  if (p < 0.001) {
    return('***')
  } else if (p < 0.01) {
    return('**')
  } else if (p < 0.05) {
    return('*')
  } else if (p < 0.1) {
    return('+')
  } else {
    return('')
  }
}

glance_custom.tobit <- function(x, ...) {
  p <- lht(x, test = 'F', 'us=eu')[2, 4]
  data.frame(
    'equality' = paste0(
      '[',
      round(p, 3),
      get_stars(p),
      ']'
    ),
    'periodFE' = if_else("year2000" %in% names(x$coefficients), "Yes",  ""),
    'regression' = 'Tobit'
  )
}

glance_custom.fixest <- function(x, ...) {
  p <- lht(x, test = 'Chisq', 'us=eu')[2, 4]
  data.frame(
    'equality' = paste0(
      '[',
      round(p, 3),
      get_stars(p),
      ']'
    ),
    'periodFE' = if_else("year2000" %in% names(x$coefficients), "Yes",  ""),
    'regression' = 'OLS'
  )
}