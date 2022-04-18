part of '../views.dart';

class PesanCepatPage extends StatefulWidget {
  const PesanCepatPage({Key? key}) : super(key: key);

  @override
  _PesanCepatPageState createState() => _PesanCepatPageState();
}

class _PesanCepatPageState extends State<PesanCepatPage> {
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

    await Provider.of<MessagesProvider>(context, listen: false)
        .getQuickMessages();

    setState(() {
      isLoading = false;
    });
  }

  Future onDeleteHandler(id) async {
    setState(() {
      isLoading = true;
    });

    await Provider.of<MessagesProvider>(context, listen: false)
        .deleteQuickMessage(id: id);
    getApi();

    setState(() {
      isLoading = false;
    });
  }

  //widget popup
  Widget popupMessage(id) {
    return AlertDialog(
      content: const Text("Apakah anda yakin menghapus pesan cepat ini?"),
      actions: [
        TextButton(
          onPressed: () {
            onDeleteHandler(id);
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

  @override
  Widget build(BuildContext context) {
    MessagesProvider messagesProvider = Provider.of<MessagesProvider>(context);

    return Scaffold(
      backgroundColor: CustomColor.light4Color,
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              HeaderWithButton(
                title: "Pesan Cepat",
                titleButton: "Tambah",
                onTap: () {
                  Navigator.pushNamed(context, '/tambah_pesan_cepat');
                },
              ),
              Divider(
                color: CustomColor.light2Color,
                thickness: 5,
              ),
              Expanded(
                child: isLoading
                    ? ListView(
                        children: const [
                          CardPesanCepatSkeleton(),
                          CardPesanCepatSkeleton(),
                        ],
                      )
                    : ListView(
                        physics: const BouncingScrollPhysics(),
                        children: messagesProvider.quickMessages.map((item) {
                          return CardPesanCepat(
                            onDeletePress: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      popupMessage(item.id));
                            },
                            quickMessages: item,
                          );
                        }).toList()),
              ),
            ],
          )),
    );
  }
}
