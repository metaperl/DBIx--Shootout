package SakSchema::StaffList;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("staff_list");
__PACKAGE__->add_columns(
  "id",
  { data_type => "TINYINT", default_value => "'0'", is_nullable => 0, size => 3 },
  "name",
  { data_type => "VARCHAR", default_value => "''", is_nullable => 0, size => 91 },
  "address",
  { data_type => "VARCHAR", default_value => "''", is_nullable => 0, size => 50 },
  "zip_code",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 10,
  },
  "phone",
  { data_type => "VARCHAR", default_value => "''", is_nullable => 0, size => 20 },
  "city",
  { data_type => "VARCHAR", default_value => "''", is_nullable => 0, size => 50 },
  "country",
  { data_type => "VARCHAR", default_value => "''", is_nullable => 0, size => 50 },
  "sid",
  { data_type => "TINYINT", default_value => "''", is_nullable => 0, size => 3 },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-08-19 13:06:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:h3DsJmGeMQUBR0GPD2CC7w


# You can replace this text with custom content, and it will be preserved on regeneration
1;
