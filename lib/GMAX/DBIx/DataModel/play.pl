#!/bin/env perl


use FindBin;

use lib "$FindBin::Bin/../../../../..";


use strict;
use warnings;

use Data::Dumper;


use DBIx::Shootout::GMAX::DBH;
use DBIx::Shootout::GMAX::DBIx::DataModel::Schema;


my $dbh = DBIx::Shootout::GMAX::DBH->dbh;
EMP->dbh($dbh);

warn $dbh;

my $e = EMP::Employees->fetch(110022);


warn Dumper($e);

warn Dumper($e->titles_role);
warn Dumper($e->salaries_role);
warn Dumper($e->departments_m2n);




