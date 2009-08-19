package GMAX::DBIx::DataModel::Schema;


use DBIx::DataModel;
DBIx::DataModel->Schema('EMP');

# $schema->Table($perl_pkg, $db_table_name, primary_keys)
EMP->Table(qw/Employees    employees      emp_no/);
EMP->Table(qw/Dept_Manager dept_manager   emp_no dept_no/);
EMP->Table(qw/Departments  departments    dept_no/);	  
EMP->Table(qw/Titles       titles         emp_no title from_date/);	  
EMP->Table(qw/Salaries     salaries       emp_no       from_date/);	  
EMP->Table(qw/Dept_Emp     dept_emp       emp_no dept_no/);

# http://search.cpan.org/dist/DBIx-DataModel/lib/DBIx/DataModel/Doc/Reference.pod#Association
# $schema->Association([$class1, $role1, $multiplicity1, @columns1], 
#                      [$class2, $role2, $multiplicity2, @columns2]);


EMP->Composition([qw/Employees   employee        1 emp_no/],
		 [qw/Titles      titles          * emp_no/]);

EMP->Composition([qw/Employees   employee        1 emp_no/],
		 [qw/Salaries    salaries        * emp_no/]);

# m-to-n : a department may have had several managers; an employee
# may manage several departments
EMP->Association([qw/Employees    employee          1 /],
		 [qw/Dept_Manager dept_managers     * /]);
EMP->Association([qw/Departments  department        1 /],
		 [qw/Dept_Manager dept_managers     * /]);
EMP->Association([qw/Employees    managers            * dept_managers employee  /],
		 [qw/Departments  managed_departments * dept_managers department/]);

# m-to-n : a department may have several employees; an employee
# may have worked in several departments over time

EMP->Association([qw/Employees   employee    1/],
		 [qw/Dept_Emp    dept_emps   */]);
EMP->Association([qw/Departments department  1/],
		 [qw/Dept_Emp    dept_emps   */]);
EMP->Association([qw/Employees    employees   * dept_emps employee  /],
		 [qw/Departments  departments * dept_emps department/]);



## column filter

EMP->ColumnType
  (Uppercase =>
   fromDB => sub { $_[0] = uc($_[0]) if $_[0] }) ;

EMP::Departments->ColumnType(Uppercase => qw/dept_name/);

1;

