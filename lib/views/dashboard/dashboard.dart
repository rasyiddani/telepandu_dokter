part of '../views.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late bool isLoading = false;
  String nameDoctor = "";
  List<String> splitedName = [];
  String nameDoctorResult = "";

  @override
  void initState() {
    getApi();

    super.initState();
  }

  getApi() async {
    setState(() {
      isLoading = true;
    });

    await Provider.of<ListPatientProvider>(context, listen: false)
        .getDataQueue(context);

    await Provider.of<AuthProvider>(context, listen:false).getUserProfile();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    ListPatientProvider listPatientProvider =
        Provider.of<ListPatientProvider>(context);

    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    setState(() {
      nameDoctor = "${authProvider.profile?.name}";
      splitedName = nameDoctor.split(" ");
      nameDoctorResult = splitedName[0];
    });

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
                  "Halo, Dr $nameDoctorResult",
                  style: TextStyle(fontSize: Dimensions.leadParagraphTextSize),
                ),
              ],
            ),
            // InkWell(
            //   onTap: () {
            //     Navigator.pushNamed(context, '/notification');
            //   },
            //   child: Icon(
            //     Icons.notifications,
            //     size: 32,
            //     color: CustomColor.mainColor,
            //   ),
            // )
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
                  isLoading
                      ? const CardHariIniSkeleton()
                      : KonsulHariComponent(
                          listDataQueue: listPatientProvider.queue),
                  // Visibility(
                  //   // visible: isConsultStarted,
                  //   visible: true,
                  //   child: buttonInfo(
                  //       "Konsul Sedang Berlangsung",
                  //       "Kembali ke Konsultasi",
                  //       CustomColor.white,
                  //       CustomColor.errorColor,2),
                  // ),
                  const SizedBox(height: 35),
                  const KonsulBulanComponent(),
                ],
              ),
            ),
            Visibility(
                visible: isLoading,
                child: Container(
                  color: CustomColor.mainColor.withOpacity(0.2),
                  height: double.infinity,
                  width: double.infinity,
                  child: const Center(
                    child: LoadingCircle(),
                  ),
                ))
          ],
        ),
      ),
    );
  }

Container buttonInfo(String title, String textButton, Color textColor,
    Color colorButton, int id) {
  return Container(
    margin: const EdgeInsets.all(20),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
        ),
        color: CustomColor.white,
        borderRadius: BorderRadius.circular(15)),
    width: 290,
    child: Column(
      children: [
        Text(
          title,
          style: TextStyle(
              fontFamily: 'Lexend',
              fontSize: Dimensions.leadParagraphTextSize,
              color: CustomColor.mainColor,
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 46),
              primary: colorButton,
            ),
            onPressed: () {
              switch (id) {
                case 1:
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const ConsultRegistration()));
                  break;
                case 2:
                  // if (cekStatusKonsul == "with doctor") {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) =>
                  //           const VideoCallRoomDoctor()));
                  // } else if (cekStatusKonsul == "with pharmacist") {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) =>
                  //           const VideoCallRoomApoteker()));
                  // } else if (cekStatusKonsul == "with nurse") {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) =>
                  //           const VideoCallRoomPerawat()));
                  // } else if (cekStatusKonsul ==
                  //     "waiting for doctor instruction") {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) =>
                  //           const WaitingRoomInstruksi()));
                  // } else if (cekStatusKonsul == "waiting for pharmacist") {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) =>
                  //           const WaitingRoomApoteker()));
                  // } else if (cekStatusKonsul == "waiting for nurse") {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) =>
                  //           const WaitingRoomPerawat()));
                  // } else {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) =>
                  //           const ResepPaymentDetail()));
                  // }

                  break;
                case 3:
                  // if (Provider.of<DetailKonsulProvider>(context,
                  //     listen: false)
                  //     .konsul!
                  //     .statusKonsul ==
                  //     "in queue") {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) =>
                  //           const ConsultRegistSuccess()));
                  // } else if (Provider.of<DetailKonsulProvider>(context,
                  //     listen: false)
                  //     .konsul!
                  //     .statusKonsul ==
                  //     "cancel") {
                  //   setState(() {
                  //     isRegisFinished = false;
                  //   });
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) =>
                  //           const ConsultRegistExpired()));
                  // } else if (Provider.of<DetailKonsulProvider>(context,
                  //     listen: false)
                  //     .konsul!
                  //     .statusKonsul ==
                  //     "declined") {
                  //   setState(() {
                  //     isRegisFinished = false;
                  //   });
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) =>
                  //           const ConsultRegistFailed()));
                  // } else if (Provider.of<DetailKonsulProvider>(context,
                  //     listen: false)
                  //     .konsul!
                  //     .statusKonsul ==
                  //     "waiting for payment") {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) =>
                  //           const ConsultRegistPending()));
                  // } else {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) =>
                  //           const ConsultRegistSuccess()));
                  // }

                  break;
              }
            },
            child: Text(
              textButton,
              style: TextStyle(color: textColor),
            ))
      ],
    ),
  );
}
}
