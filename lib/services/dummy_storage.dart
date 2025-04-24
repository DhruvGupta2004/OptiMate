import '../models/staff_model.dart';

class DummyStorage {
  static List<Staff> staffList = [];

  static void addStaff(Staff staff) {
    staffList.add(staff);
  }

  static List<Staff> getStaff() {
    return staffList;
  }
}
