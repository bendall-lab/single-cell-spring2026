#! /bin/bash

# This script is used to set up the data for the project.
# It will download the data from the specified URL and extract it to the specified directory.
if which module &> /dev/null; then
  echo "Modules system is available, loading necessary modules..."
  module load xz
  module load curl
else
  echo "Modules system is not available, checking individual programs."
  which xz &> /dev/null || { echo "xz is not installed. Please install xz to proceed." >&2; exit 1; }
  which curl &> /dev/null || { echo "curl is not installed. Please install curl to proceed." >&2; exit 1; }
fi

# Get cellranger v10
if [[ ! -d cellranger-10.0.0 ]]; then
  if [[ ! -f cellranger-10.0.0.tar.xz ]]; then
    echo "Downloading cellranger-10.0.0.tar.xz..."
    curl -o cellranger-10.0.0.tar.xz "https://cf.10xgenomics.com/releases/cell-exp/cellranger-10.0.0.tar.xz?Expires=1772778069&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA&Signature=XkwqrszKTEVWyHSmutSMf1SheH5cWAgNgF6yqkKDA1p2IlRi2XX4E-WBk3z~P9fkvzQdWSiWnPJ~PFCllS-Tw9WbwlQfyf~Mk~Drb5ne4WdJsqLNu9zQx55izVXB3NjSSpb7xnlKhwRVXil2uCHWrIpxgiboqyzWx~1ahxxvyJ4NoIn7-A-i-esRk2ezFTMG4H-Uop3brrJsnkhSSKgX8Va9ZwwdHPQA2hUEUjMnm8LF65PjzDECZfJsqM61QV8qbRIt-6LX5WWwhCwrEIfKj7BQiSY9RsxZlOOtygNv1As~2pHwRKg20iUu-bHPHrzSAYvbw5JZUkxJ6ltzMGlzgw__"
  fi
  echo "Extracting cellranger-10.0.0.tar.xz..."
  tar -xvf cellranger-10.0.0.tar.xz
fi

# Get reference data for cellranger
if [[ ! -d refdata-gex-GRCh38-2024-A ]]; then
  if [[ ! -f refdata-gex-GRCh38-2024-A.tar.gz ]]; then
    echo "Downloading refdata-gex-GRCh38-2024-A.tar.gz..."
    curl -O "https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-GRCh38-2024-A.tar.gz"
  fi
  echo "Extracting refdata-gex-GRCh38-2024-A.tar.gz..."
  tar -xzf refdata-gex-GRCh38-2024-A.tar.gz
fi

### 10x pbmc_1k_v3
# Input Files
if [[ ! -e pbmc_1k_v3_fastqs/pbmc_1k_v3_S1_L001_R1_001.fastq.gz ]]; then
    # Download the dataset if it doesn't already exist
    if [[ ! -e pbmc_1k_v3_fastqs.tar ]]; then
        echo "Downloading 10x Genomics pbmc_1k_v3..."
        curl -O https://cf.10xgenomics.com/samples/cell-exp/3.0.0/pbmc_1k_v3/pbmc_1k_v3_fastqs.tar
    fi
    # Check the integrity of the downloaded file using the provided MD5 checksum
    echo "265ebe8f77ad90db350984d9c7a59e52  pbmc_1k_v3_fastqs.tar" | md5sum -c -
    tar -xf pbmc_1k_v3_fastqs.tar
fi

# Output Files
urls=$(cat <<EOF
https://cf.10xgenomics.com/samples/cell-exp/3.0.0/pbmc_1k_v3/pbmc_1k_v3_possorted_genome_bam.bam
https://cf.10xgenomics.com/samples/cell-exp/3.0.0/pbmc_1k_v3/pbmc_1k_v3_possorted_genome_bam.bam.bai
https://cf.10xgenomics.com/samples/cell-exp/3.0.0/pbmc_1k_v3/pbmc_1k_v3_molecule_info.h5
https://cf.10xgenomics.com/samples/cell-exp/3.0.0/pbmc_1k_v3/pbmc_1k_v3_filtered_feature_bc_matrix.h5
https://cf.10xgenomics.com/samples/cell-exp/3.0.0/pbmc_1k_v3/pbmc_1k_v3_filtered_feature_bc_matrix.tar.gz
https://cf.10xgenomics.com/samples/cell-exp/3.0.0/pbmc_1k_v3/pbmc_1k_v3_raw_feature_bc_matrix.h5
https://cf.10xgenomics.com/samples/cell-exp/3.0.0/pbmc_1k_v3/pbmc_1k_v3_raw_feature_bc_matrix.tar.gz
https://cf.10xgenomics.com/samples/cell-exp/3.0.0/pbmc_1k_v3/pbmc_1k_v3_analysis.tar.gz
https://cf.10xgenomics.com/samples/cell-exp/3.0.0/pbmc_1k_v3/pbmc_1k_v3_metrics_summary.csv
https://cf.10xgenomics.com/samples/cell-exp/3.0.0/pbmc_1k_v3/pbmc_1k_v3_web_summary.html
https://cf.10xgenomics.com/samples/cell-exp/3.0.0/pbmc_1k_v3/pbmc_1k_v3_cloupe.cloupe
EOF
)

mkdir -p pbmc_1k_v3_output
(
    cd pbmc_1k_v3_output

    for url in $urls; do
        filename=$(basename "$url")
        if [[ ! -e $filename ]]; then
            echo "Downloading $filename..."
            curl -O $url
        else
            echo "$filename already exists, skipping download."
        fi
    done
)

# 10x 500 PBMC 3' Chromium Input
if [[ ! -e 500_PBMC_3p_LT_Chromium_X_fastqs/500_PBMC_3p_LT_Chromium_X_S4_L003_R1_001.fastq.gz ]]; then
    # Download the dataset if it doesn't already exist
    if [[ ! -e 500_PBMC_3p_LT_Chromium_X_fastqs.tar ]]; then
        echo "Downloading 10x Genomics 500 PBMC dataset..."
        curl -O https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_X/500_PBMC_3p_LT_Chromium_X_fastqs.tar
    fi
    # Check the integrity of the downloaded file using the provided MD5 checksum
    echo "5b36a7bfda36a7093adc8e30c3fa92c8  500_PBMC_3p_LT_Chromium_X_fastqs.tar" | md5sum -c -
    tar -xvf 500_PBMC_3p_LT_Chromium_X_fastqs.tar
fi

# 10x 500 PBMC 3' Chromium v3.1 Output
urls=$(cat <<EOF
https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_X/500_PBMC_3p_LT_Chromium_X_possorted_genome_bam.bam
https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_X/500_PBMC_3p_LT_Chromium_X_possorted_genome_bam.bam.bai
https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_X/500_PBMC_3p_LT_Chromium_X_molecule_info.h5
https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_X/500_PBMC_3p_LT_Chromium_X_filtered_feature_bc_matrix.h5
https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_X/500_PBMC_3p_LT_Chromium_X_filtered_feature_bc_matrix.tar.gz
https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_X/500_PBMC_3p_LT_Chromium_X_raw_feature_bc_matrix.h5
https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_X/500_PBMC_3p_LT_Chromium_X_raw_feature_bc_matrix.tar.gz
https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_X/500_PBMC_3p_LT_Chromium_X_analysis.tar.gz
https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_X/500_PBMC_3p_LT_Chromium_X_metrics_summary.csv
https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_X/500_PBMC_3p_LT_Chromium_X_web_summary.html
https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_X/500_PBMC_3p_LT_Chromium_X_cloupe.cloupe
EOF
)

mkdir -p 500_PBMC_3p_LT_Chromium_X_output
(
    cd 500_PBMC_3p_LT_Chromium_X_output

    for url in $urls; do
        filename=$(basename "$url")
        if [[ ! -e $filename ]]; then
            echo "Downloading $filename..."
            curl -O $url
        else
            echo "$filename already exists, skipping download."
        fi
    done
)
