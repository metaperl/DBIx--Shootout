#!/bin/env perl

use lib "$ENV{BASE}/lib";

use DBIx::Class::Schema::Loader qw/ make_schema_at /;

use DBIx::Shootout::GMAX::DBH;

use strict;
use warnings;


my $dump_dir="$ENV{GMAX}/DBIx/Class";
my $c = DBIx::Shootout::GMAX::DBH::connect_data;

make_schema_at 
  ( 
   'GSchema',
   {
    debug => 1, 
    dump_directory => $dump_dir,
    },
   [
    $c->{dsn}, $c->{user}, $c->{pass}
    ]
  );


