part of 'components.dart';

class KonsulBulanComponent extends StatelessWidget {
  const KonsulBulanComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     //widget button
    Widget button() {
      return InkWell(
        onTap: () {},
        child: Container(
          height: 46,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: CustomColor.mainColor,
          ),
          child: Center(
            child: Text(
              "Lihat Jadwal",
              style: CustomStyle.profileTextButton
                  .copyWith(color: CustomColor.light4Color),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    return Container(
      height: 140,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 35),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: CustomColor.light4Color),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Konsul Bulan Ini",
              style: CustomStyle.profileDescCard
                  .copyWith(color: CustomColor.dark1Color)),
          const SizedBox(height: 20),
          button(),
        ],
      ),
    );
  }
}
