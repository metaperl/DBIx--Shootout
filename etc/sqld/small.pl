use strict;
use warnings;
use Data::Dumper;

sub IN {
my $aref = shift;
warn Dumper $aref; 
scalar @$aref;
}


use Text::Template;
  
my $age = 22;
our @age = qw/22 33 44/;

my $template =<<'EOTMPL';
SELECT * FROM table
WHERE
   age { IN \@age }
EOTMPL

warn $template;



my $txtt = Text::Template->new
  (
   TYPE => 'STRING', 
   SOURCE => $template,
   );

warn $txtt->fill_in;

