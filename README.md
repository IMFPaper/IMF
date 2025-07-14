# IMF Paper Repository

> 📁 This repository contains all code, data, and manuscript files related to the **IMF Influence Paper**.  
> 🛑 **For internal co-authors only** – not intended for public distribution.

---

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

## ⚠️ Common Issues and Troubleshooting

Most problems related to running R scripts or rendering Quarto documents (e.g., `manuscript.qmd`, `demo.qmd`) can be resolved by:

1. **Updating packages**
2. **Installing missing packages**

You are recommended to use the `Positron R Package Manager` extension written by @kv9898, or the RStudio built-in `Packages` tab for such tasks. Alternatively, you can run the following commands in the R console:

```r
update.packages(ask = FALSE)
```

for updating packages, and

```r
install.packages("missing_package_name")
```

for installing any missing packages.
