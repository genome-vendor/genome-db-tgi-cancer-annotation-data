#In UCSC: The transcript is assigned a permanent "uc" accession. If the transcript was not in the previous release of UCSC Genes, the accession ends with the suffix ".1" indicating that this is the first version of this transcript. If the transcript is identical to some transcript in the previous release of UCSC Genes, the accession is re-used with the same version number. If the transcript is not identical to any transcript in the previous release but it overlaps a similar transcript with a compatible structure, the previous accession is re-used with the version number incremented.

#To download the transcript to gene symbol mappings, go to the UCSC Genome Table Browser
#http://genome.ucsc.edu/cgi-bin/hgTables?db=hg19
#Select desired species
#Under 'Genes and Gene Prediction Tracks' select 'UCSC Genes'
#Under table select 'knownGene'
#Make sure 'region' is set to 'genome'
#Set output format to 'selected fields from primary and related tables'
#Specify the output file as: 'UCSC.Genes.info'
#Hit the 'get output' button
#On the next page make sure the 'kgXref' table is linked. If not, check it an press the 'allow selection from checked tables' button
#In the table 'knownGene' check 'name'
#In the table 'kgXref' check 'geneSymbol' 
#Hit the 'get output' button

#Save the file in the appropriate directory and save a backup in a dated directory

#hg19.knownGene.name	hg19.kgXref.geneSymbol
uc001aaa.3	DDX11L1
uc010nxq.1	DDX11L9
uc010nxr.1	DDX11L1
uc009vis.2	DKFZp434K1323

