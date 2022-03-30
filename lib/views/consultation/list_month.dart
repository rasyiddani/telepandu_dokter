part of '../views.dart';

class ListMonthPage extends StatefulWidget {
  const ListMonthPage({Key? key}) : super(key: key);

  @override
  _ListMonthPageState createState() => _ListMonthPageState();
}

class _ListMonthPageState extends State<ListMonthPage> {
  bool isLoading = false;
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");

  onSelectDate(date) async {
    setState(() {
      isLoading = true;
    });

    await Provider.of<ListPatientProvider>(context, listen: false)
        .getListMonth(date);

    setState(() {
      isLoading = false;
    });
  }

  //Widget calendar
  Widget calendar() {
    return Container(
      height: 284,
      margin: const EdgeInsets.symmetric(horizontal: 35),
      child: SfCalendar(
        // onTap: ontap(),
        view: CalendarView.month,
        todayHighlightColor: CustomColor.mainColor,
        cellBorderColor: CustomColor.dark4Color,
        monthViewSettings: const MonthViewSettings(
            showTrailingAndLeadingDates: false, dayFormat: 'EEE'),
        headerStyle: CalendarHeaderStyle(
          textAlign: TextAlign.center,
          backgroundColor: CustomColor.mainColor,
          textStyle: TextStyle(
              fontSize: 14,
              color: CustomColor.light4Color,
              fontWeight: FontWeight.bold),
        ),
        viewHeaderStyle: ViewHeaderStyle(
            backgroundColor: CustomColor.dark4Color,
            dayTextStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: CustomColor.dark1Color,
            ),
            dateTextStyle: TextStyle(
                color: CustomColor.dark1Color,
                fontSize: 12,
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget newCalendar() {
    return Container(
      height: 284,
      margin: const EdgeInsets.symmetric(horizontal: 35),
      child: CalendarDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2222),
        onDateChanged: (DateTime selectedDate) {
          String formatDate = dateFormat.format(selectedDate);
          onSelectDate(formatDate);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ListPatientProvider listPatientProvider =
        Provider.of<ListPatientProvider>(context);

    return Scaffold(
      backgroundColor: CustomColor.light4Color,
      body: SafeArea(
          child: Column(
        children: [
          const HeaderComponent(
              isBgWhite: false, title: "Konsultasi Bulan Ini"),
          const SizedBox(height: 30),
          newCalendar(),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: listPatientProvider.listMonth.map((item) {
                return ListMonthComponent(listMonth: item);
              }).toList(),

              // children: const [
              //   ListMonthComponent(),
              //   ListMonthComponent(),
              //   ListMonthComponent(),
              //   ListMonthComponent(),
              //   ListMonthComponent(),
              // ]
            ),
          ),
        ],
      )),
    );
  }
}
