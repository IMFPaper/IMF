######## INFO ########
# Authors: Dianyi Yang
# R Script
# Purpose: This script runs PCA and regression analysis for the demo.
# Inputs:  data/panel_data.dta
# Outputs: save/regModels.RData
#          save/regTable.RData

# SETUP ----------------------------------------------------------------------------------------------------------------
rm(list = ls()) # Clear workspace

need <- c(
  'tidyverse',
  'haven',
  'AER',
  'fixest',
  "kableExtra",
  'modelsummary',
  'corrplot',
  "ggfortify",
  "parameters"
) # list packages needed
have <- need %in% rownames(installed.packages()) # checks packages you have
if (any(!have)) install.packages(need[!have]) # install missing packages
invisible(lapply(need, library, character.only = T))

data <- read_dta("data/panel_data.dta") # Load data

# Replicate Lipscy & Lee's (2018) original PCA analysis in R ------------------------------------------------------------------------------------------------------------------
PCA <- data |>
  select(
    shstaffl,
    shquotal,
    frusanew,
    frdfgnew,
    ustradenew,
    eutradenew,
    usq4,
    avgukfrgmq4
  ) |>
  na.omit() |>
  prcomp(scale = T)
summary(PCA) # show primary components

plot(PCA, type = "l") # Scree plot - "elbow" shape indicates good representation by the first component
autoplot(PCA, loadings = TRUE, loadings.label = TRUE) # shows components of the first two components

# Break down PCA into IMF, US, and EU components ------------------------------------------------------------------------------------------------------------------------------
IMF <- data |>
  select(shstaffl, shquotal) |>
  na.omit() |>
  prcomp(scale = T)
summary(IMF)
plot(IMF, type = "l")

US <- data |>
  select(frusanew, ustradenew, usq4) |>
  na.omit() |>
  prcomp(scale = T)
summary(US)
plot(US, type = "l")

EU <- data |>
  select(frdfgnew, eutradenew, avgukfrgmq4) |>
  na.omit() |>
  prcomp(scale = T)
summary(EU)
plot(EU, type = "l")

## Create primary component variables for regression ---------------------------------------------------------------------------------------------------------------------------
data$imf <- -predict(IMF, data)[, 1] |> scale()
data$us <- predict(US, data)[, 1] |> scale()
data$eu <- predict(EU, data)[, 1] |> scale()
data$pca <- -predict(PCA, data)[, 1]

## draw a kernel density plot for US and EU PC1 components  -----------------------------------------------------------------------------------------------------------------------------------
data |> 
  select(us, eu) |>
  na.omit() |>
  pivot_longer(cols = everything(), names_to = 'region', values_to = 'value') |>
  ggplot(aes(x = value, fill = region)) +
  geom_density(alpha = 0.5) +
  labs(title = "Kernel Density Plot of US and EU variables",
       x = "PC1",
       y = "Density") +
  theme_minimal()

## plot correlation between our variables with the original one. ---------------------------------------------------------------------------------------------------------------
corr <- data |>
  select('imf', 'us', 'eu', 'pca') |>
  cor(use = 'pairwise.complete.obs')

corrplot(corr, method = 'color')

# Run regression ---------------------------------------------------------------------------------------------------------------------------------------------------------------

## tobit regression - IMF loan to GDP ratio
loan <- tobit(
  imfloannew100 ~
    us +
      eu +
      shstaffl +
      shquotal +
      lnrgdpnew +
      lnrgdpnewsq +
      rgdpchnew +
      rgdpchnewsquare +
      growth1new +
      reserv1 +
      oecd1 +
      year1980 +
      year1985 +
      year1990 +
      year1995 +
      year2000,
  data = data,
  left = 0,
  right = Inf,
  cluster = shcode
)
summary(loan)

## Tobit regression - IMF participation rate ----------------------------------------------------------------------------------------------------------------
part <- tobit(
  imf_p ~
    us +
      eu +
      shstaffl +
      shquotal +
      lnrgdpnew +
      lnrgdpnewsq +
      rgdpchnew +
      rgdpchnewsquare +
      growth1new +
      reserv1 +
      oecd1 +
      year1980 +
      year1985 +
      year1990 +
      year1995 +
      year2000,
  data = data,
  left = 0,
  right = 1,
  cluster = shcode
)
summary(part)

## Probit regression - IMF loan approval --------------------------------------------------------------------------------------------------------------------
approval <- feglm(
  imf5a ~
    us +
      eu +
      shstaffl +
      shquotal +
      lnrgdpnew +
      lnrgdpnewsq +
      rgdpchnew +
      rgdpchnewsquare +
      growth1new +
      reserv1 +
      oecd1 +
      year1980 +
      year1985 +
      year1990 +
      year1995 +
      year2000,
  data = data,
  family = binomial(link = "probit"),
  cluster = 'shcode'
)
summary(approval)

# Tobit Total number of IMF conditions ----------------------------------------------------------------------------------------------------------------------
condition <- tobit(
  tc ~
    us +
      eu +
      shstaffl +
      shquotal +
      lnrgdpnew +
      lnrgdpnewsq +
      rgdpchnew +
      rgdpchnewsquare +
      growth1new +
      reserv1 +
      oecd1 +
      year1980 +
      year1985 +
      year1990 +
      year1995 +
      year2000,
  data = data,
  left = 0,
  right = Inf,
  cluster = shcode
)
summary(condition)

# Table generation -------------------------------------------------------------------------------------------------------------------------------------------

## Save the models --------------------------------------------------------------------------------------------------------------------------------------------
regModels <- list(
  'Tobit: IMF loan to GDP ratio' = loan,
  'Tobit: IMF participation rate' = part,
  'Probit: IMF loan approval' = approval,
  'Tobit: number of IMF conditions' = condition
)
save(regModels, data, file = 'save/regModels.RData')

# load('save/regModels.RData') # Load the models again if needed
msummary(regModels, stars = T) # Rough regression table with all variables and stars

## F-tests generation -----------------------------------------------------------------------------------------------------------------------------------------

regModels$`Probit: IMF loan approval`$df.residual <- degrees_of_freedom(
  regModels$`Probit: IMF loan approval`
)

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
    )
  )
}

glance_custom.fixest <- function(x, ...) {
  p <- lht(x, test = 'F', 'us=eu')[2, 4]
  data.frame(
    'equality' = paste0(
      '[',
      round(p, 3),
      get_stars(p),
      ']'
    )
  )
}

## Variable renaming -------------------------------------------------------------------------------------------------------------------------------------------

coefmap <- c(
  'us' = 'USA Influence',
  'eu' = 'EUP Influence',
  'shstaffl' = 'IMF Staff',
  'shquotal' = 'IMF Quota',
  'lnrgdpnew' = 'GDP',
  'lnrgdpnewsq' = 'GDP$^2$',
  'rgdpchnew' = 'GDPpc',
  'rgdpchnewsquare' = "GDPpc$^2$",
  'growth1new' = 'GDPpc growth',
  'reserv1' = 'Reserves',
  'oecd1' = 'OECD',
  '(Intercept)' = '(Intercept)'
)
gof_map <- list(
  list("raw" = "equality", "clean" = "USA=EUP", "fmt" = NULL),
  list("raw" = "nobs", "clean" = "$N$", "fmt" = 0)
  # list('raw' = 'vcov.type', 'clean' = 'Std.Errors', 'fmt' = NULL)
)

getTable <- function(output = "html") {
  msummary(
    regModels,
    coef_map = coefmap,
    gof_map = gof_map,
    stars = T,
    escape = F,
    output = output,
    notes = c(
      "Standard errors clustered at the country level. Values in square brackets represent $p$-values from $F$-tests."
    )
  )
}

getTable() # for previewing the table in IDE

resultsTable <- getTable("latex")

save(resultsTable, file = 'save/regTable.RData') # Save the table

# Auxiliary F-tests -------------------------------------------------------------------------------------------------------------------------------------------
# You don't have to run this to replicate the demo.

## Tobit regression - IMF loan to GDP ratio -------------------------------------------------------------------------------------------------------------------
loan_f <- tobit(
  imfloannew100 ~
    shstaffl +
      shquotal +
      frusanew +
      frdfgnew +
      ustradenew +
      eutradenew +
      usq4 +
      avgukfrgmq4 +
      lnrgdpnew +
      lnrgdpnewsq +
      rgdpchnew +
      rgdpchnewsquare +
      growth1new +
      reserv1 +
      oecd1 +
      year1980 +
      year1985 +
      year1990 +
      year1995 +
      year2000,
  data = data,
  left = 0,
  right = Inf,
  cluster = shcode
)

### significance of US ----
matrix = c('frusanew = 0', 'ustradenew = 0', 'usq4 = 0')
lht(loan_f, test = 'F', matrix)
### significance of EU ----
matrix = c('frdfgnew = 0', 'eutradenew = 0', 'avgukfrgmq4 = 0')
lht(loan_f, test = 'F', matrix)

## Tobit Total number of IMF conditions -----------------------------------------------------------------------------------------------------------------------
condition_f <- tobit(
  tc ~
    shstaffl +
      shquotal +
      frusanew +
      frdfgnew +
      ustradenew +
      eutradenew +
      usq4 +
      avgukfrgmq4 +
      lnrgdpnew +
      lnrgdpnewsq +
      rgdpchnew +
      rgdpchnewsquare +
      growth1new +
      reserv1 +
      oecd1 +
      year1980 +
      year1985 +
      year1990 +
      year1995 +
      year2000,
  data = data,
  left = 0,
  right = Inf,
  cluster = shcode
)
### significance of US ----
matrix = c('frusanew = 0', 'ustradenew = 0', 'usq4 = 0')
lht(condition_f, test = 'F', matrix)
### significance of EU ----
matrix = c('frdfgnew = 0', 'eutradenew = 0', 'avgukfrgmq4 = 0')
lht(condition_f, test = 'F', matrix)
