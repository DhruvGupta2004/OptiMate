import 'package:flutter/material.dart';
import '../../services/dummy_storage.dart';
import '../../models/staff_model.dart';

class StaffLoginScreen extends StatefulWidget {
  @override
  State<StaffLoginScreen> createState() => _StaffLoginScreenState();
}

class _StaffLoginScreenState extends State<StaffLoginScreen> {
  final idController = TextEditingController();
  final passController = TextEditingController();
  String error = '';

  void login() {
    final id = idController.text.trim();
    final pass = passController.text.trim();
    final staff = DummyStorage.staffList.firstWhere(
          (s) => s.id == id && s.password == pass,
      orElse: () => Staff(id: '', name: '', password: '', branch: '', salary: 0),
    );

    if (staff.id.isEmpty) {
      setState(() => error = 'Invalid credentials');
    } else {
      Navigator.pushReplacementNamed(context, '/billing', arguments: staff);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Staff Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(controller: idController, decoration: InputDecoration(labelText: "Staff ID")),
          TextField(controller: passController, decoration: InputDecoration(labelText: "Password"), obscureText: true),
          SizedBox(height: 10),
          ElevatedButton(onPressed: login, child: Text("Login")),
          if (error.isNotEmpty) Text(error, style: TextStyle(color: Colors.red)),
        ]),
      ),
    );
  }
}
