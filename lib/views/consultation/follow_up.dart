part of '../views.dart';

class FollowUpPage extends StatefulWidget {
  final int id;
  const FollowUpPage({Key? key, required this.id}) : super(key: key);

  @override
  _FollowUpPageState createState() => _FollowUpPageState();
}

class _FollowUpPageState extends State<FollowUpPage> {
  TextEditingController intruksiController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  bool isChooseDate = false;
  bool isLoading = false;

  @override
  void initState() {
    getApi();

    super.initState();
  }

  getApi() async {
    setState(() {
      isLoading = true;
    });

    await Provider.of<MessagesProvider>(context, listen: false)
        .getQuickMessages();
    await Provider.of<MessagesProvider>(context, listen: false).getDiseases();

    setState(() {
      isLoading = false;
    });
  }

  Map<String, bool> listItem = {
    'Resep Obat': false,
    'Rujukan BPJS': false,
    'Surat Keterangan': false,
    'Butuh Test Lab': false,
  };

  var holder_1 = [];
  var diseases = [];
  var selectQuickMessage = "";
  var foundResepObat = "";
  var foundRujukan = "";
  var foundSuratKeterangan = "";
  var foundTestLab = "";

  bool resepObatValue = false;
  bool rujukanBpjsValue = false;
  bool suratKeteranganValue = false;
  bool testLabValue = false;

  getItems() {
    listItem.forEach((key, value) {
      if (value == true) {
        holder_1.add(key);
      }
    });

    //set value for using in state
    final foundTestLabData = holder_1.where((e) => e == "Butuh Test Lab");
    setState(() {
      foundTestLab = foundTestLabData.isNotEmpty ? foundTestLabData.first : "";
    });
    if (foundTestLab == "Butuh Test Lab") {
      testLabValue = true;
    } else {
      testLabValue = false;
    }

    //set value resep obat
    final foundResepData = holder_1.where((e) => e == "Resep Obat");
    setState(() {
      foundResepObat = foundResepData.isNotEmpty ? foundResepData.first : "";
    });
    if (foundResepObat == "Resep Obat") {
      resepObatValue = true;
    } else {
      resepObatValue = false;
    }

    //set value rujukan data
    final foundRujukanData = holder_1.where((e) => e == "Rujukan BPJS");
    setState(() {
      foundRujukan = foundRujukanData.isNotEmpty ? foundRujukanData.first : "";
    });
    if (foundRujukan == "Rujukan BPJS") {
      rujukanBpjsValue = true;
    } else {
      rujukanBpjsValue = false;
    }

    //set value surat keterangan
    final foundSuratData = holder_1.where((e) => e == "Surat Keterangan");
    setState(() {
      foundSuratKeterangan =
          foundSuratData.isNotEmpty ? foundSuratData.first : "";
    });
    if (foundSuratKeterangan == "Surat Keterangan") {
      suratKeteranganValue = true;
    } else {
      suratKeteranganValue = false;
    }

    // Clear array after use.
    holder_1.clear();
  }

  getItemDiseases() {}

  //widget header
  Widget header() {
    return Container(
      height: 45,
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(35, 35, 35, 20),
      decoration: BoxDecoration(color: CustomColor.mainColor),
      child: Center(
          child: Text(
        "Intruksi Dokter",
        style: CustomStyle.consultlabelText
            .copyWith(color: CustomColor.light4Color),
      )),
    );
  }

  //widget date picker
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2500));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        isChooseDate = true;
      });
    }
  }

  //widget container date picker
  Widget containerDatePicker() {
    return GestureDetector(
      onTap: () {
        selectDate(context);
      },
      child: Container(
        width: double.infinity,
        height: 51,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(color: CustomColor.mainColorLighter),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              isChooseDate
                  ? "${selectedDate.toLocal()}".split(' ')[0]
                  : "Tanggal/Bulan/Tahun",
              style: CustomStyle.notifTitleText.copyWith(
                  color: CustomColor.dark3Color, fontWeight: FontWeight.w400),
            ),
            Icon(Icons.calendar_today_rounded, color: CustomColor.mainColor)
          ],
        ),
      ),
    );
  }

  //widget checkbox
  Widget chooseItem() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 55),
      child: Column(
        children: [
          Column(
              children: listItem.keys.map((key) {
            return CheckboxListTile(
              title: Text(key,
                  style: CustomStyle.notifSubTitleText.copyWith(
                    fontSize: Dimensions.heading4TextSize,
                  )),
              value: listItem[key],
              activeColor: CustomColor.mainColor,
              checkColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  listItem[key] = value!;
                  getItems();
                });
              },
            );
          }).toList()),
          foundTestLab == "Butuh Test Lab"
              ? containerDatePicker()
              : const SizedBox()
        ],
      ),
    );
  }

  //widget textbox
  Widget textBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: TextFormField(
        minLines: 5,
        maxLines: 5,
        controller: intruksiController,
        keyboardType: TextInputType.text,
        decoration: CustomStyle.textInputCustom.copyWith(
          hintText: "Type something",
          hintStyle: CustomStyle.profileTextButton.copyWith(
              fontWeight: FontWeight.w400, color: CustomColor.dark3Color),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Mohon Diisi Form Yang Kosong";
          } else {
            return null;
          }
        },
      ),
    );
  }

  //widget popup
  Widget popupMessage() {
    return AlertDialog(
      title: const Text("Apakah anda yakin?"),
      content: const Text("Data yang sudah di submit tidak dapat diubah"),
      actions: [
        TextButton(
          onPressed: () {
            kirimHandler();
            Navigator.pushNamed(context, '/loading_success');
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

  Future kirimHandler() async {
    setState(() {
      isLoading = true;
    });

    await Provider.of<ConsultProviders>(context, listen: false)
        .makeInstructions(
            widget.id,
            intruksiController.text,
            diseases,
            resepObatValue,
            rujukanBpjsValue,
            suratKeteranganValue,
            testLabValue,
            selectedDate.toLocal().toString());

    await Provider.of<ConsultProviders>(context, listen: false)
        .endConsult(widget.id);

    diseases.clear();
    intruksiController.text = '';

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    MessagesProvider messagesProvider = Provider.of<MessagesProvider>(context);

    intruksiController.text = selectQuickMessage;

    getItemDiseases(item) {
      setState(() {
        diseases.add(item);
      });
    }

    getQuickMessages(String item) {
      setState(() {
        selectQuickMessage = intruksiController.text + item;
      });
    }

    return Scaffold(
      backgroundColor: CustomColor.light4Color,
      body: Stack(
        children: [
          SafeArea(
              child: ListView(
            children: [
              header(),
              chooseItem(),
              const SizedBox(height: 25),
              textBox(),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: messagesProvider.quickMessages.map((item) {
                  var index = messagesProvider.quickMessages.indexOf(item);

                  return CardItemCepat(
                    onTapp: () {
                      getQuickMessages(messagesProvider
                              .quickMessages[index].desc
                              .toString() +
                          '\n');
                    },
                    firstIndex: (index == 0) ? true : false,
                    quickMessages: item,
                  );
                }).toList()),
              ),
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Text(
                    "Edukasi Personal",
                    style: CustomStyle.notifHeaderText,
                  )),
              const SizedBox(height: 20),
              Container(
                height: 60,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 5),
                margin: const EdgeInsets.symmetric(horizontal: 35),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.black87,
                    width: 1,
                  ),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: diseases.map((e) {
                      return CardItemWithButton(
                          name: e,
                          ontap: () {
                            setState(() {
                              diseases.remove(e);
                            });
                          });
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: messagesProvider.diseases.map((item) {
                  var index = messagesProvider.diseases.indexOf(item);

                  return CardItemCepat(
                    onTapp: () {
                      getItemDiseases(messagesProvider.diseases[index].name);
                    },
                    isQuickMessages: false,
                    firstIndex: (index == 0) ? true : false,
                    quickMessages: item,
                  );
                }).toList()),
              ),
              const SizedBox(height: 60),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: ButtonComponent(
                      title: "Kirim",
                      isGreen: true,
                      onPress: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => popupMessage());
                        // kirimHandler();
                        // Navigator.pushNamed(context, '/loading_success');
                      })),
              const SizedBox(height: 60),
            ],
          )),
          Visibility(
              visible: isLoading,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                height: double.infinity,
                width: double.infinity,
                child: const Center(
                  child: LoadingCircle(),
                ),
              ))
        ],
      ),
    );
  }
}
