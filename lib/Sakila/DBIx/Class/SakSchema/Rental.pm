package SakSchema::Rental;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("rental");
__PACKAGE__->add_columns(
  "rental_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "rental_date",
  { data_type => "DATETIME", default_value => "", is_nullable => 0, size => 19 },
  "inventory_id",
  { data_type => "MEDIUMINT", default_value => "", is_nullable => 0, size => 8 },
  "customer_id",
  { data_type => "SMALLINT", default_value => "", is_nullable => 0, size => 5 },
  "return_date",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "staff_id",
  { data_type => "TINYINT", default_value => "", is_nullable => 0, size => 3 },
  "last_update",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
);
__PACKAGE__->set_primary_key("rental_id");
__PACKAGE__->add_unique_constraint("rental_date", ["rental_date", "inventory_id", "customer_id"]);
__PACKAGE__->has_many(
  "payments",
  "SakSchema::Payment",
  { "foreign.rental_id" => "self.rental_id" },
);
__PACKAGE__->belongs_to("staff_id", "SakSchema::Staff", { staff_id => "staff_id" });
__PACKAGE__->belongs_to(
  "inventory_id",
  "SakSchema::Inventory",
  { inventory_id => "inventory_id" },
);
__PACKAGE__->belongs_to(
  "customer_id",
  "SakSchema::Customer",
  { customer_id => "customer_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-08-19 16:14:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ygRO9FLGKY8Fwx7FHjLFSA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
