# Lab 1: scRNA-seq Data Preprocessing

## Learning Objectives

By the end of this lab, you will:
- Understand barcode structure in scRNA-seq data
- Learn about UMI (Unique Molecular Identifier) extraction
- Perform quality control on raw sequencing reads
- Process and prepare data for downstream analysis

## Background

Single-cell RNA-seq generates millions of reads per cell. Understanding the structure of sequencing reads—including cell barcodes and UMIs—is essential for proper preprocessing.

## Sections

1. **Understanding Barcodes**: Learn about 10x Genomics barcode structure
2. **UMI Extraction**: Extract and process UMI tags from reads
3. **Quality Control**: Assess read quality and filtering
4. **Data Formatting**: Prepare data for analysis in Scanpy

## Setup

This lab has its own dedicated conda environment. To set it up:

```bash
cd labs/Lab1_scRNA-seq_Preprocessing
conda env create -f environment.yml
# or
mamba env create -f environment.yml
```

Then activate the environment before working on the lab:

```bash
conda activate lab1-scrna-preprocessing
# or
mamba activate lab1-scrna-preprocessing
```

## Running the Notebook

```bash
jupyter notebook Lab1_scRNA-seq_Preprocessing.ipynb
```

## References

- [Galaxy: scRNA-seq UMIs](https://training.galaxyproject.org/training-material/topics/single-cell/tutorials/scrna-umis/tutorial.html)
- [Galaxy: scRNA-seq Preprocessing](https://training.galaxyproject.org/training-material/topics/single-cell/tutorials/scrna-preprocessing/tutorial.html)

