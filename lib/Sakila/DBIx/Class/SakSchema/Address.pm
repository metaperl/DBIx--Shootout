package SakSchema::Address;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("address");
__PACKAGE__->add_columns(
  "address_id",
  {
    data_type => "SMALLINT",
    default_value => undef,
    is_nullable => 0,
    size => 5,
  },
  "address",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 50 },
  "address2",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 50,
  },
  "district",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 20 },
  "city_id",
  { data_type => "SMALLINT", default_value => "", is_nullable => 0, size => 5 },
  "postal_code",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 10,
  },
  "phone",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 20 },
  "last_update",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
);
__PACKAGE__->set_primary_key("address_id");
__PACKAGE__->belongs_to("city_id", "SakSchema::City", { city_id => "city_id" });
__PACKAGE__->has_many(
  "customers",
  "SakSchema::Customer",
  { "foreign.address_id" => "self.address_id" },
);
__PACKAGE__->has_many(
  "staffs",
  "SakSchema::Staff",
  { "foreign.address_id" => "self.address_id" },
);
__PACKAGE__->has_many(
  "stores",
  "SakSchema::Store",
  { "foreign.address_id" => "self.address_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-08-19 16:14:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:qdwYCnNUxPZZjRdwRHmo9g


# You can replace this text with custom content, and it will be preserved on regeneration
1;
