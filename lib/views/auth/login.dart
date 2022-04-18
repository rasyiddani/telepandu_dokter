part of '../views.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  final TextEditingController? _controllerEmail = TextEditingController();
  final TextEditingController? _controllerSandi = TextEditingController();
  bool isObscure = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/ilust_background.png'),
              fit: BoxFit.fill),
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
                  const SizedBox(height: 100),
                  Text(
                    "Halo,",
                    style: CustomStyle.titleText
                        .copyWith(fontSize: Dimensions.displayTextSize),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Selamat Datang Kembali",
                    style: CustomStyle.titleText
                        .copyWith(fontSize: Dimensions.bodyLargeTextSize),
                  ),
                  const SizedBox(height: 40),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Alamat Email",
                                style: CustomStyle.labelText,
                              )),
                          const SizedBox(height: 5),
                          TextFormField(
                            controller: _controllerEmail,
                            keyboardType: TextInputType.emailAddress,
                            decoration: CustomStyle.textInputCustom.copyWith(
                              hintText: "Masukkan Alamat Email",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Mohon Diisi Form Yang Kosong";
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Kata Sandi",
                                style: CustomStyle.labelText,
                              )),
                          const SizedBox(height: 5),
                          TextFormField(
                            controller: _controllerSandi,
                            obscureText: isObscure,
                            decoration: CustomStyle.textInputCustom.copyWith(
                              hintText: "Masukkan Kata Sandi",
                              suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isObscure = !isObscure;
                                    });
                                  },
                                  child: (isObscure)
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
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/forgot_password');
                                },
                                child: Text(
                                  "Lupa kata sandi?",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: CustomColor.secondaryColor),
                                )),
                          ),
                          ButtonComponent(
                              title: "MASUK",
                              onPress: () {
                                if (_formKey.currentState!.validate()) {
                                  logIn(_controllerEmail?.text,
                                      _controllerSandi?.text);
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
                  child: const Center(
                    child: LoadingCircle(),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controllerEmail?.dispose();
    _controllerSandi?.dispose();
  }

  logIn(String? email, String? password) async {
    setState(() {
      isLoading = true;
    });

    if (await Provider.of<AuthProvider>(context, listen: false).login(
      email: email,
      password: password,
    )) {
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          content: Text(
              "Maaf Anda Tidak Bisa Login, Mohon Dicek Kembali Email dan Password"),
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }
}
