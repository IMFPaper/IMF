# load packages and data ----
library('tidyverse')
library('modelsummary')
library('AER')
library('ggsignif')

data <- read_rds('data/panel_data_pca.rds')
load("save/regModels.RData")

# Extract coefficients ----
coef_df <- regModels |>
    map_dfr(get_estimates, .id = "outcome") |>
    filter(term %in% c("us", "eu")) |> 
    mutate(
        term = dplyr::recode(term, "us" = "USA", "eu" = "EUP"),
    )

# Extract p-values for equality test ----
get_eq_p_value <- function(model) {
    if (inherits(model, "tobit")) {
        lht(model, test = "F", "us=eu")[2, 4]
    } else {
        lht(model, test = "Chisq", "us=eu")[2, 4]
    }
}
pvals_df <- tibble(
    outcome = names(regModels),
    p_value = map_dbl(regModels, get_eq_p_value)
)

# prepare data for plotting ----
plot_data <- coef_df |>
    left_join(pvals_df, by = "outcome")

pvals_plot <- plot_data |>
    group_by(outcome) |>
    summarize(
        p_value = first(p_value),
        y_pos = max(conf.high, estimate, na.rm = TRUE) +
            0.08 * diff(range(c(conf.low, conf.high, estimate), na.rm = TRUE)),
        .groups = "drop"
    ) |>
    mutate(
        stars = case_when(
            p_value < 0.01 ~ '~"***"',
            p_value < 0.05   ~ '~"**"',
            p_value < 0.10   ~ '~"*"',
            TRUE ~ ""
        ),
        label = paste0("p == ", formatC(p_value, format = "f", digits = 3), stars),
    )

(coef_plot <- ggplot(
    plot_data,
    aes(x = term, y = estimate, shape = term)
) +
    geom_point(color = "black", position = position_dodge(width = 0.4)) +
    geom_hline(yintercept = 0, linetype = "dashed") +
    geom_errorbar(
        aes(ymin = conf.low, ymax = conf.high),
        width = 0.2,
        color = "black",
        position = position_dodge(width = 0.4)
    ) +
    geom_signif(
        data = pvals_plot,
        comparisons = list(c("USA", "EUP")),
        mapping = aes(xmin = 1, xmax = 2, y_position = y_pos, annotations = label, tip_length = 0.04),
        manual = TRUE,
        inherit.aes = FALSE,
        color = "black",
        tip_length = 0.01,
        textsize = 3,
        parse = TRUE
    ) +
    facet_wrap(~outcome, ncol = 2, scales = "free") +
    coord_flip() +
    labs(y = "Coefficient", x = NULL, shape = NULL) +
    theme_bw() +
    theme(
        legend.position = "bottom"
    ))
