#!/bin/sh
#SBATCH -J PCangsd
#SBATCH --ntasks=20
#SBATCH --mem=120G
#SBATCH --time=9-12:00
#SBATCH --output=angsd_1%j.out
#SBATCH -e angsd_4_%j.err          # File for STDERR (with jobid = %j)
#SBATCH --mail-type=ALL          # Type of email notification: BEGIN,END,FAIL,A$
#SBATCH --mail-user=gastonjr@email.unc.edu  #Email where notifications will be sent
#SBATCH --partition=bigmem
#SBATCH --qos=bigmem_access



angdir=/work/users/g/a/gastonjr/Blastomyces/bams_mapped_to_blasto
bamlist=/work/users/g/a/gastonjr/Blastomyces/bams_mapped_to_blasto/PCA.bam_list

##change the -minInd value accordingly 

/proj/matutelb/software/angsd/angsd -GL 2 -out $angdir/all_filtered -nThreads 20 -minInd 20 -doGlf 2 -doMajorMinor 1 -doMaf 2 -SNP_pval 1e-6 -bam $bamlist -minMapQ 30 -minQ 20 -doCounts 1 -doDepth 1 

#/proj/matutelb/software/angsd/misc/NGSadmix -likes $angdir/all_filtered.beagle.gz -P 8 -o $angdir/NGSoutput_all_filtered -minMaf 0.05


module load anaconda
source activate angsd

###                         ###
#  Worked all the way to here #
###                         ###

### create $angdir/pca/

module load python/3.6.6 
python --version


python3 /nas/longleaf/home/gastonjr/pcangsd/pcangsd.py -beagle $angdir/all_filtered.beagle.gz -admix -selection -sites_save -o $angdir/all_filtered -threads 20

