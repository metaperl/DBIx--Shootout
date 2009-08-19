package SakSchema::SalesByFilmCategory;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("sales_by_film_category");
__PACKAGE__->add_columns(
  "category",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 25 },
  "total_sales",
  {
    data_type => "DECIMAL",
    default_value => undef,
    is_nullable => 1,
    size => 27,
  },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-08-19 16:14:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:jShSSIj6MNg18B9V4JnE2A


# You can replace this text with custom content, and it will be preserved on regeneration
1;
