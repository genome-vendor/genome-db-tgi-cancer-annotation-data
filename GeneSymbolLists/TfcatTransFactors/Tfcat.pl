#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

my $human_entrez_genes = "/gscmnt/sata132/techd/mgriffit/reference_annotations/EntrezGene/gene_info.human";
my $tfcat_entrez_ids = "/gscmnt/sata132/techd/mgriffit/reference_annotations/hg19/gene_symbol_lists/dev/Tfcat/Tfcat_Entrez_IDs.txt";


my %entrez_map;
open (ENTREZ, $human_entrez_genes) || die "\n\nCould not open entrez file\n\n";
while (<ENTREZ>){
  chomp($_);
  my @line = split("\t", $_);
  my $entrez_id = $line[1];
  my $gene_name = $line[2];
  my $desc = $line[8];
  $entrez_map{$entrez_id}{symbol} = $gene_name;
  $entrez_map{$entrez_id}{desc} = $desc;
}
close(ENTREZ);

#print Dumper %entrez_map;

open (TFCAT, $tfcat_entrez_ids) || die "\n\nCould not open tfcat file\n\n";
while(<TFCAT>){
  chomp($_);
  my $id = $_;
  if ($entrez_map{$id}){
    print "$entrez_map{$id}{symbol}\t$id\t$entrez_map{$id}{desc}\n";
  }else{
    #print "NOT FOUND: $_\n";
  }
}
close(TFCAT);


exit();
