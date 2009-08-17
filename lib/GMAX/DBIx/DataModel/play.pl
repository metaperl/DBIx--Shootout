#!/bin/env perl


use FindBin;

use lib "$FindBin::Bin/../../..";


use strict;
use warnings;

use Data::Dumper;


use GMAX::DBH;
use GMAX::DBIx::DataModel::Schema;


my $dbh = GMAX::DBH->dbh;
EMP->dbh($dbh);

warn $dbh;

my $e = EMP::Employees->fetch(110022);


warn Dumper($e);

warn Dumper($e->titles_role);
warn Dumper($e->salaries_role);
warn Dumper($e->departments_m2n);
warn Dumper(EMP::Departments->fetch('d001'));


use DateTime;

$e->insert_into_salaries_role
  ({
    salary => '132000',
    from_date => '2009-08-13',
    to_date => '2009-08-15'
    });

