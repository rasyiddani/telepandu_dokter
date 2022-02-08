import 'package:flutter/material.dart';
import 'package:telemedicine_doctor/views/auth/login.dart';
import 'package:telemedicine_doctor/views/dashboard.dart';
import 'package:telemedicine_doctor/views/notification.dart';
import 'package:telemedicine_doctor/views/splash_screen.dart';
import 'package:telemedicine_doctor/views/user_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/login': (context) => const LoginPage(),
          '/dashboard': (context) => const DashboardPage(),
          '/user_profile': (context) => const UserProfile(),
          '/notification': (context) => const NotificationPage(),
        });
  }
}
