package Sakila::DBH::MySQL;

use strict;

my $host = 'CyberTechnologyLLC';
my $user = 'msweeney';

my %c = (

	 dsn => "dbi:mysql:database=sakila;host=develdb.$host.com",
	 user =>  $user, 
	 pass => 'Peach712Python'
	);


sub connect_data {
    \%c;
}

sub dbh {

    use DBI;

    my $dbh = DBI->connect( $c{dsn}, $c{user}, $c{pass}, { RaiseError => 1 } ) ;

}


1;
