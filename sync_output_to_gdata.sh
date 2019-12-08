#!/bin/bash
#PBS -q copyq
#PBS -l ncpus=1
#PBS -l wd
#PBS -l walltime=1:00:00,mem=2GB
#PBS -P v45
#PBS -N output_to_gdata

# Set this directory to something in /g/data3/hh5/tmp/cosima/
# Make a unique path for your set of runs.
# DOUBLE-CHECK IT IS UNIQUE SO YOU DON'T OVERWRITE EXISTING OUTPUT!
GDATADIR=/g/data/hh5/tmp/cosima/access-om2/input4MIPs_testing_1deg_jra55_iaf_control

mkdir -p ${GDATADIR}
cd archive
rsync --exclude "*.nc.*" --exclude "ocean_daily_3d_*" --exclude "*ocean_*_3hourly*" --exclude "*iceh_03h*" -vrltoD --safe-links output* ${GDATADIR}
rsync -vrltoD --safe-links error_logs ${GDATADIR}
rsync -vrltoD --safe-links pbs_logs ${GDATADIR}
