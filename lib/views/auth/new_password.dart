part of '../views.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  bool isLoading = false;
  final TextEditingController? _controllerPassword = TextEditingController();
  final TextEditingController? _controllerRepassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isObscure1 = true;
  bool isObscure2 = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/ilust_background.png'),
              fit: BoxFit.cover),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff00B896), Color(0xff00796B)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Ganti Kata Sandi",
                      style: CustomStyle.titleText
                          .copyWith(fontSize: Dimensions.heading2TextSize),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Align(
                  //   alignment: Alignment.center,
                  //   child: Text(
                  //     "Kami telah mengirim link ganti kata sandi melalui alamat email anda.",
                  //     style: CustomStyle.titleText
                  //         .copyWith(fontSize: Dimensions.bodyLargeTextSize),
                  //     textAlign: TextAlign.center,
                  //   ),
                  // ),
                  const SizedBox(height: 40),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Kata Sandi Baru",
                                style: CustomStyle.labelText,
                              )),
                          const SizedBox(height: 5),
                          TextFormField(
                            controller: _controllerPassword,
                            obscureText: isObscure1,
                            decoration: CustomStyle.textInputCustom.copyWith(
                              hintText: "Masukkan Kata Sandi",
                              suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isObscure1 = !isObscure1;
                                    });
                                  },
                                  child: (isObscure1)
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility)),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Mohon Diisi Form Yang Kosong";
                              } else {
                                if (value.length < 8) {
                                  return "Kata Sandi Minimal 8 digit";
                                }
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Konfirmasi Kata Sandi",
                                style: CustomStyle.labelText,
                              )),
                          const SizedBox(height: 5),
                          TextFormField(
                            controller: _controllerRepassword,
                            obscureText: isObscure2,
                            decoration: CustomStyle.textInputCustom.copyWith(
                              hintText: "Konfirmasi Kata Sandi",
                              suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isObscure2 = !isObscure2;
                                    });
                                  },
                                  child: (isObscure2)
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility)),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Mohon Diisi Form Yang Kosong";
                              } else {
                                if (value.length < 8) {
                                  return "Kata Sandi Minimal 8 digit";
                                }
                                // if (_controllerRepassword !=
                                //     _controllerPassword) {
                                //   return "Kata Sandi Tidak Cocok";
                                // }
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 60),
                          ButtonComponent(
                              title: "KONFIRMASI",
                              onPress: () async{
                                if (_formKey.currentState!.validate()) {
                                  setState((){
                                    isLoading= true;
                                  });
                                  if (_controllerPassword?.text ==
                                      _controllerRepassword?.text) {
                                    await Provider.of<AuthProvider>(context, listen: false).resetPassword(widget.email, _controllerPassword!.text);
                                    setState((){
                                      isLoading= false;
                                    });
                                    var status = Provider.of<AuthProvider>(context, listen: false).statusReset;
                                    if(status){
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Password Berhasil Diganti"),
                                        backgroundColor: Colors.green,));
                                      Navigator.pushReplacementNamed(
                                          context, '/login');
                                    }else{
                                      showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title:
                                              const Text("Pemberitahuan"),
                                              content: const Text(
                                                  "Maaf Anda Gagal Reset Password, Mohon Cek Kembali Email Anda"),
                                              actions: [
                                                TextButton(
                                                    child:
                                                    const Text('Kembali'),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    }),
                                              ],
                                            );
                                          });
                                    }
                                  }else{
                                    setState((){
                                      isLoading= false;
                                    });
                                    showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title:
                                            const Text("Pemberitahuan"),
                                            content: const Text(
                                                "Masukkan Password Yang Sama"),
                                            actions: [
                                              TextButton(
                                                  child:
                                                  const Text('Kembali'),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  }),
                                            ],
                                          );
                                        });
                                  }

                                }
                              }),
                        ],
                      ))
                ],
              ),
            ),
            Visibility(
                visible: isLoading,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  height: double.infinity,
                  width: double.infinity,
                  child: Center(
                    child:
                        CircularProgressIndicator(color: CustomColor.mainColor),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
