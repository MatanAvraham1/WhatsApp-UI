import 'package:flutter/material.dart';
import 'package:whatsapp/screens/home/calls/calls_page.dart';
import 'package:whatsapp/screens/home/camera/camera_page.dart';
import 'package:whatsapp/screens/home/chats/chats_page.dart';
import 'package:whatsapp/screens/home/components/app_bar/mobile_app_bar.dart';
import 'package:whatsapp/screens/home/status/status_page.dart';

class MobileHomeScreen extends StatefulWidget {
  @override
  _MobileHomeScreenState createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: MobileAppBar(),
        body: TabBarView(
          children: [CameraPage(), ChatsPage(), StatusPage(), CallsPage()],
        ),
      ),
    );
  }
}
