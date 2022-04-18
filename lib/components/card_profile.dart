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
        CardUserProfileComponent(
          title: "SIP",
          label: "${user?.sip}",
        ),
        const SizedBox(height: 16),
        CardUserProfileComponent(
          title: "Lokasi Praktek",
          label: "${user?.branch}",
        ),
        const SizedBox(height: 16),
        CardUserProfileComponent(
          title: "Email",
          label: "${user?.email}",
        ),
        const SizedBox(height: 36),
      ],
    );
  }
}
