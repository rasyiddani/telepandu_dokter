import 'package:flutter/material.dart';
import 'package:telemedicine_doctor/utils/colors.dart';
import 'package:telemedicine_doctor/utils/custom_style.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool statePage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Profil"),
        foregroundColor: CustomColor.mainColor,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.grey),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset('assets/images/dummy_doctor.png',
                            height: 100, width: 100),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {},
                        child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey.withOpacity(0.5)),
                            child: Center(child: Icon(Icons.edit))),
                      )
                    ],
                  )),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          statePage = true;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 5,
                                    color: statePage
                                        ? Colors.green
                                        : Colors.white))),
                        child: Center(
                          child: Row(
                            children: [
                              Icon(Icons.person,
                                  color:
                                      statePage ? Colors.green : Colors.black),
                              Text(
                                "Profile",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: statePage
                                        ? Colors.green
                                        : Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          statePage = false;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 5,
                                    color: !statePage
                                        ? Colors.green
                                        : Colors.white))),
                        child: Center(
                          child: Row(
                            children: [
                              Icon(Icons.date_range,
                                  color:
                                      !statePage ? Colors.green : Colors.black),
                              Text(
                                "Jadwal",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: !statePage
                                        ? Colors.green
                                        : Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              (statePage)
                  ? Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Nama",
                                style: CustomStyle.labelText
                                    .copyWith(color: Colors.black))),
                        const SizedBox(height: 5),
                        TextField(
                          enabled: false,
                          decoration: CustomStyle.textInputCustom.copyWith(
                            hintText: "Dr. Musan Pras",
                          ),
                        ),
                        SizedBox(height: 40),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("SIP",
                                style: CustomStyle.labelText
                                    .copyWith(color: Colors.black))),
                        const SizedBox(height: 5),
                        TextField(
                          enabled: false,
                          decoration: CustomStyle.textInputCustom.copyWith(
                            hintText: "171219970001",
                          ),
                        ),
                        SizedBox(height: 40),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Lokasi Praktek",
                                style: CustomStyle.labelText
                                    .copyWith(color: Colors.black))),
                        const SizedBox(height: 5),
                        TextField(
                          enabled: false,
                          decoration: CustomStyle.textInputCustom.copyWith(
                            hintText: "Klinik Utama",
                          ),
                        ),
                        SizedBox(height: 40),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Email ",
                                style: CustomStyle.labelText
                                    .copyWith(color: Colors.black))),
                        const SizedBox(height: 5),
                        TextField(
                          enabled: false,
                          decoration: CustomStyle.textInputCustom.copyWith(
                            hintText: "sandy@gmail.com",
                          ),
                        ),
                        SizedBox(height: 40),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("No. Wa Aktif",
                                style: CustomStyle.labelText
                                    .copyWith(color: Colors.black))),
                        const SizedBox(height: 5),
                        TextField(
                          enabled: false,
                          decoration: CustomStyle.textInputCustom.copyWith(
                            hintText: "081267313767",
                          ),
                        ),
                        SizedBox(height: 40),
                        Button(Icons.exit_to_app, "Keluar"),
                      ],
                    )
                  : Text("Halaman Jadwal")
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton Button(IconData icon, String text) {
    return ElevatedButton(
        style: CustomStyle.ProfileButton,
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: CustomStyle.ProfileTextButton,
            ),
          ],
        ));
  }
}
