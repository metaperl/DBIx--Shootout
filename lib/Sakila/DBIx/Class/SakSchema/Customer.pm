package SakSchema::Customer;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("customer");
__PACKAGE__->add_columns(
  "customer_id",
  {
    data_type => "SMALLINT",
    default_value => undef,
    is_nullable => 0,
    size => 5,
  },
  "store_id",
  { data_type => "TINYINT", default_value => "", is_nullable => 0, size => 3 },
  "first_name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 45 },
  "last_name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 45 },
  "email",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 50,
  },
  "address_id",
  { data_type => "SMALLINT", default_value => "", is_nullable => 0, size => 5 },
  "active",
  { data_type => "TINYINT", default_value => 1, is_nullable => 0, size => 1 },
  "create_date",
  { data_type => "DATETIME", default_value => "", is_nullable => 0, size => 19 },
  "last_update",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
);
__PACKAGE__->set_primary_key("customer_id");
__PACKAGE__->belongs_to(
  "address_id",
  "SakSchema::Address",
  { address_id => "address_id" },
);
__PACKAGE__->belongs_to("store_id", "SakSchema::Store", { store_id => "store_id" });
__PACKAGE__->has_many(
  "payments",
  "SakSchema::Payment",
  { "foreign.customer_id" => "self.customer_id" },
);
__PACKAGE__->has_many(
  "rentals",
  "SakSchema::Rental",
  { "foreign.customer_id" => "self.customer_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-08-19 16:14:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BA+sCV9uAJPZst7cDVBFUg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
