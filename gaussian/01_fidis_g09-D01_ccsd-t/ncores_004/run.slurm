#!/bin/bash -l
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --mem=120GB
#SBATCH --time=00:30:00

source /ssoft/spack/bin/slmodules.sh -r stable             
 
module load gaussian/g09-D.01
. /ssoft/spack/external/gaussian/g09-D.01/intel-sse4.2/g09/bsd/g09.profile

echo Started at:  jeu. janv. 11 15:48:22 CET 2018
/ssoft/spack/external/gaussian/g09-D.01/intel-sse4.2/g09/g09 < .com > .log
echo Finished at: jeu. janv. 11 15:48:22 CET 2018


date_start=$(date +%s)
/ssoft/spack/external/gaussian/g09-D.01/intel-sse4.2/g09/g09 < gauss.com > gauss.log           #running command            
date_end=$(date +%s)
time_run=$((date_end-date_start))
echo "004_cpus $time_run seconds"

rm -rf *chk        #remove useless big files (please!) 
