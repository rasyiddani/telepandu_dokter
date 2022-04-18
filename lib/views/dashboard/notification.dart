part of '../views.dart';

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
          style: CustomStyle.notifHeaderText,
        ),
      ),
      body: ListView(
        children: [
          notifList(),
          Divider(
            color: CustomColor.dark4Color,
            thickness: 2,
          ),
          notifList(),
          Divider(
            color: CustomColor.dark4Color,
            thickness: 2,
          ),
          notifList(),
          Divider(
            color: CustomColor.dark4Color,
            thickness: 2,
          ),
          notifList(),
          Divider(
            color: CustomColor.dark4Color,
            thickness: 2,
          ),
          notifList(),
          Divider(
            color: CustomColor.dark4Color,
            thickness: 2,
          ),
          notifList(),
          Divider(
            color: CustomColor.dark4Color,
            thickness: 2,
          ),
          notifList(),
          Divider(
            color: CustomColor.dark4Color,
            thickness: 2,
          ),
          notifList()
        ],
      ),
    );
  }

  Padding notifList() {
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
              const SizedBox(height: 24),
              const SizedBox(height: 24),
            ],
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 250,
                  child: Text(
                    "Kata Sandi Anda Diperbarui",
                    style: CustomStyle.notifTitleText,
                  )),
              SizedBox(
                width: 250,
                child: Text(
                  "Kata sandi anda berhasil dirubah. Untuk meminimalisir kesalahan silakan catat kata sandi baru anda.",
                  style: CustomStyle.notifSubTitleText,
                ),
              ),
              Text(
                "10 Januari 2022, 16:10",
                style: CustomStyle.notifTimeText,
              ),
            ],
          ),
          const SizedBox(width: 5),
          Column(
            children: [
              const SizedBox(height: 24),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: CustomColor.successColor,
                    borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(height: 24),
            ],
          )
        ],
      ),
    );
  }
}
