#!/bin/env perl

use lib "$ENV{BASE}/lib";

use DBIx::Shootout::GMAX::DBIx::Class::Schema;
use DBIx::Shootout::GMAX::DBH;

use strict;
use warnings;


my $dbh = DBIx::Shootout::GMAX::DBH->dbh ;
warn $dbh;

my $schema1 =  DBIx::Shootout::GMAX::DBIx::Class::Schema->connect
  ( 
   sub { $dbh, {} }
  );


