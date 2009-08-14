package GSchema::DeptEmp;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("dept_emp");
__PACKAGE__->add_columns(
  "emp_no",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => undef },
  "dept_no",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
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
__PACKAGE__->set_primary_key("emp_no", "dept_no");
__PACKAGE__->belongs_to("emp_no", "GSchema::Employees", { emp_no => "emp_no" });
__PACKAGE__->belongs_to("dept_no", "GSchema::Departments", { dept_no => "dept_no" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-08-06 05:08:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:HXmBNg+eIw7/JAOhNtvYJg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
