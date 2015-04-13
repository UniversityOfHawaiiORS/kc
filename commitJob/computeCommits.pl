#!/usr/bin/env perl
use strict;
use warnings;

my $commitBatchData = {};
my $jiraProcessedList = {};

sub processJira
{
    my $commitCount = shift @_;
    my $jira = shift @_;
    my $jiraDataHash = shift @_;
    my $fileJiraHash = shift @_;
    
    print "Processing $jira\n";
    if (! exists $jiraProcessedList->{$jira}) {
        foreach (@{$jiraDataHash->{$jira}}) {
            my @dataArray = @{$_};
            my $fileName=$dataArray[0];
            my $action=$dataArray[1];
            my $description=$dataArray[2];
            my @commitData = [ $jira, $fileName, $action, $description ];
            push(@{$commitBatchData->{$commitCount}}, @commitData);
            push(@{$jiraProcessedList->{$jira}}, $commitCount);
            foreach (@{$fileJiraHash->{$fileName}}) {
               my $fileJira = $_;
               processJira($commitCount,$fileJira, $jiraDataHash, $fileJiraHash);
            }
        }
    } else {
        print "$jira already processed\n"
    }
}

sub writeHashData
{
    my $jiraDataHash = shift @_;
    my $fileJiraHash = shift @_;

    foreach my $k (keys %$fileJiraHash) {
       print "Listing fileJiraHash for $k\n";
       foreach (@{$fileJiraHash->{$k}}) {
           print " : $_ \n";
       }
       print "====     File Jira Hash  ============================================\n";
    }

    foreach my $k (keys %$jiraDataHash) {
       print "Listing jiraDataHash for  $k\n";
       foreach (@{$jiraDataHash->{$k}}) {
          my @dataArray = @{$_};
          print " : FileName:$dataArray[0] \n";
          print " : \tAction:$dataArray[1] \n";
          print " : \tDescription:$dataArray[2] \n";
       }
       print "====     Jira Data Hash  ============================================\n";
    }
}

my $commitCount=100;
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

#writeHashData($jiraDataHash, $fileJiraHash);

foreach my $k (keys %$jiraFileHash) {
    $commitCount += 1;
    processJira($commitCount,$k, $jiraDataHash, $fileJiraHash);
}

foreach my $k (keys %$commitBatchData) {
   print "====  Commit $k Data Hash Begin  ============================================\n";
   foreach (sort @{$commitBatchData->{$k}}) {
      my @dataArray = @{$_};
      print " : FileName:$dataArray[0] \n";
      print " : \tAction:$dataArray[1] \n";
      print " : \tDescription:$dataArray[2] \n";
   }
   print "====     Commit Data Hash End ============================================\n";
}
