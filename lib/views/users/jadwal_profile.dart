part of '../views.dart';

class JadwalProfilePage extends StatefulWidget {
  const JadwalProfilePage({Key? key}) : super(key: key);

  @override
  _JadwalProfilePageState createState() => _JadwalProfilePageState();
}

class _JadwalProfilePageState extends State<JadwalProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.light4Color,
        body: SafeArea(
          bottom: false,
            child: ListView(
          children: [
            const HeaderComponent(isBgWhite: true, title: ""),
            const SizedBox(height: 13),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                "Atur Jadwal",
                style: CustomStyle.consultTitleText.copyWith(
                  fontSize: Dimensions.heading3TextSize,
                  color: CustomColor.mainColor,
                ),
              ),
            )
          ],
        )));
  }
}
