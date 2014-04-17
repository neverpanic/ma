#!/usr/bin/perl

use strict;
use warnings;

if ($#ARGV < 2) {
	print STDERR "Usage: diff-cdx-values.pl file1 file2 outfile\n";
	exit 1;
}

open(FILE1, "<$ARGV[0]") || die "Could not open input file: $ARGV[0]";
open(FILE2, "<$ARGV[1]") || die "Could not open input file: $ARGV[1]";
open(OUT, ">$ARGV[2]") || die "Could not open output file: $ARGV[2]";

while (<FILE1>) {
	chomp;
	next if $_ !~ /^([0-9]+)$/;
	my $val1 = $1;
	my $val2 = -1;

	while (<FILE2>) {
		chomp;
		next if $_ !~ /^([0-9]+)$/;
		$val2 = $1;

		last;
	}

	if ($val2 == -1) {
		die "Premature end of input in $ARGV[1]"
	}

	my $diff = $val2 - $val1;
	print OUT "$diff\n";
}

close(FILE1);
close(FILE2);
close(OUT);
