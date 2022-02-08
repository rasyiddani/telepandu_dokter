import 'package:flutter/material.dart';
import 'package:telemedicine_doctor/utils/colors.dart';
import 'package:telemedicine_doctor/utils/custom_style.dart';
import 'package:telemedicine_doctor/utils/dimensions.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: CustomColor.mainColor,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Notifikasi",
          style: CustomStyle.NotifHeaderText,
        ),
      ),
      body: ListView(
        children: [
          NotifList(),
          Divider(
            color: CustomColor.dark4Color,
            thickness: 2,
          ),
          NotifList(),
          Divider(
            color: CustomColor.dark4Color,
            thickness: 2,
          ),
          NotifList(),
          Divider(
            color: CustomColor.dark4Color,
            thickness: 2,
          ),
          NotifList(),
          Divider(
            color: CustomColor.dark4Color,
            thickness: 2,
          ),
          NotifList(),
          Divider(
            color: CustomColor.dark4Color,
            thickness: 2,
          ),
          NotifList(),
          Divider(
            color: CustomColor.dark4Color,
            thickness: 2,
          ),
          NotifList(),
          Divider(
            color: CustomColor.dark4Color,
            thickness: 2,
          ),
          NotifList()
        ],
      ),
    );
  }

  Padding NotifList() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Icon(
                Icons.info,
                color: CustomColor.infoColor,
              ),
              SizedBox(
                height: 24,
              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 250,
                  child: Text(
                    "Kata Sandi Anda Diperbarui",
                    style: CustomStyle.NotifTitleText,
                  )),
              Container(
                width: 250,
                child: Text(
                  "Kata sandi anda berhasil dirubah. Untuk meminimalisir kesalahan silakan catat kata sandi baru anda.",
                  style: CustomStyle.NotifSubTitleText,
                ),
              ),
              Text(
                "10 Januari 2022, 16:10",
                style: CustomStyle.NotifTimeText,
              ),
            ],
          ),
          SizedBox(width: 5),
          Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: CustomColor.successColor,
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                height: 24,
              ),
            ],
          )
        ],
      ),
    );
  }
}
