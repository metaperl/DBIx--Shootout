package SakSchema::FilmList;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("film_list");
__PACKAGE__->add_columns(
  "fid",
  {
    data_type => "SMALLINT",
    default_value => "'0'",
    is_nullable => 1,
    size => 5,
  },
  "title",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "description",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "category",
  { data_type => "VARCHAR", default_value => "''", is_nullable => 0, size => 25 },
  "price",
  {
    data_type => "DECIMAL",
    default_value => "'4.99'",
    is_nullable => 1,
    size => 4,
  },
  "length",
  {
    data_type => "SMALLINT",
    default_value => undef,
    is_nullable => 1,
    size => 5,
  },
  "rating",
  { data_type => "ENUM", default_value => "'G'", is_nullable => 1, size => 5 },
  "actors",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 341,
  },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-08-19 13:06:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:E2EnHAbA0Ytomflr8Z2MaA


# You can replace this text with custom content, and it will be preserved on regeneration
1;