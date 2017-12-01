#!/bin/bash

dst=images
src=..

copy_problem() {
    local problem=$1
    local name=$2
    for d in $(gfind $src/$problem -name '*.pdf' -printf '%h\n' | sort -u | grep -v manuscript); do
        [[ $d == $src/$problem ]] && continue
        dir=$(basename $d)
        mkdir -p $dst/$name/$dir
        cp -v $src/$problem/$dir/*.pdf $dst/$name/$dir/
    done
}

copy_problem science/3_couette_heat uniform
copy_problem science/4_snitSimpleFoam kgf
copy_problem science/6_couette_flow couette
copy_problem science/7_snit_flows snit
copy_problem reports/5_gamma_coeffs gammas
