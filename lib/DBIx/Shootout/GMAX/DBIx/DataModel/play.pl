#!/bin/env perl


use lib "$ENV{BASE}/lib";

use strict;
use warnings;

use Data::Dumper;


use DBIx::Shootout::GMAX::DBH;
use DBIx::Shootout::GMAX::DBIx::DataModel::Schema;


my $dbh = DBIx::Shootout::GMAX::DBH->dbh;
EMP->dbh($dbh);

warn $dbh;

my $e = EMP::Employee->fetch(110022);


warn Dumper($e);

warn $e->title->{title};
warn $e->salary->{salary};

warn $e->department;
warn $e->departments;



