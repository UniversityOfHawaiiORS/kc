#!/usr/bin/env perl
use strict;
use warnings;
use Data::Dumper;

my $fromBranch = "uh-modifications-initial-effort-6.0.1";
my $targetDirectory = "/cygdrive/c/Users/ronald/github/UhKc-Merge/";

my $commitBatchData = {};
my $jiraProcessedList = {};
my $jiraPath = "";
my $jiraPathCount = 0;
my $lastFileName = "";
my $commitJiraPaths = {};

sub processJira
{
    my $commitLabel = shift @_;
    my $jira = shift @_;
    my $jiraDataHash = shift @_;
    my $fileJiraHash = shift @_;
    
   # print "Processing $jira\n";

    # Check if we processed this JIRA number already using teh jiraProcessedList
    #  if so exit so recursion doesn't go infinite
    if (! exists $jiraProcessedList->{$jira}) {
        $jiraPath .= "->" . $jira;
        $jiraPathCount += 1;
        # Process the array of files assoicated with this JIRA number
        foreach (@{$jiraDataHash->{$jira}}) {
            my @dataArray = @{$_};
            my $fileName=$dataArray[0];
            my $action=$dataArray[1];
            my $description=$dataArray[2];
            my @commitData = [ $jira, $fileName, $action, $description ];
            # We have 1 filename, action and description for this jira so place them
            # into commitBatch data with key commit label and array of (fileName,Action,description) as the value
            push(@{$commitBatchData->{$commitLabel}}, @commitData);
            $jiraProcessedList->{$jira}=$commitLabel;
            # Now recursively call processJira for each JIRA assoicated with this file
            foreach (@{$fileJiraHash->{$fileName}}) {
               my $fileJira = $_;
               $lastFileName = $fileName;
               processJira($commitLabel,$fileJira, $jiraDataHash, $fileJiraHash);
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

#Load data from file into an array
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

#process data array
foreach(@array)
{
    # Split tab delimited data fields - 1) JIRA 2) Action 3) Description 4) File
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

#We now have a hash containing JIRA(Key) and Array of FileNames for that JIRA
#            a hash containing JIRA(Key) and Array of Jira Data items which are each an array which contains and elements 1) FileName 2) Action 3) Description
#            a hash containing fileName(Key) and Array of JIRA's for that file

#writeHashData($jiraDataHash, $fileJiraHash);

# Looping through the JIRA file has to process the JIRA data
foreach my $k (keys %$jiraFileHash) {
    # Each iteration through this loop will constitute on "Commit Batch" so create a label for the commit to store it's data
    $commitCount += 1;
    my $commitLabel = $commitCount . ":" . $k ;
    # Jira path is used to list all the jiras for a given commit Batch
    $jiraPath = $k;
    $jiraPathCount = 0;
    # Start the Recursive processJira loop for this commit Batch
    processJira($commitLabel,$k, $jiraDataHash, $fileJiraHash );
    $commitJiraPaths->{$commitLabel} = $jiraPath;
    #print "====  JiraPath:$jiraPathCount:$jiraPath  ============================================\n";
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
      my $thisFileDetails = "\n" . $fileName . "\n" . $jira . ":" . $action . ":" . $description . "\n";
      my $fullFileDetails = $thisFileDetails;
      if (exists $commitFileResults->{$fileName}) {
          my $value = $commitFileResults->{$fileName};
          # Add details if they are not already present
          if (!index($fullFileDetails, $value)) {
              $fullFileDetails = $value;
              $fullFileDetails .= $thisFileDetails;
         }
      }
      $commitFileResults->{$fileName}=$fullFileDetails;
   }
   $commitResults->{$k}= $commitFileResults;
}


my @commands;
my $fullCommitComment="";

foreach my $commitKey (sort keys %$commitResults) {
   $fullCommitComment="";
   print "====  Commit $commitKey  ============================================\n";
   print "====  $commitJiraPaths->{$commitKey}  ============================================\n";
   foreach  my $fileKey (keys %{$commitResults->{$commitKey}}) {
       print ": File:$fileKey\n";
       my $commitComment= $commitResults->{$commitKey}->{$fileKey};
       print ":\tComment:$commitComment\n";
       $fullCommitComment .= $commitComment;
       push(@commands,"echo git checkout $fromBranch ${fileKey}");
   }
   my $messageFileName = ${commitKey} . ".message.txt";
   open(my $messageFile, '>', $messageFileName) or die "Could not open file '$messageFileName' $!";
   print $messageFile "KC-6.0 Upgrade Commit containing the following JIRA Changes $commitJiraPaths->{$commitKey}\n\n";
   $fullCommitComment =~ s/KC-/\nKC-/g;
   print $messageFile "$fullCommitComment\n";
   close $messageFile;
   push(@commands,"echo git commit -F $messageFileName");
}

my $filename = "gitCommands.sh";
open(my $cmdFile, '>', $filename) or die "Could not open file '$filename' $!";
foreach (@commands) {
   my $cmd = $_;
   print $cmdFile "$cmd\n";
}
close $cmdFile;
