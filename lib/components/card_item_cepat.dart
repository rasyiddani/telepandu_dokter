part of 'components.dart';

class CardItemCepat extends StatelessWidget {
  final MessagesModels quickMessages;
  final bool isQuickMessages;
  final bool firstIndex;
  final Function onTapp;
  const CardItemCepat(
      {Key? key,
      required this.quickMessages,
      required this.firstIndex,
      required this.onTapp,
      this.isQuickMessages = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapp();
      },
      child: Container(
        height: 34,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: firstIndex
            ? const EdgeInsets.only(left: 35, right: 5)
            : const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            color: CustomColor.mainColorLighter.withOpacity(0.6),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: CustomColor.mainColor,
            )),
        child: Center(
          child: Text(
            isQuickMessages
                ? "${quickMessages.title}"
                : "${quickMessages.name}",
            style: CustomStyle.notifSubTitleText.copyWith(
                fontSize: Dimensions.heading4TextSize,
                color: CustomColor.mainColor),
          ),
        ),
      ),
    );
  }
}
