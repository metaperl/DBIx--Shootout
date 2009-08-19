#!/usr/bin/perl


use lib "$ENV{SHOOTOUT}/lib";
use lib "$ENV{SAKILA}";
use lib "$ENV{SAKILA}/DBIx/Class";

use SakSchema;  # mysql  source
use Sak2Schema; # sqlite target

use Sakila::DBH;
use Sakila::DBH::MySQL;


my $mysql_schema = SakSchema->connect
  (
   sub { Sakila::DBH::MySQL->dbh }, {}
  );

my $sqlite_schema = Sak2Schema->connect
  (
   sub { Sakila::DBH::dbh }
  );

my @source = sort $mysql_schema->sources;
for my $source (@source) {

    my $rs = $mysql_schema->resultset($source)->search;

    while (my $row = $rs->next) {
	use Data::Dumper;
	my %data = $row->get_columns;
	warn Dumper(\%data);
	$sqlite_schema->resultset($source)->create(\%data);
    }

}
