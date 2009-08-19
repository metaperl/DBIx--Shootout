package SakSchema::Rental;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("rental");
__PACKAGE__->add_columns(
  "rental_id",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "rental_date",
  {
    data_type => "DATETIME",
    default_value => "''",
    is_nullable => 0,
    size => 19,
  },
  "inventory_id",
  {
    data_type => "MEDIUMINT",
    default_value => "''",
    is_nullable => 0,
    size => 8,
  },
  "customer_id",
  { data_type => "SMALLINT", default_value => "''", is_nullable => 0, size => 5 },
  "return_date",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "staff_id",
  { data_type => "TINYINT", default_value => "''", is_nullable => 0, size => 3 },
  "last_update",
  {
    data_type => "TIMESTAMP",
    default_value => "'CURRENT_TIMESTAMP'",
    is_nullable => 0,
    size => 14,
  },
);
__PACKAGE__->set_primary_key("rental_id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-08-19 13:06:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:MXNu9WT0DePaoHmmqaAeQg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
