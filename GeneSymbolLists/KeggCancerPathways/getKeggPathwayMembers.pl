#!/usr/bin/perl
use Data::Dumper;
use strict;
use warnings;
use SOAP::Lite +trace => [qw(debug)];

print "SOAP::Lite = ", $SOAP::Lite::VERSION, "\n";
my $serv = SOAP::Lite -> service("http://soap.genome.jp/KEGG.wsdl");

#Hardcode paths to data and output location
my $entrez_gene_file = "/gscmnt/sata132/techd/mgriffit/reference_annotations/EntrezGene/gene_info.human";
my $target_pathways_file = "/gscmnt/sata132/techd/mgriffit/reference_annotations/GeneSymbolLists/KeggCancerPathways/targetPathways.txt";
my $outdir = "/gscmnt/sata132/techd/mgriffit/reference_annotations/GeneSymbolLists/KeggCancerPathways/29March2012/";


#Create an Entrez gene id to symbol map
my %entrez_ids;
open (ENT, "$entrez_gene_file") || die "\n\nCould not open entrez_gene_file: $entrez_gene_file\n\n";
while(<ENT>){
  chomp($_);
  if ($_ =~ /^\#/){
    next();
  }
  my @line = split("\t", $_);
  my $gene_id = $line[1];
  my $symbol = $line[2];
  if ($symbol =~ /\w+/){
    $entrez_ids{$gene_id}{symbol} = $symbol;
  }
}
close(ENT);

#For each target KEGG pathway, get the list of Entrez Gene IDs associated with it
my %target_pathways;
open (IN, "$target_pathways_file") || die "\n\nCould not open input file: $target_pathways_file\n\n";
my $header = 1;
while(<IN>){
  if ($header){
    $header = 0;
    next();
  }
  chomp($_);
  if ($_ =~ /(\S+)\s+(\S+)\s+(\S+)/){
    my $kegg_id = $1;
    my $name = $2;
    my $url = $3;
    my $genes = $serv->get_genes_by_pathway("path:$kegg_id");
    foreach my $gene (@{$genes}) {
      if ($gene =~ /(\d+)/){
        my $gene_id = $1;
        if ($target_pathways{$kegg_id}){
          my $genes_ref = $target_pathways{$kegg_id}{genes};
          $genes_ref->{$gene_id} = 1;
        }else{
          $target_pathways{$kegg_id}{name} = $name;
          my %genes;
          $genes{$gene_id} = 1;
          $target_pathways{$kegg_id}{genes} = \%genes;
        }
      }
    }
  }
}
close(IN);

#Print the output files, one per KEGG pathway
foreach my $kegg_id (sort keys %target_pathways){
  my $kegg_name = $target_pathways{$kegg_id}{name};
  my $outfile = $outdir . "$kegg_name" . "_"."KEGG$kegg_id.tsv";
  open (OUT, ">$outfile") || die "\n\nCould not open outfile: $outfile\n\n";
  my %genes = %{$target_pathways{$kegg_id}{genes}};
  foreach my $entrez_id (sort keys %genes){
    if (defined($entrez_ids{$entrez_id})){
      my $entrez_symbol = $entrez_ids{$entrez_id}{symbol};
      print OUT "$kegg_id\t$kegg_name\t$entrez_id\t$entrez_symbol\n";
    }
  }
  close(OUT);
}



exit();


