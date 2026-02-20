# Lab 5: R and RMarkdown Stub

This lab is a minimal R/RMarkdown stub intended to be opened in RStudio.

Setup
-----

Create the environment with conda/mamba:

```bash
cd labs/Lab5_R_Stub
conda env create -f environment.yml
# or
mamba env create -f environment.yml
```

Activate the environment and open the RMarkdown in RStudio:

```bash
conda activate lab5-r-stub
rstudio Lab5_analysis.Rmd
```

Notes
-----
- The environment includes `r-irkernel` so this environment can also provide an R kernel to Jupyter if you prefer to run R notebooks.
- If you want to use your system RStudio, activate the environment in a terminal before launching RStudio so it uses the environment's R.

