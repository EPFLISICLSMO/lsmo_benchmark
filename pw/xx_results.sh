#!/bin/bash 

egrep '_cpus' */*/slurm*out > xx_results.out

more xx_results.out
