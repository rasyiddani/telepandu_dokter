part of 'components.dart';

class HeaderWithButton extends StatelessWidget {
  final bool isBgWhite;
  final String title;
  final String titleButton;
  final Function onTap;
  const HeaderWithButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.isBgWhite = true,
      required this.titleButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: const EdgeInsets.all(35),
      decoration: BoxDecoration(
        color: isBgWhite ? CustomColor.light4Color : CustomColor.mainColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 32,
                  color: isBgWhite
                      ? CustomColor.mainColor
                      : CustomColor.light4Color,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: CustomStyle.profileDescCard.copyWith(
                  color: isBgWhite
                      ? CustomColor.mainColor
                      : CustomColor.light4Color,
                ),
              )
            ],
          ),
          InkWell(
            onTap: () {
              onTap();
            },
            child: Container(
              height: 40,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: CustomColor.mainColor),
                color: title == '' ? CustomColor.mainColor : Colors.white,
              ),
              child: Center(
                child: Text(
                  titleButton,
                  style: CustomStyle.doctorListSubTitle.copyWith(
                      fontSize: Dimensions.heading5TextSize,
                      color:
                          title == '' ? Colors.white : CustomColor.dark1Color),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
