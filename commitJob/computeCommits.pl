#!/usr/bin/env perl
use strict;
use warnings;

my @array;
open(my $fh, "<", "CommitData.tsv")
    or die "Failed to open file: $!\n";
while(<$fh>) { 
    chomp; 
    push @array, $_;
} 
close $fh;

my $jiraFileHash = {};
my $jiraDataHash = {};
my $fileJiraHash = {};
foreach(@array)
{
    my @split = split('\t');    
    my $asize = @split;
    if ($asize < 4) {
        print "Skipping line with invalid arguments\n";
        print "JIRA:" . $split[0] . "\n";
        print "\tAction:" . $split[1] . "\n";
        print "\tDescription:" . $split[2] . "\n";
        print "=====================================================================\n";
    } else {
        my $jira = $split[0];
        my $action = $split[1];
        my $description = $split[2];
        my $fileName = $split[3];
        $fileName =~ s/^\s+|\s+$//g;
        my @jiraData = [ $fileName, $action, $description ];
        
        if ($fileName eq "N/A") {
            print "Skipping line with N/A filename\n";
            print "JIRA:" . $split[0] . "\n";
            print "\tAction:" . $split[1] . "\n";
            print "\tDescription:" . $split[2] . "\n";
            print "=====================================================================\n";
        } else {
            push(@{$jiraFileHash->{$jira}}, $fileName);
            push(@{$jiraDataHash->{$jira}}, @jiraData);
            push(@{$fileJiraHash->{$fileName}}, $jira);
        }
    }
}
foreach my $k (keys %$jiraFileHash) {
   print "Processing $k\n";
   foreach (@{$jiraDataHash->{$k}}) {
      my @dataArray = @{$_};
      print " : FileName:$dataArray[0] \n";
      print " : \tAction:$dataArray[1] \n";
      print " : \tDescription:$dataArray[2] \n";
   }
   print "=====================================================================\n";
}

foreach my $k (keys %$fileJiraHash) {
   print "Processing $k\n";
   foreach (@{$fileJiraHash->{$k}}) {
       print " : $_ \n";
   }
   print "=====================================================================\n";
}
