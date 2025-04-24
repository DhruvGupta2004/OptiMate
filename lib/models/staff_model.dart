class Staff {
  String id;
  String name;
  String password;
  String branch;
  double salary;
  int totalSales;

  Staff({
    required this.id,
    required this.name,
    required this.password,
    required this.branch,
    required this.salary,
    this.totalSales = 0,
  });
}
