part of '../views.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool statePage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.light4Color,
      body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: const [
                  HeaderComponent(isBgWhite: true, title: ""),
                  SizedBox(height: 2),
                  AvatarProfileComponent(
                      image: "assets/images/dummy_doctor.png"),
                  SizedBox(height: 60),
                  CardUserProfileComponent(
                    title: "Nama",
                    label: "Doktor Octopus",
                  ),
                  SizedBox(height: 16),
                  CardUserProfileComponent(
                    title: "SIP",
                    label: "123456789",
                  ),
                  SizedBox(height: 16),
                  CardUserProfileComponent(
                    title: "Lokasi Praktek",
                    label: "Klinik Bandung",
                  ),
                  SizedBox(height: 16),
                  CardUserProfileComponent(
                    title: "Email",
                    label: "droctopus@imel.com",
                  ),
                  SizedBox(height: 36),
                ],
              ))),
    );
  }
}
