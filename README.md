# European or American? A re-examination of the transatlantic influence over the IMF

[![Build Manuscript](https://github.com/imfpaper/imf/actions/workflows/build-manuscript.yml/badge.svg)](https://github.com/imfpaper/imf/actions/workflows/build-manuscript.yml)

This repository contains the replication materials for our paper examining whether the United States or Europe holds greater influence over the International Monetary Fund (IMF). Using panel data from 1980 to 2010, we construct separate measures of US and European influence and analyze their impact on IMF lending outcomes.

## 🔍 Research Summary

**Research Question**: Does the United States or Europe hold greater influence over IMF lending decisions?

**Key Findings**:
- European influence is strongly associated with higher loan volumes, more frequent participation, and greater likelihood of loan approval
- US influence is not significantly associated with loan access but correlates with fewer loan conditions
- European influence is not driven by regional or colonial favoritism
- Results highlight distinct patterns of Western influence in global economic governance

**Methods**: Principal component analysis of alignment indicators (UN voting, trade, banking exposure) + Tobit/Probit regression models

**Authors**: Dianyi Yang (Oxford), Tong Hu (Beijing Foreign Studies University), Zhenyi Chen (Renmin University of China)

---

## 🚀 Quick Start (Replication)

### Prerequisites
- R (version 4.5+ recommended)
- Quarto (for document rendering)

### Setup Instructions

1. **Clone the repository**:
   ```bash
   git clone https://github.com/imfpaper/imf.git
   cd imf
   ```

2. **Install R dependencies**:
   ```r
   # Install renv if not already installed
   if (!requireNamespace("renv", quietly = TRUE)) {
     install.packages("renv")  
   }
   
   # Restore project dependencies
   renv::restore()
   ```

3. **Run the analysis**:
   ```r
   # Generate principal components and main results
   source("code/continent.R")    # Add continental information for each country
   source("code/PCA.R")          # Principal component analysis and main results
   
   # Generate additional regional analyses
   source("code/is_Europe.R")    # European borrowers analysis
   source("code/is_Africa.R")    # African borrowers analysis

   # Robustness check with fiscal conditionality measures
   source("code/fiscal.R")       # Robustness check with fiscal data
   ```

4. **Build the manuscript**:
   ```bash
   quarto render manuscript/manuscript.qmd
   ```

5. **(Optional) Run tests**:
   ```r
   # Run all tests to verify reproducibility
   testthat::test_dir("tests/testthat")
   ```

## 📂 Repository Structure

```
├── code/                    # R scripts for analysis
│   ├── PCA.R               # Principal component analysis and main results
│   ├── continent.R         # Add continental information to raw data
│   ├── fiscal.R            # Robustness check with fiscal data
│   ├── is_Europe.R         # European borrowers analysis  
│   └── is_Africa.R         # African borrowers analysis
├── data/                   # Datasets
│   ├── panel_data.rds      # Main panel dataset (1980-2010)
│   ├── panel_data_pca.rds  # Data with PCA components
│   ├── panel_data_fiscal.rds # Data with fiscal data
│   ├── panel_data_raw      # Original data from Lipscy & Lee (2018)
│   ├── fiscal.dta          # Fiscal adjustment data
│   └── continents.json     # Country-continent mapping
├── manuscript/             # Paper source and output
│   ├── _extensions/        # Contains the ORCID Quarto template
│   ├── manuscript.qmd      # Quarto manuscript source
│   └── manuscript.pdf      # Generated paper (build locally)
├── demo/                   # Presentation materials
│   ├── images/             # Contains a screenshot used in slides
│   └── demo.qmd            # Quarto Beamer slides
├── save/                   # Saved R objects to be loaded
│   ├── regModels*.RData   # Regression objects
│   ├── regTable*.RData    # Regression tables
│   ├── corr.RData          # Correlation matrices
│   ├── scree.RData         # Scree plots
│   └── PCA.RData           # Principal component results
├── helper/                 # Auxiliary scripts
│   └── f_test*.R           # Scripts for tests of equality of coefficients
├── tests/                  # Test suite for reproducibility
│   └── testthat/           # testthat unit tests
│       ├── test-continent.R  # Tests for continent.R
│       ├── test-PCA.R        # Tests for PCA.R
│       ├── test-fiscal.R     # Tests for fiscal.R
│       ├── test-regional.R   # Tests for regional analyses
│       └── test-manuscript.R # Tests for manuscript.qmd compilation
├── extra/                  # Shared assets
│   ├── references.bib      # Bibliography
│   └── apa.csl             # Citation style
├── _quarto.yml             # Quarto configuration shared by manuscript   
│                             and demo
├── .gitignore              # Git ignore file
├── .gitattributes          # Git attributes file
├── .Rprofile               # R profile for renv
├── COLLABORATE.md          # Instructions for collaboration (internal use)
├── README.md               # This file
├── renv.lock               # R package versions for reproducibility
└── LICENSE                 # MIT License
```

## 📋 Reproduction Pipeline

The reproduction follows this sequence:

1. **Data Preparation** (`code/continent.R`):
   - Loads raw panel data from `data/panel_data_raw.dta`
   - Adds continent information using `data/continents.json`
   - Saves processed data to `data/panel_data.rds`

2. **Main Analysis** (`code/PCA.R`):
   - Loads processed data from `data/panel_data.rds`
   - Calculates correlation matrices
   - Constructs US and European influence measures using PCA of:
     - UN General Assembly voting alignment
     - Bilateral trade relationships  
     - Banking exposure
   - Saves processed data with PCA components to `data/panel_data_pca.rds`
   - Make scree plots
   - Save plot, regression and table objects to `save/`
   - EDA plots (not included in manuscript)
   - Estimates Tobit and Probit models for four IMF outcomes:
     - Loan-to-GDP ratios
     - Program participation rates
     - Loan approval likelihood
     - Number of structural conditions

3. **Robustness Checks**:
   - **Fiscal conditionality** (`code/fiscal.R`): Uses required fiscal adjustments as DV
   - **Regional analysis** (`code/is_Europe.R`, `code/is_Africa.R`): Tests for regional favouritism

4. **Generate Manuscript** (`manuscript/manuscript.qmd`):
   - Compiles results into a PDF manuscript using Quarto
   - Tables and figures are auto-generated from saved R objects in `save/`

## 🧪 Tests

This repository includes a comprehensive test suite using [testthat](https://testthat.r-lib.org/) to ensure reproducibility of all analysis scripts. Tests are automatically run on Windows, Ubuntu, and macOS via GitHub Actions.

[![R Tests](https://github.com/imfpaper/imf/actions/workflows/run-tests.yml/badge.svg)](https://github.com/imfpaper/imf/actions/workflows/run-tests.yml)

### Test Coverage

The test suite verifies that:
- **Data preparation** (`test-continent.R`): Continent mapping produces identical results
- **Main analysis** (`test-PCA.R`): PCA components, correlation matrices, scree plots, and main regression models are reproducible
- **Fiscal robustness checks** (`test-fiscal.R`): Fiscal conditionality analysis generates consistent results
- **Regional analysis** (`test-regional.R`): European and African borrower analyses are reproducible
- **Manuscript compilation** (`test-manuscript.R`): Manuscript structure, data dependencies, tinytable formatting, and PDF rendering

Each test re-runs the corresponding R script in a temporary workspace and compares outputs (datasets, model coefficients, tables) against the committed versions, ensuring that future package updates do not silently change results. The manuscript test additionally verifies that all required data files exist, tinytable objects are properly formatted, and the manuscript can be rendered to PDF (when LaTeX environment is fully configured).

### Running Tests Locally

```r
# Run all tests
testthat::test_dir("tests/testthat")

# Run a specific test file
testthat::test_file("tests/testthat/test-manuscript.R")
```

Tests require that you have already run the analysis scripts at least once to generate the baseline outputs in `data/` and `save/` directories.

## 🔧 Dependency Requirements

- **R**: Version 4.5+ (recommended, not tested on older versions)
- **renv**: For package management in virtual environments
- **Quarto**: For manuscript compilation
- **LaTeX**: TinyTeX (would be prompted to install by Quarto if not present)

All package versions are locked in `renv.lock` for reproducibility.

## 📑 Citation

If you use this code or data, please cite:

```bibtex
@unpublished{yang2025,
  title={European or American? A re-examination of the transatlantic influence over the IMF},
  author={Yang, Dianyi and Hu, Tong and Chen, Zhenyi},
  year={2025},
  note={Working paper}
}
```

## 🤝 Contributing

We welcome feedback and suggestions! Please:
- Open an issue for questions about replication
- Submit pull requests for corrections or improvements
- Contact the corresponding author ([Dianyi Yang @kv9898](mailto:dianyi.yang@politics.ox.ac.uk)) for data questions

## 📄 License

This project is licensed under [MIT License](LICENSE). Data usage subject to original source restrictions.
