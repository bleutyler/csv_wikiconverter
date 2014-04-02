#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: cvs2wiki.pl
#
#        USAGE: ./cvs2wiki.pl  
#
#  DESCRIPTION: This will take a CSV file and format it to a media wiki table 
#
#      OPTIONS: A CSV file as the first parameter
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Tyler Slijboom
#      VERSION: 1.0
#      CREATED: 14-04-01 05:51:53 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;
use Getopt::Long;
use Devel::Comments;

# -o <file> is output file
# -h        is flag indicating if the csv file has a header row or not.
# -q        is flag indicating that fields are enclosed with ""
# SWEET: You can make it CSV::WikiConverter on CPAN!!  NICE AND EASY!!

my $csv_file = $ARGV[0];

my $final_output = "{|\n";

open( my $csv_filehandle, '<', $csv_file );
while ( my $line_of_file = <$csv_filehandle> ) {
    chomp( $line_of_file );
    my @elements_of_csv_filerow = split( ',' , $line_of_file );
    ### @elements_of_csv_filerow
    $final_output .= "|-\n";
    for my $cell ( @elements_of_csv_filerow ) {
        $final_output .= "|$cell\n";
    }
    
}
close( $csv_filehandle );

$final_output .= '|}';

print $final_output;
