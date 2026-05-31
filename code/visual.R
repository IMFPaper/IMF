# load packages and data ----
library('tidyverse')
library('modelsummary')
library('AER')

data <- read_rds('data/panel_data_pca.rds')
load("save/regModels.RData")

# Extract coefficients ----

extract_estimates <- function(model) {
  get_estimates(model) |> filter(term %in% c("us", "eu"))
}

get_eq_p_value <- function(model) {
  if (inherits(model, "tobit")) {
    lht(model, test = "F", "us=eu")[2, 4]
  } else {
    lht(model, test = "Chisq", "us=eu")[2, 4]
  }
}

estimates_list <- map(regModels, extract_estimates)

coef_df <- bind_rows(estimates_list, .id = "outcome")

pvals_df <- tibble(
  outcome = names(regModels),
  p_value = map_dbl(regModels, get_eq_p_value)
)

plot_data <- coef_df |>
  left_join(pvals_df, by = "outcome")

coef_plot <- ggplot(
  plot_data,
  aes(x = term, y = estimate, color = term)
) +
  geom_point(position = position_dodge(width = 0.4)) +
  geom_errorbar(
    aes(ymin = conf.low, ymax = conf.high),
    width = 0.2,
    position = position_dodge(width = 0.4)
  ) +
  facet_wrap(~ outcome, ncol = 2, scales = "free_y") +
  geom_text(
    data = pvals_df,
    aes(
      x = 1.5,
      y = Inf,
      label = sprintf("p(us=eu)=%.3f", p_value)
    ),
    inherit.aes = FALSE,
    vjust = 1.2,
    size = 3
  ) +
  labs(x = NULL, y = "Coefficient", color = NULL) +
  theme_minimal()

coef_plot
