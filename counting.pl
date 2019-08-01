#!/usr/bin/perl -w

$file1=$ARGV[0];


open ($FILE1, '<', $file1) or die "cannot open $file1: $!"; 

while (@line = <$FILE1>) {
  chomp @line; #(@line = <$FILE1>);
#	print "$line[0]\n";

	for ($i=0; $i<@line; $i++) {
		`grep -c -Fw "$line[$i]" keggids.tsv >>test.tsv`

	}
}	

close ($FILE1);







