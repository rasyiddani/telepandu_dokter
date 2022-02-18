part of '../views.dart';

class TambahPesanCepatPage extends StatefulWidget {
  final bool isTambah;
  const TambahPesanCepatPage({Key? key, this.isTambah = true})
      : super(key: key);

  @override
  _TambahPesanCepatPageState createState() => _TambahPesanCepatPageState();
}

class _TambahPesanCepatPageState extends State<TambahPesanCepatPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.light4Color,
      body: SafeArea(
          bottom: false,
          child: ListView(
            children: [
              widget.isTambah
                  ? HeaderWithButton(
                      title: "",
                      titleButton: "Tambah",
                      onTap: () {},
                    )
                  : HeaderWithButton(
                      title: "",
                      titleButton: "Edit",
                      onTap: () {},
                    ),
              const SizedBox(height: 13),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Text(
                        "Judul",
                        style: CustomStyle.consultTitleText.copyWith(
                          fontSize: Dimensions.heading3TextSize,
                          color: CustomColor.mainColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 11),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: TextFormField(
                        minLines: 1,
                        maxLines: 5,
                        controller: titleController,
                        keyboardType: TextInputType.text,
                        decoration: CustomStyle.textInputCustom.copyWith(
                          hintText: "Type something",
                          hintStyle: CustomStyle.profileTextButton.copyWith(
                              fontWeight: FontWeight.w400,
                              color: CustomColor.dark3Color),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Mohon Diisi Form Yang Kosong";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: TextFormField(
                        minLines: 5,
                        maxLines: 10,
                        controller: descController,
                        keyboardType: TextInputType.text,
                        decoration: CustomStyle.textInputCustom.copyWith(
                          hintText: "Type something",
                          hintStyle: CustomStyle.profileTextButton.copyWith(
                              fontWeight: FontWeight.w400,
                              color: CustomColor.dark3Color),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Mohon Diisi Form Yang Kosong";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
