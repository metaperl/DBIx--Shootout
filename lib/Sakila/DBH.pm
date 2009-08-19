package Sakila::DBH;

use warnings;
use strict;

my $dbfile = "$ENV{SAKILA}/schema.sqlite3";

our %c = 
  (
   dsn => "dbi:SQLite:$dbfile",
   user => '',
   pass => ''
  );


sub dbh {

    use DBI;

    my $dbh = DBI->connect( $c{dsn}, '', '', { RaiseError => 1 } ) ;

}

sub connect_data {
    \%c;
}

1;
