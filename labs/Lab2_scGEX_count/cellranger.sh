#! /bin/bash

module load cellRanger/8.0.0
. ./gwhpc_profile.sh

[[ -z ${SHARE+x} ]] && { echo "did not set SHARE"; exit 1; }
echo "SHARE set to $SHARE"

cellranger count\
   --id run_count_1kpbmcs \
   --fastqs $SHARE/pbmc_1k_v3_fastqs \
   --sample pbmc_1k_v3 \
   --transcriptome $SHARE/refdata-gex-GRCh38-2024-A\
   --expect-cells 1000\
   --create-bam true\
   --localcores $(nproc)

