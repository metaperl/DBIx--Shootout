package DBIx::Shootout::GMAX::DBIx::DataModel::Schema;


use DBIx::DataModel;
DBIx::DataModel->Schema('EMP');

# $schema->Table($perl_pkg, $db_table_name, primary_keys)
EMP->Table(qw/Employee    employees      emp_no/);
EMP->Table(qw/Dept_Mgr    dept_manager   emp_no dept_no/);
EMP->Table(qw/Department  dept_manager   dept_no/);	  
EMP->Table(qw/Title       titles         emp_no title from_date/);	  
EMP->Table(qw/Salary      salaries       emp_no title from_date/);	  
EMP->Table(qw/Dept_Emp    dept_emp       emp_no dept_no/);

# http://search.cpan.org/dist/DBIx-DataModel/lib/DBIx/DataModel/Doc/Reference.pod#Association
# $schema->Association([$class1, $role1, $multiplicity1, @columns1], 
#                      [$class2, $role2, $multiplicity2, @columns2]);
EMP->Composition([qw/Employee   employee  1/],
		 [qw/Title      title     1/]);

EMP->Composition([qw/Employee   employee  1/],
		 [qw/Salary     salary    1/]);

# m-to-n
EMP->Association([qw/Employee   employee  1/],
		 [qw/Dept_Mgr   dept_mgrs */]);
EMP->Association([qw/Department department  1/],
		 [qw/Dept_Mgr   dept_mgrs   */]);
EMP->Association([qw/Employee   employee  */],
		 [qw/Department department  */]);

EMP->Association([qw/Employee   employee    1/],
		 [qw/Dept_Emp   dept_emps   */]);
EMP->Association([qw/Department department  1/],
		 [qw/Dept_Emp   dept_emps   */]);
# Final relation would be redundant with above one... Hope this works.


1;
