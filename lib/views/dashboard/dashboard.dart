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

    print(nameDoctorResult);

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
                  isLoading
                      ? const CardHariIniSkeleton()
                      : KonsulHariComponent(
                          listDataQueue: listPatientProvider.queue),
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
}
