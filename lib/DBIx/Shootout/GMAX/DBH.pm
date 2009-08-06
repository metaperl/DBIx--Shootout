package DBIx::Shootout::GMAX::DBH;

use strict;

my $dbfile = "$ENV{GMAX}/schema.sqlite3";

sub dbh {

    use DBI;

    my $dbh = DBI->connect( "dbi:SQLite:$dbfile", '', '', { RaiseError => 1 } ) ;

}


1;
