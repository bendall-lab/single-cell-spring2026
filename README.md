# Single Cell and Spatial Genomic Analysis

Graduate-level course materials for analyzing single-cell and spatial genomic data.

## Course Overview

This course covers computational methods for analyzing single-cell and spatial transcriptomics data, with hands-on labs using Python and Jupyter notebooks.

## Labs

- [**Lab 1**: scRNA-seq Data Preprocessing (Python/Jupyter)](labs/Lab1_scRNA-seq_Preprocessing/README.md)
- **Lab 2**: (Coming Soon - Python/Jupyter)
- **Lab 3**: (Coming Soon - Python/Jupyter)
- **Lab 4**: Single-Cell Analysis in R (R/RMarkdown/RStudio)

## Getting Started

### Prerequisites

- Linux or macOS with [Mamba](https://mamba.readthedocs.io/) or Conda installed
    - [Installing Mamba](https://mamba.readthedocs.io/en/latest/installation/mamba-installation.html)
- Git

### Cloning the Repository

```bash
git clone https://github.com/bendall-lab/single-cell-spring2026.git
```

When there are updates, you will need to run:

```bash
git pull origin main
```

### Environment Setup

Each lab has its own dedicated conda/mamba environment to ensure isolated dependencies and reproducibility. To get started:

**For Lab 1 - scRNA-seq Data Preprocessing:**
```bash
cd labs/Lab1_scRNA-seq_Preprocessing
mamba env create -f environment.yml
mamba activate lab1-scrna-preprocessing
jupyter notebook Lab1_scRNA-seq_Preprocessing.ipynb
```

**For Lab 2:**
```bash
cd labs/Lab2_Stub
mamba env create -f environment.yml
mamba activate lab2-analysis
jupyter notebook Lab2_analysis.ipynb
```

**For Lab 3:**
```bash
cd labs/Lab3_Stub
mamba env create -f environment.yml
mamba activate lab3-analysis
jupyter notebook Lab3_analysis.ipynb
```

**For Lab 4 - Single-Cell Analysis in R:**
```bash
cd labs/Lab4_R_Analysis
mamba env create -f environment.yml
mamba activate lab4-r-analysis
rstudio Lab4_analysis.Rmd
```

Alternatively, activate the environment and open RStudio from your system menu - it will use the R and packages from the active conda environment.

**Note:** You can use either `conda` or `mamba` for environment management. `mamba` is recommended for faster dependency resolution.
