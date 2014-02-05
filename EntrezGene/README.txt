#Download the Entrez data files
wget ftp://ftp.ncbi.nih.gov/gene/DATA/gene2accession.gz
wget ftp://ftp.ncbi.nih.gov/gene/DATA/gene_info.gz

#Decompress and rename
gunzip *.gz
mv gene2accession gene2accession.all
mv gene_info gene_info.all

#Create human only versions of the file
perl -ne 'if ($_ =~ /^9606\s+/){print "$_"}' gene2accession.all > gene2accession.human
perl -ne 'if ($_ =~ /^9606\s+/){print "$_"}' gene_info.all > gene_info.human

#Clean up the unneeded files and commit to git
rm -f gene2accession.all gene_info.all
