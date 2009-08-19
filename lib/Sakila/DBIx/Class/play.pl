#!/usr/bin/perl

use strict; use warnings;

use lib "$ENV{SHOOTOUT}/lib";
use lib "$ENV{SAKILA}";
use lib "$ENV{SAKILA}/DBIx/Class";

use SakSchema; 


use Sakila::DBH::MySQL;

my $schema = SakSchema->connect
  (
   sub { Sakila::DBH::MySQL::dbh }
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

sub prefetch {

    my $rs = $schema->resultset('Customer')->search
      (
       { 'me.customer_id' => 599 },
       { prefetch => [ 'payments' ] }
      );

    while (my $row = $rs->next) {
	warn $row->payments->payment_id;
    }
}

#fetch_julia;
prefetch;
