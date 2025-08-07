######## INFO ########
# Authors: Dianyi Yang
# R Script
# Purpose: This script runs separate regressions for each continent.
# Inputs:  data/panel_data_pca.rds
# Outputs:

# SETUP ----------------------------------------------------------------------------------------------------------------
rm(list = ls()) # Clear workspace

need <- c(
  'tidyverse',
  'AER',
  'fixest',
  "kableExtra",
  'modelsummary',
  "parameters"
) # list packages needed
have <- need %in% rownames(installed.packages()) # checks packages you have
if (any(!have)) {
  install.packages(need[!have])
} # install missing packages
invisible(lapply(need, library, character.only = T))

data <- read_rds("data/panel_data_pca.rds") # Load data

# Run regression ---------------------------------------------------------------------------------------------------------------------------------------------------------------

## Prepare variables -----------------------------------------------------------------------------------------------------
rhs <- c(
  "us*continent",
  "eu*continent",
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

# Coef plots --------------------------------------------------------------------------------------------------------------------------------------------
continents <- data |>
  distinct(continent) |>
  pull(continent)
ref_continent <- "Africa"

library(multcomp)

get_continent_estimate <- function(continent, power, mod) {
  if (continent == ref_continent) {
    return(get_estimates(mod) |> filter(term == power) |> dplyr::select(-term))
  } else if (continent %in% continents) {
    if (power == "us") {
      lin_combo <- glht(
        mod,
        linfct = sprintf("us + `us:continent%s` = 0", continent)
      )
      rownames(lin_combo["linfct"]$linfct) <- c("term")
      return(get_estimates(lin_combo) |> dplyr::select(-term))
    } else if (power == "eu") {
      lin_combo <- glht(
        mod,
        linfct = sprintf("eu + `continent%s:eu` = 0", continent)
      )
      rownames(lin_combo["linfct"]$linfct) <- c("term")
      return(get_estimates(lin_combo) |> dplyr::select(-term))
    } else {
      stop("Invalid power term")
    }
  } else {
    stop("Invalid continent name")
  }
}

## IMF loan to GDP ratio --------------------------------------------------------------------------------------------------
loan_summary_df <- get_estimates(loan) |>
  dplyr::select(-term) |>
  slice(0) |>  # empties the dataframe while preserving structure
  mutate(
    continent = character(),
    power = character()
  ) |>
  relocate(continent, power, .before = 1)

  # Loop through each continent and power to compute estimates
for (ct in continents) {
  for (pw in c("us", "eu")) {
    row <- get_continent_estimate(ct, pw, loan) |>
      mutate(continent = ct, power = pw) |>
      relocate(continent, power, .before = 1)
    
    loan_summary_df <- bind_rows(loan_summary_df, row)
  }
}

ggplot(loan_summary_df, aes(x = power, y = estimate, color = power)) +
  geom_point(position = position_dodge(width = 0.5)) +
  geom_errorbar(aes(ymin = conf.low, ymax = conf.high),
                width = 0.2, position = position_dodge(width = 0.5)) +
  facet_wrap(~continent, ncol = 3) +
  theme_bw() +
  labs(
    title = "Estimated Influence of US and EU on IMF Lending by Continent",
    y = "Coefficient Estimate",
    x = "",
    color = "Influence"
  )

## Total number of IMF conditions --------------------------------------------------------------------------------------------------
condition_summary_df <- get_estimates(condition) |>
  dplyr::select(-term) |>
  slice(0) |>  # empties the dataframe while preserving structure
  mutate(
    continent = character(),
    power = character()
  ) |>
  relocate(continent, power, .before = 1)
# Loop through each continent and power to compute estimates
for (ct in continents) {
  for (pw in c("us", "eu")) {
    row <- get_continent_estimate(ct, pw, condition) |>
      mutate(continent = ct, power = pw) |>
      relocate(continent, power, .before = 1)
    
    condition_summary_df <- bind_rows(condition_summary_df, row)
  }
}

ggplot(condition_summary_df, aes(x = power, y = estimate, color = power)) +
  geom_point(position = position_dodge(width = 0.5)) +
  geom_errorbar(aes(ymin = conf.low, ymax = conf.high),
                width = 0.2, position = position_dodge(width = 0.5)) +
  facet_wrap(~continent, ncol = 3) +
  theme_bw() +
  labs(
    title = "Estimated Influence of US and EU on IMF Conditions by Continent",
    y = "Coefficient Estimate",
    x = "",
    color = "Influence"
  )
