package SakSchema::Category;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("category");
__PACKAGE__->add_columns(
  "category_id",
  { data_type => "TINYINT", default_value => undef, is_nullable => 0, size => 3 },
  "name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 25 },
  "last_update",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
);
__PACKAGE__->set_primary_key("category_id");
__PACKAGE__->has_many(
  "film_categories",
  "SakSchema::FilmCategory",
  { "foreign.category_id" => "self.category_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-08-19 16:14:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:WhdCKs35pgmm0NjxkJvPow


# You can replace this text with custom content, and it will be preserved on regeneration
1;
