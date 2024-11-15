#
#extract samples
#module load samtools



dsuite=$(sbatch -J dsuite  -N 1  --ntasks=1 -t 6-0 --mem 25g  -o dsuite_%j.out -e dsuite_%j.err  --mail-type=FAIL --mail-user=gastonjr@email.unc.edu --wrap="module load gcc ;cd /pine/scr/g/a/gastonjr/Histoplasma_phylogeny/Blastomyces/pattersons_D; /nas/longleaf/home/gastonjr/Dsuite/Build/Dsuite Dtrios -t whole_genome_c_2.nwk Blasto_haploid_biallelic_filtered_Dsuite.vcf.gz Sets_tree.txt")

echo $dsuite


dsuite=$(sbatch -J dsuite  -N 1  --ntasks=1 -t 6-0 --mem 25g  -o dsuite_%j.out -e dsuite_%j.err  --mail-type=FAIL --mail-user=gastonjr@email.unc.edu --wrap="module load gcc ;cd /pine/scr/g/a/gastonjr/Histoplasma_phylogeny/pattersons_D/dinvestigate; /nas/longleaf/home/gastonjr/Dsuite/Build/Dsuite Dinvestigate Blasto__haploid_biallelic_filtered_gilchr_Dsuite.vcf.gz Sets_test_tree.txt Dsuite_test_trios.txt")

echo $dsuite

/nas/longleaf/home/gastonjr/Dsuite/Build/Dsuite Dinvestigate Blasto_haploid_biallelic_filtered_Dsuite.vcf.gz Sets_tree.txt test_trios.txt


/nas/longleaf/home/gastonjr/Dsuite/Build/Dsuite Fbranch whole_genome_c_3.nwk Sets_tree__tree.txt > fbranch.txt

python /Users/gastonjofre/Dsuite/utils/dtools.py --outgroup Species8 fbranch.txt whole_genome_c_3.nwk

