part of 'components.dart';

class CardProfile extends StatelessWidget {
  final ListPatientModel? user;
  const CardProfile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderComponent(isBgWhite: true, title: ""),
        const SizedBox(height: 2),
        const AvatarProfileComponent(image: "assets/images/dummy_doctor.png"),
        const SizedBox(height: 60),
        CardUserProfileComponent(
          title: "Nama",
          label: "${user?.name}",
        ),
        const SizedBox(height: 16),
        const CardUserProfileComponent(
          title: "SIP",
          label: "123456789",
        ),
        const SizedBox(height: 16),
        const CardUserProfileComponent(
          title: "Lokasi Praktek",
          label: "Klinik Bandung",
        ),
        const SizedBox(height: 16),
        CardUserProfileComponent(
          title: "Email",
          label: "${user?.name}",
        ),
        const SizedBox(height: 36),
      ],
    );
  }
}
