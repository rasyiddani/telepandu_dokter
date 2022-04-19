part of 'components.dart';

class KonsulHariComponent extends StatelessWidget {
  final ListPatientModel? listDataQueue;
  const KonsulHariComponent({Key? key, required this.listDataQueue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //widget button
    Widget button() {
      return InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/list_patient');
        },
        child: Container(
          height: 46,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: CustomColor.secondaryColor,
          ),
          child: Center(
            child: Text(
              "Mulai Konsul",
              style: CustomStyle.profileTextButton
                  .copyWith(color: CustomColor.mainColor),
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
          color: CustomColor.mainColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Konsultasi Hari Ini", style: CustomStyle.profileDescCard),
          const SizedBox(height: 10),
          button(),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Kuota Hari Ini :",
                style: CustomStyle.consultTextButton
                    .copyWith(fontWeight: FontWeight.normal),
              ),
              Text((listDataQueue?.queu == null) ? "0/30 Pasien" :
                  "${listDataQueue?.queu}/${listDataQueue?.queueTotal} Pasien",
                  style: CustomStyle.consultTextButton)
            ],
          )
        ],
      ),
    );
  }
}
