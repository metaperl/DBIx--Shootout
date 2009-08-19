package SakSchema::SalesByStore;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("sales_by_store");
__PACKAGE__->add_columns(
  "store",
  {
    data_type => "VARCHAR",
    default_value => "''",
    is_nullable => 0,
    size => 101,
  },
  "manager",
  { data_type => "VARCHAR", default_value => "''", is_nullable => 0, size => 91 },
  "total_sales",
  {
    data_type => "DECIMAL",
    default_value => undef,
    is_nullable => 1,
    size => 27,
  },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-08-19 13:06:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/nn9v2pf+GtwEZ+g04oJag


# You can replace this text with custom content, and it will be preserved on regeneration
1;
