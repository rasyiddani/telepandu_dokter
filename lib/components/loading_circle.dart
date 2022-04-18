part of 'components.dart';

class LoadingCircle extends StatelessWidget {
  const LoadingCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: 80,
          width: 80,
          child: CircularProgressIndicator(
            color: CustomColor.mainColor
          ),
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                  fit: BoxFit.fill)),
        ),
      )
    ]);
  }
}
