#!/bin/bash -l
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --mem=60GB
#SBATCH --time=00:30:00
#SBATCH --constraint=E5v4

source /ssoft/spack/bin/slmodules.sh -r stable             
 
module load gaussian/g09-D.01
. $g09root/g09/bsd/g09.profile

date_start=$(date +%s)
$g09root/g09/g09 < gauss.com > gauss.log           #running command            
date_end=$(date +%s)
time_run=$((date_end-date_start))
echo "008_cpus $time_run seconds"

rm -rf *chk        #remove useless big files (please!) 
