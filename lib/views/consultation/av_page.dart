part of '../views.dart';

class AvPage extends StatefulWidget {
  final String namePasien;
  final int id;
  const AvPage({Key? key, required this.namePasien, required this.id})
      : super(key: key);

  @override
  _AvPageState createState() => _AvPageState();
}

//http://telemedicine-test.akunku.co/api/log-konsul/{id}

class _AvPageState extends State<AvPage> {
  late String appId = ''; //api
  late String tokenRtc = ''; //api refresh token
  late String chanelNameRtc = ''; //no telp pasien

  int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;
  late bool video = true;
  late bool mic = true;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getApi();
  }

  getApi() async {
    setState(() {
      isLoading = true;
    });

    if (await Provider.of<ConsultProviders>(context, listen: false)
        .acceptConsult(widget.id)) {
      print("berhasil");
    } else {
      print("gagal");
    }

    setState(() {
      isLoading = false;
    });

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
    ConsultProviders consultProviders = Provider.of<ConsultProviders>(context);

    setState(() {
      appId = '${consultProviders.accept?.agoraAppId}';
      tokenRtc = '${consultProviders.accept?.tokenRtc}';
      chanelNameRtc = '${consultProviders.accept?.chanelName}';
      print("nomer: $chanelNameRtc");
    });

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

    Future<void> quitVideoCall() async {
      // Create RTC client instance
      RtcEngineContext context = RtcEngineContext(appId);
      var engine = await RtcEngine.createWithContext(context);
      await engine.disableVideo();
      await engine.disableAudio();
      await engine.leaveChannel();
    }

    Future<void> switchVideo() async {
      // Create RTC client instance
      RtcEngineContext context = RtcEngineContext(appId);
      var engine = await RtcEngine.createWithContext(context);
      if (video) {
        await engine.enableVideo();
      } else {
        await engine.disableVideo();
      }
    }

    Future<void> switchAudio() async {
      // Create RTC client instance
      RtcEngineContext context = RtcEngineContext(appId);
      var engine = await RtcEngine.createWithContext(context);
      if (mic) {
        await engine.enableAudio();
      } else {
        await engine.disableAudio();
      }
    }

    //widget popup
    Widget popupMessage() {
      return AlertDialog(
        content: const Text("Apakah anda yakin mengakhiri sesi?"),
        actions: [
          TextButton(
            onPressed: () async {
              quitVideoCall();
              await Provider.of<ConsultProviders>(context, listen: false)
                  .followUpConsult(widget.id);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FollowUpPage(id: widget.id),
                  ));
              // Navigator.pushNamed(context, '/follow_up');
            },
            child: const Text('Ya'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Batal', style: TextStyle(color: Colors.red)),
          ),
        ],
      );
    }

    //widget popup
    Widget popupMessageSkip() {
      return AlertDialog(
        content: const Text("Apakah anda yakin skip pasien?"),
        actions: [
          TextButton(
            onPressed: () async {
              quitVideoCall();
              await Provider.of<ConsultProviders>(context, listen: false)
                  .skipQueue(widget.id);

              Navigator.pushNamedAndRemoveUntil(
                  context, '/list_patient', (Route<dynamic> route) => false);
            },
            child: const Text('Ya'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Batal', style: TextStyle(color: Colors.red)),
          ),
        ],
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Text(
                      widget.namePasien,
                      style: CustomStyle.consultTitleText.copyWith(
                          color: CustomColor.light4Color,
                          // color: Colors.red,
                          fontSize: Dimensions.heading4TextSize),
                    ),
                  ),
                  const SizedBox(height: 37),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconAvComponents(
                        icon: mic ? Icons.mic_rounded : Icons.mic_off_outlined,
                        onTap: () {
                          setState(() {
                            mic = !mic;
                          });
                          switchAudio();
                        },
                      ),
                      const SizedBox(width: 20),
                      IconAvComponents(
                        icon: video ? Icons.video_call : Icons.videocam_off,
                        onTap: () {
                          setState(() {
                            video = !video;
                          });
                          switchVideo();
                        },
                      ),
                      const SizedBox(width: 20),
                      IconAvComponents(
                          icon: Icons.send,
                          onTap: () {
                            // Navigator.pushNamed(context, '/chat_page');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatPage(
                                    roomId: chanelNameRtc,
                                    idPatient: widget.id,
                                  ),
                                ));
                          }),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconAvComponents(
                        icon: Icons.add_to_home_screen,
                        onTap: () async {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  popupMessageSkip());
                          // await Provider.of<ConsultProviders>(context,
                          //         listen: false)
                          //     .skipQueue(widget.id);

                          // Navigator.pushNamedAndRemoveUntil(context,
                          //     '/list_patient', (Route<dynamic> route) => false);
                        },
                      ),
                      const SizedBox(width: 20),
                      IconAvComponents(
                        icon: Icons.call_end,
                        isEndCall: true,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  popupMessage());
                          // quitVideoCall();
                          // Navigator.pushNamed(context, '/follow_up');
                        },
                      ),
                    ],
                  ),
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
          Visibility(
              visible: isLoading,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                height: double.infinity,
                width: double.infinity,
                child: const Center(
                  child: LoadingCircle(),
                ),
              ))
        ],
      ),
    );
  }
}
