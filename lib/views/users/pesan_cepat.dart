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
                            quickMessages: item,
                          );
                        }).toList()),
              ),
            ],
          )),
    );
  }
}
