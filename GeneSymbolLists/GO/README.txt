#Obtain gene lists from GO for specific queries from the GO website
http://www.geneontology.org/

#Use the AMIGO tool online because this allows you to get genes associated with a GO term AND its children
#Faster than figuring out how to do this in a scripted fashion (may require downloading the GO database and using SQL queries)

#Steps:
#1.) Select 'GO term or ID'
#2.) Enter term.  e.g. 'kinase activity'
#3.) Select 'N gene products' link
#4.) Apply filter by selecting 'Species' -> 'Homo sapiens' -> 'Set filters'
#5.) Download the tab delimited gene association file and grab the name column

#Optional
#- Could also limit to particular evidence types
#- Could also limit to 'direct associations' only

#Example lists (from Ron Bose gene family druggable genome approach):
Tyrosine kinase (ProteinTyrosineKinaseActivity_GO0004713.tsv)
Serine threonine kinase (ProteinSerineThreonineKinaseActivity_GO0004674.tsv)
Protein phosphatase (PhospoproteinPhosphataseActivity_GO0004721.tsv)
GPCR (GpcrActivity_GO0045028.tsv)
Transporter (TransporterActivity_GO0005215.tsv)
Ion Channel (IonChannelActivity_GO0005216.tsv)
Nuclear Hormone Receptor (ligand-dependent nuclear receptor activity) (NuclearHormoneReceptor_GO0004879.tsv)
Lipid Kinase (LipidKinaseActivity_GO0001727.tsv)
Phospholipase (PhospholipaseActivity_GO0004620.tsv)
Protease inhibitor (PeptidaseInhibitorActivity_GO0030414.tsv)
Cytochrome ()
DNA repair (DnaRepair_GO0006281.tsv)
Cell surface proteins (CellSurface_GO0009986.tsv)
External Side Of Plasma Membrane (ExternalsideOfPlasmaMembrane_GO0009897.tsv)
Growth factors (GrowthFactorActivity_GO0008083.tsv)
Hormone (HormoneActivity_GO0005179.tsv)

#Other categories of interest
Tumor suppressor (RegulationOfCellCycle_GO0051726.tsv)
Oncogene - N/A 
Transcription factor binding (TranscriptionFactorBinding_GO0008134.tsv)
Transcription factor complex (TranscriptionFactorComplex_GO0005667.tsv)
Histone modification (HistoneModification_GO0016570.tsv)
Drug metabolism (DrugMetabolism_GO0017144.tsv)
Drug transport ()
Drug resistance (ResponseToDrug_GO0042493.tsv)

#Also get the Russ & Lampel or Hopkins and Groom, GO terms and update their lists exactly...


#Create simplified gene lists
cd /gscmnt/sata132/techd/mgriffit/reference_annotations/GeneSymbolLists/GO/25Jan2012/
ls -l | perl -ne 'if ($_ =~ /(\S+)(\.tsv)$/){print "cut -f 3 $1$2 | sort | uniq > $1.txt\n"}' > tmp.sh
bash tmp.sh
rm -f tmp.sh
mv *.txt ..

#cut -f 3 ABCTransporter_GO0042626.tsv | sort | uniq > ABCTransporter_GO0042626.txt




