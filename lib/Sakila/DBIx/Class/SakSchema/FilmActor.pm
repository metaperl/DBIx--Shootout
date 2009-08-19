package SakSchema::FilmActor;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("film_actor");
__PACKAGE__->add_columns(
  "actor_id",
  { data_type => "SMALLINT", default_value => "''", is_nullable => 0, size => 5 },
  "film_id",
  { data_type => "SMALLINT", default_value => "''", is_nullable => 0, size => 5 },
  "last_update",
  {
    data_type => "TIMESTAMP",
    default_value => "'CURRENT_TIMESTAMP'",
    is_nullable => 0,
    size => 14,
  },
);
__PACKAGE__->set_primary_key("actor_id", "film_id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-08-19 13:06:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Gb1JGa3vfRczceRMI0wK2Q


# You can replace this text with custom content, and it will be preserved on regeneration
1;
