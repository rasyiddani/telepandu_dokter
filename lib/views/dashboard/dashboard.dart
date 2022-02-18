part of '../views.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool stateObat = false;
  bool stateDokter = false;
  bool stateLab = false;

  @override
  Widget build(BuildContext context) {
    //widget Header
    Widget header() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/profile_menu');
                  },
                  child: Icon(
                    Icons.account_circle,
                    size: 36,
                    color: CustomColor.mainColor,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "Halo, Doctor!",
                  style: TextStyle(fontSize: Dimensions.leadParagraphTextSize),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/notification');
              },
              child: Icon(
                Icons.notifications,
                size: 32,
                color: CustomColor.mainColor,
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: CustomColor.light4Color,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Positioned(
              bottom: 0.0,
              height: MediaQuery.of(context).size.height * 0.70,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                    color: CustomColor.light1Color,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(30))),
              ),
            ),
            Positioned(
              bottom: 0.0,
              height: MediaQuery.of(context).size.height * 0.50,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/ilust_doctor.png"),
                        fit: BoxFit.fill)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(height: 30),
                  header(),
                  const SizedBox(height: 35),
                  Divider(
                    color: CustomColor.light2Color,
                    thickness: 5,
                  ),
                  const SizedBox(height: 35),
                  const KonsulHariComponent(),
                  const SizedBox(height: 35),
                  const KonsulBulanComponent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
