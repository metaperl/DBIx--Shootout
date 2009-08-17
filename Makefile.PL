use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'DBIx::Shootout',
    AUTHOR              => 'Terrence Brannon <metaperl@gmail.com>',
    VERSION_FROM        => 'lib/DBIx/Shootout.pm',
    ABSTRACT_FROM       => 'lib/DBIx/Shootout.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => 
	      {
	       'Test::More' => 0,
	       'DateTime' => 0,
	      },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'DBIx-Shootout-*' },
);
