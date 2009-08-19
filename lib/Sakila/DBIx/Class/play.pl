#!/usr/bin/perl

use strict; use warnings;

use lib "$ENV{SHOOTOUT}/lib";
use lib "$ENV{SAKILA}";
use lib "$ENV{SAKILA}/DBIx/Class";

use SakSchema; 


use Sakila::DBH;

my $schema = SakSchema->connect
  (
   sub { Sakila::DBH::dbh }
  );



sub fetch_all {
    my $rs = $schema->resultset('Actor')->search;
    while (my $row = $rs->next) {
	use Data::Dumper;
	my %data = $row->get_columns;
	warn Dumper(\%data);

    }
}

sub fetch_julia {

    my $row = $schema->resultset('Actor')->find(199);
    use Data::Dumper;
    my %data = $row->get_columns;
    warn Dumper(\%data);
}

fetch_julia;
