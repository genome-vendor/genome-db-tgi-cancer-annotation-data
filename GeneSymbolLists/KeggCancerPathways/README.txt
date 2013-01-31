
#Start here at KEGG pathways in Cancer:
http://www.genome.jp/kegg-bin/show_pathway?hsa05200

#1.) Click on a white, rounded box, e.g. 'Apoptosis'
#2.) Click on the 'Pathway Entry' at the top
#3.) Save a list of the pathway IDS to a target pathway file
#4.) Use the KEGG API to pull the Entrez Gene IDs for each target pathway you saved in the file
#5.) Map each Entrez ID to an Entrez Gene symbol
#6.) Create a simple sorted uniq list of gene symbols for each pathway


cd /gscmnt/sata132/techd/mgriffit/reference_annotations/GeneSymbolLists/KeggCancerPathways/29March2012/

ls -l | perl -ne 'if ($_ =~ /(\w+)(\.tsv)$/){print "cut -f 4 $1$2 | sort | uniq > $1.txt\n"}' > tmp.sh
bash tmp.sh
rm -f tmp.sh
mv *.txt ../../


