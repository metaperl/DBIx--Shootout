#!/bin/env perl

use lib "$ENV{SHOOTOUT}/lib";

use DBIx::Class::Schema::Loader qw/ make_schema_at /;

use Sakila::DBH;

use strict;
use warnings;


my $dump_dir="$ENV{Sakila}/DBIx/Class";
my $c = Sakila::DBH::connect_data;

make_schema_at 
  ( 
   'SakSchema',
   {
    debug => 1, 
    dump_directory => $dump_dir,
    },
   [
    $c->{dsn}, $c->{user}, $c->{pass}
    ]
  );


