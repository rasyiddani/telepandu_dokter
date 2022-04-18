part of 'components.dart';

class CardUserProfileComponent extends StatelessWidget {
  final String title;
  final String label;
  const CardUserProfileComponent(
      {Key? key, required this.title, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: CustomStyle.labelText.copyWith(color: CustomColor.mainColor),
          ),
          const SizedBox(height: 11),
          Container(
            height: 61,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: CustomColor.mainColorLighter),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                label,
                style: CustomStyle.profileTextButton.copyWith(
                    fontWeight: FontWeight.w400, color: CustomColor.dark3Color),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
