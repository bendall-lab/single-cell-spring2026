#! /bin/bash
share="/GWSPH/groups/genomicsgrp/PUBH6899_10_spring2026"
ls $share &> /dev/null && export SHARE=$share || echo "You do not have permission to access $share"
unset share
