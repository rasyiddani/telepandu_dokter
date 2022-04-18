part of 'components.dart';

class ButtonComponent extends StatelessWidget {
  final String title;
  final Function onPress;
  final bool isGreen;
  const ButtonComponent(
      {Key? key,
      required this.title,
      required this.onPress,
      this.isGreen = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      width: double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: isGreen
                  ? MaterialStateProperty.all(const Color(0xff008068))
                  : MaterialStateProperty.all(const Color(0xffF5AF00))),
          onPressed: () {
            onPress();
          },
          child: Text(
            title,
            style: CustomStyle.labelText.copyWith(
              fontSize: Dimensions.heading5TextSize,
              color:
                  isGreen ? CustomColor.light4Color : const Color(0xff008068),
            ),
          )),
    );
  }
}
