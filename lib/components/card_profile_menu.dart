part of 'components.dart';

class CardMenuProfileComponent extends StatelessWidget {
  final Function onTapp;
  final String title;
  final IconData icon;
  const CardMenuProfileComponent(
      {Key? key,
      required this.icon,
      required this.title,
      required this.onTapp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 35),
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(CustomColor.mainColor)),
          onPressed: () {
            onTapp();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: CustomStyle.labelText.copyWith(
                  fontSize: Dimensions.heading5TextSize,
                  color: CustomColor.light4Color,
                ),
              ),
              const SizedBox(width: 10),
              Icon(icon),
            ],
          )),
    );
  }
}
