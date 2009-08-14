package GSchema::Departments;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("departments");
__PACKAGE__->add_columns(
  "dept_no",
  {
    data_type => "CHAR",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "dept_name",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("dept_no");
__PACKAGE__->add_unique_constraint("dept_name_unique", ["dept_name"]);
__PACKAGE__->has_many(
  "dept_managers",
  "GSchema::DeptManager",
  { "foreign.dept_no" => "self.dept_no" },
);
__PACKAGE__->has_many(
  "dept_emps",
  "GSchema::DeptEmp",
  { "foreign.dept_no" => "self.dept_no" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-08-06 05:08:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:bmmq8JRfz3hV1RIk3MFLfw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
