part of '../views.dart';

class LoadingSuccess extends StatelessWidget {
  const LoadingSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Berhasil Menambahkan Instruksi Ke Pasien",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: Dimensions.heading2TextSize,
                  fontWeight: FontWeight.w700)),
          SizedBox(height: 40),
          Lottie.asset('assets/animations/checked_animation.json'),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: CustomColor.mainColor),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/loading_success');
              },
              child: Text(
                "Kembali ke Dashboard",
                style: TextStyle(fontSize: Dimensions.defaultTextSize),
              ))
        ],
      )),
    );
  }
}
