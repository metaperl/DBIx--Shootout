use strict;
use warnings;

$/ = '),(' ;

while (my $line = <>) {
    chomp($line);
    next if length($line) < 10 ;
    print "INSERT INTO salaries VALUES ($line);\n";
}
