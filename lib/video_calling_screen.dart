import 'package:flutter/material.dart';
import 'package:onetoonelivecall/utils/util_screen.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'dart:math' as math;


/// Note that the userID needs to be globally unique,
final String localUserID = math.Random().nextInt(10000).toString();

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {

  TextEditingController callIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: callIdController,
              decoration: const InputDecoration(
                hintText: "Enter call id",
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return CallPage(callID: callIdController.text);
                  }),
                );
              },
              child: const Text("join"),
            )
          ],
        ),
      ),
    );
  }
}


class CallPage extends StatelessWidget {
  final String callID;

  const CallPage({
    Key? key,
    required this.callID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltCall(
        appID: UtilsScreen.appId,
        appSign: UtilsScreen.appSignIn,
        userID: localUserID,
        userName: "user_$localUserID",
        callID: callID,
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
          ..onOnlySelfInRoom = (context) {
            Navigator.of(context).pop();
          },
      ),
    );
  }
}