package GSchema::Salaries;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("salaries");
__PACKAGE__->add_columns(
  "emp_no",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => undef },
  "salary",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => undef },
  "from_date",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "to_date",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("emp_no", "from_date");
__PACKAGE__->belongs_to("emp_no", "GSchema::Employees", { emp_no => "emp_no" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-08-06 05:08:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:YhDtQ+HToti4YGy+LmBHuA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
