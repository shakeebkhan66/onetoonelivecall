import 'package:flutter/material.dart';
import 'package:onetoonelivecall/video_calling_screen.dart';

Future main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'One To One Audio Video Call',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const VideoCallScreen(),
    );
  }
}

