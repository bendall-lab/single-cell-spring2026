#! /bin/bash

module load star/2.7.11b
. ./gwhpc_profile.sh

[[ -z ${SHARE+x} ]] && { echo "did not set SHARE"; exit 1; }
echo "SHARE set to $SHARE"

