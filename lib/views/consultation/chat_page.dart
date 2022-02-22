part of '../views.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.light4Color,
      body: Stack(
        children: [
          SafeArea(
              child: Column(
            children: const [
              HeaderComponent(isBgWhite: false, title: "Kembali"),
            ],
          ))
        ],
      ),
    );
  }
}
