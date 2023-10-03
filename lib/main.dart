import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:telemedicine_doctor/providers/providers.dart';
import 'package:telemedicine_doctor/views/consultation/av_page.dart';
import 'package:telemedicine_doctor/views/views.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        ChangeNotifierProvider(create: (context) => ListPatientProvider(context)),
        ChangeNotifierProvider(create: (context) => ConsultProviders()),
        ChangeNotifierProvider(create: (context) => MessagesProvider()),
      ],
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
            '/login': (context) => const LoginPage(),
            '/forgot_password': (context) => const ForgotPasswordPage(),
            // '/new_password': (context) =>  NewPasswordPage(),
            '/dashboard': (context) => const DashboardPage(),
            '/profile_menu': (context) => const ProfileMenuPage(),
            '/user_profile': (context) => const UserProfile(),
            '/jadwal_profile': (context) => const JadwalProfilePage(),
            '/pesan_cepat': (context) => const PesanCepatPage(),
            '/tambah_pesan_cepat': (context) => const TambahPesanCepatPage(),
            '/notification': (context) => const NotificationPage(),
            '/list_patient': (context) => const ListPatientPage(),
            '/list_month': (context) => const ListMonthPage(),
            '/av_page': (context) => const AvPage(id: 0, namePasien: "", phone: "",),
            '/chat_page': (context) => const ChatPage(roomId: '0', idPatient: 0,),
            '/follow_up': (context) => const FollowUpPage(id: 0),
            '/loading_success': (context) => const LoadingSuccess(),
          }),
    );
  }
}
