part of '../views.dart';

class ProfileMenuPage extends StatefulWidget {
  const ProfileMenuPage({Key? key}) : super(key: key);

  @override
  State<ProfileMenuPage> createState() => _ProfileMenuPageState();
}

class _ProfileMenuPageState extends State<ProfileMenuPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    //handler logout
    logoutHandler() async {
      setState(() {
        isLoading = true;
      });

      await Provider.of<AuthProvider>(context, listen: false).logout();

      setState(() {
        isLoading = false;
      });
      Navigator.pushReplacementNamed(context, '/login');
    }

    showAlertDialog(BuildContext context) {
      // set up the button
      Widget cancelButton = TextButton(
        child: Text("Batal"),
        onPressed: () {
          Navigator.pop(context);
        },
      );
      Widget continueButton = TextButton(
        child: Text("Yakin"),
        onPressed: logoutHandler,
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Peringatan"),
        content: Text("Anda Yakin Ingin Keluar?"),
        actions: [
          cancelButton,
          continueButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    return Scaffold(
      backgroundColor: CustomColor.light4Color,
      body: Stack(children: [
        SafeArea(
            bottom: false,
            child: Column(
              children: [
                const HeaderComponent(isBgWhite: true, title: ""),
                const SizedBox(height: 2),
                CardMenuProfileComponent(
                    title: "Profile",
                    icon: Icons.paste_outlined,
                    onTapp: () {
                      Navigator.pushNamed(context, '/user_profile');
                    }),
                // const SizedBox(height: 30),
                // CardMenuProfileComponent(
                //     title: "Atur Jadwal",
                //     icon: Icons.calendar_today,
                //     onTapp: () {
                //       Navigator.pushNamed(context, '/jadwal_profile');
                //     }),
                const SizedBox(height: 30),
                CardMenuProfileComponent(
                    title: "Atur Pesan Cepat",
                    icon: Icons.message_rounded,
                    onTapp: () {
                      Navigator.pushNamed(context, '/pesan_cepat');
                    }),
                const SizedBox(height: 30),
                CardMenuProfileComponent(
                    title: "Logout",
                    icon: Icons.logout,
                    onTapp: () {
                      // SharedPreferences preferences =
                      //     await SharedPreferences.getInstance();
                      // await preferences.clear();
                      // Navigator.pushReplacementNamed(context, '/login');
                      // logoutHandler();
                      showAlertDialog(context);
                      // Navigator.pushReplacementNamed(context, '/login');
                    }),
              ],
            )),
        Visibility(
            visible: isLoading,
            child: Container(
              color: Colors.black.withOpacity(0.5),
              height: double.infinity,
              width: double.infinity,
              child: const Center(
                child: LoadingCircle(),
              ),
            ))
      ]),
    );
  }
}
