#!/bin/bash -l
#SBATCH --nodes=2
#SBATCH --ntasks=32
#SBATCH --time=00:30:00

source /ssoft/spack/bin/slmodules.sh -r deprecated 
module load cp2k/2.6.0/intel-15.0.0

date_start=$(date +%s)
srun cp2k.popt -i *.inp -o output.out                 #running command
date_end=$(date +%s)
time_run=$((date_end-date_start))
echo "032_cpus $time_run seconds"

rm -f GTH_BASIS_SETS POTENTIAL *xyz *restart          #remove useless big files (please!) 
