#Encode factorbook stores a list of transcription factors as characterized by the Encode consortium
#http://www.factorbook.org

cd /gscmnt/sata132/techd/mgriffit/reference_annotations/hg19/gene_symbol_lists/dev/encode_factorbook/

#Manually grab the list of gene names from this table
#http://www.factorbook.org

#Use these gene names to craft URLs and download records as follows:
wget http://www.factorbook.org/mediawiki/index.php/BCL11A

#Grab the entrez name from these
cat BCL11A | grep Entrez | perl -ne 'if ($_ =~ /list_uids\=(\d+)/){print "$1\n"}'



