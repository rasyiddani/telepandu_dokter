part of '../views.dart';

class ListPatientPage extends StatefulWidget {
  const ListPatientPage({Key? key}) : super(key: key);

  @override
  _ListPatientPageState createState() => _ListPatientPageState();
}

class _ListPatientPageState extends State<ListPatientPage> {
  late bool isLoading;

  @override
  void initState() {
    getApi();

    super.initState();
  }

  getApi() async {
    setState(() {
      isLoading = true;
    });

    await Provider.of<ListPatientProvider>(context, listen: false)
        .getListToday(BuildContext);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    ListPatientProvider listPatientProvider =
        Provider.of<ListPatientProvider>(context);

    Widget popupMessageSkip() {
      return AlertDialog(
        content: const Text("Apakah anda yakin skip pasien?"),
        actions: [
          TextButton(
            onPressed: () async {
              getApi();
              Navigator.pop(context, 'Cancel');
            },
            child: const Text('Ya'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Batal', style: TextStyle(color: Colors.red)),
          ),
        ],
      );
    }

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const HeaderComponent(isBgWhite: false, title: "Daftar Pasien"),
          Expanded(
            child: isLoading
                ? Column(
                    children: const [
                      ListTodaySkeleton(),
                      ListTodaySkeleton(),
                    ],
                  )
                : ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: listPatientProvider.listToday.map((item) {
                      //get index number
                      var index = listPatientProvider.listToday.indexOf(item);

                      return ListPatientComponent(
                        isIndex0: (index == 0) ? true : false,
                        listToday: item,
                        ontappMulai: () {},
                        ontappSkip: () {
                          getApi();
                          // showDialog(
                          //     context: context,
                          //     builder: (BuildContext context) =>
                          //         popupMessageSkip());
                        },
                      );
                    }).toList(),
                  ),
          )
        ],
      ),
    ));
  }
}
