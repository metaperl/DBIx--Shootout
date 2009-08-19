package SakSchema::ActorInfo;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("actor_info");
__PACKAGE__->add_columns(
  "actor_id",
  { data_type => "SMALLINT", default_value => 0, is_nullable => 0, size => 5 },
  "first_name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 45 },
  "last_name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 45 },
  "film_info",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 341,
  },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-08-19 16:14:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:YOaQ0P8quymFG1vxfXE8bw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
