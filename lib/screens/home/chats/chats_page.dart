import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat.dart';
import 'package:whatsapp/models/message.dart';
import 'package:whatsapp/screens/home/chats/components/chat_tile.dart';

class ChatsPage extends StatefulWidget {
  final Function selectChatOnDesktop;
  final Function openChatInfoOnDesktop;

  const ChatsPage(
      {Key key, this.selectChatOnDesktop, this.openChatInfoOnDesktop})
      : super(key: key);

  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  List<Chat> chats = [
    Chat(name: 'the magnivim', imageURL: "assets/image1.png", members: [
      "matan",
      "dvir",
      "yoni"
    ], messages: [
      Message(
          content: "hello man whats is up?",
          sentAt: DateTime.now(),
          sender: "dvir"),
      Message(content: "i am ok!!!", sentAt: DateTime.now(), sender: "matan")
    ]),
    Chat(name: 'yey!', imageURL: "assets/image2.png", members: [
      "matan",
      "dvir",
      "yoni"
    ], messages: [
      Message(content: "lol!!!", sentAt: DateTime.now(), sender: "matan")
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) => ChatTile(
        chat: chats[index],
        selectChatOnDesktop: widget.selectChatOnDesktop,
        openChatInfoOnDesktop: widget.openChatInfoOnDesktop,
      ),
    );
  }
}
