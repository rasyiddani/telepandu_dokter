import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telemedicine_doctor/providers/providers.dart';
import 'package:telemedicine_doctor/views/views.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
            '/login': (context) => const LoginPage(),
            '/forgot_password': (context) => const ForgotPasswordPage(),
            '/new_password': (context) => const NewPasswordPage(),
            '/dashboard': (context) => const DashboardPage(),
            '/profile_menu': (context) => const ProfileMenuPage(),
            '/user_profile': (context) => const UserProfile(),
            '/jadwal_profile': (context) => const JadwalProfilePage(),
            '/pesan_cepat': (context) => const PesanCepatPage(),
            '/tambah_pesan_cepat': (context) => const TambahPesanCepatPage(),
            '/edit_pesan_cepat': (context) => const TambahPesanCepatPage(isTambah: false),
            '/notification': (context) => const NotificationPage(),
            '/list_patient': (context) => const ListPatientPage(),
          }),
    );
  }
}
