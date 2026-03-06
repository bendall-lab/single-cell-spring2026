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

Each lab has its own dedicated conda/mamba environment to ensure isolated dependencies 
and reproducibility.

### Obtaining Data

Some of the datasets used in the labs are too large to be included in the repository,
so I have provided the commands needed to download any data within the exercises.
However, realizing that you may not want all these large files on your local machine, I
have also downloaded all the data to a shared directory on the GW HPC cluster. 

If you want to download the data yourself, either on your local machine or on the 
HPC cluster, create a data directory and run the `setup_data.sh` script from within this
directory:

```bash
mkdir -p data
( cd data &&  . ../setup_data.sh )
```

Expect the download to take as little as 30 minutes if you have a fast connection speed to several hours on a slower connection.

If you are running on the HPC cluster, you can skip the above step and simply create a symbolic link to the shared data directory:

```bash
ln -s /GWSPH/groups/genomicsgrp/PUBH6899_10_spring2026 data
````



