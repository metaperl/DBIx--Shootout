package SakSchema::Actor;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("actor");
__PACKAGE__->add_columns(
  "actor_id",
  {
    data_type => "SMALLINT",
    default_value => undef,
    is_nullable => 0,
    size => 5,
  },
  "first_name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 45 },
  "last_name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 45 },
  "last_update",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
);
__PACKAGE__->set_primary_key("actor_id");
__PACKAGE__->has_many(
  "film_actors",
  "SakSchema::FilmActor",
  { "foreign.actor_id" => "self.actor_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-08-19 16:14:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:GwskAWY7pseRpc1MsiFqFQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
