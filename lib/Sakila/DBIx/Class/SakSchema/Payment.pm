package SakSchema::Payment;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("payment");
__PACKAGE__->add_columns(
  "payment_id",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "customer_id",
  { data_type => "SMALLINT", default_value => "''", is_nullable => 0, size => 5 },
  "staff_id",
  { data_type => "TINYINT", default_value => "''", is_nullable => 0, size => 3 },
  "rental_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "amount",
  { data_type => "DECIMAL", default_value => "''", is_nullable => 0, size => 5 },
  "payment_date",
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
__PACKAGE__->set_primary_key("payment_id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-08-19 13:06:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:HK6f8bxI4UGyuzJ01RHxXg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
