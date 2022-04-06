part of '../views.dart';

class ChatPage extends StatefulWidget {
  final String roomId;
  final int idPatient;
  const ChatPage({Key? key, required this.roomId, required this.idPatient})
      : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController chatController = TextEditingController();

  @override
  void initState() {
    getApi();

    super.initState();
  }

  getApi() async {
    await Provider.of<AuthProvider>(context, listen: false).getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

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
                  ChatService().addMessages(
                      user: authProvider.profile,
                      message: chatController.text,
                      room: widget.roomId,
                      rules: 'doctor');

                  setState(() {
                    chatController.text = '';
                  });
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

    return Scaffold(
      backgroundColor: CustomColor.light4Color,
      body: SafeArea(
          child: Column(
        children: [
          const HeaderComponent(isBgWhite: false, title: "Kembali"),
          const SizedBox(height: 10),
          Expanded(
            child: StreamBuilder<List<ChatModel>>(
                stream: ChatService().getMessagesByDoctorId(
                    rules: 'doctor',
                    room: widget.roomId.toString()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                      children: snapshot.data!.map((ChatModel chat) {
                        return ChatItemComponents(
                          text: "${chat.message}",
                          isChatDoctor:
                              chat.rules.toString() == 'doctor' ? true : false,
                        );
                      }).toList(),
                    );
                  } else {
                    return const Center(
                      child: SizedBox(),
                    );
                  }
                }),
          ),
          chatInput(),
        ],
      )),
    );
  }
}
