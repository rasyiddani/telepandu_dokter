part of 'components.dart';

class ChatItemComponents extends StatelessWidget {
  final bool isChatDoctor;
  final String text;
  const ChatItemComponents(
      {Key? key, this.isChatDoctor = true, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 35, right: 35),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: isChatDoctor
                    ? CustomColor.light1Color
                    : const Color(0xFFD6FFEF)),
            child: RichText(
                text: TextSpan(
                    text: text,
                    style: CustomStyle.notifTitleText.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: Dimensions.heading4TextSize))),
          ),
          Align(
              alignment:
                  isChatDoctor ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                  transform: isChatDoctor
                      ? Matrix4.translationValues(-15, -5, 0)
                      : Matrix4.translationValues(15, -5, 0),
                  child: Trianngle(
                    isChatDoctor: isChatDoctor,
                    color: isChatDoctor
                        ? CustomColor.light1Color
                        : const Color(0xFFD6FFEF),
                  )))
        ],
      ),
    );
  }
}

class Trianngle extends StatelessWidget {
  final bool isChatDoctor;
  final Color color;
  const Trianngle({Key? key, required this.color, this.isChatDoctor = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: ShapesPainter(color: color, isChatDoctor: isChatDoctor),
        child: const SizedBox(
          height: 30,
          width: 30,
        ));
  }
}

class ShapesPainter extends CustomPainter {
  final bool isChatDoctor;
  final Color color;
  ShapesPainter({required this.color, this.isChatDoctor = true});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color;
    var path = Path();
    path.lineTo(size.width, 0);
    isChatDoctor
        ? path.lineTo(size.height, size.width)
        : path.lineTo(0, size.width);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
