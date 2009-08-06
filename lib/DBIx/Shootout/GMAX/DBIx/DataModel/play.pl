use strict;
use warnings;


use DBIx::Shootout::GMAX::DBH;
use DBIx::Shootout::GMAX::DBIx::DataModel::Schema;


my $dbh = DBIx::Shootout::GMAX::DBH->dbh;
EMP->dbh($dbh);

warn $dbh;

my $e = EMP::Employee->fetch(10001);


warn $e;

warn $e->title;

