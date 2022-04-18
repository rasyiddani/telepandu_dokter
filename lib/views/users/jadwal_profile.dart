part of '../views.dart';

class JadwalProfilePage extends StatefulWidget {
  const JadwalProfilePage({Key? key}) : super(key: key);

  @override
  _JadwalProfilePageState createState() => _JadwalProfilePageState();
}

class _JadwalProfilePageState extends State<JadwalProfilePage> {
  final bool isChooseDate = false;
  bool isSelectHour1 = false;
  bool isSelectHour2 = false;
  bool isSelectHour3 = false;

  @override
  Widget build(BuildContext context) {
    Widget textWidget(String text) {
      return Padding(
        padding: const EdgeInsets.only(left: 35),
        child: Text(
          text,
          style: CustomStyle.consultTitleText.copyWith(
            fontSize: Dimensions.heading3TextSize,
            color: CustomColor.mainColor,
          ),
        ),
      );
    }

    Widget textChooseDate() {
      return Container(
        height: 60,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 35),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: CustomColor.mainColorLighter),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isChooseDate
                ? Text(
                    "20/2/2022",
                    style: CustomStyle.notifSubTitleText
                        .copyWith(fontWeight: FontWeight.bold),
                  )
                : Text(
                    "Pilih Tanggal",
                    style: CustomStyle.notifSubTitleText
                        .copyWith(color: CustomColor.dark3Color),
                  ),
            Icon(
              Icons.calendar_today,
              color: CustomColor.mainColorLighter,
            )
          ],
        ),
      );
    }

    Widget buildSwitch(bool isSelect) => Transform.scale(
          scale: 1,
          child: Switch.adaptive(
            value: isSelect,
            activeColor: Colors.white,
            activeTrackColor: CustomColor.mainColor,
            inactiveTrackColor: CustomColor.dark1Color,
            onChanged: (value) => setState(() {
              (isSelect == isSelectHour1)
                  ? isSelectHour1 = value
                  : (isSelect == isSelectHour2)
                      ? isSelectHour2 = value
                      : isSelectHour3 = value;
            }),
          ),
        );

    Widget optionHour(String jadwal, bool isSelect) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 10,
                  color: CustomColor.mainColor,
                ),
                const SizedBox(width: 10),
                Text(
                  jadwal,
                  style: CustomStyle.consultlabelText
                      .copyWith(color: CustomColor.mainColor),
                ),
              ],
            ),
            buildSwitch(isSelect),
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: CustomColor.light4Color,
        body: SafeArea(
            bottom: false,
            child: ListView(
              children: [
                const HeaderComponent(isBgWhite: true, title: ""),
                const SizedBox(height: 13),
                textWidget("Atur Jadwal"),
                const SizedBox(height: 30),
                textWidget("Tanggal"),
                const SizedBox(height: 11),
                textChooseDate(),
                const SizedBox(height: 40),
                optionHour("Shift 1 (08:00 - 10:00)", isSelectHour1),
                optionHour("Shift 2 (13:00 - 15:00)", isSelectHour2),
                optionHour("Shift 3 (17:00 - 20:00)", isSelectHour3),
              ],
            )));
  }
}
