# Lab 4: Single-Cell Analysis in R

**Course:** Single Cell and Spatial Genomic Analysis

**Status:** Coming soon

## Overview

This lab will explore single-cell data analysis using R and Bioconductor packages in RStudio.

## Learning Objectives

By the end of this lab, you will be able to:

- Learning objective 1: TBD
- Learning objective 2: TBD
- Learning objective 3: TBD

## Files

- `Lab4_analysis.Rmd` - Main RMarkdown document for this lab

## Setup

This lab has its own dedicated conda environment with R and Bioconductor tools. To set it up:

```bash
cd labs/Lab4_R_Analysis
conda env create -f environment.yml
# or
mamba env create -f environment.yml
```

## Instructions

1. Activate your conda/mamba environment:
   ```bash
   conda activate lab4-r-analysis
   # or
   mamba activate lab4-r-analysis
   ```

2. Open RStudio (if installed via conda) or launch it from your system:
   ```bash
   rstudio Lab4_analysis.Rmd
   ```

3. Or simply open the `.Rmd` file in your existing RStudio installation after activating the environment in the terminal.

4. Follow the instructions in the RMarkdown document to complete the lab.

## Submission

Please submit your completed RMarkdown document as an `.Rmd` file along with the rendered HTML output (`.html`).

## R Environment Management

If you prefer to use your system RStudio installation rather than the conda version, you can:

1. Activate the lab environment in your terminal
2. Open your system RStudio
3. RStudio will use the R and packages from the active conda environment

To check which R is being used in RStudio:
```R
Sys.which("R")
.libPaths()
```

