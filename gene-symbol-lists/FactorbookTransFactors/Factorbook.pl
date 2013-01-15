#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

my $human_entrez_genes = "/gscmnt/sata132/techd/mgriffit/reference_annotations/EntrezGene/gene_info.human";
my $factorbook_names = "/gscmnt/sata132/techd/mgriffit/reference_annotations/GeneSymbolLists/FactorbookTransFactors/FactorBookList.txt";


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

my %fb_names;
open (FB, $factorbook_names) || die "\n\nCould not open factorbook file\n\n";
my $fc = 0;
while(<FB>){
  $fc++;
  #if ($fc == 10){
  #  last();
  #}
  chomp($_);
  my $name = $_;
  $fb_names{$name}{imported} = 1;
}
close(FB);
#print Dumper %fb_names;

#Download records
chdir("/gscmnt/sata132/techd/mgriffit/reference_annotations/hg19/gene_symbol_lists/dev/encode_factorbook/");
my $temp_file = "tmp.html";
foreach my $name (keys %fb_names){
 
  print "\n\n$name\n";
  my $wget_cmd = "wget http://www.factorbook.org/mediawiki/index.php/$name -O $temp_file 2>/dev/null 1>/dev/null";
  system ($wget_cmd);
  open (IN, "$temp_file") || die "\n\nCould not open temp file: $temp_file\n\n";
  while(<IN>){
    #cat BCL11A | grep Entrez | perl -ne 'if ($_ =~ /list_uids\=(\d+)/){print "$1\n"}'
    chomp($_);
    if ($_ =~ /Entrez/){
      if ($_ =~ /list_uids\=(\d+)/){
        $fb_names{$name}{entrez_id} = $1;
      }
    }
  }
  close(IN);
  my $clean_cmd = "rm -f $temp_file";
  system($clean_cmd);
}
#print Dumper %fb_names;
open (OUT, ">FactorBookInfo.txt") || die "\n\nCould not open file for output\n\n";
print OUT "EntrezSymbol\tOriginalName\tEntrezID\tEntrezDescription\n";
foreach my $name (keys %fb_names){
  my $entrez_id = $fb_names{$name}{entrez_id};
  if ($entrez_map{$entrez_id}){
    print "\n\nFound: $name ($entrez_id) ($entrez_map{$entrez_id}{symbol}) ($entrez_map{$entrez_id}{desc})";
    print OUT "$entrez_map{$entrez_id}{symbol}\t$name\t$entrez_id\t$entrez_map{$entrez_id}{desc}\n";
  }else{
    print "\n\nNot found: $name ($entrez_id)";
  }
}
close(OUT);




print "\n\n";

exit();
