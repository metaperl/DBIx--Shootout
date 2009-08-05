#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'DBIx::Shootout' );
}

diag( "Testing DBIx::Shootout $DBIx::Shootout::VERSION, Perl $], $^X" );
