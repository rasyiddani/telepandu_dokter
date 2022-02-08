import 'package:flutter/material.dart';
import 'package:telemedicine_doctor/utils/colors.dart';
import 'package:telemedicine_doctor/utils/custom_style.dart';
import 'package:telemedicine_doctor/utils/dimensions.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool stateObat = false;
  bool stateDokter = false;
  bool stateLab = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 0.0,
              height: MediaQuery.of(context).size.height * 0.75,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                    color: CustomColor.light1Color,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
              ),
            ),
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 25),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                // Get.to(UserProfile());
                                Navigator.pushNamed(context, '/user_profile');
                              },
                              child: Icon(
                                Icons.account_circle,
                                size: 36,
                                color: CustomColor.mainColor,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Halo, Sandy!",
                              style: TextStyle(
                                  fontSize: Dimensions.leadParagraphTextSize),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            // Get.to(NotificationScreen());
                            Navigator.pushNamed(context, '/notification');
                          },
                          child: Icon(
                            Icons.notifications,
                            size: 32,
                            color: CustomColor.mainColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: CustomColor.mainColor,
                        borderRadius: BorderRadius.circular(15)),
                    width: 290,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          bottom: -40,
                          child: Image.asset(
                            "assets/images/doctor_cartoon.png",
                            width: 180,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Mulai Konsul",
                                    style: CustomStyle.titleText,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(130, 46),
                                        primary: Color(0xffF5AF00),
                                      ),
                                      onPressed: () {
                                        // Get.to(() => ConsultRegistration());
                                      },
                                      child: Text(
                                        "DAFTAR",
                                        style:
                                            TextStyle(color: Color(0xff008068)),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      "Hasil Konsultasi Terakhir",
                      style: TextStyle(
                          fontSize: Dimensions.heading4TextSize,
                          fontWeight: FontWeight.w700,
                          color: CustomColor.dark1Color),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: CustomColor.mainColor,
                          borderRadius: BorderRadius.circular(6)),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            stateObat = !stateObat;
                          });
                        },
                        child: (stateObat)
                            ? Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      "Resep Obat Terakhir",
                                      style: TextStyle(
                                          color: CustomColor.light4Color,
                                          fontSize:
                                              Dimensions.bodyMediumTextSize,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    trailing: Icon(
                                      Icons.expand_more,
                                      color: CustomColor.light4Color,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration:
                                        BoxDecoration(color: CustomColor.white),
                                    width: double.infinity,
                                    child: Text(
                                      "Anda belum konsultasi",
                                      style: TextStyle(
                                          color: CustomColor.dark1Color,
                                          fontSize:
                                              Dimensions.bodyNormalTextSize,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )
                                ],
                              )
                            : ListTile(
                                title: Text(
                                  "Resep Obat Terakhir",
                                  style: TextStyle(
                                      color: CustomColor.light4Color,
                                      fontSize: Dimensions.bodyMediumTextSize,
                                      fontWeight: FontWeight.w400),
                                ),
                                trailing: Icon(
                                  Icons.expand_less,
                                  color: CustomColor.light4Color,
                                ),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: CustomColor.mainColor,
                          borderRadius: BorderRadius.circular(6)),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            stateDokter = !stateDokter;
                          });
                        },
                        child: (stateDokter)
                            ? Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      "Instruksi Dokter",
                                      style: TextStyle(
                                          color: CustomColor.light4Color,
                                          fontSize:
                                              Dimensions.bodyMediumTextSize,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    trailing: Icon(
                                      Icons.expand_more,
                                      color: CustomColor.light4Color,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration:
                                        BoxDecoration(color: CustomColor.white),
                                    width: double.infinity,
                                    child: Text(
                                      "Anda belum konsultasi",
                                      style: TextStyle(
                                          color: CustomColor.dark1Color,
                                          fontSize:
                                              Dimensions.bodyNormalTextSize,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )
                                ],
                              )
                            : ListTile(
                                title: Text(
                                  "Instruksi Dokter",
                                  style: TextStyle(
                                      color: CustomColor.light4Color,
                                      fontSize: Dimensions.bodyMediumTextSize,
                                      fontWeight: FontWeight.w400),
                                ),
                                trailing: Icon(
                                  Icons.expand_less,
                                  color: CustomColor.light4Color,
                                ),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: CustomColor.mainColor,
                          borderRadius: BorderRadius.circular(6)),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            stateLab = !stateLab;
                          });
                        },
                        child: (stateLab)
                            ? Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      "Hasil Lab",
                                      style: TextStyle(
                                          color: CustomColor.light4Color,
                                          fontSize:
                                              Dimensions.bodyMediumTextSize,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    trailing: Icon(
                                      Icons.expand_more,
                                      color: CustomColor.light4Color,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration:
                                        BoxDecoration(color: CustomColor.white),
                                    width: double.infinity,
                                    child: Text(
                                      "Anda belum konsultasi",
                                      style: TextStyle(
                                          color: CustomColor.dark1Color,
                                          fontSize:
                                              Dimensions.bodyNormalTextSize,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )
                                ],
                              )
                            : ListTile(
                                title: Text(
                                  "Hasil Lab",
                                  style: TextStyle(
                                      color: CustomColor.light4Color,
                                      fontSize: Dimensions.bodyMediumTextSize,
                                      fontWeight: FontWeight.w400),
                                ),
                                trailing: Icon(
                                  Icons.expand_less,
                                  color: CustomColor.light4Color,
                                ),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      "Edukasi",
                      style: TextStyle(
                          fontSize: Dimensions.heading4TextSize,
                          fontWeight: FontWeight.w700,
                          color: CustomColor.dark1Color),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    // shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        CardEdu(),
                        SizedBox(
                          width: 20,
                        ),
                        CardEdu(),
                        SizedBox(
                          width: 20,
                        ),
                        CardEdu(),
                        SizedBox(
                          width: 20,
                        ),
                        CardEdu(),
                        SizedBox(
                          width: 20,
                        ),
                        CardEdu(),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(290, 46),
                            primary: CustomColor.mainColor),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text("Fitur Lanjutan"), Icon(Icons.star)],
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container CardEdu() {
    return Container(
      // padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: CustomColor.light4Color,
          borderRadius: BorderRadius.circular(10)),
      width: 200,
      // height: 290,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfMSwmsDFm_f4Z9hZcMK2IU5pPkBHHU5A6CQ&usqp=CAU",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Kegiatan di Luar Rumah yang Menyehatkan dan Menyenangkan untuk Lansia",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: Dimensions.bodyNormalTextSize,
                    color: CustomColor.dark1Color,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Selengkapnya",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: Dimensions.bodyNormalTextSize,
                        color: CustomColor.infoColor,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: CustomColor.infoColor,
                      size: 16,
                    )
                  ],
                )
              ],
            ),
          ),
          // Text("Selengkapnya")
        ],
      ),
    );
  }
}
