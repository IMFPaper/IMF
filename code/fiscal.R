######## INFO ########
# Authors: Dianyi Yang
# R Script
# Purpose: This script runs the robustness check with required fiscal adjustments (RFA) as the dependent variable for conditionality.
# Inputs:  data/fiscal.dta
#          data/panel_data_pca.rds
#          save/regModels.RData
#          helper/f_test_fiscal.R
# Outputs:
#          data/panel_data_fiscal.rds
#          save/regModels_fiscal.RData
#          save/regTable_fiscal.RData

# SETUP ----------------------------------------------------------------------------------------------------------------
rm(list = ls()) # Clear workspace

library('tidyverse')
library('AER')
library('fixest')
library("kableExtra")
library('modelsummary')
library("parameters")

# Clean data -----------------------------------------------------------------------------------------------------------
fiscal <- read_dta("data/fiscal.dta") # Load rfa data
data <- read_rds("data/panel_data_pca.rds") # Load data

## Check name consistency -----------------------------------------------------------------------------------------------------
fiscal_names <- fiscal |>
  distinct(countryn) |>
  pull() |>
  str_to_lower() |>
  sort()
data_names <- data |>
  distinct(country) |>
  pull() |>
  str_to_lower() |>
  sort()
fiscal_names[!fiscal_names %in% data_names] # only cote d'ivoire needs to be fixed
fiscal <- fiscal |>
  mutate(countryn = ifelse(countryn == "COTE D'IVOIRE", "COTE D`IVOIRE", countryn))

## summarise to 5 year intervals -----------------------------------------------------------------------------------------------------
fiscal_sum <- fiscal |>
  mutate(panel = case_when(
    approval >= 1980 & approval < 1985 ~ 1980,
    approval >= 1985 & approval < 1990 ~ 1985,
    approval >= 1990 & approval < 1995 ~ 1990,
    approval >= 1995 & approval < 2000 ~ 1995,
    approval >= 2000 & approval < 2005 ~ 2000,
    approval >= 2005 & approval < 2010 ~ 2005,
    TRUE ~ NA_real_
  )) |>
  group_by(countryn, panel) |>
  summarise(rfa1 = mean(rfa1, na.rm = TRUE),
            rfa2 = mean(rfa2, na.rm = TRUE),
            numb_fiscal = sum(numb_fiscal, na.rm = TRUE)) |>
  ungroup() |> 
  rename(country = countryn) |> 
  mutate(country_lower = str_to_lower(country)) |> 
  select(-country) |> 
  ungroup()

## merge with main data -----------------------------------------------------------------------------------------------------
data_new <- data |>
  mutate(country_lower = str_to_lower(country)) |>
  left_join(fiscal_sum, by = c("country_lower", "panel")) |> 
  select(-country_lower)

saveRDS(data_new, "data/panel_data_fiscal.rds") # save the new data

# Run regressions -----------------------------------------------------------------------------------------------------------
## Load old condition regression model ---------------------------------------------------------------------------------
load('save/regModels.RData')
## Prepare variables -----------------------------------------------------------------------------------------------------
rhs <- c(
  "us",
  "eu",
  "shstaffl",
  "shquotal",
  "lnrgdpnew",
  "lnrgdpnewsq",
  "rgdpchnew",
  "rgdpchnewsquare",
  "growth1new",
  "reserv1",
  "oecd1",
  # "year1980", // dropped as fiscal data starts from 1999
  # "year1985",
  # "year1990",
  "year1995",
  "year2000"
)
make_formula <- function(outcome) {
  as.formula(paste(outcome, paste(rhs, collapse = " + "), sep = " ~ "))
}

## Tobit Total number of IMF conditions ----------------------------------------------------------------------------------------------------------------------
condition <- regModels$`Number of IMF conditions`
msummary(condition, stars = TRUE)

## Tobit Total number of IMF conditions (new data) ----------------------------------------------------------------------------------------------------------------------
fiscal_condition <- tobit(
  make_formula("numb_fiscal"),
  data = data_new,
  left = 0,
  right = Inf,
  cluster = shcode
)
msummary(fiscal_condition, stars = TRUE)

## OLS Required fiscal adjustments （T+1) ----------------------------------------------------------------------------------------------------------------------
rfa1 <- feols(
  make_formula("rfa1"),
  data = data_new,
  cluster = "shcode"
)
msummary(rfa1, stars = TRUE)

## OLS Required fiscal adjustments （end year) ----------------------------------------------------------------------------------------------------------------------
rfa2 <- feols(
  make_formula("rfa2"),
  data = data_new,
  cluster = "shcode"
)
msummary(rfa2, stars = TRUE)


## Save the models --------------------------------------------------------------------------------------------------------------------------------------------
regModels <- list(
  'Number of IMF conditions' = condition,
  'Number of Fiscal conditions' = fiscal_condition,
  'RFA (T+1)' = rfa1,
  'RFA (end year)' = rfa2
)
save(regModels, file = 'save/regModels_fiscal.RData')

## F-tests generation -----------------------------------------------------------------------------------------------------------------------------------------

source("helper/f_test_fiscal.R")

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
      "Standard errors clustered at the country level. Values in square brackets represent $p$-values from $F$-tests (linear models) and Chi-squared tests (Probit model)."
    )
  )
}

getTable() # for previewing the table in IDE

resultsTable <- getTable("latex")

save(resultsTable, file = 'save/regTable_fiscal.RData') # Save the table
