#Ron Bose.  RonBoseKinasesList.txt by email directly from Ron

#KinCat.  Kincat_Hsap.08.02.xls from here:
wget http://kinase.com/human/kinome/tables/Kincat_Hsap.08.02.xls

#KinBase.  Human_kinase_rna.fasta from here:
wget http://kinase.com/kinbase/FastaFiles/Human_kinase_rna.fasta
grep ">" Human_kinase_rna.fasta | perl -ne 'if ($_ =~ /\>(.*)\_/){print "$1\n";}' | sort | uniq > Human_kinase_rna.names.txt

#Gene Ontology. GO:0016301 and children
#Through website, limited to human genes only

#Other sources to consider?



