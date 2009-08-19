package SakSchema::Country;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("country");
__PACKAGE__->add_columns(
  "country_id",
  {
    data_type => "SMALLINT",
    default_value => undef,
    is_nullable => 0,
    size => 5,
  },
  "country",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 50 },
  "last_update",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
);
__PACKAGE__->set_primary_key("country_id");
__PACKAGE__->has_many(
  "cities",
  "SakSchema::City",
  { "foreign.country_id" => "self.country_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-08-19 16:14:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:hGhCYfxzMlujtbDan7Rt6g


# You can replace this text with custom content, and it will be preserved on regeneration
1;
