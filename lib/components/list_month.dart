part of 'components.dart';

class ListMonthComponent extends StatelessWidget {
  final ListPatientModel listMonth;
  const ListMonthComponent({Key? key, required this.listMonth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: CustomColor.light3Color,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: CustomColor.dark3Color.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "${listMonth.name}",
                  style: CustomStyle.doctorListSubTitle
                      .copyWith(fontSize: Dimensions.heading5TextSize),
                  overflow: TextOverflow.ellipsis
                ),
              ),
              Text(
                "No Antrian : ${listMonth.queueNumber}",
                style: CustomStyle.doctorListSubTitle
                    .copyWith(fontSize: Dimensions.heading5TextSize),
              )
            ],
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              (listMonth.gender != "") ? Text(
                "${listMonth.gender}, ",
                style: CustomStyle.doctorListSubTitle.copyWith(
                    fontSize: Dimensions.heading5TextSize,
                    fontWeight: FontWeight.w400),
              ) : SizedBox(),
              Text(
                "${listMonth.age} Tahun",
                style: CustomStyle.doctorListSubTitle.copyWith(
                    fontSize: Dimensions.heading5TextSize,
                    fontWeight: FontWeight.w400),
              )
            ],
          )
        ],
      ),
    );
  }
}
