package SakSchema::FilmText;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("film_text");
__PACKAGE__->add_columns(
  "film_id",
  { data_type => "SMALLINT", default_value => "", is_nullable => 0, size => 6 },
  "title",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "description",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => 65535,
  },
);
__PACKAGE__->set_primary_key("film_id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-08-19 16:14:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:FFWfK+sdH6pEYUlGh8lIMw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
