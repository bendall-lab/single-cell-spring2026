# Lab 3

## Seurat Tutorial

### Prerequisites

```r
install.packages('Seurat')
```

### The original notebook is from the Seurat vignettes:

```bash
## DON'T RUN
# curl -L -O https://github.com/satijalab/seurat/raw/fa638cca8a9db84987a28463f3433634bd6a2167/vignettes/pbmc3k_tutorial.Rmd
# mv pbmc3k_tutorial.Rmd seurat_tutorial.Rmd
```

### Data

```bash
cd data && curl -L -O https://cf.10xgenomics.com/samples/cell/pbmc3k/pbmc3k_filtered_gene_bc_matrices.tar.gz
tar xzf pbmc3k_filtered_gene_bc_matrices.tar.gz 
cd ..
```

Now open [seurat_tutorial.Rmd](./seurat_tutorial.Rmd) in RStudio and interactively run the notebook.


