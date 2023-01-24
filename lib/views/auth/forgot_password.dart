part of '../views.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool isLoading = false;
  final TextEditingController? _controllerEmail = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                    height: 50,
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
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Mohon Masukkan Alamat Email Yang Terdaftar",
                      style: CustomStyle.titleText
                          .copyWith(fontSize: Dimensions.bodyLargeTextSize),
                      textAlign: TextAlign.center,
                    ),
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
                          const SizedBox(height: 60),
                          ButtonComponent(
                              title: "KIRIM",
                              onPress: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NewPasswordPage(
                                              email:
                                              _controllerEmail!.text)));
                                  // Navigator.pushNamed(context, '/new_password');
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
