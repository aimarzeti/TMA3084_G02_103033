import 'dart:io';

import 'my_lib.dart';

void main() {
  // Creating an employee object with values to achieve 5070.0 total salary
  // (Basic Salary: RM 4500.0, 19.0 overtime hours at RM 30.0/hr)
  Employee emp = Employee(
    name: 'Zeti',
    basicSalary: 4500.0,
    overtimeHours: 19.0,
    overtimeRate: 30.0,
  );

  double totalSalary = emp.calculateTotalSalary();

  stdout.writeln('Employee Name: ${emp.name}');
  stdout.writeln('Basic Salary: RM ${emp.basicSalary}');
  stdout.writeln('Overtime Hours: RM ${emp.overtimeHours}');
  stdout.writeln('Overtime Rate: RM ${emp.overtimeRate}');
  stdout.writeln('Total Salary = RM $totalSalary');
}
