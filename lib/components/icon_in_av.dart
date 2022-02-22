part of 'components.dart';

class IconAvComponents extends StatelessWidget {
  final IconData icon;
  final bool isEndCall;
  const IconAvComponents({Key? key, required this.icon, this.isEndCall = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 52,
        width: 52,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(52 / 2),
            color: isEndCall
                ? CustomColor.errorColor
                : const Color(0xFFD6FFEF).withOpacity(0.5)),
        child: Center(
          child: Icon(
            icon,
            size: 30,
            color: CustomColor.light4Color,
          ),
        ),
      ),
    );
  }
}
