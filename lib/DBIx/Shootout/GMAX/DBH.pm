package DBIx::Shootout::GMAX::DBH;


sub dbh {

    use DBI;

    my $dbh = DBI->connect( 'dbi:SQLite:test', '', '', { RaiseError => 1 } ) ;

}


1;
