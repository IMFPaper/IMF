# Copilot Instructions for IMF Paper Repository

## Project Overview

This is an academic research repository for an International Monetary Fund (IMF) influence paper using R, Quarto, and Zotero for reference management. The project analyzes transatlantic influence over the IMF using statistical modeling and generates a manuscript in PDF format.

## Repository Structure

- `code/` — R scripts for data preparation, regression analysis, plotting, and table generation
- `data/` — Raw and processed datasets  
- `demo/` — Standalone Quarto Beamer demonstration
- `extra/` — Shared assets:
  - `references.bib` — Auto-generated BibTeX file from Zotero
  - `apa.csl` — APA citation style file
- `helper/` — Auxiliary scripts (e.g., F-test scripts)
- `manuscript/` — Main manuscript source (`manuscript.qmd`) and Quarto extensions
- `save/` — Saved R objects (models, regression outputs)
- `Taiwan_paper/` — Archived legacy work
- `renv/` and `renv.lock` — R package management with renv

## Key Technologies & Tools

- **R with renv** for reproducible package management
- **Quarto** for manuscript rendering to PDF
- **Zotero** for bibliography management 
- **GitHub Actions** for automated builds and releases
- **LaTeX** for advanced typesetting via Quarto
- **Statistical packages**: `fixest` for econometric models, `modelsummary` for tables

## Development Guidelines

### Package Management
- Use `renv::restore()` to install dependencies from `renv.lock`
- Use `renv::snapshot()` to update the lock file after adding packages
- Prefer binary packages via RSPM for faster installation

### Citation Management  
- Export BibTeX from Zotero to `extra/references.bib` when adding references
- Both `demo/` and `manuscript/` use this shared bibliography
- Never duplicate citations in multiple files

### Manuscript Development
- Main file: `manuscript/manuscript.qmd`
- Uses custom ORCID extension for author formatting
- Renders to PDF with LaTeX formatting
- Includes mathematical equations, tables, and figures
- Appendices are included inline with special section classes

### Code Organization
- Statistical models in `code/` directory with descriptive names
- Save model objects to `save/` directory as `.RData` files
- Use consistent variable naming and coefficient mapping
- Include F-tests for model comparisons in `helper/` scripts

### Collaboration Workflow
- **Never commit directly to `main`**
- Always work on feature branches with descriptive names
- Open Pull Requests for review before merging
- Keep PRs focused on single purposes
- Multiple commits per branch are encouraged for tracking changes

### File Exclusions
- PDF files are excluded by `.gitignore` and should be generated locally
- R history, DS_Store, and Quarto cache files are ignored
- LaTeX intermediate files (`.tex`) are excluded from version control

## Common Tasks

### Building the Manuscript
```bash
# Install dependencies
renv::restore()

# Render manuscript to PDF
quarto render manuscript/manuscript.qmd
```

### Running Statistical Analysis
```bash
# Run regression models
Rscript code/fiscal.R

# Generate tables
# Tables are automatically saved to save/ directory
```

### GitHub Actions
- `build-manuscript.yml` — Automated manuscript building with Zotero → PDF pipeline
- `copilot-setup-steps.yml` — Validates the development environment setup

## Code Style & Conventions

### R Code
- Use `fixest::feols()` for econometric models
- Use `modelsummary::msummary()` for regression tables
- Cluster standard errors at country level (`cluster = "shcode"`)
- Save model lists with descriptive names
- Include coefficient mapping for clean table output

### Quarto/Markdown
- Use cross-references with `@sec-`, `@fig-`, `@tbl-` prefixes  
- Include chunk labels for all R code blocks
- Set `echo: false` in YAML for clean manuscript output
- Use LaTeX commands for advanced mathematical notation

### File Naming
- Use descriptive names for scripts (e.g., `fiscal.R`, `f_test_fiscal.R`)
- Save outputs with consistent prefixes (`regModels_`, `regTable_`)
- Use lowercase with underscores for file names

## Environment Setup

The repository includes a `copilot-setup-steps.yml` workflow that validates the complete environment including:
- R and system dependencies
- Quarto with TinyTeX for PDF generation  
- renv package restoration
- Zotero bibliography export
- All necessary LaTeX packages

Run this workflow to ensure your development environment matches the production build environment.

## Security & Access

- This is a **private repository for internal co-authors only**
- Zotero API key required for bibliography updates (stored in GitHub secrets)
- No public distribution intended

## Troubleshooting

### Common Issues
- **LaTeX errors**: Ensure TinyTeX is installed and updated
- **Package errors**: Run `renv::restore()` and check `renv.lock`
- **Bibliography issues**: Verify Zotero export to `extra/references.bib`
- **Quarto rendering**: Check `_quarto.yml` configuration and extensions

### Build Dependencies
- System packages: cmake, libcurl4-openssl-dev, libfontconfig1-dev, etc.
- R packages: managed via renv
- LaTeX packages: automatically handled by TinyTeX in Quarto