package SakSchema::FilmCategory;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("film_category");
__PACKAGE__->add_columns(
  "film_id",
  { data_type => "SMALLINT", default_value => "", is_nullable => 0, size => 5 },
  "category_id",
  { data_type => "TINYINT", default_value => "", is_nullable => 0, size => 3 },
  "last_update",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
);
__PACKAGE__->set_primary_key("film_id", "category_id");
__PACKAGE__->belongs_to("film_id", "SakSchema::Film", { film_id => "film_id" });
__PACKAGE__->belongs_to(
  "category_id",
  "SakSchema::Category",
  { category_id => "category_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-08-19 16:14:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:U2OGp/BHbAXRAQtwSrhzng


# You can replace this text with custom content, and it will be preserved on regeneration
1;
