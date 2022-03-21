part of 'components.dart';

class CardPesanCepat extends StatelessWidget {
  final MessagesModels quickMessages;
  final Function onDeletePress;
  const CardPesanCepat(
      {Key? key, required this.quickMessages, required this.onDeletePress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onLongPress: () {
            onDeletePress();
          },
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TambahPesanCepatPage(
                      isTambah: false, id: quickMessages.id),
                ));
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
                  quickMessages.title.toString(),
                  style: CustomStyle.notifTitleText,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                RichText(
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                        text: quickMessages.desc,
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
