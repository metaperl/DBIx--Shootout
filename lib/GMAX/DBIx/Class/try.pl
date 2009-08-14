#!/bin/env perl

use lib "$ENV{BASE}/lib";

use GSchema;

use DBIx::Shootout::GMAX::DBH;

use strict;
use warnings;


my $dump_dir="$ENV{GMAX}/DBIx/Class";
#my $c = DBIx::Shootout::GMAX::DBH::connect_data;
my $dbh = DBIx::Shootout::GMAX::DBH::dbh;

my $schema = GSchema->connect
  (
   sub { $dbh }, {}
  );

my $e = $schema->resultset('Employees')->find(110085);

warn $e->first_name;
warn $e->titles





