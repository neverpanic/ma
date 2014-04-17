#!/usr/bin/perl

use strict;
use warnings;

if ($#ARGV < 2) {
	print STDERR "Usage: collect-cdx-times.pl time_outfile_prefix memory_outfile_prefix files...\n";
	exit 1;
}

foreach my $num (2 .. $#ARGV) {
	my $entry = $ARGV[$num];
	next if !-f $entry;
	open(FILE, "<$entry") || next;
	open(T_OUT, ">$ARGV[0]-$entry") || die "Could not open time_outfile $ARGV[0]-$entry";
	open(M_OUT, ">$ARGV[1]-$entry") || die "Could not open memory_outfile $ARGV[1]-$entry";

	while (<FILE>) {
		chomp;
		next if $_ !~ /^([0-9]+) ([0-9]+) [0-9]+ ([0-9]+) ([0-9]+) [0-9]+ [0-9]+/;

		my $t_start = $1;
		my $t_end   = $2;
		my $t_diff  = $t_end - $t_start;
		my $m_start = $4;
		my $m_end   = $3;
		my $m_diff  = $m_end - $m_start;

		print T_OUT "$t_start, $t_end, $t_diff\n";
		print M_OUT "$m_start, $m_end, $m_diff\n";
	}
	close(FILE);
	close(T_OUT);
	close(M_OUT);
}
