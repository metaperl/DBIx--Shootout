package GSchema::Employees;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("employees");
__PACKAGE__->add_columns(
  "emp_no",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => undef },
  "birth_date",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "first_name",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "last_name",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "gender",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "hire_date",
  {
    data_type => "DATE",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("emp_no");
__PACKAGE__->has_many(
  "dept_managers",
  "GSchema::DeptManager",
  { "foreign.emp_no" => "self.emp_no" },
);
__PACKAGE__->has_many(
  "dept_emps",
  "GSchema::DeptEmp",
  { "foreign.emp_no" => "self.emp_no" },
);
__PACKAGE__->has_many(
  "titles",
  "GSchema::Titles",
  { "foreign.emp_no" => "self.emp_no" },
);
__PACKAGE__->has_many(
  "salaries",
  "GSchema::Salaries",
  { "foreign.emp_no" => "self.emp_no" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-08-06 05:08:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:XLd3yIZilQN7ME4gg8Dp2A


# You can replace this text with custom content, and it will be preserved on regeneration
1;
