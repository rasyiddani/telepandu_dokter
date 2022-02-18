part of 'views.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences sharedPreferences;
  late String finalToken;

  @override
  void initState() {
    super.initState();
    getValidToken().whenComplete(() {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacementNamed(
              context, (finalToken == 'null') ? '/login' : '/dashboard'));
    });
  }

  Future getValidToken() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var obtainedToken = sharedPreferences.getString("token");
    setState(() {
      finalToken = obtainedToken.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_splash.png',
              width: 200,
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
