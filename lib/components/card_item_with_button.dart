part of 'components.dart';

class CardItemWithButton extends StatelessWidget {
  final String name;
  final Function ontap;
  const CardItemWithButton({Key? key, required this.name, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
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
            name,
            style: CustomStyle.notifSubTitleText.copyWith(
                fontSize: Dimensions.heading4TextSize,
                color: CustomColor.mainColor),
          ),
        ),
      ),
    );
  }
}
