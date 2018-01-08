#!/bin/bash -l
#SBATCH --nodes=8
#SBATCH --ntasks=96
#SBATCH --time=00:30:00
#SBATCH --account=s761
#SBATCH --constraint=gpu

module load daint-gpu
module load QuantumESPRESSO/6.1.0-CrayIntel-17.08

date_start=$(date +%s)
srun pw.x < *.pwi > output.pwo           #running command            
date_end=$(date +%s)
time_run=$((date_end-date_start))
echo "096_cpus $time_run seconds"

rm -rf *UPF *paw *pwscf* *wfc *mix *hub        #remove useless big files (please!) 
