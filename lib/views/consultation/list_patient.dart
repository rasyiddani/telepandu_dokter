part of '../views.dart';

class ListPatientPage extends StatefulWidget {
  const ListPatientPage({Key? key}) : super(key: key);

  @override
  _ListPatientPageState createState() => _ListPatientPageState();
}

class _ListPatientPageState extends State<ListPatientPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const HeaderComponent(isBgWhite: false, title: "Daftar Pasien"),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: const [
                SizedBox(height: 15),
                ListPatientComponent(isIndex0: true),
                ListPatientComponent(),
                ListPatientComponent(),
                ListPatientComponent(),
                ListPatientComponent(),
                ListPatientComponent(),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
