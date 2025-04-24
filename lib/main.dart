import 'package:flutter/material.dart';
import 'config/routes.dart';

void main() {
  runApp(OptiMateApp());
}

class OptiMateApp extends StatelessWidget {
  const OptiMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OptiMate',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/splash',
      routes: appRoutes,
    );
  }
}
