#A gene symbol list is a simple list of gene symbols, one per line, no headers
#Ideally these gene symbols are already in Entrez, but if not, a match to Entrez will be attempted

#There are three levels of abstraction used to organize these gene lists

#1.) MasterList.txt 
#    - Contains the names, etc. for each individual list of gene symbols. Each deriving from a single primary source of gene annotation data (e.g. KEGG, Entrez, etc.)

#2.) MasterGroups.txt
#    - Contains groupings of 1 or more individual lists that can be conceptually joined

#3.) group_lists/*
#    - Contains subsets of the groupings that might be used in a summary analysis
#    - A default will be automatically loaded for convenience
#    - All other lists already defined will also be automatically loaded

