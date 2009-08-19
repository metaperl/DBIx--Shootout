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

my $employee = EMP::Employees->fetch(110022);


warn Dumper($employee);

warn Dumper($employee->titles);
warn Dumper($e->salaries);
warn Dumper($e->departments);
warn Dumper(EMP::Departments->fetch('d001'));


use DateTime;


$employee->insert_into_salaries
  ({
    salary => '132000',
    from_date => '2009-08-13',
    to_date => '2009-08-15'
    });


