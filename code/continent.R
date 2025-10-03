######## INFO ########
# Authors: Dianyi Yang
# R Script
# Purpose: This script adds continent information to the panel data.
# Inputs:  data/panel_data_raw.dta
#          data/continents.json
# Outputs: data/panel_data.rds

# SETUP ----------------------------------------------------------------------------------------------------------------
rm(list = ls()) # Clear workspace

library('tidyverse')
library('jsonlite')
library('haven')

# Read data ----------------------------------------------------------------------------------------------------------------
raw_data <- read_dta("data/panel_data_raw.dta")
continent_map <- fromJSON("data/continents.json")

# Check coverage of countries in the map -----------------------------------------------------------------------------------------------
continent_df <- data.frame(
  country = names(continent_map),
  continent = unname(unlist(continent_map))
)

country_list <- unique(raw_data$country)
country_list[!(country_list %in% continent_df$country)]
  ## character(0) # No missing countries

# Merge data with continent map -----------------------------------------------------------------------------------------------
data <- raw_data |> 
  left_join(continent_df, by = "country") |> 
  relocate(continent, .after = isocode)

# Save data ------------------------------------------------------------------------------------------------------------------
write_rds(data, "data/panel_data.rds")
