class Employee {
  String name;
  double basicSalary;
  double overtimeHours;
  double overtimeRate;

  // Constructor
  Employee({
    required this.name,
    required this.basicSalary,
    required this.overtimeHours,
    required this.overtimeRate,
  });

  // Method to calculate overtime pay
  double calculateOvertimePay() {
    return overtimeHours * overtimeRate;
  }

  // Method to calculate total salary
  double calculateTotalSalary() {
    return basicSalary + calculateOvertimePay();
  }
}