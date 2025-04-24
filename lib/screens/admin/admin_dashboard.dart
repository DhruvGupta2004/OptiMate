import 'package:flutter/material.dart';
import '../../services/dummy_storage.dart';
import '../../models/staff_model.dart';

class AdminDashboard extends StatefulWidget {
  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    List<Staff> staffList = DummyStorage.getStaff();

    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/create-staff').then((_) => setState(() {}));
            },
          ),
        ],
      ),
      body: staffList.isEmpty
          ? Center(child: Text('No staff added yet.'))
          : ListView.builder(
        itemCount: staffList.length,
        itemBuilder: (context, index) {
          final staff = staffList[index];
          return ListTile(
            title: Text('${staff.name} - ${staff.branch}'),
            subtitle: Text('Salary: ₹${staff.salary} | Sales: ₹${staff.totalSales}'),
          );
        },
      ),
    );
  }
}
