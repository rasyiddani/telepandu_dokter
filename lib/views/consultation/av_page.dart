part of '../views.dart';

class AvPage extends StatefulWidget {
  const AvPage({Key? key}) : super(key: key);

  @override
  _AvPageState createState() => _AvPageState();
}

//http://telemedicine-test.akunku.co/api/log-konsul/{id}

class _AvPageState extends State<AvPage> {
  final String appId = '40d5d2002f3948dbb3f86c40d1562ffc'; //api
  final String tokenRtc =
      '00640d5d2002f3948dbb3f86c40d1562ffcIABASQs7ICvpxktxieYSMYFwhZkniZWwk3PYqGlZYOt0jP96k10AAAAAEACEYx7An0kUYgEAAQCdSRRi'; //api refresh token
  final String chanelNameRtc = 'videocalltelepandu'; //no telp pasien

  int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = await RtcEngine.create(appId);

    await _engine.enableVideo();
    _engine.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          // print("local user $uid joined");
          setState(() {
            _localUserJoined = true;
          });
        },
        userJoined: (int uid, int elapsed) {
          // print("remote user $uid joined");
          setState(() {
            _remoteUid = uid;
          });
        },
        userOffline: (int uid, UserOfflineReason reason) {
          // print("remote user $uid left channel");
          setState(() {
            _remoteUid = null;
          });
        },
      ),
    );

    await _engine.joinChannel(tokenRtc, chanelNameRtc, null, 0);
  }

  // Display remote user's video
  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return RtcRemoteView.SurfaceView(uid: _remoteUid!);
    } else {
      return const Text(
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    //widget local view
    Widget localViewRtc() {
      return Align(
        alignment: Alignment.topRight,
        child: SizedBox(
          width: 100,
          height: 150,
          child: Center(
            child: _localUserJoined
                ? RtcLocalView.SurfaceView()
                : const CircularProgressIndicator(),
          ),
        ),
      );
    }

    //widget bottom
    Widget bottomComponents() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Stack(
          children: [
            BackdropFilter(
                filter: ImageFilter.blur(
              sigmaX: 8,
              sigmaY: 8,
            )),
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [
                      0.0,
                      1.0
                    ],
                    colors: <Color>[
                      const Color.fromRGBO(0, 128, 104, 0).withOpacity(0.0),
                      const Color.fromARGB(
                        1,
                        0,
                        128,
                        104,
                      ).withOpacity(0.77)
                    ]),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Name Doctor",
                      style: CustomStyle.consultTitleText.copyWith(
                          color: CustomColor.light4Color,
                          fontSize: Dimensions.heading4TextSize),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Role Doctor",
                      style: CustomStyle.consultTitleText.copyWith(
                          color: CustomColor.light4Color,
                          fontSize: Dimensions.heading5TextSize,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(height: 37),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconAvComponents(
                        icon: Icons.mic_rounded,
                        onTap: () {},
                      ),
                      const SizedBox(width: 20),
                      IconAvComponents(
                        icon: Icons.video_call,
                        onTap: () {},
                      ),
                      const SizedBox(width: 20),
                      IconAvComponents(
                          icon: Icons.send,
                          onTap: () {
                            Navigator.pushNamed(context, '/chat_page');
                          }),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: IconAvComponents(
                      icon: Icons.call_end,
                      isEndCall: true,
                      onTap: () {},
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: CustomColor.light4Color,
      body: Stack(
        children: [
          Center(
            child: _remoteVideo(),
          ),
          localViewRtc(),
          bottomComponents(),
        ],
      ),
    );
  }
}
