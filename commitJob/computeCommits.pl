#!/usr/bin/env perl
use strict;
use warnings;
use Data::Dumper;

my $commitBatchData = {};
my $jiraProcessedList = {};

sub processJira
{
    my $commitCount = shift @_;
    my $jira = shift @_;
    my $jiraDataHash = shift @_;
    my $fileJiraHash = shift @_;
    
#    print "Processing $jira\n";
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
#        print "$jira already processed\n"
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
    my $commitLabel = $commitCount . ":" . $k ;
    processJira($commitLabel,$k, $jiraDataHash, $fileJiraHash);
}

my $commitResults = {};
foreach my $k (sort keys %$commitBatchData) {
#   print "====  Commit $k Data Hash Begin  ============================================\n";
   my $commitFileResults = {};
   foreach (@{$commitBatchData->{$k}}) {
      my @dataArray = @{$_};
      my $jira = $dataArray[0];
      my $fileName = $dataArray[1];
      my $action = $dataArray[2];
      my $description = $dataArray[3];
#      print " : Jira:$jira\n";
#      print " : FileName:$fileName\n";
#      print " : Action:$action\n";
#      print " : Description:$description\n";
      my $thisFileDetails = $jira . ":" . $action . ":" . $description;
      my $fullFileDetails = $thisFileDetails;
      if (exists $commitFileResults->{$fileName}) {
          my $value = $commitFileResults->{$fileName};
          $fullFileDetails = $value;
          $fullFileDetails .= "\n";
          $fullFileDetails .= $thisFileDetails;
      }
      $commitFileResults->{$fileName}=$fullFileDetails;
   }
   $commitResults->{$k}= $commitFileResults;
}


foreach my $commitKey (sort keys %$commitResults) {
   print "====  Commit $commitKey  ============================================\n";
   foreach  my $fileKey (keys %{$commitResults->{$commitKey}}) {
       print ": File:$fileKey\n";
       my $commitComment= $commitResults->{$commitKey}->{$fileKey};
       print ":\tComment:$commitComment\n";
   }
}
