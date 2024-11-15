#!/bin/bash

#SBATCH -J iqtree             # Job name
#SBATCH -n 24                     # Number of cores
#SBATCH -N 1                     # Ensure that all cores are on one machine
#SBATCH -t 11-00:00               # Runtime in D-HH:MM (or use minutes)
#SBATCH --mem=200G               # Memory in MB
#SBATCH -o iqtree_%j.out      # File for STDOUT (with jobid = %j)
#SBATCH -e iqtree_%j.err           # File for STDERR (with jobid = %j)
#SBATCH --mail-type=ALL          # Type of email notification: BEGIN,END,FAIL,A$
#SBATCH --mail-user=gastonjr@email.unc.edu  #Email where notifications will be sent
#SBATCH --partition=bigmem
#SBATCH --qos=bigmem_access
#SBATCH --dependency=afterok:39237520




/nas/longleaf/home/gastonjr/iqtree-2.1.1-Linux/bin/iqtree2 -s /work/users/g/a/gastonjr/Blastomyces/Blasto_haploid_biallelic_filtered.min4.phy -T AUTO -B 1000 -m TVMe+R2

