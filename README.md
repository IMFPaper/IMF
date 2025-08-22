# IMF Paper Repository

> 📁 This repository contains all code, data, and manuscript files related to the **IMF Influence Paper**.  
> 🛑 **For internal co-authors only** – not intended for public distribution.

---

## 🛠️ Package Management with renv

This project uses **renv** for reproducible package management. The `renv.lock` file contains the exact package versions used in this analysis.

### Getting Started with renv

1. **First-time setup** (when cloning the repository):

   ```r
   # Install renv and pak if not already installed
   if (!requireNamespace("renv", quietly = TRUE)) {
     install.packages("renv")
   }

   if (!requireNamespace("pak", quietly = TRUE)) {
     install.packages("pak")
   }

   # Initialize renv and restore packages
   renv::restore()
   ```

2. Daily Workflow

   ```r
   # Activate the renv environment (usually automatic in Positron/RStudio)
   renv::activate()

   # Install new packages (they'll be added to the lockfile)
   renv::install("package_name")

   # Update the lockfile after adding packages
   renv::snapshot()
   ```

3. Troubleshooting

- If packages are missing: `renv::restore()`
- To update all packages: `renv::update()`
- To check status: `renv::status()`

## 📂 Project Structure

- `code/` — R scripts for data preparation and regression analysis, plotting and table-generation.
- `data/` — Raw and processed data.
- `demo/` — A standalone Quarto Beamer demonstration.
- `extra/` — Shared assets across projects:
  - `references.bib` → auto-generated BibTeX file exported from Zotero.
  - `apa.csl` → Citation style file used by both `demo/` and `manuscript/`.
- `helper/` — Auxiliary scripts (e.g., $F$-test scripts).
- `manuscript/` — Quarto source and output for the main manuscript.
- `save/` — Saved R objects (e.g., models, regression outputs).
- `Taiwan_paper/` — Archived Do-files and resources from related Taiwan IMF work.

Note that all PDF files are ignored by `.gitignore` and not tracked by Git, and should be generated locally.

---

## 📚 Citation Management

Zotero is used as the reference manager.  
Please **export the BibTeX file from Zotero into `extra/references.bib`** when new sources are added.  
Both `demo/` and `manuscript/` use this file — avoid duplicating citations elsewhere.

---

## 🔁 Collaboration Guidelines

Please _DO NOT_ commit directly to `main`.

- Always work on a separate branch.
- Open a Pull Request (PR) when ready for review or merge.
- Use descriptive branch names (e.g., fix-pca-labels, results-table-tweaks).
- Keep PRs focused — one purpose per PR is best.
- Multiple commits on the same branch are _encouraged_ to keep track of changes.
