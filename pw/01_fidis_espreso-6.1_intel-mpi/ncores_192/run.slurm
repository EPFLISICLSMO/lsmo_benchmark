#!/bin/bash -l
#SBATCH --nodes=7
#SBATCH --ntasks=192
#SBATCH --time=01:00:00


source /ssoft/spack/bin/slmodules.sh -r stable             
 
module purge
module load intel/17.0.2
module load intel-mkl/2017.2.174
module load intel-mpi/2017.2.174
module load espresso/6.1.0-mpi

date_start=$(date +%s)
srun pw.x < *.pwi > output.pwo           #running command            
date_end=$(date +%s)
time_run=$((date_end-date_start))
echo "192_cpus $time_run seconds"

rm -rf *UPF *paw *pwscf* *wfc *mix *hub        #remove useless big files (please!) 
