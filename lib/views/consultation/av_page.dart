import 'dart:async';
import 'dart:ui';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:telemedicine_doctor/components/components.dart';
import 'package:telemedicine_doctor/const/app_constant.dart';
import 'package:telemedicine_doctor/providers/providers.dart';
import 'package:telemedicine_doctor/utils/utils.dart';
import 'package:telemedicine_doctor/views/views.dart';

class AvPage extends StatefulWidget {
  final String namePasien;
  final int id;
  final String phone;

  const AvPage(
      {Key? key,
      required this.namePasien,
      required this.id,
      required this.phone})
      : super(key: key);

  @override
  State<AvPage> createState() => _AvPageState();
}

//http://telemedicine-test.akunku.co/api/log-konsul/{id}

class _AvPageState extends State<AvPage> {
  late String appId = '40d5d2002f3948dbb3f86c40d1562ffc'; //api
  late String? tokenRtc = ''; //api refresh token
  late String chanelNameRtc = widget.phone; //no telp pasien

  int? _remoteUid = 0;
  bool _localUserJoined = false;
  late RtcEngine _engine;
  late bool video = true;
  late bool mic = true;

  bool isLoading = false;

  @override
  void initState() {
    getApi().whenComplete(
        () => Timer(const Duration(seconds: 0), () => initAgora()));
    initAgora();
    super.initState();
  }

  Future<void> getApi() async {
    setState(() {
      isLoading = true;
    });

    await Provider.of<ConsultProviders>(context, listen: false)
        .acceptConsult(widget.id);

    setState(() {
      isLoading = false;
    });

    // initAgora();
  }

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = createAgoraRtcEngine();
    _engine.initialize(RtcEngineContext(
        appId: appId,
        channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
        threadPriority: ThreadPriorityType.highest));

    debugPrint("agora credentials $appId, $chanelNameRtc, $tokenRtc");

    await _engine.enableVideo();
    await _engine.enableAudio();

    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          // print("local user $uid joined");
          setState(() {
            _localUserJoined = true;
          });
        },
        onUserJoined: (RtcConnection connection, int uid, int elapsed) {
          // print("remote user $uid joined");
          setState(() {
            _remoteUid = uid;
          });
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          // print("remote user $uid left channel");
          setState(() {
            _remoteUid = 0;
          });
        },
      ),
    );
    debugPrint("Remote ID $_remoteUid");

    await _engine.joinChannel(
        token: tokenRtc ?? AGORA_TOKEN,
        channelId: chanelNameRtc,
        uid: _remoteUid ?? 0,
        options: const ChannelMediaOptions(
            clientRoleType: ClientRoleType.clientRoleBroadcaster,
            channelProfile: ChannelProfileType.channelProfileCommunication));
  }

  // Display remote user's video
  Widget _remoteVideo() {
    if (_remoteUid != 0) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _engine,
          canvas: VideoCanvas(uid: _remoteUid),
          connection: RtcConnection(channelId: chanelNameRtc),
        ),
      );
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
      // appId = '${consultProviders.accept?.agoraAppId}';
      tokenRtc = consultProviders.accept?.tokenRtc;
      // chanelNameRtc = '${consultProviders.accept?.chanelName}';
    });

    //widget local view
    Widget localViewRtc() {
      return SafeArea(
        child: Align(
          alignment: Alignment.topRight,
          child: SizedBox(
            width: 100,
            height: 150,
            child: Center(
              child: _localUserJoined
                  ? AgoraVideoView(
                      controller: VideoViewController(
                          rtcEngine: _engine, canvas: const VideoCanvas(uid: 0)))
                  : const CircularProgressIndicator(),
            ),
          ),
        ),
      );
    }

    Future<void> quitVideoCall() async {
      // Create RTC client instance
      setState(() {
        _localUserJoined = false;
        _remoteUid = null;
      });
      await _engine.disableVideo();
      await _engine.disableAudio();
      await _engine.leaveChannel();
    }

    Future<void> switchVideo() async {
      // Create RTC client instance
      if (video) {
        await _engine.enableVideo();
      } else {
        await _engine.disableVideo();
      }
    }

    Future<void> switchAudio() async {
      // Create RTC client instance
      if (mic) {
        await _engine.enableAudio();
      } else {
        await _engine.disableAudio();
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
                  Get.context!,
                  MaterialPageRoute(
                    builder: (_) => FollowUpPage(id: widget.id),
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

    skipHandler() async {
      quitVideoCall();
      await Provider.of<ConsultProviders>(context, listen: false)
          .skipQueue(widget.id);

      Navigator.pushNamedAndRemoveUntil(
          Get.context!, '/list_patient', (Route<dynamic> route) => false);
    }

    //widget popup
    Widget popupMessageSkip() {
      return AlertDialog(
        content: const Text("Apakah anda yakin skip pasien?"),
        actions: [
          TextButton(
            onPressed: () {
              skipHandler();
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

    return WillPopScope(
      child: Scaffold(
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
      ),
      onWillPop: () async {
        return false;
      },
    );
  }

  @override
  void dispose() async {
    await _engine.release();
    super.dispose();
  }
}
