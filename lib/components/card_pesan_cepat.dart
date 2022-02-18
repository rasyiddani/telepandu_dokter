part of 'components.dart';

class CardPesanCepat extends StatelessWidget {
  final String title;
  final String desc;
  final Function onTap;
  const CardPesanCepat(
      {Key? key, required this.title, required this.desc, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            onTap();
          },
          child: Container(
            height: 130,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: CustomStyle.notifTitleText,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                RichText(
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                        text: desc,
                        style: CustomStyle.notifTitleText
                            .copyWith(fontWeight: FontWeight.w400))),
              ],
            ),
          ),
        ),
        Divider(
          color: CustomColor.light2Color,
          thickness: 2,
        ),
      ],
    );
  }
}
