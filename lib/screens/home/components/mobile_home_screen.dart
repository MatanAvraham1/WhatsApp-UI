import 'package:flutter/material.dart';
import 'package:whatsapp/screens/home/calls/calls_page.dart';
import 'package:whatsapp/screens/home/camera/camera_page.dart';
import 'package:whatsapp/screens/home/chats/chats_page.dart';
import 'package:whatsapp/screens/home/components/default_app_bar.dart';
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
        appBar: DefaultAppBar(),
        // appBar: AppBar(
        //   actions: [
        //     IconButton(icon: Icon(Icons.search), onPressed: () {}),
        //     IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
        //   ],
        //   title: Text("WhatsApp"),
        //   bottom: TabBar(
        //     tabs: [
        //       Tab(
        //         icon: Icon(Icons.camera_alt),
        //       ),
        //       Tab(
        //         child: Text("CHATS"),
        //       ),
        //       Tab(
        //         child: Text("STATUS"),
        //       ),
        //       Tab(
        //         child: Text("CALLS"),
        //       ),
        //     ],
        //   ),
        // ),
        body: TabBarView(
          children: [CameraPage(), ChatsPage(), StatusPage(), CallsPage()],
        ),
      ),
    );
  }
}
