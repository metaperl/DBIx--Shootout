package DBIx::Shootout::GMAX::DBIx::DataModel::Schema;


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

EMP->Composition([qw/Employees   employees_role  1 emp_no/],
		 [qw/Titles      titles_role     * emp_no/]);

EMP->Composition([qw/Employees   employees_role  1 emp_no/],
		 [qw/Salaries    salaries_role   * emp_no/]);

# m to n
EMP->Association([qw/Employees    employee_role     1 /],
		 [qw/Dept_Manager dept_manager_role * /]);
EMP->Association([qw/Departments  departments_role  1 /],
		 [qw/Dept_Manager dept_manager_role * /]);
EMP->Association([qw/Employees    employees_m2n     * dept_manager_role employee/],
		 [qw/Departments  departments_m2n   * dept_manager_role departments_role/]);



EMP->Association([qw/Employees   employees    1/],
		 [qw/Dept_Emp   dept_emp   */]);
EMP->Association([qw/Departments departments  1/],
		 [qw/Dept_Emp   dept_emp   */]);




1;
