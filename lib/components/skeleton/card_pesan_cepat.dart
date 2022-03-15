part of '../components.dart';

class CardPesanCepatSkeleton extends StatelessWidget {
  const CardPesanCepatSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 130,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12,
                width: 150,
                child: LinearProgressIndicator(
                  backgroundColor: CustomColor.dark3Color.withOpacity(0.5),
                  valueColor: AlwaysStoppedAnimation<Color>(
                      CustomColor.dark3Color.withOpacity(0.5)),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 10,
                child: LinearProgressIndicator(
                  backgroundColor: CustomColor.dark3Color.withOpacity(0.5),
                  valueColor: AlwaysStoppedAnimation<Color>(
                      CustomColor.dark3Color.withOpacity(0.5)),
                ),
              ),
              const SizedBox(height: 3),
              SizedBox(
                height: 10,
                child: LinearProgressIndicator(
                  backgroundColor: CustomColor.dark3Color.withOpacity(0.5),
                  valueColor: AlwaysStoppedAnimation<Color>(
                      CustomColor.dark3Color.withOpacity(0.5)),
                ),
              ),
              const SizedBox(height: 3),
              SizedBox(
                height: 10,
                child: LinearProgressIndicator(
                  backgroundColor: CustomColor.dark3Color.withOpacity(0.5),
                  valueColor: AlwaysStoppedAnimation<Color>(
                      CustomColor.dark3Color.withOpacity(0.5)),
                ),
              ),
              const SizedBox(height: 3),
              SizedBox(
                height: 10,
                child: LinearProgressIndicator(
                  backgroundColor: CustomColor.dark3Color.withOpacity(0.5),
                  valueColor: AlwaysStoppedAnimation<Color>(
                      CustomColor.dark3Color.withOpacity(0.5)),
                ),
              ),
            ],
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
