part of 'components.dart';

class CardItemCepat extends StatelessWidget {
  final String text;
  const CardItemCepat({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: CustomColor.mainColorLighter.withOpacity(0.6),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: CustomColor.mainColor,
          )),
      child: Center(
        child: Text(
          text,
          style: CustomStyle.notifSubTitleText.copyWith(
              fontSize: Dimensions.heading4TextSize,
              color: CustomColor.mainColor),
        ),
      ),
    );
  }
}
