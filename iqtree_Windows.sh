#!/bin/bash




cd /pine/scr/g/a/gastonjr/Histoplasma_phylogeny/Blastomyces/iqtree/Windows
#
sptree=$(sbatch -J w_sp_tree -N 1 -n 24 -t 11-00:00  --mem 200g  -o sptree_%j.out -e sptree_%j.err --mail-type=FAIL --mail-user=gastonjr@email.unc.edu --partition=bigmem --qos=bigmem_access --wrap="cd /work/users/g/a/gastonjr/Blastomyces/IQTREE/Windows; /proj/matutelb/users/gjofre/software/iqtree-2.2.0-Linux/bin/iqtree2 -p /work/users/g/a/gastonjr/Blastomyces/IQTREE/Windows/seqs --prefix concat -B 1000 -T AUTO")

echo $sptree
sptree=${sptree##* }

genetree=$(sbatch -J w_gene_tree -N 1 -n 24 -t 11-00:00 --mem 200g --dependency=afterok:13742762 -o genetree_%j.out -e genetree_%j.err --mail-type=FAIL --mail-user=gastonjr@email.unc.edu --partition=bigmem --qos=bigmem_access --wrap="cd /work/users/g/a/gastonjr/Blastomyces/IQTREE/Windows; /proj/matutelb/users/gjofre/software/iqtree-2.2.0-Linux/bin/iqtree2 -S /work/users/g/a/gastonjr/Blastomyces/IQTREE/Windows/seqs --prefix loci -T AUTO")

echo $genetree


gCF=$(sbatch -J w_g_CF -N 1 -n 1 -t 5-12:00  --mem 10g --dependency=afterok:13836972 -o gCF_%j.out -e gCF_%j.err --mail-type=ALL --mail-user=gastonjr@email.unc.edu --wrap="cd /work/users/g/a/gastonjr/Blastomyces/IQTREE/Windows; /proj/matutelb/users/gjofre/software/iqtree-2.2.0-Linux/bin/iqtree2 -t concat.treefile --gcf loci.treefile --prefix concord")
echo $gCF
