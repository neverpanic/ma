#!/usr/bin/perl

use strict;
use warnings;
use List::Util qw(sum);

if ($#ARGV < 1) {
	print STDERR "Usage: average-cdx-values.pl outfile files...\n";
	exit 1;
}

open(OUT, ">$ARGV[0]") || die "Could not open outfile $ARGV[0]";

my @inputs;
foreach my $num (1 .. $#ARGV) {
	my $input = $ARGV[$num];
	next if !-f $input;

	local *IFILE;
	open(IFILE, "<$input") || die "Could not open input file $input";
	push(@inputs, *IFILE);
}

while (readline($inputs[0])) {
	chomp;
	/\d+, \d+, (-?\d+)/ || die "Unexpected input line `$_'";

	my @values;
	push(@values, $1);

	foreach my $n (1 .. $#inputs) {
		readline($inputs[$n]);
		chomp;
		/\d+, \d+, (-?\d+)/ || die "Unexpected input line `$_'";
		push(@values, $1);
	}

	my $avg = sum(@values)/@values;
	print OUT "$avg\n";
}

foreach my $num (0 .. $#inputs) {
	close $inputs[$num];
}
close OUT;
