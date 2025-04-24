import 'package:flutter/material.dart';
import '../screens/admin/admin_dashboard.dart';
import '../screens/admin/create_staff_screen.dart';
import '../screens/role_selector_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/login_screen.dart';
import '../screens/staff/billing_screen.dart';
import '../screens/staff/staff_login_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/splash': (context) => SplashScreen(),
  '/login': (context) => LoginScreen(role: '',),
  '/admin-dashboard': (context) => AdminDashboard(),
  '/create-staff': (context) => CreateStaffScreen(),
  '/staff-login': (context) => StaffLoginScreen(),
  '/billing': (context) => BillingScreen(),
  '/role_screen':(context) => RoleSelectorScreen(),
};
