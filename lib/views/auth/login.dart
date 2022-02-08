import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:telemedicine_doctor/utils/colors.dart';
import 'package:telemedicine_doctor/utils/custom_style.dart';
import 'package:telemedicine_doctor/utils/dimensions.dart';

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
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff00B896), Color(0xff00796B)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Halo,",
                    // style: CustomStyle.titleText
                    //     .copyWith(fontSize: Dimensions.displayTextSize),
                  ),
                  Text(
                    "Selamat Datang Kembali",
                    style: CustomStyle.titleText
                        .copyWith(fontSize: Dimensions.bodyLargeTextSize),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Email",
                                style: CustomStyle.labelText,
                              )),
                          const SizedBox(height: 5),
                          TextFormField(
                            controller: _controllerEmail,
                            keyboardType: TextInputType.emailAddress,
                            decoration: CustomStyle.textInputCustom.copyWith(
                              // labelText: "Nama Lengkap",
                              hintText: "sandy@gmail.com",
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
                                  // Get.toNamed('/forget');
                                },
                                child: Text(
                                  "Lupa kata sandi?",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: CustomColor.secondaryColor),
                                )),
                          ),
                          SizedBox(
                            height: 46,
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xffF5AF00))),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // print(_controllerSandi?.text);
                                    logIn(_controllerEmail?.text,
                                        _controllerSandi?.text);
                                  }
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(color: Color(0xff008068)),
                                )),
                          )
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

  void dispose() {
    super.dispose();
    _controllerEmail?.dispose();
    _controllerSandi?.dispose();
  }

  logIn(String? email, String? password) async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {'email': email, 'password': password};
    // var jsonResponse = null;
    const url = 'http://telemedicine-test.akunku.co/api/auth/login';
    var response = await http.post(Uri.parse(url), body: data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      // Get.offNamed('/dashboard');
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      setState(() {
        isLoading = false;
      });
      print(response.body);
      // Get.snackbar("", "",
      //     backgroundColor: Colors.red,
      //     colorText: Colors.white,
      //     duration: Duration(seconds: 2),
      //     messageText: Text(
      //       "Maaf Anda Tidak Bisa Login, Mohon Dicek Kembali Nomor dan Password",
      //       style: TextStyle(color: Colors.white),
      //     ));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          content: const Text(
              "Maaf Anda Tidak Bisa Login, Mohon Dicek Kembali Email dan Password")));
    }
  }
}
