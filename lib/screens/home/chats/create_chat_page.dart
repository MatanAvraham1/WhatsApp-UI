import 'package:flutter/material.dart';

class CreateChatPage extends StatefulWidget {
  @override
  _CreateChatPageState createState() => _CreateChatPageState();
}

class _CreateChatPageState extends State<CreateChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Chat"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("ori"),
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/image1.png"),
            ),
          )
        ],
      ),
    );
  }
}
