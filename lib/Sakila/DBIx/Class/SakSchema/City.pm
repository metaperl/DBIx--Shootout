package SakSchema::City;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("city");
__PACKAGE__->add_columns(
  "city_id",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "city",
  { data_type => "VARCHAR", default_value => "''", is_nullable => 0, size => 50 },
  "country_id",
  { data_type => "SMALLINT", default_value => "''", is_nullable => 0, size => 5 },
  "last_update",
  {
    data_type => "TIMESTAMP",
    default_value => "'CURRENT_TIMESTAMP'",
    is_nullable => 0,
    size => 14,
  },
);
__PACKAGE__->set_primary_key("city_id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-08-19 13:06:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8x0B5/NI9AV4m1phZkoPbw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
