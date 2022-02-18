part of '../views.dart';

class ProfileMenuPage extends StatelessWidget {
  const ProfileMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.light4Color,
      body: SafeArea(
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
              const SizedBox(height: 30),
              CardMenuProfileComponent(
                  title: "Atur Jadwal",
                  icon: Icons.calendar_today,
                  onTapp: () {
                    Navigator.pushNamed(context, '/jadwal_profile');
                  }),
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
                  onTapp: () async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    await preferences.clear();
                    Navigator.pushReplacementNamed(context, '/login');
                  }),
            ],
          )),
    );
  }
}
