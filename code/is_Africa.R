######## INFO ########
# Authors: Dianyi Yang
# R Script
# Purpose: This script runs separate regressions for African and non-African countries.
# Inputs:  data/panel_data_pca.rds
# Outputs: save/regModels_africa.RData
#          save/regTable_africa.RData

# SETUP ----------------------------------------------------------------------------------------------------------------
rm(list = ls()) # Clear workspace

library('tidyverse')
library('AER')
library('fixest')
library("kableExtra")
library('modelsummary')
library("parameters")

data <- read_rds("data/panel_data_pca.rds") # Load data

# Generate African dummy variable ------------------------------------------------------------------------------------------------
data$is_african <- ifelse(data$continent == "Africa", 1, 0)

# Run regression ---------------------------------------------------------------------------------------------------------------------------------------------------------------

## Prepare variables -----------------------------------------------------------------------------------------------------
rhs <- c(
  "us",
  "eu*is_african",
  "shstaffl",
  "shquotal",
  "lnrgdpnew",
  "lnrgdpnewsq",
  "rgdpchnew",
  "rgdpchnewsquare",
  "growth1new",
  "reserv1",
  "oecd1",
  "year1980",
  "year1985",
  "year1990",
  "year1995",
  "year2000"
)
make_formula <- function(outcome) {
  as.formula(paste(outcome, paste(rhs, collapse = " + "), sep = " ~ "))
}

## tobit regression - IMF loan to GDP ratio --------------------------------------------------------------------------------------------------------------------
loan <- tobit(
  make_formula("imfloannew100"),
  data = data,
  left = 0,
  right = Inf,
  cluster = shcode
)

msummary(loan, stars = TRUE)

## Tobit regression - IMF participation rate ----------------------------------------------------------------------------------------------------------------
part <- tobit(
  make_formula("imf_p"),
  data = data,
  left = 0,
  right = 1,
  cluster = shcode
)
msummary(part, stars = TRUE)

## Probit regression - IMF loan approval --------------------------------------------------------------------------------------------------------------------
approval <- feglm(
  make_formula("imf5a"),
  data = data,
  family = binomial(link = "probit"),
  cluster = 'shcode'
)
msummary(approval, stars = TRUE)

# Tobit Total number of IMF conditions ----------------------------------------------------------------------------------------------------------------------
condition <- tobit(
  make_formula("tc"),
  data = data,
  left = 0,
  right = Inf,
  cluster = shcode
)
msummary(condition, stars = TRUE)

# Table generation -------------------------------------------------------------------------------------------------------------------------------------------

## Save the models --------------------------------------------------------------------------------------------------------------------------------------------
regModels <- list(
  'IMF loan to GDP ratio' = loan,
  'IMF participation rate' = part,
  'IMF loan approval' = approval,
  'Number of IMF conditions' = condition
)
save(regModels, file = 'save/regModels_africa.RData')

# load('save/regModels.RData') # Load the models again if needed
msummary(regModels, stars = T) # Rough regression table with all variables and stars

## gof generation -----------------------------------------------------------------------------------------------------------------------------------------

source("helper/f_test.R")

## Variable renaming -------------------------------------------------------------------------------------------------------------------------------------------

coefmap <- c(
  'us' = 'USA Influence',
  'eu' = 'EUP Influence',
  'eu:is_african' = 'EUP Influence $\\times$ \\newline African recipient',
  'is_african' = 'African recipient',
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
  list("raw" = "periodFE", "clean" = "Period FE", "fmt" = NULL),
  list("raw" = "regression", "clean" = "Regression", "fmt" = NULL),
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
      "Standard errors clustered at the country level."
    )
  )
}

getTable() # for previewing the table in IDE

resultsTable <- getTable("latex")

save(resultsTable, file = 'save/regTable_africa.RData') # Save the table
