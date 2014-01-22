#Create a new directory for this update
mkdir /gscmnt/sata132/techd/mgriffit/reference_annotations/EntrezGene/28March2012/
cd /gscmnt/sata132/techd/mgriffit/reference_annotations/EntrezGene/28March2012/

#Download the Entrez data files
wget ftp://ftp.ncbi.nih.gov/gene/DATA/gene2accession.gz
wget ftp://ftp.ncbi.nih.gov/gene/DATA/gene_info.gz

#Decompress and rename
gunzip *.gz
mv gene2accession gene2accession.all
mv gene_info gene_info.all

#Create human only versions of the file
perl -ne 'if ($_ =~ /^9606/){print "$_"}' gene2accession.all > gene2accession.human
perl -ne 'if ($_ =~ /^9606/){print "$_"}' gene_info.all > gene_info.human

#Copy up one directory to the main working copy
cp gene* ..


