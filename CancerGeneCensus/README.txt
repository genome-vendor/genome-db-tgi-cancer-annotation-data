1.) Get cancer gene census from here
ftp://ftp.sanger.ac.uk/pub/CGP/cosmic/data_export/cancer_gene_census.xls

2.) Copy the Entrez Gene ID column and use Ensembl BioMart to convert IDs to Ensembl Gene IDs.  Save the result as a TSV file.

3.) Save the file as 'cancer_gene_census_ensembl.tsv'

4.) Remove the header from this file

5.) Get a two column file with uniq Ensembl Gene to Symbol mappings
cut -f 1-2 cancer_gene_census_ensembl.tsv | sort | uniq > cancer_gene_census_ensgs.tsv

