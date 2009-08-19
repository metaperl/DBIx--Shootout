package SakSchema::Language;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("language");
__PACKAGE__->add_columns(
  "language_id",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "name",
  { data_type => "CHAR", default_value => "''", is_nullable => 0, size => 20 },
  "last_update",
  {
    data_type => "TIMESTAMP",
    default_value => "'CURRENT_TIMESTAMP'",
    is_nullable => 0,
    size => 14,
  },
);
__PACKAGE__->set_primary_key("language_id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-08-19 13:06:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Hwua7+hBpiqiyvyrS0GKyg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
