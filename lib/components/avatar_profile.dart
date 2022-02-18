part of 'components.dart';

class AvatarProfileComponent extends StatelessWidget {
  final String image;
  const AvatarProfileComponent({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(140 / 2),
        image: const DecorationImage(
            image: AssetImage("assets/images/dummy_doctor.png"),
            fit: BoxFit.contain),
      ),
    );
  }
}
