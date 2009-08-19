package SakSchema::Customer;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("customer");
__PACKAGE__->add_columns(
  "customer_id",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "store_id",
  { data_type => "TINYINT", default_value => "''", is_nullable => 0, size => 3 },
  "first_name",
  { data_type => "VARCHAR", default_value => "''", is_nullable => 0, size => 45 },
  "last_name",
  { data_type => "VARCHAR", default_value => "''", is_nullable => 0, size => 45 },
  "email",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 50,
  },
  "address_id",
  { data_type => "SMALLINT", default_value => "''", is_nullable => 0, size => 5 },
  "active",
  { data_type => "TINYINT", default_value => "'1'", is_nullable => 0, size => 1 },
  "create_date",
  {
    data_type => "DATETIME",
    default_value => "''",
    is_nullable => 0,
    size => 19,
  },
  "last_update",
  {
    data_type => "TIMESTAMP",
    default_value => "'CURRENT_TIMESTAMP'",
    is_nullable => 0,
    size => 14,
  },
);
__PACKAGE__->set_primary_key("customer_id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-08-19 13:06:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:A7NF3JUfugpOXA2o1gpAng


# You can replace this text with custom content, and it will be preserved on regeneration
1;
