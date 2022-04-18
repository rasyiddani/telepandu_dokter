part of 'components.dart';

class HeaderComponent extends StatelessWidget {
  final bool isBgWhite;
  final String title;
  const HeaderComponent(
      {Key? key, required this.isBgWhite, required this.title})
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
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 32,
              color:
                  isBgWhite ? CustomColor.mainColor : CustomColor.light4Color,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: CustomStyle.profileDescCard.copyWith(
              color:
                  isBgWhite ? CustomColor.mainColor : CustomColor.light4Color,
            ),
          )
        ],
      ),
    );
  }
}
