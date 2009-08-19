package SakSchema::FilmText;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("film_text");
__PACKAGE__->add_columns(
  "film_id",
  {
    data_type => "INTEGER",
    default_value => "''",
    is_nullable => 0,
    size => undef,
  },
  "title",
  {
    data_type => "VARCHAR",
    default_value => "''",
    is_nullable => 0,
    size => 255,
  },
  "description",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("film_id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-08-19 13:06:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:N7f5aIHCA6ERsiZssmd9kA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
