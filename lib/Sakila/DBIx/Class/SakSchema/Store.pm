package SakSchema::Store;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("store");
__PACKAGE__->add_columns(
  "store_id",
  { data_type => "TINYINT", default_value => undef, is_nullable => 0, size => 3 },
  "manager_staff_id",
  { data_type => "TINYINT", default_value => "", is_nullable => 0, size => 3 },
  "address_id",
  { data_type => "SMALLINT", default_value => "", is_nullable => 0, size => 5 },
  "last_update",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
);
__PACKAGE__->set_primary_key("store_id");
__PACKAGE__->add_unique_constraint("idx_unique_manager", ["manager_staff_id"]);
__PACKAGE__->has_many(
  "customers",
  "SakSchema::Customer",
  { "foreign.store_id" => "self.store_id" },
);
__PACKAGE__->has_many(
  "inventories",
  "SakSchema::Inventory",
  { "foreign.store_id" => "self.store_id" },
);
__PACKAGE__->has_many(
  "staffs",
  "SakSchema::Staff",
  { "foreign.store_id" => "self.store_id" },
);
__PACKAGE__->belongs_to(
  "manager_staff_id",
  "SakSchema::Staff",
  { staff_id => "manager_staff_id" },
);
__PACKAGE__->belongs_to(
  "address_id",
  "SakSchema::Address",
  { address_id => "address_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-08-19 16:14:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:AckVvefegRJPrLuH3Mp2Ug


# You can replace this text with custom content, and it will be preserved on regeneration
1;
