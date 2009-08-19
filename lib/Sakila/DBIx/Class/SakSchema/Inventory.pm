package SakSchema::Inventory;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("inventory");
__PACKAGE__->add_columns(
  "inventory_id",
  {
    data_type => "MEDIUMINT",
    default_value => undef,
    is_nullable => 0,
    size => 8,
  },
  "film_id",
  { data_type => "SMALLINT", default_value => "", is_nullable => 0, size => 5 },
  "store_id",
  { data_type => "TINYINT", default_value => "", is_nullable => 0, size => 3 },
  "last_update",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
);
__PACKAGE__->set_primary_key("inventory_id");
__PACKAGE__->belongs_to("store_id", "SakSchema::Store", { store_id => "store_id" });
__PACKAGE__->belongs_to("film_id", "SakSchema::Film", { film_id => "film_id" });
__PACKAGE__->has_many(
  "rentals",
  "SakSchema::Rental",
  { "foreign.inventory_id" => "self.inventory_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-08-19 16:14:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7K8fFWGWW73R2Q4MPqoO5w


# You can replace this text with custom content, and it will be preserved on regeneration
1;
