#!/usr/bin/perl

use strict;
use warnings;

if ($#ARGV < 2) {
	print STDERR "Usage: diff-cdx-values.pl outfile reference data\n";
	exit 1;
}

open(OUT, ">$ARGV[0]") || die "Could not open output file: $ARGV[0]";
open(FILE1, "<$ARGV[1]") || die "Could not open input file: $ARGV[1]";
open(FILE2, "<$ARGV[2]") || die "Could not open input file: $ARGV[2]";

while (<FILE1>) {
	chomp;
	next if $_ !~ /^(-?\d+)$/;
	my $ref  = $1;
	my $data = -1;

	while (<FILE2>) {
		chomp;
		next if $_ !~ /^(-?\d+)$/;
		$data = $1;

		last;
	}

	if ($data == -1) {
		die "Premature end of input in $ARGV[2]"
	}

	my $percent = $data / $ref;
	print OUT "$percent\n";
}

close(FILE1);
close(FILE2);
close(OUT);
