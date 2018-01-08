#!/bin/bash -l
#SBATCH --nodes=16
#SBATCH --ntasks=192
#SBATCH --time=00:30:00
#SBATCH --account=s761
#SBATCH --constraint=gpu

module load daint-mc
module load CP2K/5.0r18043-CrayGNU-17.08

date_start=$(date +%s)
srun cp2k.psmp -i *.inp -o output.out                 #running command
date_end=$(date +%s)
time_run=$((date_end-date_start))
echo "192_cpus $time_run seconds"

rm -f GTH_BASIS_SETS POTENTIAL *xyz *restart          #remove useless big files (please!) 
