package SakSchema::Film;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("film");
__PACKAGE__->add_columns(
  "film_id",
  {
    data_type => "SMALLINT",
    default_value => undef,
    is_nullable => 0,
    size => 5,
  },
  "title",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "description",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => 65535,
  },
  "release_year",
  { data_type => "YEAR", default_value => undef, is_nullable => 1, size => 4 },
  "language_id",
  { data_type => "TINYINT", default_value => "", is_nullable => 0, size => 3 },
  "original_language_id",
  { data_type => "TINYINT", default_value => undef, is_nullable => 1, size => 3 },
  "rental_duration",
  { data_type => "TINYINT", default_value => 3, is_nullable => 0, size => 3 },
  "rental_rate",
  {
    data_type => "DECIMAL",
    default_value => "4.99",
    is_nullable => 0,
    size => 4,
  },
  "length",
  {
    data_type => "SMALLINT",
    default_value => undef,
    is_nullable => 1,
    size => 5,
  },
  "replacement_cost",
  {
    data_type => "DECIMAL",
    default_value => "19.99",
    is_nullable => 0,
    size => 5,
  },
  "rating",
  { data_type => "ENUM", default_value => "G", is_nullable => 1, size => 5 },
  "special_features",
  { data_type => "SET", default_value => undef, is_nullable => 1, size => 54 },
  "last_update",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
);
__PACKAGE__->set_primary_key("film_id");
__PACKAGE__->belongs_to(
  "language_id",
  "SakSchema::Language",
  { language_id => "language_id" },
);
__PACKAGE__->belongs_to(
  "original_language_id",
  "SakSchema::Language",
  { language_id => "original_language_id" },
);
__PACKAGE__->has_many(
  "film_actors",
  "SakSchema::FilmActor",
  { "foreign.film_id" => "self.film_id" },
);
__PACKAGE__->has_many(
  "film_categories",
  "SakSchema::FilmCategory",
  { "foreign.film_id" => "self.film_id" },
);
__PACKAGE__->has_many(
  "inventories",
  "SakSchema::Inventory",
  { "foreign.film_id" => "self.film_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-08-19 16:14:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:hlZH8LCrS93Np0qTKdmHvg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
