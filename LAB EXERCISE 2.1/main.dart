import 'myLib.dart';

void main() {
  // Creating an employee object with values to achieve $5070.0 total salary
  // (e.g. Basic Salary: $4500.0, 19.0 overtime hours at $30.0/hr)
  Employee emp = Employee(
    name: 'Zeti',
    basicSalary: 4500.0,
    overtimeHours: 19.0,
    overtimeRate: 30.0,
  );

  double totalSalary = emp.calculateTotalSalary();

  print('Employee Name: ${emp.name}');
  print('Basic Salary: \$${emp.basicSalary}');
  print('Overtime Hours: ${emp.overtimeHours}');
  print('Overtime Rate: \$${emp.overtimeRate}');
  print('Total Salary = \$${totalSalary} USD');
}