part of '../views.dart';

class PesanCepatPage extends StatefulWidget {
  const PesanCepatPage({Key? key}) : super(key: key);

  @override
  _PesanCepatPageState createState() => _PesanCepatPageState();
}

class _PesanCepatPageState extends State<PesanCepatPage> {
  @override
  Widget build(BuildContext context) {
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
                child:
                    ListView(physics: const BouncingScrollPhysics(), children: [
                  CardPesanCepat(
                    title: "Lorem Ipsum",
                    desc:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi viverra vehicula lectus sit amet fermentum. Suspendisse sagittis odio lacus, sed cursus tellus accumsan vitae. Maecenas vulputate nulla eu metus vestibulum euismod. Duis porta metus ut arcu bibendum mollis. Vivamus consequat erat felis, ",
                    onTap: () {
                      Navigator.pushNamed(context, '/edit_pesan_cepat');
                    },
                  ),
                  CardPesanCepat(
                    title: "Lorem Ipsum",
                    desc:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi viverra vehicula lectus sit amet fermentum. Suspendisse sagittis odio lacus, sed cursus tellus accumsan vitae. Maecenas vulputate nulla eu metus vestibulum euismod. Duis porta metus ut arcu bibendum mollis. Vivamus consequat erat felis, ",
                    onTap: () {
                      Navigator.pushNamed(context, '/edit_pesan_cepat');
                    },
                  ),
                  CardPesanCepat(
                    title: "Lorem Ipsum",
                    desc:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi viverra vehicula lectus sit amet fermentum. Suspendisse sagittis odio lacus, sed cursus tellus accumsan vitae. Maecenas vulputate nulla eu metus vestibulum euismod. Duis porta metus ut arcu bibendum mollis. Vivamus consequat erat felis, ",
                    onTap: () {
                      Navigator.pushNamed(context, '/edit_pesan_cepat');
                    },
                  ),
                  CardPesanCepat(
                    title: "Lorem Ipsum",
                    desc:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi viverra vehicula lectus sit amet fermentum. Suspendisse sagittis odio lacus, sed cursus tellus accumsan vitae. Maecenas vulputate nulla eu metus vestibulum euismod. Duis porta metus ut arcu bibendum mollis. Vivamus consequat erat felis, ",
                    onTap: () {
                      Navigator.pushNamed(context, '/edit_pesan_cepat');
                    },
                  ),
                  CardPesanCepat(
                    title: "Lorem Ipsum",
                    desc:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi viverra vehicula lectus sit amet fermentum. Suspendisse sagittis odio lacus, sed cursus tellus accumsan vitae. Maecenas vulputate nulla eu metus vestibulum euismod. Duis porta metus ut arcu bibendum mollis. Vivamus consequat erat felis, ",
                    onTap: () {
                      Navigator.pushNamed(context, '/edit_pesan_cepat');
                    },
                  ),
                ]),
              ),
            ],
          )),
    );
  }
}
