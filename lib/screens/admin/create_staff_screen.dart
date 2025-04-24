import 'package:flutter/material.dart';
import '../../models/staff_model.dart';
import '../../services/dummy_storage.dart';

class CreateStaffScreen extends StatefulWidget {
  @override
  State<CreateStaffScreen> createState() => _CreateStaffScreenState();
}

class _CreateStaffScreenState extends State<CreateStaffScreen> {
  final _formKey = GlobalKey<FormState>();

  final idController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final branchController = TextEditingController();
  final salaryController = TextEditingController();

  void saveStaff() {
    if (_formKey.currentState!.validate()) {
      DummyStorage.addStaff(Staff(
        id: idController.text.trim(),
        name: nameController.text.trim(),
        password: passwordController.text.trim(),
        branch: branchController.text.trim(),
        salary: double.parse(salaryController.text.trim()),
      ));

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Staff')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(controller: idController, decoration: InputDecoration(labelText: 'Staff ID'), validator: (val) => val!.isEmpty ? 'Required' : null),
            TextFormField(controller: nameController, decoration: InputDecoration(labelText: 'Name'), validator: (val) => val!.isEmpty ? 'Required' : null),
            TextFormField(controller: passwordController, decoration: InputDecoration(labelText: 'Password'), validator: (val) => val!.isEmpty ? 'Required' : null),
            TextFormField(controller: branchController, decoration: InputDecoration(labelText: 'Branch'), validator: (val) => val!.isEmpty ? 'Required' : null),
            TextFormField(controller: salaryController, decoration: InputDecoration(labelText: 'Salary'), keyboardType: TextInputType.number, validator: (val) => val!.isEmpty ? 'Required' : null),
            SizedBox(height: 20),
            ElevatedButton(onPressed: saveStaff, child: Text('Save Staff'))
          ]),
        ),
      ),
    );
  }
}
