part of '../views.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController chatController = TextEditingController();

  //widget bottom chat input
  Widget chatInput() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
      color: CustomColor.mainColor,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: CustomColor.light4Color,
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                minLines: 1,
                maxLines: 3,
                controller: chatController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: CustomColor.light4Color,
                  hintText: "Type something",
                  hintStyle: CustomStyle.profileTextButton.copyWith(
                      fontWeight: FontWeight.w400,
                      color: CustomColor.dark3Color),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
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
            const SizedBox(width: 5),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/follow_up');
              },
              child: Icon(
                Icons.send,
                color: CustomColor.mainColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.light4Color,
      body: SafeArea(
          child: Column(
        children: [
          const HeaderComponent(isBgWhite: false, title: "Kembali"),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: const [
                ChatItemComponents(
                    text:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "),
                ChatItemComponents(
                    isChatDoctor: false,
                    text:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                ChatItemComponents(
                    text:
                        "Lorem Ipsum is simply dummy text "),
              ],
            ),
          ),
          chatInput(),
        ],
      )),
    );
  }
}
